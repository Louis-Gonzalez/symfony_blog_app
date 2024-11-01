<?php

namespace App\Controller\User;

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

#[Route('/profile/comment')]
class UserCommentController extends AbstractController
{
    #[Route('/', name: 'app_user_comment_index', methods: ['GET'])]
    #[Breadcrumb(title:'Home', routeName: 'app_home')]
    public function index(CommentRepository $commentRepository, Request $request, Trail $trail): Response
    {
        $trail->add('Comment Index', 'app_user_comment_index');
        $comments = $commentRepository->findByUser($this->getUser()->getId());
        // dd($comments);
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

    #[Route('/new', name: 'app_comment_new', methods: ['GET', 'POST'])]
    // #[Breadcrumb(title:'Comment Index', routeName: 'app_user_comment_index')]
    public function new(Request $request, EntityManagerInterface $entityManager, Trail $trail): Response
    {
        // $trail->add('Comment New', 'app_comment_new');
        $comment = new Comment();
        $form = $this->createForm(CommentType::class, $comment);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $comment->setIsHidden(false);
            $entityManager->persist($comment);
            $entityManager->flush();
            return $this->redirectToRoute('app_comment_index', [], Response::HTTP_SEE_OTHER);
        }
        return [
            
            'form' => $form,
        ];
    }

    #[Route('/show/{id}', name: 'app_user_comment_show', methods: ['GET'])]
    #[Breadcrumb(title:'Comment Index', routeName: 'app_user_comment_index')]
    public function show(int $id, Comment $comment, Trail $trail): Response
    {
        $trail->add('Comment Show', 'app_user_comment_show', ['id'=> $id]);
        return $this->render('comment/show.html.twig', [
            'comment' => $comment,
        ]);

        // return $this->redirect($request->headers->get('referer'));
    }

    
    #[Route('/edit/{id}', name: 'app_user_comment_edit', methods: ['GET', 'POST'])]
    #[IsGranted('edit', 'comment')]
    #[Breadcrumb(title:'Comment Index', routeName: 'app_user_comment_index')]
    public function edit(int $id, Request $request, Comment $comment, EntityManagerInterface $entityManager, Trail $trail): Response
    {
        $trail->add('Comment Show', 'app_user_comment_show', ['id'=> $id]);
        $trail->add('Comment Edit', 'app_user_comment_edit', ['id'=> $id]);
        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();
            $this->addFlash('success', 'Comment updated successfully.');
            return $this->redirectToRoute('app_user_comment_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('comment/edit.html.twig', [
            'comment' => $comment,
            'form' => $form,
        ]);
    }

    #[Route('/delete/{id}', name: 'app_user_comment_delete', methods: ['POST'])]
    public function delete(Request $request, EntityManagerInterface $entityManager, CommentRepository $commentRepository, int $id): Response
    {
        if ($this->isCsrfTokenValid('delete' . $id, $request->request->get('_token'))) {
            $comment = $commentRepository->find($id);
            if ($comment) {
                $entityManager->remove($comment);
                $entityManager->flush();
                $this->addFlash('success', 'Comment deleted successfully.');
            } else {
                $this->addFlash('error', 'Comment not found.');
            }
        } else {
            $this->addFlash('error', 'Impossible action.');
        }
        return $this->redirectToRoute('app_user_comment_index', [], Response::HTTP_SEE_OTHER);
    }
    


}
