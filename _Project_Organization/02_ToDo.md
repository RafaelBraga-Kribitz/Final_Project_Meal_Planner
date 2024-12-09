# Project 2 - Meal Planner (Symfony/MySQL)

**Timeframe:** 2 Weeks  
**Team Members:**  
- **Back-End (2):**  
  - Person A ([Marina Stanković](https://fswd23.slack.com/team/U07TLJL7HLY))  
  - Person B ([Philipp](https://fswd23.slack.com/team/U07SXQMC1QA))  
- **Front-End (3):**  
  - Person C ([William](https://fswd23.slack.com/team/U07JYM3PT7W))  
  - Person D ([Yosyp Malanka](https://fswd23.slack.com/team/U07K8SDHBC1))  
  - Person E ([Rafael Braga-Kribitz](https://fswd23.slack.com/team/U07K8SDHBC1))

**Goal:** Build a Meal Planner web application that allows users to create, manage, and schedule meals, view other users’ recipes, and handle an admin panel for global CRUD operations and approvals. The final product should be fully functional, clean, and straightforward.

---

## Features & Requirements Recap

- **Authentication & Roles:**  
  - **Admin:** Created on application initialization. Can CRUD all recipes, all users (including blocking), and approve new recipes.  
  - **User:** Registers normally, can CRUD their own recipes and schedule meals. Can view others’ recipes but not edit them.  
  - **Login System:** Simple login/registration with role-based access.

- **Recipes:**  
  - Each recipe contains title, ingredients, description, cooking time, calories, dietary type (e.g., vegan, vegetarian), and optional link to external resources.  
  - Users can manage their own recipes. Admin can manage all recipes.  
  - Filter recipes by type, calories, etc.  
  - (Nice to have) Rating system, allergens, nutrients info, admin approval workflow.

- **Meal Planner:**  
  - CRUD for meal planning (assigning recipes to dates/times).  
  - Users can select meals for a day or a week.  
  - Filtering by dietary type, calories, etc.

- **Shopping List (Nice to have):**  
  - Generate lists of ingredients from chosen recipes.  
  - Lists can be created, stored, and revisited.

---

## High-Level Project Structure

1. **Set Up Environment (Week 1):**  
   - Configure Symfony project.  
   - **One BE Dev (Person A) sets up the database schema and all entities from the start.**  
   - Run initial `doctrine:migrations` so everyone can pull and have the same DB structure.

2. **Back-End Core Logic (Week 1 & Week 2):**  
   - After DB structure is in place, implement CRUD operations for Users, Recipes, and Meal Plans.  
   - Implement filtering (by type, calories) and approval workflows.  
   - Ensure role-based access control.

3. **Front-End Implementation (Week 1 & Week 2):**  
   - Create responsive layouts and pages for login, registration, recipes listing, meal planner, and admin panel.  
   - Integrate forms with back-end endpoints.  
   - Add search, filters, and user-friendly navigation.

4. **Testing & Polishing (End of Week 2):**  
   - Test functionalities (create, update, delete recipes, schedule meals, admin approvals).  
   - Validate forms and ensure ease of use.  
   - Add any nice-to-have features (ratings, allergens, nutrients) if time permits.

---

## Detailed Task Breakdown by Person

### Back-End Developers

#### Person A (Marina Stanković - Back-End)

**Week 1 (Days 1-7):**  
- [ ] **Database & Environment Setup:**  
  - [ ] Install and configure the Symfony skeleton project.  
  - [ ] Connect the project to the MySQL database.  
  - [ ] Ensure `.env` configurations for local development are correct.  
  - [ ] **Create all initial entities upfront** (User, Recipe, MealPlan, optionally ShoppingList, Rating) to define the database schema early on.  
  - [ ] Run `doctrine:migrations` to generate and apply initial DB schema migrations.  
  - [ ] Push the initial migrations and entities to the repo so the entire team can pull the consistent DB structure.
- [ ] **User Entity & Authentication:**  
  - [ ] Complete `User` entity (id, username, password, role, etc.).  
  - [ ] Set up a default admin user in data fixtures.  
  - [ ] Implement authentication (login/register) using Symfony Security.  
  - [ ] Verify users can register as normal users only.

- [ ] **Role Management:**  
  - [ ] Implement role-based security (ADMIN vs USER).  
  - [ ] Protect admin routes with role checks.

**Week 2 (Days 8-14):**  
- [ ] **Recipe Management & Approval Workflow:**  
  - [ ] Implement CRUD controllers for `Recipe` (Admin: all, User: their own).  
  - [ ] Add `approved` boolean field to `Recipe`.  
  - [ ] Admin-only route to approve pending recipes.  
  - [ ] Notification system (e.g., "pending recipes" counter for admin dashboard).
- [ ] **Validation & Testing:**  
  - [ ] Implement field validations (e.g., empty fields, numeric calories).  
  - [ ] Test user registration, login, and recipe creation/deletion.
  - [ ] Fix any DB or logic issues found.

#### Person B (Philipp - Back-End)

**After pulling initial schema from Person A:**  

**Week 1 (Days 1-7):**  
- [ ] **Meal Planner Logic:**  
  - [ ] Implement CRUD for `MealPlan` entity (User-specific logic).  
  - [ ] Ensure user can pick recipes from all approved recipes.  
- [ ] **Filtering & Searching:**  
  - [ ] Implement filtering by dietary type and calorie range.  
  - [ ] Create repository methods for complex queries (e.g., `findByCaloriesRange`).

**Week 2 (Days 8-14):**  
- [ ] **Optional Features (Ratings, Allergens, Nutrients):**  
  - [ ] If time allows, add `Rating` entity linked to `Recipe`.  
  - [ ] Add `allergens`, `nutrients` fields to `Recipe`.  
  - [ ] Implement logic for displaying average rating and filtering by allergens.
  
- [ ] **Shopping List (Nice to have):**  
  - [ ] Implement `ShoppingList` and `ShoppingListItem` entities.  
  - [ ] CRUD for Shopping Lists (create from selected recipes, finalize, revisit).
  
- [ ] **Testing & Optimization:**  
  - [ ] Test Meal Planner and Filtering functionalities.  
  - [ ] Optimize queries if needed.  
  - [ ] Final pass on documentation for back-end logic.

---

### Front-End Developers

#### Person C (William - Front-End)

**Week 1 (Days 1-7):**  
- [ ] **Basic Layout & Navigation:**  
  - [ ] Set up main layout template (header, footer, navigation menu).  
  - [ ] Implement home page with instructions and links to login/register.  
- [ ] **Authentication Pages:**  
  - [ ] Create login page (username/password form).  
  - [ ] Create registration page with basic validations.  
  - [ ] Integrate with back-end endpoints (fetch/axios).  
- [ ] **Responsive Design Setup:**  
  - [ ] Ensure layout is mobile-friendly.  
  - [ ] Test a few breakpoints to confirm responsiveness.

**Week 2 (Days 8-14):**  
- [ ] **User Dashboard & Profile:**  
  - [ ] User dashboard linking to manage recipes, meal planner.  
  - [ ] Optional profile page for viewing/updating user info.
- [ ] **Forms Validation & UX Enhancements:**  
  - [ ] Add inline form validation messages.  
  - [ ] Ensure error/success notifications appear clearly.

- [ ] **Testing & Polish:**  
  - [ ] Test login/register flows thoroughly.  
  - [ ] Fix styling/layout issues.

#### Person D (Yosyp Malanka - Front-End)

**Week 1 (Days 1-7):**  
- [ ] **Recipes Page (List & Details):**  
  - [ ] Create a page to display all approved recipes.  
  - [ ] Include search/filter options (by type, calories).  
  - [ ] On click, show recipe details (ingredients, steps, etc.).
- [ ] **User’s Own Recipes (CRUD):**  
  - [ ] Forms to add/edit/delete user’s own recipes.  
  - [ ] Integrate with back-end recipe endpoints.  
  - [ ] Display messages after create/update/delete actions.

**Week 2 (Days 8-14):**  
- [ ] **Meal Planner Interface:**  
  - [ ] Calendar or list interface to view assigned meals by day.  
  - [ ] Form to pick a recipe and time, add to planner.  
  - [ ] Integrate filtering to find desired recipes quickly.
- [ ] **Admin Panel UI (if user is admin):**  
  - [ ] Page for admin to approve recipes.  
  - [ ] View pending recipes and click “approve”.  
  - [ ] Basic user management (block/unblock).

- [ ] **Testing & Polish:**  
  - [ ] Test recipe and meal planner functionalities.  
  - [ ] Adjust UI based on feedback.

#### Person E (Rafael Braga-Kribitz - Front-End, UI/UX Lead)

**Week 1 (Days 1-7):**  
- [ ] **UX/UI Planning & Design System:**
  - [ ] Create and share initial wireframes/mockups for key pages
  - [ ] Design and document the component system (buttons, forms, cards, etc.)
  - [ ] Create a UI style guide (colors, typography, spacing rules)
  - [ ] Get team approval on design direction
- [ ] **Global Styling & Theming:**  
  - [ ] Define and implement the approved color palette and typography
  - [ ] Create reusable CSS classes/components based on the style guide
  - [ ] Build a component library for other front-end devs to use
- [ ] **Responsive Grid & Components:**  
  - [ ] Design and implement responsive layouts for all major views
  - [ ] Create responsive grids for recipe thumbnails
  - [ ] Document responsive breakpoints for the team

**Week 2 (Days 8-14):**  
- [ ] **Enhanced UI Elements:**  
  - [ ] Add icons or small illustrations where appropriate.  
  - [ ] Implement a simple filtering panel (toggles, dropdowns).  
  - [ ] Show visual feedback (spinners, loading indicators).
- [ ] **Nice-to-Have Features UI:**  
  - [ ] UI for rating recipes (stars, numeric).  
  - [ ] Allergens/Nutrient badges display.  
  - [ ] Shopping List page layout.

- [ ] **Final Polish & Consistency Check:**  
  - [ ] Check typography, spacing, colors consistency.  
  - [ ] Ensure accessibility basics (alt text, labels).  
  - [ ] Minor UI adjustments after feedback.

---

## Final Steps (All Team Members)

**Week 2 (Last 2 Days):**  
- [ ] **Integration Testing:**  
  - [ ] Test user registration -> login -> create recipe -> plan meal -> admin approval -> filtering end-to-end.  
  - [ ] Check error handling for invalid logins, missing fields.
- [ ] **Documentation & Presentation:**  
  - [ ] Write README with setup/running instructions.  
  - [ ] Prepare a short demo script.  
  - [ ] Ensure code comments and commit messages are clear.

**Project Ready for Submission.**
