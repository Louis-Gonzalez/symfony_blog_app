<?php

namespace App\Controller\Anonymous;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use APY\BreadcrumbTrailBundle\Annotation\Breadcrumb;
use APY\BreadcrumbTrailBundle\BreadcrumbTrail\Trail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PrivacyController extends AbstractController
{
    #[Route('privacy', name: 'app_anonymous_privacy')]
    #[Breadcrumb(title:'Home', routeName: 'app_home')]
    public function showPolicy(Request $request,Trail $trail): Response
    {
        $trail->add('Privacy', 'app_anonymous_privacy');
        $locale = $request->getLocale();
        return $this->render('anonymous/privacy/policy.html.twig', [
            'locale' => $locale,
        ]);
    }

    #[Route('privacy/cgu', name: 'app_anonymous_privacy_cgu')]
    #[Breadcrumb(title:'Home', routeName: 'app_home')]
    public function showCgu(Request $request, Trail $trail): Response
    {
        $trail->add('CGU', 'app_anonymous_privacy_cgu');
        $locale = $request->getLocale();
        return $this->render('anonymous/privacy/cgu.html.twig', [
            'locale' => $locale,
        ]);
    }
}