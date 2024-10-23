<?php

namespace App\Entity;

use App\Repository\CommentArchiveRepository;
use Doctrine\DBAL\Types\Types;
use Symfony\Component\Validator\Constraints as Assert;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CommentArchiveRepository::class)]
class CommentArchive
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?int $user_id = null;

    #[ORM\Column]
    private ?int $post_id = null;

    #[ORM\Column(length: 255)]
    #[Assert\Lenght(max: 255)]
    private ?string $description = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $created_at = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $modified_at = null;

    #[ORM\Column]
    private ?bool $id_hidden = null;

    #[ORM\Column(nullable: true)]
    private ?bool $wasDeleted = null;

    #[ORM\Column(nullable: true)]
    private ?bool $wasArchived = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUserId(): ?int
    {
        return $this->user_id;
    }

    public function setUserId(int $user_id): static
    {
        $this->user_id = $user_id;

        return $this;
    }

    public function getPostId(): ?int
    {
        return $this->post_id;
    }

    public function setPostId(int $post_id): static
    {
        $this->post_id = $post_id;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeImmutable $created_at): static
    {
        $this->created_at = $created_at;

        return $this;
    }

    public function getModifiedAt(): ?\DateTimeInterface
    {
        return $this->modified_at;
    }

    public function setModifiedAt(\DateTimeInterface $modified_at): static
    {
        $this->modified_at = $modified_at;

        return $this;
    }

    public function isIdHidden(): ?bool
    {
        return $this->id_hidden;
    }

    public function setIdHidden(bool $id_hidden): static
    {
        $this->id_hidden = $id_hidden;

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
