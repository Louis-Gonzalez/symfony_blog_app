<?php

namespace App\Controller\User;

use App\Entity\Contact;
use App\Entity\User;
use App\Form\SearchType;
use App\Model\SearchData;
use App\Form\CommentType;
use App\Form\ContactType;
use App\Traits\XssSanitizerTrait;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\UserRepository;
use App\Repository\ContactRepository;
use App\Repository\CommentRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use APY\BreadcrumbTrailBundle\Annotation\Breadcrumb;
use APY\BreadcrumbTrailBundle\BreadcrumbTrail\Trail;


#[Route('/profile/contact')]
class UserContactController extends AbstractController
{
    use XssSanitizerTrait;

    #[Route('/', name: 'app_user_contact_index', methods: ['GET'])]
    #[Breadcrumb(title:'Home', routeName: 'app_home')]
    public function index(ContactRepository $contactRepository, Request $request, Trail $trail): Response
    {
        $trail->add('Contact Index', 'app_user_contact_index');
        $contact = $contactRepository->findByUser($this->getUser()->getId());

        // $contact = $contactRepository->findAllDesc($this->getUser()->getId());
        // dd($contact);
        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // recherche
            $keyword = $form->get('search')->getData();
            $currentUser = $this->getUser();
            // dd($currentUser);
            $contact = $contactRepository->searchUser($keyword, $currentUser);
        }
        return $this->render('contact/index.html.twig', [
            'contacts' => $contact,
            'form' => $form,
            
        ]);
    }
    
    #[Route('/new', name: 'app_user_contact_new', methods: ['GET', 'POST'])]
    #[Breadcrumb(title:'Contact Index', routeName: 'app_user_contact_index')]
    public function new(Request $request, EntityManagerInterface $entityManager, UserRepository $userRepository, Trail $trail): Response
    {
        $trail->add('Contact New', 'app_user_contact_new');
        $contact = new Contact();
        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // XSS
            $contact->setTitle($this->sanitizerString($contact->getTitle()));
            $contact->setDescription($this->sanitizerString($contact->getDescription()));
            $contact->setMail($this->sanitizerString($contact->getMail()));

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
            // $this->addFlash('success', 'Your message has been sent successfully.');
            return $this->redirectToRoute('app_user_contact_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('contact/new.html.twig', [
            'contact' => $contact,
            'form' => $form,
        ]);
    }

    #[Route('/show/{id}', name: 'app_user_contact_show', methods: ['GET'])]
    #[Breadcrumb(title:'Contact Index', routeName: 'app_user_contact_index')]
    public function show(int $id, Contact $contact, Trail $trail): Response
    {
        $trail->add('Contact Show', 'app_user_contact_show', ['id'=>$id]);
        return $this->render('contact/show.html.twig', [
            'contact' => $contact,
        ]);
    }

    #[Route('/edit/{id}', name: 'app_user_contact_edit', methods: ['GET', 'POST'])]
    #[Breadcrumb(title:'Contact Index', routeName: 'app_user_contact_index')]
    public function edit(int $id, Request $request, Contact $contact, EntityManagerInterface $entityManager, Trail $trail): Response
    {
        $trail->add('Contact Show', 'app_user_contact_show', ['id'=>$id]);
        $trail->add('Contact Edit', 'app_user_contact_edit', ['id'=>$id]);
        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // XSS
            $contact->setTitle($this->sanitizerString($contact->getTitle()));
            $contact->setDescription($this->sanitizerString($contact->getDescription()));
            $contact->setMail($this->sanitizerString($contact->getMail()));
            $entityManager->flush();
            return $this->redirectToRoute('app_user_contact_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('contact/edit.html.twig', [
            'contact' => $contact,
            'form' => $form,
        ]);
    }
    #[Route('/delete/{id}', name: 'app_user_contact_delete', methods: ['POST'])]
    public function delete(int $id, Request $request, Contact $contact, EntityManagerInterface $entityManager): Response
    {
        dd($request);
        $tokenCsrf = $this->isCsrfTokenValid('delete'.$contact->getId(), $request->request->get('_token'));

        if ($tokenCsrf) {
            $entityManager->remove($contact);
            $entityManager->flush();
        }
    
        return $this->redirectToRoute('app_user_contact_index', [], Response::HTTP_SEE_OTHER);
    }
}
