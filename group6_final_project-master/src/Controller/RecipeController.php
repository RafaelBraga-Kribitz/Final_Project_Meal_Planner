<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use App\Repository\RecipeRepository;

class RecipeController extends AbstractController
{
    public function index(RecipeRepository $recipeRepository): Response
    {
        // Fetch all recipes from the database
        $recipes = $recipeRepository->findAll();

        // Pass the recipes to the Twig template
        return $this->render('recipe/index.html.twig', [
            'recipes' => $recipes,
        ]);
    }
}
