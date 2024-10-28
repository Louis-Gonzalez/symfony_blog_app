<?php

namespace App\Form;

use App\Entity\Post;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\Validator\Constraints as Assert;

class PostType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        // /** @var Post $post */ possiblilité de faire comme ceci pour expliquer que les options correspoandeent à un post
        // $post = $options['data'];
        // dd(!$options['data']);

        $builder
            ->add('title', TextType::class, [
                'required' => true,
                'constraints' => [
                    new Assert\NotBlank(['message'=>'Please enter a title']),
                    new Assert\length([
                        'min' => 2,
                        'minMessage'=> 'Your title should be at least 2 characters.',
                        'max'=> 255,])
                ],
            ])
            ->add('content', TextareaType::class, [
                'attr' => [
                    'class' => 'tinymce', 
                    'rows'=>5,
                ],
                'required' => false
            ])
            ->add('published', CheckboxType::class, [
                'required' => false
            ])
            ->add('img', FileType::class, [
                'label' => 'img',
                'mapped' => false,
                'required' => !$options['data']->getImg(), // modifier le comportement true new / false à edit 
                'constraints' => [
                    new File([
                        'maxSize' => '4096k',
                        'mimeTypes' => [
                            'image/png',
                            'image/jpeg',
                            'image/jpg',
                            'image/webp'
                        ],
                        'mimeTypesMessage' => 'Please upload a valid extension for image',
                    ])
                ],
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Post::class,
        ]);
    }
}
