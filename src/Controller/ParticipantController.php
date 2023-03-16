<?php

namespace App\Controller;

use App\Form\ParticipantType;
use App\Repository\ParticipantRepository;
use App\Repository\SortieRepository;
use App\Utils\Uploader;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/participant', name: 'participant_')]
class ParticipantController extends AbstractController
{
    #[Route('/list', name: 'list')]
    public function list(ParticipantRepository $participantRepository, Request $request): Response
    {
        $participants = $participantRepository->findBy([], ['nom' => 'ASC']);

        if (!$participants) {
            throw $this->createNotFoundException("Aucun participant n'a été trouvé !");
        }

        return $this->render('participant/list.html.twig', [
            'participants' => $participants,
        ]);
    }

    #[Route('/profilOrganisateur/{id}', name: 'profil_organisateur', requirements: ['id' => '\d+'])]
    public function afficherProfilOrganisateur(int $id, SortieRepository $sortieRepository, Request $request): Response
    {
        // récupérer id de la sortie
        $sortieOrganisee = $sortieRepository->find($id);

        if (!$sortieOrganisee) {
            throw $this->createNotFoundException("La sortie n'a pas été trouvée !");
        }

        // récupérer id de l'organisateur de la sortie
        $organisateur = $sortieOrganisee->getOrganisateur();

        if (!$organisateur) {
            throw $this->createNotFoundException("L'organisateur de la sortie n'a pas été trouvé !");
        }

        return $this->render('participant/profilOrganisateur.html.twig', [
            'organisateur' => $organisateur
        ]);
    }

    #[Route('/modifier/{id}', name: 'modifier', requirements: ['id' => '\d+'])]
    public function modifierProfil(int $id, ParticipantRepository $participantRepository, Request $request, Uploader $uploader)
    {
        // récupérer le participant grâce à son id
        $participant = $participantRepository->find($id);

        if (!$participant) {
            throw $this->createNotFoundException("Cet utilisateur n'a pas pu être modifié !");
        }

        $photo = $participant->getPhotoProfil();

        // instance de form liée à une instance de participant
        $participantForm = $this->createForm(participantType::class, $participant);
        // récupérer les données du formulaire
        $participantForm->handleRequest($request);

        // TODO : écraser anciennne photo car si pseudo renommé, ancienne photo gardée
        // changer renommage photo avec ???

        // si le formulaire est soumis et valide
        if ($participantForm->isSubmitted() && $participantForm->isValid()) {

            // upload photo de profil
            /**
             * @var UploadedFile $file
             */
            // upload crée en service
            $file = $participantForm->get('photo_profil')->getData();

            // si non null => upload, sinon appel pseudo.img
            if (!$file) {
                $participant->setPhotoProfil($photo);
            } else {

                // appel de l'uploader
                $newFileName = $uploader->upload(
                    $file,
                    // récupérer le paramètre de services.yaml
                    $this->getParameter('upload_photo_profil'),
                    $participant->getPseudo()
                );

                // setter le nouveau nom du fichier uploadé
                $participant->setPhotoProfil($newFileName);
            }

            // sauvegarder les nouvelles données en BDD
            $participantRepository->save($participant, true);
            $this->addFlash('success', 'Profil modifié !');

            // rediriger vers le profil modifié
            return $this->redirectToRoute('participant_modifier', ['id' => $participant->getId()]);
        }

        // afficher le formulaire de modification
        return $this->render('participant/modifierProfil.html.twig', [
            'participantForm' => $participantForm->createView()
        ]);
    }

    #[Route('/supprimer/{id}', name: 'supprimer', requirements: ['id' => '\d+'])]
    public function supprimerProfil(int $id, ParticipantRepository $participantRepository, Request $request, Uploader $uploader, SortieRepository $sortieRepository)
    {
        $participant = $participantRepository->find($id);

        if (!$participant) {
            throw $this->createNotFoundException("Cet utilisateur n'a pas pu être supprimé !");
        }

            // Supprime l'utilisateur des sorties auxquelles il est inscrit
            foreach ($participant->getSorties() as $sortie) {
                $sortie->removeParticipant($participant);
                $sortieRepository->save($sortie);
            }

            // Supprime l'utilisateur en tant qu'organisateur de ses sorties
            foreach ($participant->getSortiesOrganisees() as $sortie) {
                $sortieRepository->remove($sortie, true);
            }

            // Supprime l'utilisateur de la base de données
            $participantRepository->remove($participant, true);
            $this->addFlash("success", "Utilisateur supprimé !");

        return $this->redirectToRoute('participant_list');
    }

    #[Route('/changerEtat/{id}', name: 'changerEtat', requirements: ['id' => '\d+'])]
    public function changerEtat(int $id, Request $request, ParticipantRepository $participantRepository): Response
    {
        // récupérer le participant grâce à son id
        $participant = $participantRepository->find($id);

        if (!$participant) {
            throw $this->createNotFoundException("Cet utilisateur n'a pas pu être supprimé !");
        } else {
            //s'il est actif, le rendre inactif et vice-versa
            if($participant->isActif()){
                $participant->setActif(false);
            } else {
                $participant->setActif(true);
            }
        }

        $participantRepository->save($participant, true);

        $this->addFlash('success', 'L\'état du participant a été mis à jour');
        return $this->redirectToRoute('participant_list',[
            'participant' => $participant
        ]);
    }
}
