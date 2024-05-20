<?php

namespace App\Controller\Admin;

use App\Entity\Contact;
use App\Form\CommentType;
use App\Repository\ContactRepository;
use App\Repository\CommentRepository;
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
    public function index(ContactRepository $contactRepository): Response
    {
        
        $contact = $contactRepository->findAll();
        return $this->render('contact/index.html.twig', [
            'contacts' => $contact,
        ]);
    }

}
