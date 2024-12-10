# Pages & Sections Breakdown

## Public Pages
1. **Landing Page** (currently at /static)
   - Welcome message
   - Navigation menu
   - Call-to-action (Register/Login)

2. **Authentication Pages** (already implemented in security system)
   - Login form
   - Registration form

## User Dashboard & Profile
3. **User Dashboard** (currently at /home)
   - Quick actions menu
   - Navigation to recipes

## Recipe Management
4. **Recipe Listing Page** (/recipe)
   - List view of recipes
   - Basic filtering
     - Dietary type (vegetarian, vegan)
     - Calorie range
   - Basic search

5. **Recipe Detail Page** (/recipe/{id})
   - Recipe title & description
   - Ingredients list
   - Cooking instructions
   - Preparation time
   - Calories
   - Dietary preferences (vegan, vegetarian)

6. **Recipe Creation/Edit Page** (/recipe/new, /recipe/{id}/edit)
   - Recipe form
     - Title & description
     - Ingredients list
     - Preparation instructions
     - Cooking time
     - Calories
     - Dietary preferences

## Admin Section
7. **User Management** (/user)
   - Users list
   - Block/unblock controls
   - Basic user CRUD operations

## System Pages
8. **Error Pages**
   - 404 Not Found
   - 403 Forbidden
   - 500 Server Error

Notes:
- Removed Meal Planner section as it's not yet implemented
- Removed Shopping List as it's in "Nice to Have" features
- Removed Nutrition Tracking as it's not in scope
- Simplified Recipe Management to match current implementation
- Removed Rating system as it's in "Nice to Have" features
- Removed Profile management as it's not yet implemented