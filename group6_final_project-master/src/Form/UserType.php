<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            // ->add('email')
            // ->add('password')
            ->add('first_name', TextType::class, array(
                'attr' => ['pattern' => '[a-zA-Z]*']
            ))
            ->add('last_name', TextType::class, array(
                'attr' => ['pattern' => '[a-zA-Z]*']
            ))
            ->add('photo')
            ->add('phone_number', TelType::class, array(
                'attr' => ['pattern' => '[0-9]*']
            ))
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
