<?php

namespace App\DataFixtures;

use App\Entity\Recipe;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Faker\Factory;
use DateTimeImmutable;

class RecipeFixtures extends Fixture implements DependentFixtureInterface
{
    public function load(ObjectManager $manager): void
    {
        // Get all users from "App/DataFixtures/UserFixtures.php"
        $userRepo = $manager->getRepository(User::class);
        $users = $userRepo->findAll();

        if (empty($users)) {
            throw new \Exception('Users not found. Please add at least one user to the database');
        }

        // Creating a Faker object
        $faker = Factory::create();

        // Generating recipes
        for ($i = 0; $i < 12; $i++) {
            $recipe = new Recipe();
            $recipe->setAuthor($users[array_rand($users)]); // Random user
            $recipe->setName($faker->sentence(3));
            $recipe->setIngredients($faker->words(5, true));
            $recipe->setDescription($faker->sentence(10));
            $recipe->setPhoto($faker->imageUrl(640, 480, 'food'));
            $recipe->setCookingTime($faker->numberBetween(10, 120));
            $recipe->setPreparationTime($faker->numberBetween(5, 60));
            $recipe->setCalories($faker->numberBetween(100, 900));
            $recipe->setLink($faker->url());
            $recipe->setType($faker->randomElement(['Vegan', 'Vegetarian', 'Pescatarian', 'Meat']));
            $recipe->setDateAdded(new DateTimeImmutable());
            $recipe->setStatus(true);
            $manager->persist($recipe);
        }

        // Saving all recipes to the database
        $manager->flush();
    }

    public function getDependencies(): array
    {
        // Link to "App/DataFixtures/UserFixtures.php" for creating users
        return [
            UserFixtures::class, // Ensure users are loaded first
        ];
    }
}
