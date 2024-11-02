<?php

namespace App\Controller\User;

use App\Entity\Post;
use App\Form\PostType;
use App\Entity\Comment;
use App\Form\CommentType;
use App\Entity\UploadFile;
use App\Service\FileUploader;
use App\Form\SearchType;
use App\Repository\PostRepository;
use App\Repository\CommentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Security\Core\User\UserInterface;
use App\Model\SearchData;
use APY\BreadcrumbTrailBundle\Annotation\Breadcrumb;
use APY\BreadcrumbTrailBundle\BreadcrumbTrail\Trail;


#[Route('/profile/post')]
class UserPostController extends AbstractController {
    #[Route('/', name: 'app_user_post_index', methods: ['GET'])]
    #[Breadcrumb(title:'Home', routeName: 'app_home')]
    public function index(PostRepository $postRepository, Request $request, Trail $trail): Response {

        $trail->add('Post Index', 'app_user_post_index');
        $posts = $postRepository->findByAuthorId($this->getUser()->getId());
        $form = $this->createForm(SearchType::class);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            $keyword = $form->get('search')->getData();
            $posts2 = $postRepository->search($keyword);
        }
        return $this->render('post/index.html.twig', [
            'posts' => $posts,
            'form' => $form,
        ]);
    }

    #[Route('/new', name: 'app_user_post_new', methods: ['GET', 'POST'])]
    #[Breadcrumb(title:'Home', routeName: 'app_home')]
    public function new(Request $request, EntityManagerInterface $entityManager, FileUploader $fileUploader, Trail $trail): Response {
        $trail->add('Post Index', 'app_user_post_index');
        $trail->add('Post New', 'app_user_post_new');
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
            $this->addFlash('success', 'Your post has been created successfully.');
            return $this->redirectToRoute('app_user_post_index', [], Response::HTTP_SEE_OTHER);
        }
        return $this->render('post/new.html.twig', [
            'post' => $post,
            'form' => $form,
        ]);
    }
    /*
    * SLUG
    */
    #[Route('/{slug}', name: 'app_user_post_by_slug', methods: ['GET', 'POST'])]
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

    #[Route('/show/{id}', name: 'app_user_post_show', methods: ['GET', 'POST'])]
    #[Breadcrumb(title:'Home', routeName: 'app_home')]
    public function show(int $id, Post $post, CommentRepository $commentRepository, Request $request, EntityManagerInterface $entityManager, Trail $trail): Response {

        $trail->add('Post Index', 'app_user_post_index');
        $trail->add('Post Show', 'app_user_post_show', ['id'=>$id]);
        $comment = new Comment();
        $comment->setUser($this->getUser());
        $comment->setPost($post);

        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $comment->setIsHidden(false);
            $entityManager->persist($comment);
            $entityManager->flush();
            return $this->redirectToRoute('app_user_post_show', ['id' =>$id]);
        }
        $comments = $commentRepository->findBy(['post' => $post]);
        return $this->render('post/show.html.twig', [
            'post' => $post,
            'comments' => $comments,
            'form' => $form
        ]);
    }

    #[Route('/edit/{id}', name: 'app_user_post_edit', methods: ['GET', 'POST'])]
    #[IsGranted('edit', 'post')]
    public function edit(int $id, Request $request, Post $post, EntityManagerInterface $entityManager, FileUploader $fileUploader, Trail $trail): Response {

        $trail->add('Post Index', 'app_user_post_index');
        $trail->add('Post Edit', 'app_user_post_edit', ['id'=>$id]);
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
            return $this->redirectToRoute('app_user_post_index', [], Response::HTTP_SEE_OTHER);
        } 
        // else if ($form->isSubmitted() && !$form->isValid()) {
        //     $this->addFlash('warning', 'Your post could not be updated. Please check the form for errors.');
        // }
        return $this->render('post/edit.html.twig', [
            'post' => $post,
            'form' => $form,
        ]);
    }

    #[Route('delete/{id}', name: 'app_user_post_delete', methods: ['POST'])]
    public function delete(Request $request, Post $post, EntityManagerInterface $entityManager): Response {
        if ($this->isCsrfTokenValid('delete'.$post->getId(), $request->request->get('_token'))) {
            try {
                $entityManager->remove($post);
                $entityManager->flush();
                $this->addFlash('success', 'You\'ve deleted the post.');
            } catch (\Doctrine\DBAL\Exception\ForeignKeyConstraintViolationException $e){
                $this->addFlash('warning', 'You can\'t delete this post because it has related comments.');
            }
        }
        return $this->redirectToRoute('app_user_post_index', [], Response::HTTP_SEE_OTHER);
    }

    
    #[Route('hidden/{id}', name: 'app_user_post_hide', methods: ['GET', 'POST'])]
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
}
