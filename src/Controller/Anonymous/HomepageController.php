<?php

namespace App\Controller\Anonymous;
use App\Form\SearchType;
use App\Model\SearchData;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Repository\PostRepository;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Component\HttpFoundation\JsonResponse;
class HomepageController extends AbstractController
{
    #[Route('/', name: 'app_home',methods: ['GET'])]
    
    public function index(PostRepository $postRepository, Request $request): Response
    {
        $posts = $postRepository->findBy(['published' => true], ['id' => 'DESC']);
        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $keyword = $form->get('search')->getData();
            // écrire la sélection
            // dd($keyword);
            if ($keyword != null) {
                $posts = $postRepository->search($keyword);
                return $this->json($posts);
            }
            else {
                $posts = $postRepository->findBy(['published' => true], ['id' => 'DESC']);  
            }
        }
        return $this->render('homepage/index.html.twig', [
            'posts' => $posts,
            'form' => $form,
        ]);
    }

    #[Route('/home', name: 'app_homepage_alt', methods: ['GET'])]
    #[Route('/homepage', name: 'app_homepage', methods: ['GET'])]
    public function homepage(): RedirectResponse {
        return $this->redirectToRoute('app_home');
    }

    #[Route('/home/search-ajax/{value?}', name: 'app-home-search-ajax', methods: ['GET', 'POST'])] 
    public function searchAjax(PostRepository $postRepository, Request $request, $value = null): JsonResponse {
        $posts = $postRepository->search($value);
        return new JsonResponse($posts, 200);
    }
}
