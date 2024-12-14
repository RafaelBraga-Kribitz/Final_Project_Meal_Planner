<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class UserFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // Creating a Faker object
        $faker = Factory::create();

        // Generating users
        for ($i = 0; $i < 10; $i++) {
            $user = new User();
            $user->setFirstName($faker->firstName); // field first_name
            $user->setLastName($faker->lastName); // field last_name
            $user->setEmail($faker->unique()->email);
            $user->setPassword(password_hash('password', PASSWORD_BCRYPT)); // Dummy password
            $user->setRoles(['ROLE_USER']); // Default role
            $user->setPhoto($faker->imageUrl(200, 200, 'people')); 
            $user->setPhoneNumber($faker->phoneNumber); 
            $user->setBlocked($faker->boolean(10)); 
            
            $manager->persist($user);
        }

        // Saving users to the database
        $manager->flush();
    }
}

