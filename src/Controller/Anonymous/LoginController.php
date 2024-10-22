<?php

namespace App\Controller\Anonymous;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class LoginController extends AbstractController
{

    #[Route('/login', name: 'app_login')]
    public function index(AuthenticationUtils $authenticationUtils, Request $request): Response
    {
        // if ($this->getUser()){

        //     $locale =$request->getLocale();
        //     $session->set('_locale', $locale);
        //     return $this->redirect($request->headers->get('referer'));

        // }

        if ($this->getUser()) {
            // Récupérer la langue de la session
            // Ajoute la logique pour récupérer la locale par défaut si elle n'a pas chargé dans le user
            $user = $this->getUser();
    
            if ($user->getLocale() === null) {
                $locale = 'fr';
            } else {
                $locale = $user->getLocale();
            }
            // dd($user->getLocale());
            return $this->redirectToRoute('app_homepage', ['_locale' => $locale]);
        }
    
         // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();

         // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('login/index.html.twig', [
            'last_username' => $lastUsername,
            'error'         => $error,
        ]);
    }
}