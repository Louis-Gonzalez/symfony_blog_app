<?php

namespace App\Controller\Admin;

use App\Entity\Contact;
use App\Form\SearchType;
use App\Form\CommentType;
use App\Form\ContactType;
use App\Model\SearchData;
use App\Entity\ContactArchive;
use App\Repository\UserRepository;
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
use APY\BreadcrumbTrailBundle\Annotation\Breadcrumb;
use APY\BreadcrumbTrailBundle\BreadcrumbTrail\Trail;

#[Route('/admin/contact-archive')]
class AdminContactArchiveController extends AbstractController{

    
    #[Route('/', name: 'app_admin_contact_archive_index', methods: ['GET'])]
    #[Breadcrumb(title:'Contact Index Admin', routeName: 'app_admin_contact_index')]
    public function index(ContactArchiveRepository $contactArchiveRepository, Request $request, Trail $trail): Response {
        
        $trail->add('Contact Archive Admin', 'app_admin_contact_archive_index');
        $contactArchive = $contactArchiveRepository->findAllDesc();
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
    #[Breadcrumb(title:'Contact Index Admin', routeName: 'app_admin_contact_index')]
    public function show(int $id, ContactArchive $contactArchive, Trail $trail): Response
    {
        $trail->add('Contact Archive Admin', 'app_admin_contact_archive_index');
        $trail->add('Contact Archive Admin Show', 'app_admin_contact_archive_show', ['id' => $id]);
        return $this->render('contact_archive/show.html.twig', [
            'contactArchive' => $contactArchive,
        ]);
    }

    #[Route('/unarchive/{id}', name: 'app_admin_contact_unarchive', methods: ['GET', 'POST'])]

    public function unArchive(int $id, Request $request, EntityManagerInterface $entityManager, UserRepository $userRepository): Response
    {
        $contactArchive = $entityManager->getRepository(ContactArchive::class)->find($id);
    
        if ($contactArchive) {
            $contact = new Contact();
    
            // Récupérer l'utilisateur par son ID
            $user = $userRepository->find($contactArchive->getUserId());
            
            // Assigner l'objet User à l'objet Contact
            if ($user) {
                $contact->setUser($user);
            } else {
                // Gérer le cas où l'utilisateur n'est pas trouvé
                throw new \Exception("User not found for ID: " . $contactArchive->getUserId());
            }
    
            $contact->setTitle($contactArchive->getTitle());
            $contact->setDescription($contactArchive->getDescription());
            $contact->setMail($contactArchive->getMail());
            $contact->setStatus($contactArchive->getStatus());
            $contact->setCreatedAt($contactArchive->getCreatedAt());
            $contact->setUpdatedAt($contactArchive->getUpdatedAt());
            
            // dd($contact);
            $entityManager->persist($contact);
    
            $entityManager->remove($contactArchive);
            $entityManager->flush();
        }
    
        // Redirection vers la liste des contacts
        return $this->redirectToRoute('app_admin_contact_index', [], Response::HTTP_SEE_OTHER);
    }
}