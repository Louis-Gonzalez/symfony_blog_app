<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Form\SearchType;
use App\Model\SearchData;
use App\Entity\UploadFile;
use App\Service\FileUploader;
use App\Form\Admin\AdminUserType;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use APY\BreadcrumbTrailBundle\Annotation\Breadcrumb;
use APY\BreadcrumbTrailBundle\BreadcrumbTrail\Trail;

#[Route('/admin/user')]
class AdminUserController extends AbstractController
{
    #[Route('/', name: 'app_admin_user_index', methods: ['GET'])]
    #[Breadcrumb(title:'Dashboard Admin', routeName: 'app_admin')]
    public function index(UserRepository $userRepository, Request $request, Trail $trail): Response
    {
        $trail->add('User Index Admin', 'app_admin_user_index');
        $users = $userRepository->findAllDesc();
        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            // sélectionne
            $keyword = $form->get('search')->getData();
            $users = $userRepository->search($keyword);
        }
        return $this->render('admin/user/index.html.twig', [
            'users' => $users,
            'form' => $form,
        ]);
    }

    #[Route('/new', name: 'app_admin_user_new', methods: ['GET', 'POST'])]
    
    public function new(Request $request, EntityManagerInterface $entityManager, Trail $trail): Response
    {
        $user = new User();
        $form = $this->createForm(AdminUserType::class, $user); // , ['mode' => 'creation'] qu'on mettrait juste après le $user 
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) 
        {
            $entityManager->persist($user);
            $entityManager->flush();
            return $this->redirectToRoute('app_admin_user_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('admin/user/new.html.twig', [
            'user' => $user,
            'form' => $form,
        ]);
    }

    
    #[Route('/search', name: 'app_search', methods: ['GET', 'POST'])]
    
    public function search(): Response
    {
        $searchData = new SearchData();
        $form = $this->createForm(SearchType::class, $searchData);
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            // écrire la requête
            $keyword = $_POST['keyword'];
            die($keyword);

            return $this->redirectToRoute('app_admin_user_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('search/index.html.twig', [
            'searchData' => $searchData,
            'form' => $form,
        ]);
    }

    #[Route('show/{id}', name: 'app_admin_user_show', methods: ['GET'])]
    #[Breadcrumb(title:'Dashboard Admin', routeName: 'app_admin')]
    public function show(int $id, User $user, Trail $trail): Response
    {
        $trail->add('User Index Admin', 'app_admin_user_index');
        $trail->add('User Index Admin Show', 'app_admin_user_show', ['id'=>$id]);
        return $this->render('admin/user/show.html.twig', [
            'user' => $user,
        ]);
    }

    #[Route('/edit/{id}/', name: 'app_admin_user_edit', methods: ['GET', 'POST'])]
    #[Breadcrumb(title:'Dashboard Admin', routeName: 'app_admin')]
    public function edit(int $id, Request $request, User $user, EntityManagerInterface $entityManager, FileUploader $fileUploader, Trail $trail): Response
    {
        $trail->add('User Index Admin', 'app_admin_user_index');
        $trail->add('User Index Admin Show', 'app_admin_user_show', ['id'=>$id]);
        $trail->add('User Index Admin Edit', 'app_admin_user_edit', ['id'=>$id]);
        $form = $this->createForm(AdminUserType::class, $user);
        $form->handleRequest($request);
        // dd($form);
        if ($form->isSubmitted() && $form->isValid()) {
            $avatarFile = $form->get('avatar')->getData();
            // dd($avatarFile);
            if ($avatarFile) {
                $avatarFile = $form->get('avatar')->getData();
                
                if ($avatarFile) {
                    $fileUpload = $fileUploader->upload($avatarFile, "avatar_directory",  $form->get('private')->getData(), $user->getAvatar()->getImg());
                }
                $entityManager->persist($fileUpload);
                $user->setAvatar($fileUpload);
            }
            $entityManager->flush();
            $this->addFlash('success', 'Your account has been updated. ');
            return $this->redirectToRoute('app_admin_user_index', [], Response::HTTP_SEE_OTHER);
        }
        return $this->render('admin/user/edit.html.twig', [
            'user' => $user,
            'form' => $form,
        ]);
    }

    #[Route('/delete', name: 'app_admin_user_delete', methods: ['POST'])]
    public function delete(Request $request, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete', $request->request->get('_token'))) {
            $id=$request->request->get('delete');
            $user = $entityManager->getRepository(User::class)->find($id);
            $entityManager->remove($user);
            $entityManager->flush();
        }
        return $this->redirectToRoute('app_admin_user_index', [], Response::HTTP_SEE_OTHER);
    }

    #[Route("/admin/user/delete-multiple", name: "app_admin_user_delete_multiple", methods: ["POST"])]
    public function deleteMultipleUser(Request $request, EntityManagerInterface $entityManager, UserRepository $userRepository) {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');
        $userRepository = $entityManager->getRepository(User::class);

        // Vérifier que le jeton CSRF est valide
        $csrfToken = $request->request->get('_csrf_token');
        // dd($csrfToken);
        if ($this->isCsrfTokenValid('delete-multiple-users', $request->request->get('_csrf_token'))) {
            $userIds = [];
            $userIds = $request->request->all('users');
            // dd($userIds);
            if (!empty($userIds)) {
                foreach ($userIds as $userId) {
                    $user = $userRepository->find($userId);
                    if ($user) {
                        $entityManager->remove($user);
                    }
                }
                $entityManager->flush();
                $this->addFlash('success', 'Selected users have been deleted successfully.');
            } else {
                $this->addFlash('warning', 'No users were selected for deletion.');
            }
        }
        return $this->redirectToRoute('app_admin_user_index');
    }
}
