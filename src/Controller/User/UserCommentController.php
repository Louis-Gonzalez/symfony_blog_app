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

#[Route('/profile/comment')]
class UserCommentController extends AbstractController
{
    #[Route('/', name: 'app_user_comment_index', methods: ['GET'])]
    public function index(CommentRepository $commentRepository, Request $request): Response
    {
        $comments = $commentRepository->findByUser($this->getUser()->getId());
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
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
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

    #[Route('/{id}', name: 'app_user_comment_show', methods: ['GET'])]
    public function show(Comment $comment): Response
    {
        return $this->render('comment/show.html.twig', [
            'comment' => $comment,
        ]);
    }

    
    #[Route('/{id}/edit', name: 'app_user_comment_edit', methods: ['GET', 'POST'])]
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


}
