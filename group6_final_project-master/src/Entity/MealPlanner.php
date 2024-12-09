<?php

namespace App\Entity;

use App\Repository\MealPlannerRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: MealPlannerRepository::class)]
class MealPlanner
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    /**
     * @var Collection<int, Recipe>
     */
    #[ORM\ManyToMany(targetEntity: Recipe::class)]
    private Collection $meal_chosen;

    #[ORM\ManyToOne]
    private ?User $user = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE)]
    private ?\DateTimeInterface $chosen_date = null;

    #[ORM\Column(type: Types::DATETIME_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $update_date = null;

    public function __construct()
    {
        $this->meal_chosen = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return Collection<int, Recipe>
     */
    public function getMealChosen(): Collection
    {
        return $this->meal_chosen;
    }

    public function addMealChosen(Recipe $mealChosen): static
    {
        if (!$this->meal_chosen->contains($mealChosen)) {
            $this->meal_chosen->add($mealChosen);
        }

        return $this;
    }

    public function removeMealChosen(Recipe $mealChosen): static
    {
        $this->meal_chosen->removeElement($mealChosen);

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): static
    {
        $this->user = $user;

        return $this;
    }

    public function getChosenDate(): ?\DateTimeInterface
    {
        return $this->chosen_date;
    }

    public function setChosenDate(\DateTimeInterface $chosen_date): static
    {
        $this->chosen_date = $chosen_date;

        return $this;
    }

    public function getUpdateDate(): ?\DateTimeInterface
    {
        return $this->update_date;
    }

    public function setUpdateDate(?\DateTimeInterface $update_date): static
    {
        $this->update_date = $update_date;

        return $this;
    }
}
