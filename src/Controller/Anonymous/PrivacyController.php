<?php

namespace App\Controller\Anonymous;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use APY\BreadcrumbTrailBundle\Annotation\Breadcrumb;
use APY\BreadcrumbTrailBundle\BreadcrumbTrail\Trail;

class PrivacyController extends AbstractController
{
    #[Route('/privacy', name: 'app_anonymous_privacy')]
    #[Breadcrumb(title:'Home', routeName: 'app_home')]
    public function index(Trail $trail): Response
    {
        $trail->add('Privacy', 'app_anonymous_privacy');
        return $this->render('anonymous/privacy/index.html.twig');
    }
}