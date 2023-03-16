<?php

namespace App\Services;

use App\Entity\Etat;
use App\Repository\SortieRepository;
use Doctrine\ORM\EntityManagerInterface;

class MajEtatSorties
{
    //Classe en charge de la mise à jour de l'état des sorties en BDD

    public function majEtat(Etat $etatCreee, Etat $etatHistorisee, Etat $etatEnCours, Etat $etatPassee, Etat $etatOuverte, Etat $etatCloturee, SortieRepository $sortieRepository, EntityManagerInterface $entityManager)
    {
        $sorties = $sortieRepository->findByStatusNotCreated($etatCreee);

        foreach ($sorties as $sortie) {

                $dateHeureDebut = clone $sortie->getDateHeureDebut();

                $limiteAnt = clone $dateHeureDebut;
                $limiteAnt->modify('+' . $sortie->getDuree() . 'minute');
                $limitePost = clone $limiteAnt;
                $limitePost->modify('+1month');

                $dateAuj = new \DateTime();

                //Si la date actuelle est supérieure à la date
                //de début de la sortie, alors l'état passe à "Activité en cours"
                //Si en plus de ça, la date actuelle est supérieure à
                //DateHeureDébut + durée = limite antérieure
                //Alors l'état passe en passée

                //Si cela fait plus d'un mois que la sortie est terminée
                //DateHeureDebut + durée = limite antérieure
                //limite antérieure + 1 mois = limite postérieure
                //Si dateAujourd'hui > limite postérieure,
                //Alors l'état passe en clôturé

                if ($dateAuj > $limitePost) {
                    $sortie->setEtat($etatHistorisee);
                } elseif ($dateAuj > $limiteAnt) {
                    $sortie->setEtat($etatPassee);
                } elseif ($dateAuj > $dateHeureDebut) {
                    $sortie->setEtat($etatEnCours);
                } elseif ($dateAuj < $dateHeureDebut &&
                            $sortie->getEtat()->getLibelle() !== "Ouverte" &&
                            $sortie->getParticipants()->count() < $sortie->getNbInscriptionsMax())
                {
                    $sortie->setEtat($etatOuverte);
                }

                $entityManager->persist($sortie);
            }
            $entityManager->flush();
        }
}