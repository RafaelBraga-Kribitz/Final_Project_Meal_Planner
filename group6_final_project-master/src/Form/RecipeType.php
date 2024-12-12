<?php

namespace App\Form;

use App\Entity\Recipe;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\UrlType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class RecipeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, array(
                'attr' => ['pattern' => '[a-zA-Z]*']
            ))
            ->add('ingredients', TextType::class, array(
                'attr' => ['pattern' => '[a-zA-Z0-9]*']
            ))
            ->add('description', TextType::class, array(
                'attr' => ['pattern' => '[a-zA-Z0-9]*']
            ))
            ->add('photo')
            ->add('cooking_time', NumberType::class, array(
                'attr' => ['pattern' => '[0-9]*']
            ))
            ->add('preparation_time', NumberType::class, array(
                'attr' => ['pattern' => '[0-9]*']
            ))
            ->add('calories', NumberType::class, array(
                'attr' => ['pattern' => '[0-9]*']
            ))
            ->add('link', UrlType::class)
            ->add('type', ChoiceType::class, [
                'choices' => [
                    'Vegan' => 'Vegan',
                    'Vegetarian' => 'Vegetarian',
                    'Pescatarian' => 'Pescatarian',
                    'Meat' => 'Meat'
                ]
            ])
            #->add('date_added', null, [
            #    'widget' => 'single_text',
            #])
            #->add('date_updated', null, [
            #    'widget' => 'single_text',
            #])
            // ->add('author', EntityType::class, [
            //     'class' => User::class,
            //     'choice_label' => 'id',
            // ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Recipe::class,
        ]);
    }
}
