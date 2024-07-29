<?php

namespace App\Controller\Admin;

use App\Repository\PostRepository;
use App\Form\SearchType;
use App\Model\SearchData;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AdminPostController extends AbstractController
{
    #[Route('/admin/post', name: 'app_admin_post', methods: ['GET'])]
    public function index(PostRepository $postRepository, Request $request): Response
    {
        $posts = $postRepository->findAllDesc();
        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            // écrire la sélection
            $keyword = $form->get('search')->getData();
            $posts = $postRepository->search($keyword);
        }
        return $this->render('admin_post/index.html.twig', [
            'posts' => $posts,
            'form' => $form,
        ]);
    }
}
