<?php

namespace App\Form;

use App\Entity\MealPlanner;
use App\Entity\Recipe;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class MealPlannerType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('chosen_date', null, [
                'widget' => 'single_text',
            ])
            ->add('update_date', null, [
                'widget' => 'single_text',
            ])
            ->add('meal_chosen', EntityType::class, [
                'class' => Recipe::class,
                'choice_label' => 'name',
                'multiple' => true,
                'required' => false
            ])
            ->add('user', EntityType::class, [
                'class' => User::class,
                'choice_label' => 'id',
            ])
           
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => MealPlanner::class,
        ]);
    }
}
