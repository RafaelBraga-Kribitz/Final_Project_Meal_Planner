# Project 2 - Meal Planner (Symfony/MySQL)

**Timeframe:** 2 Weeks  
**Team Members:**  
- **Back-End (2):** Person A, Person B  
- **Front-End (3):** Person C, Person D, Person E

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
   - Setup MySQL database, schema, and initial admin user.  
   - Create essential entities: User, Recipe, MealPlan, (optional: ShoppingList, Ratings).

2. **Back-End Core Logic (Week 1 & Week 2):**  
   - Implement CRUD operations for Users, Recipes, and Meal Plans.  
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

#### Person A (Back-End)

**Week 1 (Days 1-7):**  
- [ ] **Environment Setup:**  
  - [ ] Install and configure Symfony skeleton project.  
  - [ ] Connect project to MySQL database.  
  - [ ] Ensure `.env` configurations for local development are correct.  
  - [ ] Create initial database schema and run `doctrine:migrations`.  
- [ ] **User Entity & Authentication:**  
  - [ ] Create `User` entity with fields (id, username, password, role, etc.).  
  - [ ] Set up a default admin user in data fixtures.  
  - [ ] Implement authentication (login/register) using Symfony Security.  
  - [ ] Verify users can register as normal users only.  
- [ ] **Role Management:**  
  - [ ] Implement role-based security (ADMIN vs USER).  
  - [ ] Protect admin routes with role checks.

**Week 2 (Days 8-14):**  
- [ ] **Recipe Entity & Basic CRUD:**  
  - [ ] Create `Recipe` entity with fields (title, ingredients, description, time, calories, type).  
  - [ ] Implement CRUD controllers for `Recipe` (Admin can manage all, User can manage their own).  
  - [ ] Implement basic validation (e.g., empty fields, numeric calories).  
- [ ] **Approval Workflow:**  
  - [ ] Add `approved` boolean field to `Recipe`.  
  - [ ] Admin-only route to approve pending recipes.  
  - [ ] Notification system (e.g., a simple "pending recipes" counter for admin dashboard).

- [ ] **Testing & Bug Fixes:**  
  - [ ] Test user registration, login, and recipe creation/deletion.  
  - [ ] Fix any DB or logic issues found.

#### Person B (Back-End)

**Week 1 (Days 1-7):**  
- [ ] **Meal Planner Entity & CRUD:**  
  - [ ] Create `MealPlan` entity (id, user_id, recipe_id, datetime).  
  - [ ] Implement CRUD for MealPlans (User-specific).  
  - [ ] Ensure user can pick recipes from all approved recipes.  
- [ ] **Filtering & Searching:**  
  - [ ] Implement filtering by dietary type, calorie range.  
  - [ ] Create repository methods for complex queries (e.g., `findByCaloriesRange`).

**Week 2 (Days 8-14):**  
- [ ] **Optional: Rating & Allergens:**  
  - [ ] If time allows, add `Rating` entity and link to `Recipe`.  
  - [ ] Add `allergens`, `nutrients` columns to `Recipe` (or related entities).  
  - [ ] Implement logic to display average rating, and filter by allergens if requested.
  
- [ ] **Shopping List (Nice to have):**  
  - [ ] Create `ShoppingList` entity with fields (id, user_id, created_at).  
  - [ ] Associate selected recipe ingredients with a `ShoppingListItem` entity.  
  - [ ] CRUD for Shopping Lists (create list from selected recipes, finalize it).  
  - [ ] Ensure lists can be revisited.

- [ ] **Testing & Optimization:**  
  - [ ] Test Meal Planner and Filtering functionalities.  
  - [ ] Optimize queries if needed.  
  - [ ] Final pass on documentation for back-end logic.

---

### Front-End Developers

#### Person C (Front-End)

**Week 1 (Days 1-7):**  
- [ ] **Basic Layout & Navigation:**  
  - [ ] Set up main layout template (header, footer, navigation menu).  
  - [ ] Implement home page with instructions and links to login/register.  
- [ ] **Authentication Pages:**  
  - [ ] Create login page (username/password form).  
  - [ ] Create registration page with basic validations.  
  - [ ] Integrate with back-end endpoints (fetch/axios or similar).  
- [ ] **Responsive Design Setup:**  
  - [ ] Ensure layout is mobile-friendly.  
  - [ ] Test a few breakpoints to confirm responsiveness.

**Week 2 (Days 8-14):**  
- [ ] **User Dashboard & Profile:**  
  - [ ] Create a simple user dashboard (links to manage recipes, meal planner).  
  - [ ] Optionally, add a profile page where user can view/update their info.  
- [ ] **Forms Validation & UX Enhancements:**  
  - [ ] Add inline form validation messages.  
  - [ ] Ensure error/success notifications appear clearly.

- [ ] **Testing & Polish:**  
  - [ ] Test login/register flows thoroughly.  
  - [ ] Fix any styling/layout issues reported by the team.

#### Person D (Front-End)

**Week 1 (Days 1-7):**  
- [ ] **Recipes Page (List & Details):**  
  - [ ] Create a page to display all approved recipes.  
  - [ ] Include search/filter options (by type, calories).  
  - [ ] Clicking on a recipe shows details (ingredients, steps, etc.).
- [ ] **User’s Own Recipes (CRUD):**  
  - [ ] Create forms to add/edit/delete user’s own recipes.  
  - [ ] Integrate with back-end recipe endpoints.  
  - [ ] Display clear messages after creation/update/deletion.

**Week 2 (Days 8-14):**  
- [ ] **Meal Planner Interface:**  
  - [ ] Create a calendar or simple list interface to view assigned meals by day.  
  - [ ] Add a form to pick a recipe and time, then add it to the planner.  
  - [ ] Integrate filtering to quickly find desired recipes.
- [ ] **Admin Panel UI (if accessible to admin role):**  
  - [ ] Special page for admin to approve recipes.  
  - [ ] View pending recipes and click “approve” button.  
  - [ ] Simple user management page (block/unblock).

- [ ] **Testing & Polish:**  
  - [ ] Test recipe and meal planner functionalities.  
  - [ ] Adjust UI elements based on feedback.

#### Person E (Front-End)

**Week 1 (Days 1-7):**  
- [ ] **Global Styling & Theming:**  
  - [ ] Define a simple color palette and font choices.  
  - [ ] Create reusable CSS classes/components (buttons, inputs, cards).  
  - [ ] Apply consistent styling to all pages developed by Person C and D.
- [ ] **Responsive Grid & Components:**  
  - [ ] Ensure recipe listing and meal planner layouts work well in multiple screen sizes.  
  - [ ] Create a responsive grid for recipe thumbnails.

**Week 2 (Days 8-14):**  
- [ ] **Enhanced UI Elements:**  
  - [ ] Add icons or small illustrations where appropriate.  
  - [ ] Implement a simple filtering panel UI with toggles or dropdowns.  
  - [ ] Provide visual feedback (spinners, loading indicators).
- [ ] **Nice-to-Have Features UI:**  
  - [ ] UI elements for rating recipes (stars, numeric rating).  
  - [ ] Allergens/Nutrient badges.  
  - [ ] Shopping List page and ingredient list layout.

- [ ] **Final Polish & Consistency Check:**  
  - [ ] Check all pages for consistent typography, spacing, and color usage.  
  - [ ] Ensure accessibility basics (alt text on images, proper form labels).  
  - [ ] Gather final feedback and make minor adjustments.

---

## Final Steps (All Team Members)

**Week 2 (Last 2 Days):**  
- [ ] **Integration Testing:**  
  - [ ] Test end-to-end flows: user registration -> login -> create recipe -> plan meal -> admin approval -> filtering.  
  - [ ] Check error handling: invalid logins, missing fields in forms.
- [ ] **Documentation & Presentation:**  
  - [ ] Write a short README explaining how to run the project.  
  - [ ] Prepare a quick demonstration script for course conclusion presentation.  
  - [ ] Ensure code comments and commit messages are clear.

**The project should now be ready for submission.**
