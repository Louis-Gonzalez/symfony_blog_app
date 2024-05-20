<?php

namespace App\Form;

use App\Entity\Contact;
use App\Entity\User;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', TextType::class, 
                [
                'constraints' => new NotBlank(['message' => 'Pease enter a title']),
                ])

            ->add('description',  TextAreaType::class, 
                [
                'constraints' => new NotBlank(['message' => 'Pease enter a message']),
                ])
            ->add('mail')
            // ->add('status')
            // menu déroulant pour le status [ urgent, normal, pas urgent ]
            ->add('status', ChoiceType::class , [
                'choices' => [
                    'Urgent' => 'urgent',
                    'Normal' => 'normal',
                    'Low' => 'low',
                ], 
                'required' => true,
                'constraints' => new NotBlank(['message' => 'Please select a status']),
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
