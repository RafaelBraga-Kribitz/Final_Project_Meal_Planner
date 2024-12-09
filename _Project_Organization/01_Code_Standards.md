# Project Code Standards & Guidelines

The goal of these standards is to ensure a clean, consistent, and easy to collaborate codebase. By following these guidelines, we make it easier for all team members to read, understand, and extend the project code.

---

## General Principles

1. **Clarity Over Brevity:**  
   Prefer descriptive, meaningful names over short or abbreviated ones.  
   **Example:**  
   ```php
   // Bad
   $usr = new User();

   // Good
   $user = new User();
   ```

2. **Consistency Across the Stack:**  
   Apply consistent naming conventions, formatting, and file structures in PHP, HTML, CSS, JS/TS, and database schemas.  
   **Example:** Use `snake_case` for MySQL table names and `camelCase` for PHP variables.

3. **No Single-Letter Variables:**  
   Avoid using variables like `$x` or `$y` unless in very short, trivial scopes (like small loops where context is obvious).  
   **Example:**  
   ```javascript
   // Bad
   let x = 42;

   // Good
   let userAge = 42;
   ```

4. **No Abbreviations:**  
   Don’t rely on abbreviations. Use full words for clarity. Modern editors and autocomplete make long names manageable.  
   ```php
   // Bad
   $usrName = "Alice";

   // Good
   $userName = "Alice";
   ```

5. **Don’t Include Types in Names:**  
   Names should describe the variable’s purpose, not its type.  
   ```php
   // Bad
   $strUserName = "Bob";

   // Good
   $userName = "Bob";
   ```

6. **Include Units When Necessary:**  
   If a value represents a unit, include it in the variable name unless a strongly typed object makes it obvious.  
   ```javascript
   // Bad
   let delay = 5; // what unit?
   
   // Good
   let delaySeconds = 5;
   ```

7. **Avoid "Utils" or "Helper" Names:**  
   Organize code into properly named classes or modules that reflect their domain or functionality.  
   ```javascript
   // Bad
   class Utils {
       static calculateDiscount(price) { ... }
   }

   // Good
   class Pricing {
       static calculateDiscount(price) { ... }
   }
   ```

---

## PHP (Symfony) Standards

1. **Follow PSR-12 Coding Style:**  
   - Indent with 4 spaces, no tabs.  
   - Opening braces on the same line.  
   - Class and method names in `PascalCase`.  
   - Variables and function parameters in `camelCase`.

   ```php
   // Good Example
   class RecipeController extends AbstractController
   {
       public function createRecipe(Request $request): Response
       {
           $userName = $this->getUser()->getUsername();
           // ...
       }
   }
   ```

2. **Symfony Directory Structure:**  
   - **src/**: PHP code (Controllers, Entities, Repositories, Services).  
   - **templates/**: Twig templates.  
   - **public/**: Publicly accessible web root.  
   - **migrations/**: Doctrine migrations.  
   - **config/**: Configuration files.  
   
   Keep logic separated by domain. For example, `src/Entity/Recipe.php`, `src/Controller/RecipeController.php`, `src/Repository/RecipeRepository.php`.

3. **Use Dependency Injection:**  
   Rely on Symfony’s service container rather than creating new instances manually.

4. **Naming Entities and Fields:**  
   Entity names are singular and `PascalCase`. Fields are `camelCase`. For database columns, use `snake_case`.  
   ```php
   class Recipe
   {
       private $title;
       private $cookingTime;
       private $calories;
   }
   ```

---

## HTML Standards

1. **Semantic HTML:**  
   Use meaningful tags like `<article>`, `<section>`, `<nav>`, `<header>`, `<footer>` to clearly describe content structure.
   ```html
   <!-- Good -->
   <header>
       <h1>Meal Planner</h1>
   </header>
   <main>
       <section class="recipe-list">
           <h2>Recipes</h2>
           <!-- ... -->
       </section>
   </main>
   ```

2. **Naming and IDs:**  
   Use `kebab-case` for classes and IDs. Classes should describe purpose, not presentation.  
   ```html
   <!-- Good -->
   <div id="user-profile" class="profile-container">
       <p class="user-name">John Doe</p>
   </div>
   ```

---

## CSS Standards

1. **BEM Methodology (Block-Element-Modifier):**  
   This ensures clarity and consistency in naming.  
   ```css
   /* Example: .block__element--modifier */
   .recipe-list__item {
       margin-bottom: 10px;
   }

   .recipe-list__item--highlighted {
       background-color: #f0f0f0;
   }
   ```

2. **No Inline Styles:**  
   Keep all styles in `.css` files or use SASS/SCSS if available.

3. **Structure:**  
   Organize styles by feature or page. For example:  
   - `assets/styles/base/` for base styles (typography, resets).  
   - `assets/styles/components/` for reusable UI components.  
   - `assets/styles/pages/` for page-specific styles.

---

## JavaScript/TypeScript Standards

1. **ES6+ Syntax:**  
   Use `const` and `let` instead of `var`.  
   ```javascript
   const userName = "Alice";
   let userAge = 30;
   ```

2. **camelCase for Variables and Functions:**  
   `PascalCase` for Classes.  
   ```javascript
   class UserSession {
       constructor(userName) {
           this.userName = userName;
       }
       
       startSession() { ... }
   }
   ```

3. **Avoid Global Variables:**  
   Encapsulate code in modules or classes.  
   
4. **Meaningful Function Names:**  
   ```javascript
   // Bad
   function calc() { ... }

   // Good
   function calculateUserDiscount(user) { ... }
   ```

5. **File Organization:**  
   Group related JS modules together. For example:  
   - `assets/js/services/` for API calls.  
   - `assets/js/components/` for UI components.  
   - `assets/js/pages/` for page-specific logic.

---

## MySQL Standards

1. **Table and Column Naming:**  
   - Use `snake_case` for table and column names.  
   - Table names should be plural.  
   - Avoid abbreviations.

   ```sql
   CREATE TABLE users (
       id INT AUTO_INCREMENT PRIMARY KEY,
       user_name VARCHAR(100),
       user_email VARCHAR(255),
       created_at DATETIME
   );
   ```

2. **Foreign Keys and Indexes:**  
   - Include `_id` suffix on foreign keys.  
   - Index columns that are frequently searched or filtered.

   ```sql
   CREATE TABLE meal_plans (
       id INT AUTO_INCREMENT PRIMARY KEY,
       user_id INT NOT NULL,
       recipe_id INT NOT NULL,
       planned_at DATETIME NOT NULL,
       FOREIGN KEY (user_id) REFERENCES users(id),
       FOREIGN KEY (recipe_id) REFERENCES recipes(id)
   );
   ```

3. **Use Consistent Data Types:**  
   Select the smallest appropriate data type (e.g., `TINYINT` for flags, `INT` for IDs, `DATETIME` for timestamps).

---

## File & Folder Structure

```
project-root/
├─ src/
│  ├─ Controller/
│  │   └─ RecipeController.php
│  ├─ Entity/
│  │   ├─ User.php
│  │   ├─ Recipe.php
│  │   └─ MealPlan.php
│  ├─ Repository/
│  │   └─ RecipeRepository.php
│  ├─ Service/
│  │   └─ PricingCalculator.php
│  └─ ...
├─ config/
│  ├─ packages/
│  └─ routes/
├─ migrations/
│  └─ VersionXXXXXX.php
├─ public/
│  └─ index.php
├─ templates/
│  ├─ base.html.twig
│  ├─ recipe/
│  │   └─ show.html.twig
│  └─ user/
│      └─ profile.html.twig
├─ assets/
│  ├─ js/
│  │   ├─ services/
│  │   ├─ components/
│  │   └─ pages/
│  ├─ styles/
│  │   ├─ base/
│  │   ├─ components/
│  │   └─ pages/
│  └─ images/
└─ ...
```

- **src/Controller:** All Symfony controllers.  
- **src/Entity:** Doctrine entities.  
- **src/Repository:** Doctrine repositories for queries.  
- **src/Service:** Application services (e.g., domain logic, pricing, filtering).  
- **templates/:** Twig templates for the frontend.  
- **assets/js:** JavaScript/TypeScript code separated by type (services, components, pages).  
- **assets/styles:** CSS/SCSS files following a structured approach.  
- **assets/images:** Static image files.

---

## Conclusion

By adhering to these standards, we ensure that the codebase remains organized, understandable, and maintainable. Following a consistent naming and structuring approach across all layers (Back-End, Front-End, and Database) makes onboarding new team members easier and helps maintain a high development velocity.

**Remember:** Clarity, consistency, and simplicity come first. Keep asking yourself, "Would another developer understand this at a glance?"
