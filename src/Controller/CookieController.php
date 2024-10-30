<?php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Cookie;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CookieController extends AbstractController
{
    #[Route('/set-cookie-consent', name: 'set_cookie_consent', methods: ['POST'])]
    public function setCookieConsent(Request $request): Response
    {
        $consent = $request->request->get('consent');

        // Enregistrez la valeur dans la session
        $request->getSession()->set('cookie', $consent);
        $expire = 7776000; // 3 mois de 30j en secondes
        $path = "/";

        // Créer la réponse
        $response = new Response('Consent saved', Response::HTTP_OK);
        
        // Définir le cookie avec les options
        $response->headers->setCookie(new Cookie('adamsCookie', $consent, time() + $expire, $path));

        return $response;
    }
}
