<?php

namespace App\Controller\Admin;

use App\Entity\Contact;
use App\Form\SearchType;
use App\Form\CommentType;
use App\Form\ContactType;
use App\Model\SearchData;
use App\Entity\ContactArchive;
use App\Repository\CommentRepository;
use App\Repository\ContactRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;


#[Route('/admin/contact')]
class AdminContactController extends AbstractController
{
    #[Route('/', name: 'app_admin_contact_index', methods: ['GET'])]
    public function index(ContactRepository $contactRepository, Request $request): Response {
        
        $contact = $contactRepository->findAllDesc();
        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $keyword = $form->get('search')->getData();
            $contact = $contactRepository->search($keyword);
        }
        return $this->render('contact/index.html.twig', [
            'contacts' => $contact,
            'form' => $form,

        ]);
    }

    #[Route('/edit/{id}/', name: 'app_admin_contact_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Contact $contact, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(ContactType::class, $contact);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_admin_contact_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('contact/edit.html.twig', [
            'contact' => $contact,
            'form' => $form,
        ]);
    }
    
    #[Route('/show/{id}', name: 'app_admin_contact_show', methods: ['GET'])]
    public function show(Contact $contact): Response
    {
        return $this->render('contact/show.html.twig', [
            'contact' => $contact,
        ]);
    }

    #[Route('/delete', name: 'app_admin_contact_delete', methods: ['GET', 'POST'])]
    public function delete(Request $request, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete', $request->request->get('_token'))) {
            $id = $request->request->get('delete');
            $isDeleted = (bool) $request->request->get('was_deleted');
            // dd($isDeleted);

            $contact = $entityManager->getRepository(Contact::class)->find($id);
            
            if ($contact) {
                $contactArchive = new ContactArchive();
                $contactArchive->setContactId($contact->getId());
                // dd($contact->getId());
                // dd($contact->getUser()->getId()); // ici j'ai un objet dont l'id est bien entier
                $contactArchive->setUserId($contact->getUser()->getId());
                $contactArchive->setTitle($contact->getTitle());
                $contactArchive->setDescription($contact->getDescription());
                $contactArchive->setMail($contact->getMail());
                $contactArchive->setStatus($contact->getStatus());
                $contactArchive->setCreatedAt($contact->getCreatedAt());
                $contactArchive->setUpdatedAt($contact->getUpdatedAt());
                
                // Définir logique was_deleted à 1 was_archived à 0
                $contactArchive->setWasDeleted($isDeleted);
                $contactArchive->setWasArchived(!$isDeleted);
                
                $entityManager->persist($contactArchive);
                
                $entityManager->remove($contact);
                $entityManager->flush();
            }
        }
        return $this->redirectToRoute('app_admin_contact_index', [], Response::HTTP_SEE_OTHER);
    }

    #[Route("/admin/contact/delete-multiple", name: "app_admin_contact_delete_multiple", methods: ["POST"])]
    public function deleteMultipleContacts(Request $request, EntityManagerInterface $entityManager, ContactRepository $contactRepository): Response
    {
    //     $this->denyAccessUnlessGranted('ROLE_ADMIN');

    //     // Vérifier que le jeton CSRF est valide
    //     if ($this->isCsrfTokenValid('delete-multiple-contacts', $request->request->get('_csrf_token'))) {
    //         // Récupérer les IDs des contacts à supprimer
    //         $contactIds = $request->request->all('contact');
            
    //         dd($contactIds);
    //         // $contactIds = $request->request->get('contact', []); // Correct ici
           

    //         if (!empty($contactIds)) {
    //             foreach ($contactIds as $contactId) {
                    
    //                 $contact = $contactRepository->find($contactId);
    //                 if ($contact) {
    //                     // dd($contact);
    //                     $contactArchive = new ContactArchive();

    //                     // Copier les propriétés de Contact vers ContactArchive
    //                     $contactArchive->setContactId($contact->getId());
    //                     $contactArchive->setUserId($contact->getUser()->getId());
    //                     $contactArchive->setTitle($contact->getTitle());
    //                     $contactArchive->setDescription($contact->getDescription());
    //                     $contactArchive->setMail($contact->getMail());
    //                     $contactArchive->setStatus($contact->getStatus());
    //                     $contactArchive->setCreatedAt($contact->getCreatedAt());
    //                     $contactArchive->setUpdatedAt($contact->getUpdatedAt());

    //                     // Définir was_deleted à 1 et was_archived à 0
    //                     $contactArchive->setWasDeleted(1);
    //                     $contactArchive->setWasArchived(0);

    //                     // Persister l'entité ContactArchive
    //                     $entityManager->persist($contactArchive);

    //                     // Supprimer l'entité Contact
    //                     $entityManager->remove($contact);
    //                 }
    //             }
    //             $entityManager->flush();
    //             $this->addFlash('success', 'Les contacts sélectionnés ont été archivés et supprimés avec succès.');
    //         } else {
    //             $this->addFlash('warning', 'Aucun contact sélectionné pour la suppression.');
    //         }
    //     }
    //     return $this->redirectToRoute('app_admin_contact_index');
    }
    
    


}



