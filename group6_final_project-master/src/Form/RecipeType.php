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
                'attr' => [
                    'class' => 'form-control mb-3', 
                    'pattern' => '[a-zA-Z0-9\s.,/*-]*',
                    'placeholder' => 'Enter recipe name'
                ],
                'label' => 'Recipe Name',
                'label_attr' => ['class' => 'form-label'], 
            ))
            ->add('ingredients', TextType::class, array(
                'attr' => [
                    'class' => 'form-control mb-3',
                    'pattern' => '[a-zA-Z0-9\s.,/*-]*',
                    'placeholder' => 'List the ingredients'
                ],
                'label' => 'Ingredients',
                'label_attr' => ['class' => 'form-label'],
            ))
            ->add('description', TextType::class, array(
                'attr' => [
                    'class' => 'form-control mb-3',
                    'pattern' => '[a-zA-Z0-9\s.,/*-]*',
                    'placeholder' => 'Describe the recipe'
                ],
                'label' => 'Description',
                'label_attr' => ['class' => 'form-label'],  
            ))
            ->add('photo', UrlType::class, [
                'attr' => [
                    'class' => 'form-control mb-3',
                    'placeholder' => 'Provide a photo URL'
                ],
                'label' => 'Photo URL',
                'label_attr' => ['class' => 'form-label'],
            ])
            ->add('cooking_time', NumberType::class, array(
                'attr' => [
                    'class' => 'form-control mb-3',
                    'pattern' => '[0-9]*',
                    'placeholder' => 'Enter cooking time (minutes)'
                ],
                'label' => 'Cooking Time (minutes)',
                'label_attr' => ['class' => 'form-label'],
            ))
            ->add('preparation_time', NumberType::class, array(
                'attr' => [
                    'class' => 'form-control mb-3',
                    'pattern' => '[0-9]*',
                    'placeholder' => 'Enter preparation time (minutes)'
                ],
                'label' => 'Preparation Time (minutes)',
                'label_attr' => ['class' => 'form-label'],
            ))
            ->add('calories', NumberType::class, array(
                'attr' => [
                    'class' => 'form-control mb-3',
                    'pattern' => '[0-9]*',
                    'placeholder' => 'Enter calorie count'
                ],
                'label' => 'Calories',
                'label_attr' => ['class' => 'form-label'],
            ))
            ->add('link', UrlType::class, [
                'attr' => [
                    'class' => 'form-control mb-3',
                    'placeholder' => 'Enter a link to the recipe'
                ],
                'label' => 'Recipe Link',
                'label_attr' => ['class' => 'form-label'],
            ])
            ->add('type', ChoiceType::class, [
                'choices' => [
                    'Vegan' => 'Vegan',
                    'Vegetarian' => 'Vegetarian',
                    'Pescatarian' => 'Pescatarian',
                    'Meat' => 'Meat'
                ],
                'attr' => [
                    'class' => 'form-select mb-3',
                ],
                'label' => 'Recipe Type',
                'label_attr' => ['class' => 'form-label'],
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


// '[a-zA-Z0-9\s.,/*-]*'