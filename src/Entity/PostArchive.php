<?php

namespace App\Entity;

use App\Repository\PostArchiveRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: PostArchiveRepository::class)]
class PostArchive
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(nullable: true)]
    private ?int $author_id = null;

    #[ORM\Column(length: 255)]
    #[Assert\Lenght(max: 255)]
    private ?string $title = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    private ?string $content = null;

    #[ORM\Column]
    private ?bool $published = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $created_at = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $modified_at = null;

    #[ORM\Column(length: 255)]
    #[Assert\Lenght(max: 255)]
    private ?string $slug = null;

    #[ORM\Column]
    private ?int $img_id = null;

    #[ORM\Column]
    private ?bool $is_hidden = null;

    #[ORM\Column(nullable: true)]
    private ?bool $wasDeleted = null;

    #[ORM\Column(nullable: true)]
    private ?bool $wasArchived = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAuthorId(): ?int
    {
        return $this->author_id;
    }

    public function setAuthorId(?int $author_id): static
    {
        $this->author_id = $author_id;

        return $this;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): static
    {
        $this->title = $title;

        return $this;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(?string $content): static
    {
        $this->content = $content;

        return $this;
    }

    public function isPublished(): ?bool
    {
        return $this->published;
    }

    public function setPublished(bool $published): static
    {
        $this->published = $published;

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

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): static
    {
        $this->slug = $slug;

        return $this;
    }

    public function getImgId(): ?int
    {
        return $this->img_id;
    }

    public function setImgId(int $img_id): static
    {
        $this->img_id = $img_id;

        return $this;
    }

    public function isIsHidden(): ?bool
    {
        return $this->is_hidden;
    }

    public function setIsHidden(bool $is_hidden): static
    {
        $this->is_hidden = $is_hidden;

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
