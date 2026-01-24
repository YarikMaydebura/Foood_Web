# Technical Architecture

## System Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                         CLIENT (Browser)                         │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                    React Application                         ││
│  │  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────────┐   ││
│  │  │ My       │ │ Browse   │ │ Meal     │ │ Shopping     │   ││
│  │  │ Recipes  │ │ Library  │ │ Planner  │ │ List         │   ││
│  │  └──────────┘ └──────────┘ └──────────┘ └──────────────┘   ││
│  │                        │                                     ││
│  │                        ▼                                     ││
│  │              ┌─────────────────┐                            ││
│  │              │  RecipeManager  │  (Main State Container)    ││
│  │              └─────────────────┘                            ││
│  └─────────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────────┘
                              │
                              │ HTTPS (JWT Auth)
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                      BACKEND (FastAPI)                           │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                      API Routes                              ││
│  │  /auth    /recipes    /library    /meal-plan    /shopping   ││
│  └─────────────────────────────────────────────────────────────┘│
│                              │                                   │
│                              ▼                                   │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                    CRUD Operations                           ││
│  │              (SQLAlchemy ORM Queries)                        ││
│  └─────────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────────┘
                              │
                              │ SQL
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                      PostgreSQL Database                         │
│  ┌──────┐ ┌────────┐ ┌───────────┐ ┌────────────┐ ┌──────────┐ │
│  │users │ │recipes │ │ingredients│ │meal_plan_  │ │shopping_ │ │
│  │      │ │        │ │           │ │entries     │ │lists     │ │
│  └──────┘ └────────┘ └───────────┘ └────────────┘ └──────────┘ │
└─────────────────────────────────────────────────────────────────┘
```

## Frontend Architecture

### Component Hierarchy

```
App.jsx (Router)
├── LandingPage.jsx
├── AuthPage.jsx
│   ├── LoginForm.jsx
│   ├── SignupForm.jsx
│   └── EmailVerification.jsx
├── RecipeDetailPage.jsx
└── RecipeManager.jsx (Protected)
    ├── RecipeLibrary.jsx (Browse)
    ├── RecipesView (My Recipes)
    ├── MealPlannerView
    ├── ShoppingListView
    └── RecipeFormModal
```

### State Management

**No external state library** - Uses React useState/useEffect

| State | Location | Purpose |
|-------|----------|---------|
| user | RecipeManager | Current authenticated user |
| recipes | RecipeManager | User's recipe list |
| mealPlan | RecipeManager | Current week's plan |
| shoppingList | RecipeManager | Generated shopping list |
| currentView | RecipeManager | Active tab (recipes/library/planner/shopping) |

### Data Flow: My Recipes

```
1. User opens app
       ↓
2. Check auth token in localStorage
       ↓
3. GET /auth/me (validate token)
       ↓
4. GET /recipes (user's recipes)
   GET /library/saved (saved library recipes)
       ↓
5. Merge and display in grid
       ↓
6. User interactions (add/edit/delete)
       ↓
7. POST/PUT/DELETE /recipes
       ↓
8. Refresh recipe list
```

### Data Flow: Browse Library

```
1. User clicks "Browse" tab
       ↓
2. GET /library/recipes?offset=0&limit=12
   (with Authorization header if logged in)
       ↓
3. Display recipe cards with is_saved status
       ↓
4. User clicks filter or search
       ↓
5. GET /library/recipes?cuisine=Italian&search=pasta
       ↓
6. User clicks heart (save)
       ↓
7. POST /library/recipes/{id}/save
       ↓
8. Update local savedRecipeIds state
```

## Backend Architecture

### API Layer Structure

```
backend/app/
├── main.py              # FastAPI app initialization
├── api/
│   ├── deps.py          # Dependencies (auth, db)
│   └── routes/
│       ├── auth.py      # Authentication endpoints
│       ├── recipes.py   # User recipes CRUD
│       ├── library.py   # Public library endpoints
│       ├── meal_plan.py # Meal planning
│       └── shopping_lists.py
├── core/
│   ├── config.py        # Environment settings
│   └── security.py      # JWT, password hashing
├── models/              # SQLAlchemy models
├── schemas/             # Pydantic request/response
└── crud/                # Database operations
```

### Request Flow

```
HTTP Request
    ↓
FastAPI Router (@router.get, @router.post)
    ↓
Dependency Injection (db session, current_user)
    ↓
Route Handler Function
    ↓
CRUD Operation (crud/recipe.py)
    ↓
SQLAlchemy ORM Query
    ↓
PostgreSQL Database
    ↓
Return Pydantic Schema
    ↓
JSON Response
```

### Authentication Flow

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Signup    │────▶│  Send Code  │────▶│   Verify    │
│             │     │  via Email  │     │   Email     │
└─────────────┘     └─────────────┘     └─────────────┘
                                               │
                                               ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Access    │◀────│   Login     │◀────│   User      │
│   Token     │     │             │     │   Verified  │
└─────────────┘     └─────────────┘     └─────────────┘
      │
      │ Bearer Token in Header
      ▼
┌─────────────┐
│  Protected  │
│  Endpoints  │
└─────────────┘
```

## Database Schema

### Entity Relationship Diagram

```
users ─────────────────┬──────────────────┬───────────────┐
  │                    │                  │               │
  │ 1:N                │ 1:N              │ 1:N           │ 1:N
  ▼                    ▼                  ▼               ▼
recipes          meal_plan_entries   shopping_lists   user_saved_recipes
  │                                       │               │
  │ M:N                                   │ 1:N           │ N:1
  ▼                                       ▼               ▼
recipe_ingredients ◀──── ingredients ───▶ shopping_list_items
  │                                                    recipes
  │ M:N                                              (library)
  ▼
tags
```

### Key Tables

**users**
```sql
id, name, email, password_hash, email_verified, created_at
```

**recipes**
```sql
id, user_id, title, description, image_url, instructions,
slug, is_public, source, difficulty, cuisine, category,
prep_time_minutes, cook_time_minutes, servings, calories
```

**user_saved_recipes** (Reference to library recipes)
```sql
id, user_id, recipe_id, saved_at, notes, rating
UNIQUE(user_id, recipe_id)
```

**meal_plan_entries**
```sql
id, user_id, week_start_date, day_of_week, meal_slot, recipe_id
UNIQUE(user_id, week_start_date, day_of_week, meal_slot)
```

## Security Measures

### Authentication
- JWT tokens with 15-minute expiry
- Refresh tokens for session extension
- Password hashing with bcrypt

### API Security
- CORS restricted to allowed origins
- Rate limiting (100 req/min)
- SQL injection prevention (SQLAlchemy ORM)
- Input validation (Pydantic schemas)

### Headers
```
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
X-XSS-Protection: 1; mode=block
Referrer-Policy: strict-origin-when-cross-origin
```

## Performance Considerations

### Current Implementation
- Pagination: 12-50 items per request
- Lazy loading: Images load on scroll
- Unsplash CDN: Images served with ?w=800 optimization

### Potential Improvements
- [ ] Redis caching for library recipes
- [ ] Database query optimization (N+1 queries)
- [ ] Image lazy loading with blur placeholder
- [ ] Service worker for offline support
