<?php

namespace App\Traits;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping\PrePersist;
use Doctrine\ORM\Mapping\PreUpdate;

/** Un trait est semblable à une classe, mais il ne sert qu'à grouper des fonctionnalités d'une manière intéressante. 
 * Il n'est pas possible d'instancier un Trait en lui-même. C'est un ajout à l'héritage traditionnel, qui autorise la composition
 *  horizontale de comportements, c'est-à-dire l'utilisation de méthodes de classe sans besoin d'héritage.
*/ 

trait LifecycleTrackerTrait {

    #[ORM\Column]
    private ?\DateTimeImmutable $createdAt = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $modifiedAt = null;

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }
    #[ORM\PrePersist]
    public function setCreatedAt(): static
    {
        $this->createdAt = new \DateTimeImmutable();

        return $this;
    }

    public function getModifiedAt(): ?\DateTimeInterface
    {
        return $this->modifiedAt;
    }
    #[ORM\PreUpdate]
    #[ORM\PrePersist]
    public function setModifiedAt(): static
    {
        $this->modifiedAt = new \DateTime();

        return $this;
    }

    // #[ORM\PrePersist]
    // public function setCreatedAtValue(): void
    // {
    //     $this->createdAt = new \DateTimeImmutable();
    //     $this->setUpdatedAtValue();
    // }

    // #[ORM\PreUpdate]
    // public function setUpdatedAtValue(): void
    // {
    //     $this->modifiedAt = new \DateTime();
    // }
}