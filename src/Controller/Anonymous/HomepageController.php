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
class HomepageController extends AbstractController
{
    #[Route('/', name: 'app_home', methods: ['GET'])]
    public function index(PostRepository $postRepository, Request $request): Response
    {
        $posts = $postRepository->findBy(['published' => true]);
        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $keyword = $form->get('search')->getData();
            // écrire la sélection
            if ($keyword != null) {
                $posts = $postRepository->search($keyword);
            }
            else {
                $posts = $postRepository->findBy(['published' => true]);                
            }
        }
        return $this->render('homepage/index.html.twig', [
            'posts' => $posts,
            'form' => $form,
        ]);
    }

    #[Route('/home', name: 'app_homepage_alt', methods: ['GET'])]
    #[Route('/homepage', name: 'app_homepage', methods: ['GET'])]
    public function homepage(): RedirectResponse
    {
        // redirects to the "homepage" route
        return $this->redirectToRoute('app_home');
    }
}
