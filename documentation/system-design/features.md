# Feature List with Implementation Status

## Legend
- [x] Implemented and working
- [~] Partially implemented / has issues
- [ ] Not implemented

---

## 1. Authentication

| Feature | Status | Notes |
|---------|--------|-------|
| Email/Password signup | [x] | Working |
| Email verification (6-digit code) | [x] | Working |
| Login with JWT | [x] | 15-min access token |
| Refresh token | [x] | Session extension |
| Logout | [x] | Token blacklist |
| Password reset | [x] | Email code flow |
| Remember me | [ ] | Not implemented |
| Social login (Google/Apple) | [ ] | Not implemented |

---

## 2. My Recipes

| Feature | Status | Notes |
|---------|--------|-------|
| View recipe list | [x] | Grid layout with cards |
| Create new recipe | [x] | Form with ingredients |
| Edit recipe | [x] | Full editing support |
| Delete recipe | [x] | With confirmation |
| Search recipes by title | [x] | Client-side filter |
| Filter by tags | [x] | Multi-select |
| Sort recipes | [x] | Date, alphabetical |
| Pagination | [x] | 12 per page |
| Show saved library recipes | [x] | Merged with user recipes |
| Recipe sharing (URL) | [x] | Base64 encoded |
| Recipe images | [~] | URL only, no upload |
| Recipe tags | [x] | Create/assign tags |
| Nutritional info | [~] | Fields exist, often empty |
| Recipe import from URL | [ ] | Not implemented |
| Recipe export (PDF) | [ ] | Not implemented |
| Recipe collections/folders | [ ] | Not implemented |

---

## 3. Browse Library

| Feature | Status | Notes |
|---------|--------|-------|
| View public recipes | [x] | 200 seeded recipes |
| Pagination | [x] | Load more button |
| Filter by cuisine | [x] | Working |
| Filter by category | [x] | meal/drink/snack/dessert |
| Filter by difficulty | [x] | easy/medium/hard |
| Search by title | [x] | Working |
| Save/like recipe | [x] | Heart button |
| Show saved status | [x] | Filled heart |
| View recipe details | [x] | Full page view |
| Copy recipe to My Recipes | [~] | Backend ready, UI incomplete |
| Recipe ratings | [ ] | Model exists, no UI |
| Recipe comments | [ ] | Not implemented |
| Related recipes | [ ] | Not implemented |
| Infinite scroll | [ ] | Uses button instead |

---

## 4. Meal Planner

| Feature | Status | Notes |
|---------|--------|-------|
| Weekly view (7 days) | [x] | Working |
| 3 meals per day | [x] | Breakfast/Lunch/Dinner |
| Assign recipe to slot | [x] | Dropdown selection |
| Remove recipe from slot | [x] | Working |
| Random recipe assignment | [x] | Two modes |
| Smart randomizer (by meal type) | [x] | Matches tags |
| Clear week | [x] | Working |
| View next/previous week | [ ] | Current week only |
| Copy previous week | [ ] | Not implemented |
| Meal plan templates | [ ] | Not implemented |
| Drag-drop recipes | [ ] | Click-to-assign only |
| Snack/dessert slots | [ ] | Only 3 meal types |

---

## 5. Shopping List

| Feature | Status | Notes |
|---------|--------|-------|
| Auto-generate from meal plan | [x] | Frontend-only |
| Combine duplicate ingredients | [x] | Working |
| Unit conversion | [x] | grams, ml, pieces |
| Mark item as purchased | [x] | Checkbox (no persist) |
| Add custom item | [ ] | Not implemented |
| Remove item | [ ] | Not implemented |
| Organize by category | [ ] | Not implemented |
| Price tracking | [ ] | Not implemented |
| Share shopping list | [ ] | Not implemented |
| Backend persistence | [ ] | API exists, not used |

---

## 6. Recipe Details Page

| Feature | Status | Notes |
|---------|--------|-------|
| Full recipe view | [x] | Working |
| Ingredient list | [x] | With quantities |
| Instructions | [x] | Working |
| Nutritional info | [~] | Often incomplete |
| Prep/cook time | [x] | Working |
| Servings | [x] | Working |
| Save to collection | [x] | Heart button |
| Share recipe | [x] | URL sharing |
| Print recipe | [ ] | Not implemented |
| Scale servings | [ ] | Not implemented |
| Add to meal plan | [ ] | Not implemented |
| Similar recipes | [ ] | Not implemented |

---

## 7. User Settings

| Feature | Status | Notes |
|---------|--------|-------|
| Change randomizer mode | [x] | localStorage |
| View profile | [ ] | Not implemented |
| Edit profile | [ ] | Not implemented |
| Change password | [ ] | Not implemented |
| Delete account | [ ] | Not implemented |
| Notification preferences | [ ] | Not implemented |
| Dietary preferences | [ ] | Not implemented |
| Dark mode | [ ] | Not implemented |

---

## 8. Onboarding

| Feature | Status | Notes |
|---------|--------|-------|
| Backend routes | [x] | API exists |
| Onboarding UI | [ ] | Not implemented |
| Dietary preferences setup | [ ] | Not implemented |
| Cooking skill level | [ ] | Not implemented |
| Recipe recommendations | [ ] | Not implemented |

---

## 9. Admin Features

| Feature | Status | Notes |
|---------|--------|-------|
| Seed library recipes | [x] | Script exists |
| Recipe moderation | [ ] | Not implemented |
| User management | [ ] | Not implemented |
| Analytics dashboard | [ ] | Not implemented |

---

## Feature Priority Matrix

### P0 - Critical (Must Fix)
- [x] ~~Pagination repeating recipes~~ (Fixed)
- [x] ~~Filter crash~~ (Fixed)
- [x] ~~Saved recipes not in My Recipes~~ (Fixed)
- [ ] Image mismatches in library

### P1 - Important (Should Have)
- [ ] Backend shopping list persistence
- [ ] Copy recipe from library
- [ ] Infinite scroll for Browse
- [ ] Recipe image upload

### P2 - Nice to Have
- [ ] Dark mode
- [ ] Recipe ratings
- [ ] Meal plan templates
- [ ] Recipe collections

### P3 - Future
- [ ] Social features
- [ ] Mobile app
- [ ] AI recipe suggestions
- [ ] Grocery delivery integration
