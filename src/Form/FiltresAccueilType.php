<?php

namespace App\Form;

use App\Entity\Campus;
use App\Model\FiltresAccueil;
use App\Repository\CampusRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\SearchType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;



class FiltresAccueilType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('campus', EntityType::class, [
                'class' => Campus::class,
                'choice_label' => 'nom',
                'placeholder' => 'Tous les campus'
            ])
            ->add('recherche', SearchType::class, [
                'label'=>'Le nom de la sortie contient :'
            ])
            ->add('dateDebut', DateTimeType::class, [
                'label'=>'Entre',
                'html5'=>true,
                'widget'=>'single_text'
            ])
            ->add('dateFin', DateTimeType::class, [
                'label'=>'et',
                'html5'=>true,
                'widget'=>'single_text'
            ])
            ->add('checkOrga', CheckboxType::class, [
                'label'=>"Sorties dont je suis l'organisateur/trice"
            ])
            ->add('checkInscrit', CheckboxType::class, [
                'label'=>'Sorties auxquelles je suis inscrit/e'
            ])
            ->add('checkNonInscrit', CheckboxType::class, [
                'label'=>'Sorties auxquelles je ne suis pas inscrit/e'
            ])
            ->add('checkPassees', CheckboxType::class, [
                'label'=>'Sorties passées'
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => FiltresAccueil::class,
            'required'=>false
        ]);
    }
}
