<?php

namespace App\Entity;

use App\Repository\UserArchiveRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: UserArchiveRepository::class)]
class UserArchive
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    #[Assert\Lenght(max: 255)]
    private ?string $username = null;

    #[ORM\Column(length: 180)]
    #[Assert\Lenght(max: 180)]
    private ?string $email = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $roles = null;

    #[ORM\Column(length: 255)]
    #[Assert\Lenght(max: 255)]
    private ?string $password = null;

    #[ORM\Column]
    private ?bool $is_verified = null;

    #[ORM\Column(nullable: true)]
    private ?int $avatar_id = null;

    #[ORM\Column(nullable: true)]
    private ?bool $wasDeleted = null;

    #[ORM\Column(nullable: true)]
    private ?bool $wasArchived = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUsername(): ?string
    {
        return $this->username;
    }

    public function setUsername(string $username): static
    {
        $this->username = $username;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): static
    {
        $this->email = $email;

        return $this;
    }

    public function getRoles(): ?string
    {
        return $this->roles;
    }

    public function setRoles(string $roles): static
    {
        $this->roles = $roles;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): static
    {
        $this->password = $password;

        return $this;
    }

    public function isIsVerified(): ?bool
    {
        return $this->is_verified;
    }

    public function setIsVerified(bool $is_verified): static
    {
        $this->is_verified = $is_verified;

        return $this;
    }

    public function getAvatarId(): ?int
    {
        return $this->avatar_id;
    }

    public function setAvatarId(?int $avatar_id): static
    {
        $this->avatar_id = $avatar_id;

        return $this;
    }

    public function isWasDeleted(): ?bool
    {
        return $this->wasDeleted;
    }

    public function setWasDeleted(?bool $wasDeleted): static
    {
        $this->wasDeleted = $wasDeleted;

        return $this;
    }

    public function isWasArchived(): ?bool
    {
        return $this->wasArchived;
    }

    public function setWasArchived(?bool $wasArchived): static
    {
        $this->wasArchived = $wasArchived;

        return $this;
    }
}
