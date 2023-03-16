<?php

namespace App\Controller;

use App\Entity\Campus;
use App\Form\CampusType;
use App\Repository\CampusRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/campus', name: 'campus_')]
class CampusController extends AbstractController
{
    #[Route('/afficher', name: 'afficher')]
    public function afficherCampus(Request $request, CampusRepository $campusRepository): Response
    {
        $allCampus = $campusRepository->findBy([], ['nom' => 'ASC']);

        if (!$allCampus) {
            throw $this->createNotFoundException("Oups, les campus n'ont pas été trouvés !");
        }

        $nouveauCampus = new Campus();
        $formCampus = $this->createForm(CampusType::class, $nouveauCampus);
        $formCampus->handleRequest($request);

        if ($formCampus->isSubmitted() && $formCampus->isValid()) {
            $campusRepository->save($nouveauCampus, true);
            return $this->redirectToRoute('campus_afficher');
        }

        return $this->render('campus/afficherCampus.html.twig', [
            'allCampus' => $allCampus,
            'formCampus' => $formCampus->createView()
        ]);
    }

    #[Route('/filtrer', name: 'filtrer')]
    public function filtrerCampus(Request $request, CampusRepository $campusRepository): Response
    {
        $saisie = $request->query->get('saisie');

        // pas de message d'erreur car pas de saisie = affichage de tous les campus
        if (empty($saisie)) {
            return $this->redirectToRoute('campus_afficher');
        }

        $allCampus = $campusRepository->createQueryBuilder('v')
            ->where('v.nom LIKE :nom')
            ->setParameter('nom', '%' . $saisie . '%')
            ->orderBy('v.nom', 'ASC')
            ->getQuery()
            ->getResult();

        if (empty($allCampus)) {
            // throw $this->createNotFoundException("Oups, aucun campus n'a été trouvé !");
            // remplacé par message
            $this->addFlash("error", "aucun campus contenant $saisie n'a été trouvé !");
            return $this->redirectToRoute('campus_afficher');
        }

        return $this->render('campus/afficherCampus.html.twig', [
            'allCampus' => $allCampus,
            'saisie' => $saisie
        ]);
    }

    #[Route('/ajouter', name: 'ajouter')]
    public function ajouterCampus(Request $request, EntityManagerInterface $entityManager)
    {
        $campus = new Campus();
        $form = $this->createForm(CampusType::class, $campus);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($campus);
            $entityManager->flush();

            $this->addFlash('success', 'Le campus a bien été ajouté.');
            return $this->redirectToRoute('campus_afficher');
        }

        return $this->render('campus/afficherCampus.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/modifier/{id}', name: 'modifier')]
    public function modifierCampus(int $id, CampusRepository $campusRepository, Request $request, EntityManagerInterface $entityManager): Response
    {
        // TODO : function modifierCampus() avec exception 404
        $campus = $campusRepository->find($id);
        $allCampus = $campusRepository->findBy([], ['nom' => 'ASC']);

        if (!$campus) {
            throw $this->createNotFoundException("Ce campus n'a pas pu être supprimé !");
        }
        if (!$allCampus) {
            throw $this->createNotFoundException("La liste des campus n'est pas accessible !");
        }

        $form = $this->createForm(CampusType::class, $campus);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $campus->setNom($campus->getNom());

            $campusRepository->save($campus, true);

            $this->addFlash('success', 'Le campus a été modifié avec succès.');
            return $this->redirectToRoute('campus_afficher', ['id' => $campus->getId()]);
        }

        return $this->render('campus/afficherCampus.html.twig', [
            'formCampus' => $form->createView(),
            'campus' => $campus,
            'allCampus' => $allCampus
        ]);
    }

    #[Route('/supprimer/{id}', name: 'supprimer')]
    public function supprimerCampus(int $id, CampusRepository $campusRepository, EntityManagerInterface $entityManager): Response
    {
        //TODO : gérer les dépendances pour pouvoir supprimer
        $campus = $campusRepository->find($id);

        if (!$campus) {
            throw $this->createNotFoundException("Ce campus n'a pas pu être supprimé !");
        } else {
            $campusRepository->remove($campus, true);
            $this->addFlash("success", "campus supprimé !");
        }

        return $this->redirectToRoute('campus_afficher');
    }
}
