# Final_Project_Meal_Planner Tree

```
├── _Project_Organization
│   ├── 00_Project_Scope.md
│   ├── 01_Code_Standards.md
│   ├── 02_ToDo.md
│   └── 03_Pages_Plan.md
├── frontend
└── group6_final_project-master
    ├── assets
    │   ├── app.js
    │   ├── bootstrap.js
    │   ├── controllers
    │   │   ├── csrf_protection_controller.js
    │   │   └── hello_controller.js
    │   ├── controllers.json
    │   └── styles
    │       └── app.css
    ├── bin
    │   ├── console
    │   └── phpunit
    ├── compose.override.yaml
    ├── compose.yaml
    ├── composer.json
    ├── composer.lock
    ├── config
    │   ├── bundles.php
    │   ├── packages
    │   │   ├── asset_mapper.yaml
    │   │   ├── cache.yaml
    │   │   ├── csrf.yaml
    │   │   ├── debug.yaml
    │   │   ├── doctrine.yaml
    │   │   ├── doctrine_migrations.yaml
    │   │   ├── framework.yaml
    │   │   ├── mailer.yaml
    │   │   ├── messenger.yaml
    │   │   ├── monolog.yaml
    │   │   ├── notifier.yaml
    │   │   ├── routing.yaml
    │   │   ├── security.yaml
    │   │   ├── translation.yaml
    │   │   ├── twig.yaml
    │   │   ├── validator.yaml
    │   │   └── web_profiler.yaml
    │   ├── preload.php
    │   ├── routes
    │   │   ├── framework.yaml
    │   │   ├── security.yaml
    │   │   └── web_profiler.yaml
    │   ├── routes.yaml
    │   └── services.yaml
    ├── group6_meal_planner_project.sql
    ├── importmap.php
    ├── migrations
    │   └── Version20241209131419.php
    ├── phpunit.xml.dist
    ├── public
    │   └── index.php
    ├── src
    │   ├── Controller
    │   │   ├── HomeController.php
    │   │   ├── RecipeController.php
    │   │   ├── RegistrationController.php
    │   │   ├── SecurityController.php
    │   │   ├── StaticController.php
    │   │   └── UserController.php
    │   ├── Entity
    │   │   ├── MealPlanner.php
    │   │   ├── Recipe.php
    │   │   └── User.php
    │   ├── Form
    │   │   ├── RecipeType.php
    │   │   ├── RegistrationFormType.php
    │   │   └── UserType.php
    │   ├── Kernel.php
    │   └── Repository
    │       ├── MealPlannerRepository.php
    │       ├── RecipeRepository.php
    │       └── UserRepository.php
    ├── symfony.lock
    ├── templates
    │   ├── base.html.twig
    │   ├── components
    │   │   └── navbar.html.twig
    │   ├── home
    │   │   └── index.html.twig
    │   ├── recipe
    │   │   ├── _delete_form.html.twig
    │   │   ├── _form.html.twig
    │   │   ├── edit.html.twig
    │   │   ├── index.html.twig
    │   │   ├── new.html.twig
    │   │   └── show.html.twig
    │   ├── registration
    │   │   └── register.html.twig
    │   ├── security
    │   │   └── login.html.twig
    │   ├── static
    │   │   └── index.html.twig
    │   └── user
    │       ├── _delete_form.html.twig
    │       ├── _form.html.twig
    │       ├── edit.html.twig
    │       ├── index.html.twig
    │       ├── new.html.twig
    │       └── show.html.twig
    ├── tests
    │   └── bootstrap.php
    └── translations
```