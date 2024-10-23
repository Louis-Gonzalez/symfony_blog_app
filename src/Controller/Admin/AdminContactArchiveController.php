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
use App\Repository\ContactArchiveRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

#[Route('/admin/contact-archive')]
class AdminContactArchiveController extends AbstractController{

    
    #[Route('/', name: 'app_admin_contact_archive_index', methods: ['GET'])]
    public function index(ContactArchiveRepository $contactArchiveRepository, Request $request): Response {
        
        $contactArchive = $contactArchiveRepository->findAll();
        // dd($contactArchive[24]->getUserId());
        foreach ($contactArchive as $archive){
            $archive->userId = $archive->getUserId();
        }

        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class);
        $form->handleRequest($request);
        

        if ($form->isSubmitted() && $form->isValid()) {
            $keyword = $form->get('search')->getData();
            $contactArchive = $contactArchiveRepository->search($keyword);
        }
        return $this->render('contact_archive/index.html.twig', [
            'contactArchives' => $contactArchive,
            'form' => $form,
        ]);
    }

    
    #[Route('/show/{id}', name: 'app_admin_contact_archive_show', methods: ['GET'])]
    public function show(ContactArchive $contactArchive): Response
    {
        return $this->render('contact_archive/show.html.twig', [
            'contactArchive' => $contactArchive,
        ]);
    }


    #[Route('/unarchive', name: 'app_admin_contact_unarchive', methods: ['GET', 'POST'])]
    public function unArchive(Request $request, EntityManagerInterface $entityManager): Response
    {
            $contact = $entityManager->getRepository(ContactArchive::class)->find($id);
            
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
        return $this->redirectToRoute('app_admin_contact_index', [], Response::HTTP_SEE_OTHER);
    }
}