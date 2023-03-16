<?php

namespace App\Controller;

use App\Repository\EtatRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends AbstractController
{
    #[Route(path: '/login', name: 'app_login')]
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        // si user loggé, le redirige vers accueil
         if ($this->getUser()) {
             return $this->redirectToRoute('main_accueil');
         }

        // récupère l'erreur de login si elle existe
        $error = $authenticationUtils->getLastAuthenticationError();
        // récupère le username saisi par l'utilisateur
        $lastUsername = $authenticationUtils->getLastUsername();

        // si message d'erreur, afficher identifiants incorrects
        if ($error) {
            $this->addFlash('error', 'Identifiants incorrects !');
        }

        return $this->render('security/login.html.twig', [
            'last_username' => $lastUsername,
            'error' => $error,

        ]);
    }

    #[Route(path: '/logout', name: 'app_logout')]
    public function logout(): void
    {
        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }
}
