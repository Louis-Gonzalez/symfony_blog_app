<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ChangeLocaleController extends AbstractController
{
    #[Route('/change_locale/{locale}', name: 'app_change_locale')]
    public function changeLocale($locale, Request $request) 
    {
        // On stocke la langue dans la session
        $request->getSession()->set('_locale', $locale);

        // On revient sur la page précédente
        $referer = $request->headers->get('referer');
        if ($referer) {
            return $this->redirect($referer);
        }

        // Si pas de page précédente, rediriger vers la page d'accueil
        return $this->redirectToRoute('app_homepage');
    }
}
