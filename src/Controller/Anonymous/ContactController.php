<?php

namespace App\Controller\Anonymous;

use App\Entity\Contact;
use App\Form\CommentType;
use App\Form\ContactType;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\ContactRepository;
use App\Repository\CommentRepository;
use APY\BreadcrumbTrailBundle\Annotation\Breadcrumb;
use APY\BreadcrumbTrailBundle\BreadcrumbTrail\Trail;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;


#[Route('/contact')]
class ContactController extends AbstractController
{
    #[Route('/', name: 'app_contact_index', methods: ['GET'])]
    public function index(ContactRepository $contactRepository, Trail $trail): Response
    {
        $contact = $contactRepository->findByUser($this->getUser()->getId());
        return $this->render('contact/index.html.twig', [
            'contacts' => $contact,
        ]);
    }
    
    #[Route('/new', name: 'app_contact_new', methods: ['GET', 'POST'])]
    #[Breadcrumb(title:'Home', routeName: 'app_home')]
    public function new(Request $request, EntityManagerInterface $entityManager, UserRepository $userRepository, Trail $trail): Response
    {
        $trail->add('Contact New', 'app_contact_new');
        $contact = new Contact();
        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $contact->setCreatedAt(new \DateTimeImmutable());
            $contact->setUpdatedAt(new \DateTime());
            // ici, il faut faire la liaison avec un utilisateur
            // vérifier s'il y a utilisateur en cours, si oui le prend user en cours
            if ($this->getUser() != null) 
            {
                $contact->setUser($this->getUser());
            }
            else {
                // sinon, il est anonyme
                $anonymous = $userRepository->findOneBy(['id' => 113]);
                $contact->setUser($anonymous);
            }
                        
            $entityManager->persist($contact);
            $entityManager->flush();
            $this->addFlash('success', 'Your message has been sent successfully.');
            return $this->redirectToRoute('app_home', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('contact/new.html.twig', [
            'contact' => $contact,
            'form' => $form,
            'Trail'=> $trail
        ]);
    }

}
