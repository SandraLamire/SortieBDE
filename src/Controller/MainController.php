<?php

namespace App\Controller;

use App\Form\FiltresAccueilType;
use App\Model\FiltresAccueil;
use App\Repository\EtatRepository;
use App\Repository\SortieRepository;
use App\Services\MajEtatSorties;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

class MainController extends AbstractController
{
    #[Route('/accueil', name: 'main_accueil')]
    public function accueil(SessionInterface $session, EtatRepository $etatRepository, SortieRepository $sortieRepository, Request $request, MajEtatSorties $majEtatSorties, EntityManagerInterface $entityManager): Response
    {
        $etats = [];

        if(!$session->get('etats')){
            //Récupération des états en BDD pour les stocker dans le contexte de session
            foreach ($etatRepository->findAll() as $etat) {
                $etats[$etat->getLibelle()] = $etat;
            }
            $session->set('etats', $etats);
        }

        $etats = $session->get('etats');

        $majEtatSorties->majEtat($etats["En création"], $etats["Historisée"], $etats["Activité en cours"], $etats["Passée"], $etats["Ouverte"], $etats["Clôturée"], $sortieRepository, $entityManager);

        $dateDuJour = new \DateTime('now');
        $sorties = [];
        $filtres = new FiltresAccueil();
        $user = $this->getUser();

        $filtresForm = $this->createForm(FiltresAccueilType::class, $filtres);
        $filtresForm->handleRequest($request);

        if ($filtresForm->isSubmitted() && $filtresForm->isValid()) {
            $sorties = $sortieRepository->findByFilters($etats["En création"], $etats["Historisée"], $filtres, $this->getUser(), true);
        } else {
            $sorties = $sortieRepository->findByFilters($etats["En création"], $etats["Historisée"], $filtres, $this->getUser(), false);
        }

        return $this->render('main/accueil.html.twig', [
            'filtresForm' => $filtresForm->createView(),
            'dateDuJour' => $dateDuJour,
            "sorties" => $sorties,
            "user" => $user
        ]);

    }
}
