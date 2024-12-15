<?php

namespace App\Form;

use App\Entity\Recipe;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\UrlType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class RecipeType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, array(
                'attr' => ['pattern' => '[a-zA-Z0-9\s.,/*-]*']
            ))
            ->add('ingredients', TextType::class, array(
                'attr' => ['pattern' => '[a-zA-Z0-9\s.,/*-]*']
            ))
            ->add('description', TextType::class, array(
                'attr' => ['pattern' => '[a-zA-Z0-9\s.,/*-]*']
            ))
            ->add('photo', FileType::class, [
                'label' => 'Image (png, jpg, jpeg file)',

                // unmapped means that this field is not associated to any entity property
                'mapped' => false,

                // make it optional so you don't have to re-upload the PDF file
                // every time you edit the Product details
                'required' => false,

                // unmapped fields can't define their validation using attributes
                // in the associated entity, so you can use the PHP constraint classes
                'constraints' => [
                    new File([
                        'maxSize' => '2048k',
                        'mimeTypes' => [
                            'image/png',
                            'image/jpg',
                            'image/jpeg',
                        ],
                        'mimeTypesMessage' => 'Please upload a valid image file',
                    ])
                ],
            ])
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
