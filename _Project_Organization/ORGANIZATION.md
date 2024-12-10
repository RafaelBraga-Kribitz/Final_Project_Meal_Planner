# ORGANIZATION.md

## **Welcome to Organized Chaos!**

This document exists because, let’s be honest, even the most talented developers sometimes forget where things go. **Meal Planner** is a team project, and keeping things organized is the key to collaboration (and keeping your team from rioting).

---

## **1. Folder Structure: Where Stuff Goes**

Our project structure is like a well-organized kitchen: every ingredient has its place.

### **Top-Level Overview**
```
├── _Project_Organization/   # All project documentation
├── frontend/                # Front-end code (HTML, CSS, JS)
└── group6_final_project-master/  # The main Symfony app
```

### **Folder Breakdown**

#### **_Project_Organization/**
- Where all project-related documentation lives.  
- Includes:
  - `00_Project_Scope.md`: Big-picture goals and scope.
  - `01_Code_Standards.md`: Rules for clean code and good vibes.
  - `02_ToDo.md`: The grand checklist to keep everyone on track.
  - `03_Pages_Plan.md`: Detailed blueprints for each page.

**Pro Tip:** If you don’t know what to do, start here. Read. Take notes. Then ask questions.

---

#### **frontend/**
This is where all front-end assets live before they’re integrated with Symfony. Think of it as the prep station before the main course.

**What goes here:**
- Raw HTML, CSS, and JavaScript files for development.
- Organized by components, pages, or any system your team agrees on.

---

#### **group6_final_project-master/**
The Symfony app—the heart and soul of the Meal Planner.

**Key Folders Inside:**

1. **`assets/`:**  
   Front-end files managed by Symfony.  
   - JS and CSS compiled here for production.  
   - Includes controllers for modular front-end logic.

2. **`bin/`:**  
   Where Symfony hides its utility scripts. Don’t mess with this unless you know what you’re doing.

3. **`config/`:**  
   Home of app configurations (routing, security, database, etc.).  
   - **`services.yaml`:** For registering services.  
   - **`packages/`:** Config for individual Symfony bundles.

4. **`migrations/`:**  
   Where Doctrine keeps track of database schema changes.  
   - If you’re working on database-related tasks, pay attention here.

5. **`public/`:**  
   The app’s public entry point. This is what the browser sees.  
   - Don’t touch `index.php` unless you have a really good reason.

6. **`src/`:**  
   Where the magic happens—controllers, entities, forms, and repositories.  
   - **Controllers:** Logic for handling requests and rendering templates.  
   - **Entities:** The blueprints for database tables.  
   - **Forms:** Symfony forms for user inputs.  
   - **Repositories:** Query logic for fetching data.

7. **`templates/`:**  
   Twig templates for rendering the app’s UI. Organized by feature or entity.

8. **`tests/`:**  
   Automated tests for the app. If it breaks, it’s because we didn’t write enough tests.

9. **`translations/`:**  
   For multilingual support. If we decide to go international, this is where the translations live.

---

## **2. File Naming Conventions**

Naming things is one of the two hardest problems in computer science (along with cache invalidation). Let’s make it easier by sticking to these conventions:

### **Back-End (PHP):**
- **Entities:** Singular, `PascalCase` (e.g., `User.php`, `Recipe.php`).  
- **Controllers:** End with `Controller` (e.g., `UserController.php`, `RecipeController.php`).  
- **Forms:** End with `Type` (e.g., `RecipeType.php`).  
- **Repositories:** End with `Repository` (e.g., `RecipeRepository.php`).  

### **Front-End (CSS, JS, Twig):**
- **CSS Classes:** Follow the BEM convention.  
  Example: `.recipe-card__title--highlighted`.  
- **Twig Templates:** Organized by entity or feature.  
  Example: `templates/recipe/show.html.twig`.

### **Database:**
- **Tables:** Plural, `snake_case` (e.g., `users`, `recipes`).  
- **Columns:** Singular, `snake_case` (e.g., `user_name`, `created_at`).

---

## **3. Workflow Rules: Stay in Sync**

### **Daily Checklist for All Team Members**

1. **Start the Day:**  
   - Pull the latest changes:  
     ```bash
     git pull origin main
     ```

2. **While Working:**  
   - Always work on a feature branch:  
     ```bash
     git checkout -b feature/your-feature-name
     ```
   - Commit often with clear messages:  
     ```bash
     git commit -m "Added validation to recipe form"
     ```

3. **End of the Day:**  
   - Push your changes:  
     ```bash
     git push origin feature/your-feature-name
     ```

4. **Keep Communicating:**  
   - Update the `02_ToDo.md` if you finish a task.  
   - Leave a note in the team chat if you’re stuck.

---

## **4. Collaboration Tips**

1. **Respect the Folder Structure:**  
   - If you’re unsure where something goes, ask the team. Better to ask than to lose files in `/tmp`.

2. **Avoid “It Works on My Machine” Syndrome:**  
   - Before committing, test your changes in a clean environment. Use:
     ```bash
     symfony serve
     ```

3. **Documentation is Love:**  
   - If you create a new feature, document how it works in `README.md` or a related file in `_Project_Organization`.

4. **Code Reviews:**  
   - Submit pull requests for code review. It’s not about catching mistakes—it’s about learning and improving.

---

## **5. Frequently Asked Questions**

**Q: "Can I just put everything in one file?"**  
A: Sure, if you hate your team and enjoy debugging 500-line files.

**Q: "Do I really need to follow these conventions?"**  
A: Yes, unless you enjoy a repo that looks like a Jackson Pollock painting.

**Q: "What if I mess up?"**  
A: Git forgives, but your teammates might not. Communicate, fix it, and learn.

---

## **6. Final Words**

Organizing a project is like organizing a kitchen:  
- Know where everything is.  
- Clean up after yourself.  
- Don’t leave raw chicken (or untested code) lying around.

Happy coding, and may your files always be where you expect them to be!
