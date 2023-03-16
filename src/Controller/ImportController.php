<?php

namespace App\Controller;

use App\Entity\Campus;
use App\Entity\Participant;
use App\Form\RegistrationFormType;
use App\Repository\CampusRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Encoder\CsvEncoder;
use Symfony\Component\Serializer\SerializerInterface;

//#[Route("/importer-participants")]
class ImportController extends AbstractController
{
//    #[Route ('/', name: 'importer_participants')]
    public function importerParticipants(Request $request, EntityManagerInterface $em)
    {
        $user = new Participant();
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $file = $request->files->get('fichier_csv');


            // ouvrir le fichier CSV en mode lecture
            $handle = fopen($file->getPathname(), "r");

            // parcourir le fichier ligne par ligne à partir de la deuxième ligne
            $row = 1;
            while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
                if ($row > 1) {
                    // récupérer les valeurs pour chaque colonne
                    $pseudo = $data[0];
                    $prenom = $data[1];
                    $nom = $data[2];
                    $telephone = $data[3];
                    $mail = $data[4];
                    $plainPassword = $data[5];
                    $campus = $data[6];

                    // créer un nouvel utilisateur
                    $user = new Participant();
                    $user->setPseudo($pseudo);
                    $user->setPrenom($prenom);
                    $user->setNom($nom);
                    $user->setTelephone($telephone);
                    $user->setMail($mail);
                    $user->setCampus($campus);

                    $em->persist($user);
                }
                $row++;
            }
            // fermer le fichier
            fclose($handle);
            $em->flush();
            $this->addFlash('success', 'Les données du fichier csv ont été ajoutées à base de données');

            return $this->redirectToRoute('participant_list');
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
        ]);
    }
}
//

/*
// INSTALLER composer require symfony/serializer pour pouvoir l'utiliser
use App\Entity\Participant;
use App\Form\RegistrationFormType;
use App\Repository\CampusRepository;
use App\Repository\ParticipantRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;


#[Route('/register', name: 'app_register')]
public function register(CampusRepository            $campusRepository,
                         Request                     $request,
                         UserPasswordHasherInterface $userPasswordHasher,
                         EntityManagerInterface      $entityManager): Response
{
    $user = new Participant();

    //formulaire registrationForm
    $form = $this->createForm(RegistrationFormType::class, $user);
    $form->handleRequest($request);

    // vérif si registrationForm soumis
    if ($form->isSubmitted() && $form->isValid()) {
        // hash MDP
        $user->setPassword($userPasswordHasher->hashPassword($user, $form->get('plainPassword')->getData()));
        // rôle user par défaut
        $user->setRoles(['ROLE_USER']);

        $entityManager->persist($user);
        $entityManager->flush();

        $this->addFlash("sucess", "Utilisateur inscrit !");

        return $this->redirectToRoute('main_home');
    }

    // formulaire télécharger csv
    //FileModel() ne contient qu'un attribut fichier + getter/setter
    $ajoutfileModel = new FileModel();
    $csvForm = $this->createForm(RegistationFormCSVType::class, $ajoutfileModel);
    $csvForm->handleRequest($request);

    if ($csvForm->isSubmitted() && $csvForm->isValid()) {

        /**
         * @var UploadedFile $file
         */

/*        $file = $csvForm->get('fichier')->getData();
        if ($file) {
            $x = 0;
            if (($handle = fopen($file, "r")) !== FALSE) {
                while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) {
                    $x++;
                    if ($x > 1) {
                        $user = new Participant();
                        $campus = $campusRepository->find($data[5]);

                        $user->setPseudo($data[0]);
                        $user->setNom($data[1]);
                        $user->setPrenom($data[2]);
                        $user->setTelephone($data[3]);
                        $user->setMail($data[4]);
                        $user->setPassword('eni2023');
                        $user->setCampus($campus);
                        $user->setRoles(['ROLE_USER']);
                        $user->setPassword($userPasswordHasher->hashPassword($user, 'eni2023'));
                        $entityManager->persist($user);
                    }
                }
                $entityManager->flush();
                $this->addFlash('success', 'Ajout des utilisateurs réussi');
            }
        }
        return $this->redirectToRoute('participant_list');
    }
    return $this->render('register.html.twig', [
        'registrationForm' => $form->createView(),
        'csvForm' => $csvForm->createView()
    ]);
}
*/


//    public function importerParticipants(Request $request, SerializerInterface $serializer, CampusRepository $campusRepository, EntityManagerInterface $entityManager): Response
//    {
//        // Vérifier si un fichier a été envoyé
//        if (!$request->files->has('fichier_csv')) {
//            throw $this->createNotFoundException("Aucun fichier n'a été envoyé.");
//        }
//
//        // Récupérer le fichier CSV envoyé
//        $fichier = $request->files->get('fichier_csv');
//
//        // Vérifier si le fichier est valide
//        if ($fichier->getError() !== UPLOAD_ERR_OK) {
//            throw $this->createNotFoundException("Le fichier n'a pas pu être envoyé.");
//        }
//
//        // Lire le contenu du fichier et le décoder en tableau de données
//        $contenu = file_get_contents($fichier->getPathname());
//        $donnees = $serializer->decode($contenu, CsvEncoder::FORMAT);
//        //dd($donnees); //récupère les 3 lignes "Pseudo;Nom;Prenom;Telephone;Mail;Campus" => "Vava;Vivi;Vovo;06 00 00 00 88;vava@eni.fr;Niort"
//
//        // Extraire les valeurs du tableau
//        $values = array_values($donnees);
//        //dd($values); // récupère 0 => "Vava;Vivi;Vovo;06 00 00 00 88;vava@eni.fr;Niort"
//
//        // Diviser la chaîne en un tableau de valeurs individuelles
//        $donnees_separees = explode(';', $values[0]);
//        //dd($donnees_separees); //récupère       0 => "Vava"
////                                              1 => "Vivi"
////                                              2 => "Vovo"
////                                              3 => "06 00 00 00 88"
////                                              4 => "vava@eni.fr"
////                                              5 => "Niort"
//
//        // réquête à la BDD pour récup des campus
//        // Récupération des entités Campus
//        $campusList = $campusRepository->findAll();
//
//        // Stockage des noms de campus dans un tableau
//        $CampusList = array();
//        foreach ($campusList as $campus) {
//            $CampusList[] = $campus;
//            $nomCampus = $campus->getNom();
//        }
//
//        foreach ($donnees as $row) {
//
//                // Créer un participant à partir des éléments du tableau
//                $participant = new Participant();
//                $participant->setPassword('enieni');
//
//                // Vérifier que le pseudo est unique
//                $pseudoAComparer = $donnees_separees[0];
//                //dd($pseudoAComparer); récupère bien "Vuvu"
//                $participantExist = $entityManager->getRepository(Participant::class)->findOneBy(['pseudo' => $pseudoAComparer]);
//                //dd($participantExist); = null
//                if ($participantExist === null) {
//                    $participant->setPseudo($pseudoAComparer);
//                    // dd($participant); Vuvu bien mis en pseudo
//                } else {
//                    // Le pseudo existe déjà, ignorer cette ligne du fichier
//                    continue;
//                }
//
//                $participant->setNom($donnees_separees[1]);
//                $participant->setPrenom($donnees_separees[2]);
//                $participant->setTelephone($donnees_separees[3]);
//                $participant->setMail($donnees_separees[4]);
//
//                // Vérification que le campus existe dans la liste
//                // Récupérer l'objet Campus correspondant au nom de campus extrait
//                $nomCampus = $donnees_separees[5];
//                $campus = null;
//                foreach ($campusList as $c) {
//                    if ($c->getNom() === $nomCampus) {
//                        $campus = $c;
//                        break;
//                    }
//                }
//                // Si un objet Campus correspondant au nom de campus a été trouvé, l'assigner au participant
//                if ($campus !== null) {
//                    $participant->setCampus($campus);
//                }
//
//            // Sauvegarder le participant en base de données
//            $entityManager->persist($participant);
//
//        }
//        $entityManager->flush();
//
//        $this->addFlash('success', 'Les données du fichier csv ont été ajoutées à base de données');
//        return $this->redirectToRoute('app_register');
//    }
//
//}



//        // Créer un participant à partir de chaque ligne du fichier
//        for ($i = 0; $i < count($donnees); $i++) {
//            // Extraire les valeurs du tableau
//            $values = array_values($donnees[$i]);
//            // Diviser la chaîne en un tableau de valeurs individuelles
//            $donnees_separees = explode(';', $values[0]);
//
//            // Créer un participant à partir des éléments du tableau
//            $participant = new Participant();
//            $participant->setPassword('enieni');
//
//            // Vérifier que le pseudo est unique
//            $pseudoAComparer = $donnees_separees[0];
//            $participantExist = $entityManager->getRepository(Participant::class)->findOneBy(['pseudo' => $pseudoAComparer]);
//            if ($participantExist === null) {
//                $participant->setPseudo($pseudoAComparer);
//            } else {
//                // Le pseudo existe déjà, ignorer cette ligne du fichier
//                continue;
//            }
//
//            $participant->setNom($donnees_separees[1]);
//            $participant->setPrenom($donnees_separees[2]);
//            $participant->setTelephone($donnees_separees[3]);
//            $participant->setMail($donnees_separees[4]);
//
//            // Vérification que le campus existe dans la liste
//                // Récupérer l'objet Campus correspondant au nom de campus extrait
//                $nomCampus = $donnees_separees[5];
//                $campus = null;
//                foreach ($campusList as $c) {
//                    if ($c->getNom() === $nomCampus) {
//                        $campus = $c;
//                        break;
//                    }
//                }
//                // Si un objet Campus correspondant au nom de campus a été trouvé, l'assigner au participant
//                if ($campus !== null) {
//                    $participant->setCampus($campus);
//                }
//
//
//            // Sauvegarder le participant en base de données
//            $entityManager->persist($participant);
//        }
//
//        $entityManager->flush();
//
//        $this->addFlash('success', 'Les données du fichier csv ont été ajoutées à base de données');
//        return $this->redirectToRoute('app_register');



//}
//
//    public function importerParticipants(Request $request, EntityManagerInterface $em)
//    {
//        $form = $this->createFormBuilder()->getForm();
//        $form->handleRequest($request);
//
//        if ($form->isSubmitted() && $form->isValid()) {
//            $file = $request->files->get('fichier_csv');
//
//            // ouvrir le fichier CSV en mode lecture
//            $handle = fopen($file->getPathname(), "r");
//
//            // parcourir le fichier ligne par ligne à partir de la deuxième ligne
//            $row = 1;
//            while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
//                if ($row > 1) {
//                    // récupérer les valeurs pour chaque colonne
//                    $pseudo = $data[0];
//                    $prenom = $data[1];
//                    $nom = $data[2];
//                    $telephone = $data[3];
//                    $mail = $data[4];
//                    $plainPassword = $data[5];
//                    $campus = $data[6];
//
//                    // créer un nouvel utilisateur
//                    $user = new Participant();
//                    $user->setPseudo($pseudo);
//                    $user->setPrenom($prenom);
//                    $user->setNom($nom);
//                    $user->setTelephone($telephone);
//                    $user->setMail($mail);
//                    $user->setCampus($campus);
//
//                    $em->persist($user);
//                }
//
//                $row++;
//            }
//            // fermer le fichier
//            fclose($handle);
//            $em->flush();
//            $this->addFlash('success', 'Les données du fichier csv ont été ajoutées à base de données');
//
//            return $this->redirectToRoute('participant_list');
//        }
//
//        return $this->render('registration/register.html.twig', [
//            'registrationForm' => $form->createView(),
//        ]);
//    }}