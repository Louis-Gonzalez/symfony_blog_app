<?php

namespace App\Form;

use App\Entity\User;
use App\Entity\Contact;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', TextType::class, 
                [
                'constraints' => new Assert\NotBlank(['message' => 'Pease enter a title']),
                ])
            ->add('description', TextareaType::class, [
                'attr' => [
                    'class' => 'tinymce', 
                    'rows'=>5,
                ],
            ])
            ->add('mail', EmailType::class, [
                'attr' => [
                    'placeholder' => 'johndoe@gmail.com'
                ]
            ])
            // ->add('status')
            // menu déroulant pour le status [ urgent, normal, pas urgent ]
            ->add('status', ChoiceType::class , [
                'choices' => [
                    'Urgent' => 'urgent',
                    'Normal' => 'normal',
                    'Low' => 'low',
                ], 
                'required' => true,
                'constraints' => new Assert\NotBlank(['message' => 'Please select a status']),
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Contact::class,
        ]);
    }
}
