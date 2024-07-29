<?php

namespace App\Controller\Admin;

use App\Repository\PostRepository;
use App\Form\SearchType;
use App\Model\SearchData;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Post;
use App\Form\PostType;
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

    
    #[Route('/admin/post/new', name: 'app_admin_post_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager, FileUploader $fileUploader): Response {
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
    public function show(int $id, Post $post, CommentRepository $commentRepository, Request $request, EntityManagerInterface $entityManager): Response {
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
    public function edit(Request $request, Post $post, EntityManagerInterface $entityManager, FileUploader $fileUploader): Response {
        $form = $this->createForm(PostType::class, $post);
        $form->handleRequest($request);

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
            }
            $entityManager->persist($fileUpload);
            $post->setImg($fileUpload);
            $entityManager->persist($post);
            $entityManager->flush();
            
            return $this->redirectToRoute('app_admin_post', [], Response::HTTP_SEE_OTHER);
        }
        return $this->render('post/edit.html.twig', [
            'post' => $post,
            'form' => $form,
        ]);
    }

    #[Route('/admin/post/delete', name: 'app_admin_post_delete', methods: ['POST'])]
    public function delete(Request $request, EntityManagerInterface $entityManager): Response {

        if ($this->isCsrfTokenValid('delete', $request->request->get('_token'))) {
            $id=$request->request->get('delete');
            $post = $entityManager->getRepository(Post::class)->find($id);
            $entityManager->remove($post);
            $entityManager->flush();
        }
        return $this->redirectToRoute('app_admin_post', [], Response::HTTP_SEE_OTHER);
    }

    
    #[Route('/admin/post/hiddent/{id}', name: 'app_admin_post_hide', methods: ['GET', 'POST'])]
    public function hidden(Request $request, Post $post, EntityManagerInterface $entityManager): Response
    {
        if ($post->isIsHidden()){
            $post->setIsHidden(false);
        } else{
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
        }
        return $this->redirectToRoute('app_admin_post');
    }

    #[Route("/admin/comment/visible-multiple", name: "app_admin_post_visible_multiple", methods: ["POST"])]

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
                $this->addFlash('success', 'Selected comments have been deleted successfully.');
            } else {
                $this->addFlash('warning', 'No comments were selected for deletion.');
            }
        }
        return $this->redirectToRoute('app_admin_comment_index');
    }
}
