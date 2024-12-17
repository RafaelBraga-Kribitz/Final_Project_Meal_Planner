<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder

            ->add('email', EmailType::class, options: [
                'attr' => ['pattern' => '[^@\s]+@[^@\s]+\.[^@\s]+']
            ])
            ->add('phoneNumber', TelType::class, [
                'required' => false,
                'attr' => [
                    'pattern' => '^[0-9\-\+\s\(\)]{6,20}$',
                    'placeholder' => '+XX XXX XXX XXX'
                ],
                'constraints' => [
                    new Length([
                        'max' => 20,
                        'maxMessage' => 'Phone number cannot be longer than {{ limit }} characters',
                    ])
                ]
            ])
            ->add('first_name', TextType::class, options: [
                'attr' => ['pattern' => '[a-zA-Z\s.,/*-]*']
            ])
            ->add('last_name', TextType::class, array(
                'attr' => ['pattern' => '[a-zA-Z\s.,/*-]*']
            ))
            ->add('photo')
            ->add('agreeTerms', CheckboxType::class, [
                'mapped' => false,
                'constraints' => [
                    new IsTrue([
                        'message' => 'You should agree to our terms.',
                    ]),
                ],
            ])
            ->add('plainPassword', PasswordType::class, [
                // instead of being set onto the object directly,
                // this is read and encoded in the controller
                'mapped' => false,
                'attr' => ['autocomplete' => 'new-password'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Please enter a password',
                    ]),
                    new Length([
                        'min' => 6,
                        'minMessage' => 'Your password should be at least {{ limit }} characters',
                        // max length allowed by Symfony for security reasons
                        'max' => 4096,
                    ]),
                ],
            ])
        ;
    }
    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
