<?php

namespace App\Traits;

trait XssSanitizerTrait {

    public function sanitizerString(string $input): string
    {
        // for HTML tag 
        $sanitized = strip_tags($input);

        // takeoff ()
        $sanitized = str_replace(['(', ')'], ' ', $sanitized);

        // erase beginning and ending space
        $sanitized = trim($sanitized);

        // Convert the special caracter
        $sanitized = htmlspecialchars($sanitized, ENT_QUOTES, 'UTF-8');

        return $sanitized;
    }
}