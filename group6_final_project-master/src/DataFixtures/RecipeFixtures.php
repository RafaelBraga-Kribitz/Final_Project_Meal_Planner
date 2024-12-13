<?php

namespace App\DataFixtures;

use App\Entity\Recipe;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use DateTimeImmutable;

class RecipeFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // Retrieve existing users
        $userRepo = $manager->getRepository(User::class);
        $adminUser = $userRepo->find(1); // Assuming User ID 1 exists
        $testUser = $userRepo->find(2); // Assuming User ID 2 exists

        // Verify users exist
        if (!$adminUser || !$testUser) {
            throw new \Exception('Required user records are missing. Ensure users with IDs 1 and 2 exist.');
        }

        // Recipe 1
        $recipe1 = new Recipe();
        $recipe1->setAuthor($adminUser); // Set author
        $recipe1->setName('Spicy Chicken and Sweet Potato');
        $recipe1->setIngredients('Chicken, Sweet Potato, Spices');
        $recipe1->setDescription('A spicy and healthy meal perfect for meal prep.');
        $recipe1->setPhoto('https://cdn.example.com/spicy-chicken.jpg');
        $recipe1->setCookingTime(45);
        $recipe1->setPreparationTime(15);
        $recipe1->setCalories(500);
        $recipe1->setLink('https://example.com/spicy-chicken');
        $recipe1->setType('Non-Vegetarian');
        $recipe1->setDateAdded(new DateTimeImmutable());
        $recipe1->setStatus(true);
        $manager->persist($recipe1);

        // Recipe 2
        $recipe2 = new Recipe();
        $recipe2->setAuthor($testUser); // Set author
        $recipe2->setName('Instant Pot Beef and Broccoli');
        $recipe2->setIngredients('Beef, Broccoli, Soy Sauce, Garlic');
        $recipe2->setDescription('A quick and delicious Instant Pot meal.');
        $recipe2->setPhoto('https://cdn.example.com/beef-broccoli.jpg');
        $recipe2->setCookingTime(30);
        $recipe2->setPreparationTime(10);
        $recipe2->setCalories(400);
        $recipe2->setLink('https://example.com/beef-broccoli');
        $recipe2->setType('Non-Vegetarian');
        $recipe2->setDateAdded(new DateTimeImmutable());
        $recipe2->setStatus(true);
        $manager->persist($recipe2);

        // Flush the data to the database
        $manager->flush();
    }
}
