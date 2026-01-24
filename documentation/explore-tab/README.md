# Browse/Explore Tab Documentation

## Overview

The Browse (Explore) tab allows users to discover recipes from the public library. Users can filter, search, and save recipes to their personal collection.

## Key Files

| File | Purpose |
|------|---------|
| `frontend/src/components/RecipeLibrary.jsx` | Main Browse page component |
| `backend/app/api/routes/library.py` | API endpoints for library recipes |
| `backend/app/models/user_saved_recipe.py` | Model for saved recipe references |

## How It Works

### 1. Loading Recipes

```
User opens Browse tab
       ↓
Frontend: GET /library/recipes?offset=0&limit=12
       ↓
Backend: Query recipes WHERE is_public=true
       ↓
If user logged in: Include is_saved flag for each recipe
       ↓
Display recipe cards in grid
```

### 2. Filtering & Search

**Available Filters:**
- **Cuisine**: Italian, Mexican, Chinese, etc.
- **Category**: meal, drink, snack, dessert
- **Difficulty**: easy, medium, hard
- **Search**: Text search by title

**API Endpoint:**
```
GET /library/recipes?cuisine=Italian&category=meal&difficulty=easy&search=pasta&offset=0&limit=12
```

### 3. Save/Like Recipe

```
User clicks heart button on recipe card
       ↓
Frontend: POST /library/recipes/{recipe_id}/add-to-collection
       ↓
Backend: Create UserSavedRecipe record (user_id, recipe_id)
       ↓
Update local state: savedRecipeIds.add(recipe_id)
       ↓
Heart button turns orange (filled)
```

### 4. Connection to My Recipes

When user visits "My Recipes" page:
1. Fetch user's own recipes: `GET /recipes`
2. Fetch saved library recipes: `GET /library/saved`
3. Merge both lists with source indicator
4. Display unified list with "Saved" badge for library recipes

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/library/recipes` | GET | List public recipes with filters |
| `/library/recipes/{slug}` | GET | Get recipe by slug |
| `/library/recipes/{id}/save` | POST | Save recipe to collection |
| `/library/recipes/{id}/unsave` | DELETE | Remove from saved |
| `/library/saved` | GET | Get user's saved recipes |
| `/library/cuisines` | GET | Get available cuisines |

## What's Implemented

- [x] Recipe listing with pagination
- [x] Filter by cuisine, category, difficulty
- [x] Text search by title
- [x] Save/unsave recipes (heart button)
- [x] Visual indicator for saved recipes
- [x] Saved recipes appear in My Recipes page
- [x] Authorization header for authenticated features

## What Needs Work

### Priority 1: Critical
- [ ] **Infinite scroll** - Currently uses "Load More" button
- [ ] **Copy recipe** - Allow users to create editable copy of library recipe

### Priority 2: Important
- [ ] **Advanced search** - Search by ingredients, prep time, calories
- [ ] **Recipe ratings** - Show community ratings on cards
- [ ] **Sorting options** - By popularity, newest, prep time

### Priority 3: Nice to Have
- [ ] **Related recipes** - Show similar recipes
- [ ] **Recipe collections** - Group saved recipes into folders
- [ ] **Share recipe** - Generate shareable link for library recipes

## Component Structure

```
RecipeLibrary (main component)
├── State
│   ├── recipes[]        - Current page of recipes
│   ├── cuisines[]       - Available cuisine filters
│   ├── savedRecipeIds   - Set of saved recipe IDs
│   ├── page             - Current page number
│   └── filters          - Selected filter values
├── FilterPill           - Toggle buttons for filters
├── RecipeCard           - Individual recipe display
└── Load More Button     - Pagination control
```

## Data Flow Diagram

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│                 │     │                 │     │                 │
│  RecipeLibrary  │────▶│  /library/      │────▶│    Database     │
│   Component     │     │   recipes       │     │                 │
│                 │◀────│   endpoint      │◀────│   recipes       │
└─────────────────┘     └─────────────────┘     │   (is_public)   │
        │                       │               └─────────────────┘
        │                       │
        ▼                       ▼
┌─────────────────┐     ┌─────────────────┐
│ Save Recipe     │────▶│ /library/       │
│ (heart click)   │     │ recipes/{id}/   │
│                 │     │ save            │
└─────────────────┘     └─────────────────┘
                                │
                                ▼
                        ┌─────────────────┐
                        │ user_saved_     │
                        │ recipes table   │
                        └─────────────────┘
```

## Testing Checklist

1. **Basic Loading**
   - [ ] Browse page loads with 12 recipes
   - [ ] "200 recipes found" count is accurate
   - [ ] Recipe cards display correctly

2. **Pagination**
   - [ ] "Load More" loads next 12 recipes
   - [ ] No duplicate recipes when loading more
   - [ ] "Load More" hides when all recipes loaded

3. **Filters**
   - [ ] Clicking filter shows only matching recipes
   - [ ] Multiple filters combine correctly
   - [ ] "Clear filters" resets all filters
   - [ ] Recipe count updates with filters

4. **Search**
   - [ ] Typing in search box filters results
   - [ ] Search works with filters combined
   - [ ] Empty search shows all recipes

5. **Save/Like**
   - [ ] Heart button visible when logged in
   - [ ] Clicking heart saves recipe (turns orange)
   - [ ] Saved state persists after page refresh
   - [ ] Saved recipes appear in My Recipes
