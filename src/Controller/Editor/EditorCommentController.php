<?php

namespace App\Controller\Editor;

use App\Entity\Comment;
use App\Form\SearchType;
use App\Model\SearchData;
use App\Form\CommentType;
use App\Repository\CommentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use APY\BreadcrumbTrailBundle\Annotation\Breadcrumb;
use APY\BreadcrumbTrailBundle\BreadcrumbTrail\Trail;

#[Route('/editor/comment')]
class EditorCommentController extends AbstractController
{
    #[Route('/', name: 'app_editor_comment_index', methods: ['GET'])]
    #[Breadcrumb(title:'Home', routeName: 'app_home')]
    public function index(CommentRepository $commentRepository, Request $request, Trail $trail): Response
    {
        $trail->add('Comment Index Editor', 'app_editor_comment_index');
        $comments = $commentRepository->findAll();
        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            // sélectionne
            $keyword = $form->get('search')->getData();
            $comments = $commentRepository->search($keyword);
        }
        
        // $comment = $commentRepository->findByUser($this->getUser()->getId())();
        return $this->render('comment/index.html.twig', [
            'comments' => $comments,
            'form' => $form,
        ]);
    }
  
    #[Route('/new', name: 'app_editor_comment_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $comment = new Comment();
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($comment);
            $entityManager->flush();
            return $this->redirectToRoute('app_comment_index', [], Response::HTTP_SEE_OTHER);
        }

        return [
            
            'form' => $form,
        ];
    }

    #[Route('/{id}', name: 'app_editor_comment_show', methods: ['GET'])]
    public function show(Comment $comment): Response
    {
        return $this->render('comment/show.html.twig', [
            'comment' => $comment,
        ]);
    }

    
    #[Route('/{id}/edit', name: 'app_editor_comment_edit', methods: ['GET', 'POST'])]
    #[IsGranted('edit', 'comment')]
    public function edit(Request $request, Comment $comment, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            


            $entityManager->persist($comment);
            $entityManager->flush();
            
            return $this->redirectToRoute('app_user_post_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('post/edit.html.twig', [
            'comment' => $comment,
            'form' => $form,
        ]);
    }

    
    #[Route('/hidden/{id}', name: 'app_editor_comment_hide', methods: ['GET', 'POST'])]
    public function hidden(Request $request, Comment $comment, EntityManagerInterface $entityManager): Response
    {
        if ($comment->isIsHidden()){
            $comment->setIsHidden(false);
        }
        else{
            $comment->setIsHidden(true);
        }
        $entityManager->flush();
        // return $this->redirectToRoute('app_comment_index', [], Response::HTTP_SEE_OTHER);
        return $this->redirect($request->headers->get('referer'));
    }
    #[Route("/editor/comment/visible-multiple", name: "app_editor_comment_visible_multiple", methods: ["POST"])]

    public function visibleMultipleComments(Request $request, EntityManagerInterface $entityManager, CommentRepository $commentRepository) {
        $this->denyAccessUnlessGranted('ROLE_EDITOR');
        if ($this->isCsrfTokenValid('delete-multiple-comments', $request->request->get('_csrf_token'))) {
            $commentIds = [];
            $commentIds = $request->request->all('comments');
            // dd($commentIds);
            if (!empty($commentIds)) {
                foreach ($commentIds as $commentId) {
                    $comment = $commentRepository->find($commentId);
                    if ($comment) {
                        if ($comment->isIsHidden()){
                            $comment->setIsHidden(false);
                        }
                        else {
                            $comment->setIsHidden(true);
                        }
                        $entityManager->flush();
                    }
                }
                $entityManager->flush();
                $this->addFlash('success', 'Selected comments have been visible/hide successfully.');
            } else {
                $this->addFlash('warning', 'No comments were selected for deletion.');
            }
        }
        // return $this->redirectToRoute('app_editor_comment_index');
        return $this->redirect($request->headers->get('referer'));
    }

}
