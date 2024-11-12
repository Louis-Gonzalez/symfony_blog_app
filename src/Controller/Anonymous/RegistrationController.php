<?php

namespace App\Controller\Anonymous;

use App\Entity\User;
use App\Entity\UploadFile;
use App\Service\FileUploader;
use App\Security\EmailVerifier;
use App\Repository\UserRepository;
use App\Form\RegistrationFormType;
use App\Traits\XssSanitizerTrait;
use Symfony\Component\Mime\Address;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Contracts\Translation\TranslatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use SymfonyCasts\Bundle\VerifyEmail\Exception\VerifyEmailExceptionInterface;
use APY\BreadcrumbTrailBundle\Annotation\Breadcrumb;
use APY\BreadcrumbTrailBundle\BreadcrumbTrail\Trail;

class RegistrationController extends AbstractController
{
    use XssSanitizerTrait;

    private EmailVerifier $emailVerifier;

    public function __construct(EmailVerifier $emailVerifier)
    {
        $this->emailVerifier = $emailVerifier;
    }

    #[Route('/register', name: 'app_register')]
    #[Breadcrumb(title:'Home', routeName: 'app_home')]
    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager, FileUploader $fileUploader, UserRepository $userRepository, Trail $trail): Response
    {
        $trail->add('Register', 'app_register');
        $user = new User();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $plainPassword = $form->get('plainPassword')->getData();
            if (str_contains($plainPassword, " ") || $plainPassword == "") {
                return $this->redirectToRoute('app_register');
            }
            $username = $this->sanitizerString($form->get('username')->getData());
            // $username = $form->get('username')->getData();
            if ($userRepository->findOneBy(['username' => $username])) {
                return $this->redirectToRoute('app_register');
            }

            $email = $this->sanitizerString($form->get('email')->getData());
            // $email = $form->get('email')->getData();
            if ($userRepository->findOneBy(['email' => $email])) {
                return $this->redirectToRoute('app_register');
            }

            $avatarFile = $form->get('avatar')->getData();
            if ($avatarFile) {
                $fileUpload = $fileUploader->upload($avatarFile, "avatar_directory", $form->get('private')->getData());

            }

            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                    ));

            // set avatar   
            $user->setAvatar($fileUpload);

            $entityManager->persist($user);
            $entityManager->flush();
            $this->addFlash('success', 'Your account has been created.');
            // envoie de mail de confirmation
            $this->emailVerifier->sendEmailConfirmation('app_verify_email', $user,
                (new TemplatedEmail())
                    ->from(new Address('gonzalezlouis1981@gmail.com', 'Adamas Tools'))
                    ->to($user->getEmail())
                    ->subject('Please Confirm your Email')
                    ->htmlTemplate('registration/confirmation_email.html.twig')
            );
            return $this->redirectToRoute('app_home');
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form,
            'locale'=>$request->getLocale(),
        ]);
    }

    #[Route('/verify/email', name: 'app_verify_email')]
    public function verifyUserEmail(Request $request, TranslatorInterface $translator): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        try {
            $this->emailVerifier->handleEmailConfirmation($request, $this->getUser());
        } catch (VerifyEmailExceptionInterface $exception) {
            $this->addFlash('verify_email_error', $translator->trans($exception->getReason(), [], 'VerifyEmailBundle'));
            return $this->redirectToRoute('app_register');
        }
        $this->addFlash('success', 'Your email address has been verified.');

        return $this->redirectToRoute('app_home');
    }
}
