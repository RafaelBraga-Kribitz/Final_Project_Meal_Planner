<?php

namespace App\Controller;

use App\Entity\MealPlanner;
use App\Entity\Recipe;
use App\Form\MealPlannerType;
use App\Repository\MealPlannerRepository;
use App\Repository\RecipeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/meal/planner')]
final class MealPlannerController extends AbstractController
{
    #[Route(name: 'app_meal_planner_index', methods: ['GET'])]
    public function index(MealPlannerRepository $mealPlannerRepository): Response
    {
         /** @var \App\Entity\User $user */
        $user = $this->getUser();
        return $this->render('meal_planner/index.html.twig', [
            'meal_planners' => $mealPlannerRepository->findBy(['user' => $user]),
            'userId'=>$user->getId(),
        ]);
    }

    #[Route('/new', name: 'app_meal_planner_new', methods: ['GET', 'POST'])]
    public function new(RecipeRepository $recipeRepository,Request $request, EntityManagerInterface $entityManager): Response
    {
        $mealPlanner = new MealPlanner();
        // $form = $this->createForm(MealPlannerType::class, $mealPlanner);
        
        $user=$this->getUser();
        $approvedRecipes=$recipeRepository->findBy(["status"=>"1"]);
        $mealPlanner = new MealPlanner();
        $form = $this->createForm(MealPlannerType::class, $mealPlanner, [
            'approved_recipes' => $approvedRecipes,
        ]);
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {
            $now = new \DateTime("now");
            $mealPlanner->setUpdateDate($now);
            $mealPlanner->setUser($user);
            $entityManager->persist($mealPlanner);
            $entityManager->flush();

            return $this->redirectToRoute('app_meal_planner_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('meal_planner/new.html.twig', [
            'meal_planner' => $mealPlanner,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_meal_planner_show', methods: ['GET'])]
    public function show(MealPlanner $mealPlanner): Response
    {
        return $this->render('meal_planner/show.html.twig', [
            'meal_planner' => $mealPlanner,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_meal_planner_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, MealPlanner $mealPlanner, EntityManagerInterface $entityManager, RecipeRepository $recipeRepository): Response
    {
        // $form = $this->createForm(MealPlannerType::class, $mealPlanner);
        
        $approvedRecipes=$recipeRepository->findBy(["status"=>"1"]);
        $form = $this->createForm(MealPlannerType::class, $mealPlanner, [
            'approved_recipes' => $approvedRecipes
        ]);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_meal_planner_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('meal_planner/edit.html.twig', [
            'meal_planner' => $mealPlanner,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_meal_planner_delete', methods: ['POST'])]
    public function delete(Request $request, MealPlanner $mealPlanner, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$mealPlanner->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($mealPlanner);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_meal_planner_index', [], Response::HTTP_SEE_OTHER);
    }

}
