<?php

namespace App\Controller\User;

use App\Entity\Contact;
use App\Entity\User;
use App\Form\SearchType;
use App\Model\SearchData;
use App\Form\CommentType;
use App\Form\ContactType;
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


#[Route('/profile/contact')]
class UserContactController extends AbstractController
{
    #[Route('/', name: 'app_user_contact_index', methods: ['GET'])]
    public function index(ContactRepository $contactRepository, Request $request): Response
    {
        
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
    public function new(Request $request, EntityManagerInterface $entityManager, UserRepository $userRepository): Response
    {
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
            // $this->addFlash('success', 'Your message has been sent successfully.');
            return $this->redirectToRoute('app_user_contact_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('contact/new.html.twig', [
            'contact' => $contact,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_user_contact_show', methods: ['GET'])]
    public function show(Contact $contact): Response
    {
        return $this->render('contact/show.html.twig', [
            'contact' => $contact,
        ]);
    }

    #[Route('/edit/{id}', name: 'app_user_contact_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Contact $contact, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
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
