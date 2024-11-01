<?php

namespace App\Controller\Admin;

use App\Entity\Post;
use App\Form\PostType;
use App\Entity\Comment;
use App\Form\SearchType;
use App\Form\CommentType;
use App\Model\SearchData;
use App\Entity\UploadFile;
use App\Service\FileUploader;
use App\Repository\PostRepository;
use App\Repository\CommentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use APY\BreadcrumbTrailBundle\Annotation\Breadcrumb;
use APY\BreadcrumbTrailBundle\BreadcrumbTrail\Trail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AdminPostController extends AbstractController {
    #[Route('/admin/post', name: 'app_admin_post', methods: ['GET'])]
    #[Breadcrumb(title:'Dashboard Admin', routeName: 'app_admin')]
    public function index(PostRepository $postRepository, Request $request, Trail $trail): Response {

        $trail->add('Post Index Admin', 'app_admin_post');
        $posts = $postRepository->findAllDesc();
        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            // écrire la sélection
            $keyword = $form->get('search')->getData();
            $posts = $postRepository->search($keyword);
        }
        return $this->render('admin_post/index.html.twig', [
            'posts' => $posts,
            'form' => $form,
        ]);
    }

    
    #[Route('/admin/post/new', name: 'app_admin_post_new', methods: ['GET', 'POST'])]
    #[Breadcrumb(title:'Dashboard Admin', routeName: 'app_admin')]
    public function new(Request $request, EntityManagerInterface $entityManager, FileUploader $fileUploader, Trail $trail): Response {
        
        $trail->add('Post Admin Index', 'app_admin_post');
        $trail->add('Post Admin New', 'app_admin_post_new');
        $post = new Post();
        $post->setAuthor($this->getUser());
        $form = $this->createForm(PostType::class, $post);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $post->setIsHidden(false);
            $imgFile = $form->get('img')->getData();
            if ($imgFile) {
                $fileUpload = $fileUploader->upload($imgFile, "img_directory", false);
            }
            $entityManager->persist($fileUpload);
            $post->setImg($fileUpload);
            $entityManager->persist($post);
            $entityManager->flush();
            return $this->redirectToRoute('app_admin_post', [], Response::HTTP_SEE_OTHER);
        }
        return $this->render('post/new.html.twig', [
            'post' => $post,
            'form' => $form,
        ]);
    }
    /*
    * SLUGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
    */
    #[Route('/admin/post/slug={slug}', name: 'app_admin_post_by_slug', methods: ['GET', 'POST'])]
    public function showBySlug(Post $post, PostRepository $postRepository, Request $request, EntityManagerInterface $entityManager, CommentRepository $commentRepository, string $slug): Response {
        // return $this->render('post/show.html.twig', [
        //     'post' => $postRepository->findOneBy(['slug' => $slug]),
        // ]);
        $post = $postRepository->findBySlug($slug);
        $comment = new Comment();
        $comment->setIsHidden(false);
        $comment->setUser($this->getUser());
        $comment->setPost($post);

        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $comment->setIsHidden(false);
            $entityManager->persist($comment);
            $entityManager->flush();
            return $this->redirectToRoute('app_post_by_slug', ['slug' =>$slug]);
        }
        $comments = $commentRepository->findBy(['post' => $post]);
        return $this->render('post/show.html.twig', [
            'post' => $post,
            'comments' => $comments,
            'form' => $form
        ]);
    }

    #[Route('/admin/post/show/{id}', name: 'app_admin_post_show', methods: ['GET', 'POST'])]
    #[Breadcrumb(title:'Dashboard Admin', routeName: 'app_admin')]
    public function show(int $id, Post $post, CommentRepository $commentRepository, Request $request, EntityManagerInterface $entityManager, Trail $trail): Response {
        
        $trail->add('Post Admin Index', 'app_admin_post');
        $trail->add('Post Admin Show', 'app_admin_post_show', ['id'=>$id]);
        $comment = new Comment();
        $comment->setUser($this->getUser());
        $comment->setPost($post);

        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $comment->setIsHidden(false);
            $entityManager->persist($comment);
            $entityManager->flush();
            return $this->redirectToRoute('app_admin_post_show', ['id' =>$id]);
        }
        $comments = $commentRepository->findBy(['post' => $post]);

        return $this->render('post/show.html.twig', [
            'post' => $post,
            'comments' => $comments,
            'form' => $form
        ]);
    }

    #[Route('/admin/post/edit/{id}', name: 'app_admin_post_edit', methods: ['GET', 'POST'])]
    #[IsGranted('edit', 'post')]
    #[Breadcrumb(title:'Dashboard Admin', routeName: 'app_admin')]
    public function edit(int $id, Request $request, Post $post, EntityManagerInterface $entityManager, FileUploader $fileUploader, Trail $trail): Response {

        $trail->add('Post Admin Index', 'app_admin_post');
        $trail->add('Post Admin Show', 'app_admin_post_show', ['id'=>$id]);
        $trail->add('Post Admin Edit', 'app_admin_post_edit', ['id'=>$id]);
        $form = $this->createForm(PostType::class, $post);
        $form->handleRequest($request);
        $form = $this->createForm(PostType::class, $post);
        $form->handleRequest($request);
        // dd($form);
        // dd($post);

        if ($form->isSubmitted() && $form->isValid()) {
            $imgFile = $form->get('img')->getData();
            if ($imgFile) {
                $imgFileName = $fileUploader->upload($imgFile, "img_directory", false);
                $fileUpload = new UploadFile();
                $fileUpload->setImg($imgFileName->getImg());
                // dd($fileUpload);

                $fileUpload->setIsPrivate(false);
                $fileUpload->setCreatedAt(new \DateTimeImmutable());
                $fileUpload->setModifiedAt(new \DateTimeImmutable());
                $entityManager->persist($fileUpload);
                $post->setImg($fileUpload);
            }
            
            $entityManager->persist($post);
            $entityManager->flush();
            // ajouter une logique de message 
            $this->addFlash('success', 'Your post has been successfully updated.');
            return $this->redirectToRoute('app_admin_post', [], Response::HTTP_SEE_OTHER);
        } 
        // else if ($form->isSubmitted() && !$form->isValid()) {
        //     $this->addFlash('warning', 'Your post could not be updated. Please check the form for errors.');
        // }
        return $this->render('post/edit.html.twig', [
            'post' => $post,
            'form' => $form,
        ]);
    }

    #[Route('/admin/post/delete', name: 'app_admin_post_delete', methods: ['POST'])]
    public function delete(Request $request, EntityManagerInterface $entityManager): Response {
        if ($this->isCsrfTokenValid('delete', $request->request->get('_token'))) {
            try{
                $id=$request->request->get('delete');
                $post = $entityManager->getRepository(Post::class)->find($id);
                $this->addFlash('success', 'You\'ve deleted the post.');
                $entityManager->remove($post);
                $entityManager->flush();
            } catch (\Doctrine\DBAL\Exception\ForeignKeyConstraintViolationException $e){
                $this->addFlash('warning', 'You can\'t delete this post because it has related comments.');
            }
        }
        return $this->redirectToRoute('app_admin_post', [], Response::HTTP_SEE_OTHER);
    }

    #[Route('/admin/post/hidden/{id}', name: 'app_admin_post_hide', methods: ['GET', 'POST'])]
    public function hidden(Request $request, Post $post, EntityManagerInterface $entityManager): Response
    {
        if ($post->isIsHidden()) {
            $post->setIsHidden(false);
        } else {
            $post->setIsHidden(true);
        }
        $entityManager->flush();
        return $this->redirect($request->headers->get('referer'));
    }

    
    #[Route("/admin/post/delete-multiple", name: "app_admin_post_delete_multiple", methods: ["POST"])]

    public function deleteMultiplePosts(Request $request, EntityManagerInterface $entityManager, PostRepository $postRepository) {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');
        $postRepository = $entityManager->getRepository(Post::class);

        $csrfToken = $request->request->get('_csrf_token');
        // dd($csrfToken);
        if ($this->isCsrfTokenValid('delete-multiple-posts', $request->request->get('_csrf_token'))) {
            try{
                $postIds = [];
                $postIds = $request->request->all('posts');
                // dd($postIds);
                if (!empty($postIds)) {
                    foreach ($postIds as $postId) {
                        $post = $postRepository->find($postId);
                        if ($post) {
                            $entityManager->remove($post);
                        }
                    }
                    $entityManager->flush();
                    $this->addFlash('success', 'Selected posts have been deleted successfully.');
                } else {
                    $this->addFlash('warning', 'No posts were selected for deletion.');
                }
            } catch (\Doctrine\DBAL\Exception\ForeignKeyConstraintViolationException $e){
                $this->addFlash('warning', 'You can\'t delete, because a post contains comments.');
            }
        }
        return $this->redirectToRoute('app_admin_post');
    }

    #[Route("/admin/post/visible-multiple", name: "app_admin_post_visible_multiple", methods: ["POST"])]

    public function visibleMultiplePosts(Request $request, EntityManagerInterface $entityManager, PostRepository $postRepository) {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');
        
        if ($this->isCsrfTokenValid('delete-multiple-posts', $request->request->get('_csrf_token'))) {
            $postIds = [];
            $postIds = $request->request->all('posts');
            // dd($postIds);
            if (!empty($postIds)) {
                foreach ($postIds as $postId) {
                    $post = $postRepository->find($postId);
                    if ($post) {
                        if ($post->isIsHidden()) {
                            $post->setIsHidden(false);
                        }
                        else {
                            $post->setIsHidden(true);
                        }
                        $entityManager->flush();
                    }
                }
                $entityManager->flush();
                $this->addFlash('success', 'Selected posts have been visible/hidden successfully.');
            } else {
                $this->addFlash('warning', 'No posts were selected for deletion.');
            }
        }
        return $this->redirectToRoute('app_admin_post');
    }
}
