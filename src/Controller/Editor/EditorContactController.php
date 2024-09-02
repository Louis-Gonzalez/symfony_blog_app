<?php

namespace App\Controller\Editor;

use App\Entity\Contact;
use App\Form\SearchType;
use App\Model\SearchData;
use App\Form\CommentType;
use App\Repository\ContactRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/editor/contact')]
class EditorContactController extends AbstractController {
    
    #[Route("/delete-multiple", name: "app_editor_contact_delete_multiple", methods: ["POST"])]

    public function deleteMultipleContacts(Request $request, EntityManagerInterface $entityManager, ContactRepository $contactRepository) {
        $this->denyAccessUnlessGranted('ROLE_EDITOR');
        $contactRepository = $entityManager->getRepository(Contact::class);

        // Vérifier que le jeton CSRF est valide
        $csrfToken = $request->request->get('_csrf_token');
        if ($this->isCsrfTokenValid('editor-delete-multiple-contacts', $request->request->get('_csrf_token'))) {
            $contactIds = [];
            $contactIds = $request->request->all('contact');
            // dd($contactIds);
            if (!empty($contactIds)) {
                foreach ($contactIds as $contactId) {
                    $contact = $contactRepository->find($contactId);
                    if ($contact) {
                        $entityManager->remove($contact);
                    }
                }
                $entityManager->flush();
                $this->addFlash('success', 'Selected contacts have been deleted successfully.');
            } else {
                $this->addFlash('warning', 'No contacts were selected for deletion.');
            }
        }
        return $this->redirectToRoute('app_user_contact_index');
    }
}