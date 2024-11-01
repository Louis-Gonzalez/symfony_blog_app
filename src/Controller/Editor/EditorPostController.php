<?php

namespace App\Controller\Editor;

use App\Entity\Post;
use App\Repository\PostRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use APY\BreadcrumbTrailBundle\Annotation\Breadcrumb;
use APY\BreadcrumbTrailBundle\BreadcrumbTrail\Trail;

class EditorPostController extends AbstractController
{
    #[Route('/editor/post', name: 'app_editor_post_index', methods: ['GET'])]
    #[Breadcrumb(title:'Home', routeName: 'app_home')]
    public function index(PostRepository $postRepository, Trail $trail): Response
    {
        $trail->add('Post Index Editor', 'app_editor_post_index');
        return $this->render('editor_post/index.html.twig', [
            'posts' => $postRepository->findAllDesc(),
        ]);
    }

    #[Route('/editor/post/hidden/{id}', name: 'app_editor_post_hide', methods: ['GET', 'POST'])]
    public function hidden(int $id, Request $request, Post $post, EntityManagerInterface $entityManager): Response
    {
        $post = $entityManager->getRepository(Post::class)->find($id);
        if (!$post) {
            throw $this->createNotFoundException('Le post n\'existe pas.');
        }
        if ($post->isIsHidden()) {
            $post->setIsHidden(false);
        } else {
            $post->setIsHidden(true);
        }
        // dd($post);
        $entityManager->flush();
        return $this->redirect($request->headers->get('referer'));
    }

}
