<?php

namespace App\Controller;

use App\Entity\Sortie;
use App\Form\AnnuleType;
use App\Form\ModifierSortieType;
use App\Form\SortieType;
use App\Repository\EtatRepository;
use App\Repository\ParticipantRepository;
use App\Repository\SortieRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/sortie', name: 'sortie_')]
class SortieController extends AbstractController
{

    #[Route('/creation', name: 'creation')]
    public function creation(Session $session, ParticipantRepository $participantRepository, EntityManagerInterface $entityManager, Request $request, EtatRepository $etatRepository): Response
    {
        $participant = $participantRepository->findByIdentifier($this->getUser()->getUserIdentifier());
        if($participant->isActif()){

            $sortie = new Sortie();
            //Permet de récupérer le campus de l'user connecté dans le form créer une sortie
            $sortie->setSiteOrganisateur($participant->getCampus());
            $sortie->setOrganisateur($participant);

            //Création d'une instance de form lié à une instance de sortie
            $sortieForm = $this->createForm(SortieType::class, $sortie);

            //méthode qui extrait les éléments du formulaire
            $sortieForm->handleRequest($request);

            //Récupération des états
            $etats = $session->get('etats');

            if ($sortieForm->isSubmitted() && $sortieForm->isValid()) {
                //set etat en fonction du bouton cliqué
                $bjr = $request->request->get('bjr');
                if ($bjr === 'publier') {
                    $sortie->setEtat($etats["Ouverte"]);
                    $entityManager->persist($sortie);
                } else if ($bjr === 'creee') {
                    $sortie->setEtat($etats["En création"]);
                    $entityManager->persist($sortie);
                }

                //Sauvegarde en BDD la création de l'événement
                $entityManager->flush();

                $this->addFlash("success", "Sortie Ajouté !");

                //redirige vers la page accueil
                return $this->redirectToRoute('main_accueil', ['id' => $sortie->getId()]);
            }


            return $this->render('sortie/creation.html.twig', [
                'sortieForm' => $sortieForm->createView()

            ]);
        } else {
            throw $this->createNotFoundException("Vous ne pouvez pas créer de sortie. Votre profil est inactif. Contactez l'admin ;)");
        }
    }

    #[Route('/{id}', name: 'afficher', requirements: ['id' => '\d+'])]
    public function afficher(int $id, SortieRepository $sortieRepository, ParticipantRepository $participantRepository): Response
    {
        $sortie = $sortieRepository->find($id);

        if(!$sortie){
            throw $this->createNotFoundException("Oups ! La sortie n'a pas été trouvée !");
        }

        return $this->render('sortie/afficher.html.twig', [
            'sortie' => $sortie,
        ]);
    }

    #[Route('/modifier/{id}', name: 'modifier', requirements: ['id' => '\d+'])]
    public function modifier(int $id, SortieRepository $sortieRepository, Request $request): Response
    {
        $sortie = new Sortie();
        $sortie = $sortieRepository->find($id);

        //Création du formulaire modifier sortie
        $sortieForm = $this->createForm(ModifierSortieType::class, $sortie);

        //Méthode qui extrait les éléments du formulaire
        $sortieForm->handleRequest($request);

        if ($sortieForm->isSubmitted() && $sortieForm->isValid()){

            //sauvegarde en BDD la modification de l'event
            $sortieRepository->save($sortie, true);;

            $this->addFlash("success","Sortie Modifiée !");

            //redirige vers la page accueil
            return $this->redirectToRoute('main_accueil') ;
        }

        return $this->render('sortie/modifier.html.twig', [
            'sortie'=>$sortie,
            'ModifierSortie'=> $sortieForm->createView()
        ]);
    }

    #[Route('/supprimer/{id}', name: 'supprimer')]
    public function supprimer(int $id, SortieRepository $sortieRepository)
    {
        //Récupération de la série
        $sortie = $sortieRepository->find($id);

        if ($sortie){
            //je la supprime
            $sortieRepository->remove($sortie, true);
            $this->addFlash("Success", "Sortie supprimée avec succès !");
        }else{
            throw $this->createNotFoundException("Cette sortie ne peut pas être supprimée !");
        }
        return $this->redirectToRoute('main_accueil');
    }
    #[Route('/publier/{id}', name: 'publier', requirements: ['id'=>'\d+'])]
    public function publier(SessionInterface $session, int $id, SortieRepository $sortieRepository, EtatRepository $etatRepository)
    {
        $sortie = $sortieRepository->find($id);
        $etats = $session->get('etats');

        $sortie->setEtat($etats["Ouverte"]);
        $sortieRepository->save($sortie, true);

        return $this->redirectToRoute("sortie_afficher", ['id' => $id]);
    }
    #[Route('/annuler/{id}', name: 'annuler', requirements: ['id'=>'\d+'])]
    public function annuler(Session $session, int $id, SortieRepository $sortieRepository, Request $request, EtatRepository $etatRepository): Response
    {
        $sortie = $sortieRepository->find($id);
        $sorteiInfo =$sortie->getInfosSortie();
        $etats = $session->get('etats');

        //Création formulaire annuler sortie
        $sortieForm=$this->createForm(AnnuleType::class);

        //Méthode qui extrait les éléments du formulaire
        $sortieForm->handleRequest($request);

        if ($sortieForm->isSubmitted()){

            $motif = $sortieForm->get('infosSortie')->getData();

            //modifier la description de sortie
            $sortie->setInfosSortie($sorteiInfo . $motif);
            $sortie->setEtat($etats["Annulée"]);
            //sauvegarde en BDD la modification de l'event
            $sortieRepository->save($sortie, true);

            $this->addFlash("success","Sortie Annulée !");

            //redirige vers la page accueil
            return $this->redirectToRoute('main_accueil') ;
        }

        return $this->render('sortie/annuler.html.twig',[
        'sortie'=>$sortie,
            'AnnulerSortie'=>$sortieForm->createView()
        ]);
    }

    #[Route('/inscription/{id}', name: 'inscription', requirements: ['id'=>'\d+'])]
    public function inscription(Session $session, ParticipantRepository $participantRepository, SortieRepository $sortieRepository, Sortie $id)
    {
        $userID = $this->getUser()->getUserIdentifier();
        $participant = $participantRepository->findByIdentifier($userID);
        $etats = $session->get('etats');

        if($participant->isActif()){
            if ($id->getEtat()->getLibelle() !== "Clôturée"){
                $id->addParticipant($participant);
                $sortieRepository->save($id, true);
            } else {
                $this->addFlash("Warning", "Nombre d'inscrits maximum atteint !");
            }
        } else {
            throw $this->createNotFoundException("Vous ne pouvez pas vous inscire à une sortie. Votre profil est inactif. Contactez l'admin ;)");
        }

        if($id->getParticipants()->count() === $id->getNbInscriptionsMax()){
            $id->setEtat($etats["Clôturée"]);
            $sortieRepository->save($id, true);
        }

        return $this->redirectToRoute("sortie_afficher",[
            'id'=> $id->getId(),
        ]);
    }

    #[Route('/desinscription/{id}', name: 'desinscription', requirements: ['id'=>'\d+'])]
    public function desinscription(Session $session, ParticipantRepository $participantRepository, SortieRepository $sortieRepository, int $id)
    {
        $sortie = $sortieRepository->find($id);
        $userID = $this->getUser()->getUserIdentifier();
        $user = $participantRepository->findByIdentifier($userID);
        $etats = $session->get('etats');

        if($user->isActif()){
            if ($sortie->getParticipants()->contains($user)){
                $sortie->removeParticipant($user);
                    if($sortie->getEtat()->getLibelle() === "Clôturée") $sortie->setEtat($etats["Ouverte"]);
                $sortieRepository->save($sortie, true);
            } else {
                $this->addFlash("Warning", "Vous n'êtes pas inscrit à cette sortie !");
            }
        } else {
            throw $this->createNotFoundException("Vous ne pouvez pas vous désinscire d'une sortie. Votre profil est inactif. Contactez l'admin ;)");
        }

        return $this->redirectToRoute("main_accueil");
    }
}
