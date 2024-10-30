<?php

namespace App\Service;

use Symfony\Component\Validator\Constraints\Length;
use Twig\Extension\AbstractExtension;
use Twig\TwigFilter;


class TwigExtension extends AbstractExtension {
    
    public function getFilters()
    {
        return [
            new TwigFilter(
                'offuscation', [$this, 'offuscationFilter'],
                )
        ];
    }

    public function offuscationFilter($content){
        // connaitre la longueur de $content
        $lg = strlen($content);
        // condition si la longueur inférieur à 3
        if ($lg == 1 | $lg == 2){
            return $content;
        }
        // condition si la longueur = 3, masqué laisser visible seulement le premier caractère
        if ($lg ==3){
            $firstLetter = substr($content, 0, 1);
            $maskedContent = $firstLetter . str_repeat('*', strlen($content) - 1);
        }
        // condition si la longueur >= 4,  masqué les caractères sauf la première et la dernière
        else if ($lg >=4){
            $firstLetter = substr($content, 0, 1);
            $lastLetter = substr($content, -1);
            $makedContent = $firstLetter . str_repeat('*', $lg - 2) . $lastLetter;
        }
    return $makedContent;
    }

}
