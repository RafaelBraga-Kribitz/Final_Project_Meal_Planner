
# How the Backend Interacts with the Frontend in Our Project




## Backend Workflow (Symfony)

  ### MVC Architecture
The backend in our project follows the **MVC (Model-View-Controller)** pattern:

- **Model**: Manages the interaction with the database through Doctrine ORM. This is where entities like `User`, `Recipe`, or `MealPlan` are defined to map the database tables.
- **View**: In a traditional Symfony setup, Twig templates (HTML pages) are used to render and display data to the user.
- **Controller**: Contains the core business logic. Controllers handle HTTP requests, call necessary models to retrieve data, and then pass the data to Twig templates or return JSON responses for APIs.

### Logic in Controllers
Controllers define **routes** that map URLs to specific functions (methods). These routes determine how incoming HTTP requests are handled.

#### Example with Twig (Rendering an HTML page):

```php
// src/Controller/RecipeController.php
class RecipeController extends AbstractController
{
    #[Route('/recipes', name: 'recipes_list', methods: ['GET'])]
    public function list(): Response
    {
        $recipes = $this->getDoctrine()->getRepository(Recipe::class)->findAll();
        return $this->render('recipes/list.html.twig', [
            'recipes' => $recipes,
        ]);
    }
}
Here, the `render` method sends data to the Twig template for display.

```




## Frontend Workflow

In this project, the frontend is built separately from the backend and communicates through APIs.

  ### Key Differences with APIs
Instead of rendering Twig templates, controllers return **JSON data**, which the frontend uses to build its interface.

Example of an API route:

```php
// src/Controller/RecipeController.php
class RecipeController extends AbstractController
{
    #[Route('/api/recipes', name: 'api_recipes_list', methods: ['GET'])]
    public function apiList(): JsonResponse
    {
        $recipes = $this->getDoctrine()->getRepository(Recipe::class)->findAll();
        return $this->json($recipes);
    }
}

Here, the json method converts data (e.g., an array of recipes) into a JSON response, which is sent back to the frontend.

```

  ### What is an API Endpoint?
An API endpoint is a URL that the frontend can call to interact with the backend. Examples of endpoints:

- GET /api/recipes — Retrieves a list of recipes.
- POST /api/recipes — Creates a new recipe.
- DELETE /api/recipes/{id} — Deletes a recipe by its ID.

    **Example of an Endpoint Workflow:**

The frontend sends a request to GET /api/recipes to fetch recipes:

```php
fetch('/api/recipes')
    .then(response => response.json())
    .then(data => console.log(data));

```




## How the Frontend Communicates with the Backend


  ### Frontend Sends an HTTP Request
The frontend sends HTTP requests using JavaScript (typically via fetch or libraries like axios):

```php  
const fetchRecipes = async () => {
    const response = await fetch('http://localhost:8000/api/recipes');
    const recipes = await response.json();
    console.log(recipes); // Process the retrieved data
};
```
  ### Backend Processes the Request

- The request enters the backend through the entry point (public/index.php).
- Symfony matches the request to a route (e.g., /api/recipes) and calls the corresponding controller method.
- The controller processes the request, retrieves data (e.g., from the database), and returns a JSON response.

  ### Frontend Receives the Response
The frontend processes the received JSON data and uses it to update the user interface. For example, it could display a list of recipes or populate a meal planner calendar.





## Key Points

  ### How Are Requests Handled?

- Backend processes HTTP requests through Symfony’s routing and controllers.
- For API-based projects, controllers return JSON instead of HTML pages.

 ### What Happens Without Twig?

- Twig is typically used for rendering HTML in server-side rendering. However, in your project, the frontend is built separately and does not use Twig for final rendering.
- Instead, the backend sends JSON data to the frontend, which handles all UI rendering with JavaScript, HTML, and CSS.

  ### What Does the Frontend Receive?

- The frontend receives only JSON data from the backend API, which contains the requested information.

  ### Role of the API

- The API acts as the "bridge" between the frontend and backend, enabling data exchange through HTTP requests (e.g., GET, POST, PUT, DELETE).

  ### How the Frontend Uses the Data

- The frontend processes the JSON data and uses it to dynamically create the user interface, styling it with its own CSS and adding interactivity with JavaScript.









