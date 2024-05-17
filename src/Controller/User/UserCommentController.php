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

#[Route('/post/show/comment')]
class UserCommentController extends AbstractController
{
    #[Route('/', name: 'app_comment_index', methods: ['GET'])]
    public function index(CommentRepository $commentRepository, Request $request): Response
    {
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

        return $this->render('comment/index.html.twig', [
            'comments' => $comments,
            'form' => $form,
        ]);
    }
    #[Route('/new', name: 'app_comment_new', methods: ['GET', 'POST'])]
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

    #[Route('/{id}', name: 'app_comment_show', methods: ['GET'])]
    public function show(Comment $comment): Response
    {
        return $this->render('comment/show.html.twig', [
            'comment' => $comment,
        ]);
    }

    #[Route('/{id}/hidden', name: 'app_comment_hide', methods: ['GET', 'POST'])]
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

}
