<?php

namespace App\Controller\Anonymous;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PrivacyController extends AbstractController
{
    #[Route('/privacy', name: 'app_anonymous_privacy')]
    public function index(): Response
    {
        return $this->render('anonymous/privacy/index.html.twig');
    }
}