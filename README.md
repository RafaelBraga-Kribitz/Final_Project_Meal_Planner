# Meal Planner: Plan Your Meals, Save Your Sanity

Meal Planner is a web application designed to help users organize, schedule, and plan their meals efficiently. Whether you’re juggling a busy schedule or simply looking to streamline your meal prep, this tool offers recipe management, meal scheduling, and shopping list creation features—all in one place.

---

## Current State of the Project

We’re actively building Meal Planner and are making steady progress. Here’s where we currently stand:

### **What’s Complete**
- **Back-End:**
  - User authentication and role-based access (Admin/User).
  - Recipe entity with CRUD functionality.
  - Database schema and migrations.
- **Front-End:**
  - Basic structure for navigation, home page, and recipe listing.
  - Initial styles using responsive design principles.
- **Documentation:**
  - Clear guidelines for code standards, project scope, and To-Do list.

### **What’s In Progress**
- **Back-End:**
  - Meal Planner functionality (CRUD for meals, daily/weekly views).
  - Filtering options for recipes by dietary type, calories, etc.
- **Front-End:**
  - Integrating dynamic forms with back-end logic.
  - Finalizing components for user dashboard and recipe details.
- **Nice-to-Have Features:** 
  - Recipe ratings and allergens.

### **What’s Missing**
- Shopping list generation.
- Complete admin panel for recipe and user management.
- Comprehensive testing (unit and integration).
- Final polish on UI/UX design.

For detailed progress and pending tasks, see the [To-Do List](./_Project_Organization/02_ToDo.md).

---

## Features (Planned and Current)

- **User Features:**
  - Register and manage an account.
  - Add, edit, delete, and view recipes.
  - Schedule meals for the day or week.
  - Filter recipes by dietary type, calories, and more.
- **Admin Features:**
  - Manage all users and recipes.
  - Approve user-submitted recipes.
- **Nice-to-Have Features:**
  - Generate shopping lists for planned meals.
  - Show recipe ratings, allergens, and nutrient info.

---

## Getting Started

### **Prerequisites**
Before you start, make sure you have:
- PHP 8.1+
- Composer
- Symfony CLI
- Node.js and npm
- MySQL

### **Installation**
1. Clone the repository:
   ```bash
   git clone https://github.com/RafaelBraga-Kribitz/Final_Project_Meal_Planner.git
   cd group6_final_project-master
   ```

2. Install dependencies:
   ```bash
   composer install
   npm install
   ```

3. Set up the database:
   - Update your `.env` file with database credentials.
   - Run migrations:
     ```bash
     php bin/console doctrine:migrations:migrate
     ```

4. Start the Symfony server:
   ```bash
   symfony serve
   ```

5. Open your browser at `http://localhost:8000`.

For detailed setup and troubleshooting, see [DEBUGGING.md](./_Project_Organization/DEBUGGING.md).

---

## Project Structure

Here’s an overview of the project folders:

```
├── _Project_Organization/   # Documentation
├── frontend/                # Raw front-end code
└── group6_final_project-master/  # Symfony app
    ├── assets/              # JS/CSS/Frontend files
    ├── config/              # Configuration files
    ├── src/                 # Controllers, Entities, Forms, Repositories
    ├── templates/           # Twig templates for views
    ├── migrations/          # Doctrine migrations
    ├── public/              # Entry point for the app
    └── tests/               # Automated tests
```

For a full breakdown, see [ORGANIZATION.md](./_Project_Organization/ORGANIZATION.md).

---

## Usage

1. **Sign Up:** Create an account to get started.
2. **Manage Recipes:** Add your favorite meals with all the details you need.
3. **Plan Meals:** Schedule meals for the week and (soon) generate shopping lists.
4. **Admin Features:** Approve recipes and manage users.

---

## Contributing

We welcome contributions from all team members. Here’s how you can help:

1. Pull the latest changes:
   ```bash
   git pull origin main
   ```
2. Create a feature branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Commit your changes with meaningful messages:
   ```bash
   git commit -m "Added shopping list generator"
   ```
4. Push your branch:
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a pull request for review.

For team workflow details, check [ORGANIZATION.md](./_Project_Organization/ORGANIZATION.md) and [DONT_IGNORE_GITIGNORE.md](./_Project_Organization/DONT_IGNORE_GITIGNORE.md).

---

## Credits

Developed with collaboration, debugging, and occasional snacks by:
- Marina Stanković  
- Philipp  
- William  
- Yosyp Malanka  
- Rafael Braga-Kribitz  

---

## License

This project is licensed under the MIT License.

---

## Closing Notes

This README will evolve as the project progresses. Keep it updated, keep it clean, and let’s build something awesome together!
