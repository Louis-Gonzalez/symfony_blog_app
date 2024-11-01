<?php

namespace App\Controller\Admin;

use App\Entity\Comment;
use App\Form\SearchType;
use App\Form\CommentType;
use App\Model\SearchData;
use App\Repository\CommentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use APY\BreadcrumbTrailBundle\Annotation\Breadcrumb;
use APY\BreadcrumbTrailBundle\BreadcrumbTrail\Trail;
use Doctrine\ORM\EntityManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/admin/comment')]
class AdminCommentController extends AbstractController
{
    #[Route('/', name: 'app_admin_comment_index', methods: ['GET'])]
    #[Breadcrumb(title:'Dashboard Admin', routeName: 'app_admin')]
    public function index(CommentRepository $commentRepository, Request $request, Trail $trail): Response
    {
        $trail->add('Comment Index Admin', 'app_admin_comment_index');
        $comments = $commentRepository->findAllDesc();
        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            // sélectionne
            $keyword = $form->get('search')->getData();
            $comments = $commentRepository->search($keyword);
        }
        
        return $this->render('comment/index.html.twig', [
            'comments' => $comments,
            'form' => $form,
        ]);
    }

    #[Route('/new', name: 'app_admin_comment_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $comment = new Comment();
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $comment->setIsHidden(false);
            $entityManager->persist($comment);
            $entityManager->flush();
            return $this->redirectToRoute('app_admin_comment_index', [], Response::HTTP_SEE_OTHER);
        }

        return [
            
            'form' => $form,
        ];
    }

    #[Route('/show/{id}', name: 'app_admin_comment_show', methods: ['GET'])]
    #[Breadcrumb(title:'Dashboard Admin', routeName: 'app_admin')]
    public function show(int $id, Comment $comment, Trail $trail): Response
    {
        $trail->add('Comment Index Admin Show', 'app_admin_comment_show', ['id'=>$id]);
        return $this->render('comment/show.html.twig', [
            'comment' => $comment,
        ]);
    }

    #[Route('/edit/{id}', name: 'app_admin_comment_edit', methods: ['GET', 'POST'] )]
    #[Breadcrumb(title:'Dashboard Admin', routeName: 'app_admin')]
    public function edit(int $id, Request $request, EntityManagerInterface $entityManager, Comment $comment, Trail $trail){

        $trail->add('Comment Index Admin Show', 'app_admin_comment_show', ['id'=>$id]);
        $trail->add('Comment Index Admin Edit', 'app_admin_comment_edit', ['id'=>$id]);
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();
            $this->addFlash('success', 'Comment updated successfully.');
            return $this->redirectToRoute('app_admin_comment_index', [], Response::HTTP_SEE_OTHER);
        }
        return $this->render('comment/edit.html.twig', [
            'comment' => $comment,
            'form' => $form,
        ]);
    }

    #[Route('/comment/{id}/hidden', name: 'app_comment_hide', methods: ['GET', 'POST'])]
    public function hidden(Request $request, Comment $comment, EntityManagerInterface $entityManager): Response
    {
        if ($comment->isIsHidden()){
            $comment->setIsHidden(false);
        }
        else {
            $comment->setIsHidden(true);
        }
        $entityManager->flush();
        return $this->redirect($request->headers->get('referer'));
    }

    
    #[Route('/delete', name: 'app_admin_comment_delete', methods: ['GET', 'POST'])]
    public function delete(Request $request, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete', $request->request->get('_token'))) {
            $id=$request->request->get('delete');
            $comment = $entityManager->getRepository(Comment::class)->find($id);
            $entityManager->remove($comment);
            $entityManager->flush();
        }
        return $this->redirectToRoute('app_admin_comment_index', [], Response::HTTP_SEE_OTHER);
    }

    
    #[Route("/admin/comment/delete-multiple", name: "app_admin_comment_delete_multiple", methods: ["POST"])]

    public function deleteMultipleComments(Request $request, EntityManagerInterface $entityManager, CommentRepository $commentRepository) {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');
        $commentRepository = $entityManager->getRepository(Comment::class);

        $csrfToken = $request->request->get('_csrf_token');
        // dd($csrfToken);
        if ($this->isCsrfTokenValid('delete-multiple-comments', $request->request->get('_csrf_token'))) {
            $commentIds = [];
            $commentIds = $request->request->all('comments');
            // dd($commentIds);
            if (!empty($commentIds)) {
                foreach ($commentIds as $commentId) {
                    $comment = $commentRepository->find($commentId);
                    if ($comment) {
                        $entityManager->remove($comment);
                    }
                }
                $entityManager->flush();
                $this->addFlash('success', 'Selected comments have been deleted successfully.');
            } else {
                $this->addFlash('warning', 'No comments were selected for deletion.');
            }
        }
        return $this->redirectToRoute('app_admin_comment_index');
    }

    #[Route("/admin/comment/visible-multiple", name: "app_admin_comment_visible_multiple", methods: ["POST"])]

    public function visibleMultipleComments(Request $request, EntityManagerInterface $entityManager, CommentRepository $commentRepository) {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');
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
        return $this->redirectToRoute('app_admin_comment_index');
    }

}
