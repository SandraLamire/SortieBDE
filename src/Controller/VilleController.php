<?php

namespace App\Controller;

use App\Entity\Ville;
use App\Form\VilleType;
use App\Repository\VilleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/ville', name: 'ville_')]
class VilleController extends AbstractController
{
    #[Route('/afficher', name: 'afficher')]
    public function afficherVilles(Request $request, VilleRepository $villeRepository)
    {
        $saisie = $request->query->get('saisie');

        if(!empty($saisie)){
            $villes = $villeRepository->findByName($saisie);
            if(empty($villes)){
                // gestion des exceptions (erreur 404)
                // throw $this->createNotFoundException("Oups, aucune ville n'a été trouvée !");
                // remplacé par popup error
                $this->addFlash("error", "Aucune ville contenant $saisie n'a été trouvée !");
                return $this->redirectToRoute('ville_afficher');
            }
        } else {
            $villes = $villeRepository->findBy([], ['nom' => 'ASC']);
        }

        if(!$villes){
            throw $this->createNotFoundException("Oups, les villes n'ont pas été trouvées !");
        }

        $nouvelleVille = new Ville();
        $formVille = $this->createForm(VilleType::class, $nouvelleVille);
        $formVille->handleRequest($request);

        if ($formVille->isSubmitted() && $formVille->isValid()) {
            $villeRepository->save($nouvelleVille, true);
            return $this->redirectToRoute('ville_afficher');
        }

        return $this->render('ville/afficherVilles.html.twig', [
            'villes' => $villes,
            'formVille' => $formVille->createView(),
            'formModif' => $formVille->createView(),
        ]);
    }

    #[Route('/ajouter', name: 'ajouter')]
    public function ajouterVille(Request $request, VilleRepository $villeRepository)
    {
        $nouvelleVille = new Ville();
        $villeForm = $this->createForm(VilleType::class, $nouvelleVille);
        $villeForm->handleRequest($request);

        if ($villeForm->isSubmitted() && $villeForm->isValid()) {
            $nouvelleVille = $villeForm->getData();
            $nouvelleVille
                ->setVille($request->get('ville'))
                ->setCodePostal($request->get('code_postal'));

            $villeRepository->save($nouvelleVille, true);
            return $this->redirectToRoute('ville_afficher');
        }

        return $this->render('ville/afficherVilles.html.twig', [
            'villeForm' => $villeForm->createView(),
            'ville' => $nouvelleVille
        ]);
    }

    #[Route('/modifier/{id}', name: 'modifier')]
    public function modifier(int $id,
                             Request $request,
                             EntityManagerInterface $entityManager,
                             VilleRepository $villeRepository)
    {
        $ville = $villeRepository->find($id);
        $villes = $villeRepository->findBy([], ['nom' => 'ASC']);
        $ville_modif = $ville;

        if (!$ville) {
            throw $this->createNotFoundException("Cette ville n'a pas pu être modifiée !");
        }
        if (!$villes ) {
            throw $this->createNotFoundException("La liste des villes n'est pas accessible !");
        }

        $formVille = $this->createForm(VilleType::class, $ville);
        $formVille->handleRequest($request);

        if ($formVille->isSubmitted() && $formVille->isValid()) {
            $ville
                ->setNom($ville->getNom())
                ->setCodePostal($ville->getCodePostal());

            $villeRepository->save($ville, true);

            $this->addFlash('success', 'Ville modifiée avec succès.');
            return $this->redirectToRoute('ville_afficher');
        }

        return $this->render('ville/afficherVilles.html.twig', [
            'formVille' => $formVille->createView(),
            'ville' => $ville,
            'villes' => $villes,
            'ville_modif' => $ville_modif
        ]);
    }

    #[Route('/supprimer/{id}', name: 'supprimer')]
    public function supprimerVille(int $id, VilleRepository $villeRepository, Request $request): Response
    {
        $ville = $villeRepository->find($id);

        if (!$ville) {
            throw $this->createNotFoundException("Cette ville n'a pas pu être supprimé !");
        }

        //TODO : gérer les dépendances pour pouvoir supprimer
        $villeRepository->remove($ville, true);
        $this->addFlash("success", "Ville supprimée !");

        return $this->render('ville/afficherVilles.html.twig');
    }
}
