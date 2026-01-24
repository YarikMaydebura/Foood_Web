# Development Roadmap

## Recently Completed

### Bug Fixes
- [x] **Pagination fix** - Load More now shows new recipes instead of repeating
- [x] **Filter crash fix** - Cuisines API response properly parsed
- [x] **Like/Save integration** - Saved recipes now appear in My Recipes
- [x] **Auth header fix** - Browse page sends auth token to show saved status

### Documentation
- [x] Explore tab documentation
- [x] Image fix plan
- [x] System design documentation

---

## Current Sprint: Stability & Polish

### High Priority

#### 1. Image Mismatch Fix
**Status:** Ready to implement
**Effort:** 2-3 hours

**Tasks:**
- [ ] Identify all duplicate image URLs in seed_library.py
- [ ] Find replacement images on Unsplash
- [ ] Update seed_library.py with correct URLs
- [ ] Re-seed database
- [ ] Verify all images match recipes

**Files:** `backend/scripts/seed_library.py`

---

#### 2. Shopping List Backend Integration
**Status:** Backend ready, frontend needs connection
**Effort:** 4-6 hours

**Current State:**
- Frontend generates shopping list client-side
- Backend has full CRUD API but never called
- Changes don't persist after page refresh

**Tasks:**
- [ ] Call `POST /shopping-lists/generate` when meal plan saves
- [ ] Fetch shopping list from backend on load
- [ ] Call toggle endpoint when item checked
- [ ] Add/remove items via API

**Files:**
- `frontend/src/RecipeManager.jsx` (ShoppingListView section)
- `backend/app/api/routes/shopping_lists.py`

---

#### 3. Copy Recipe Feature
**Status:** Backend ready, needs UI
**Effort:** 2-3 hours

**Current State:**
- Backend endpoint exists: `POST /library/recipes/{id}/copy`
- No UI button to trigger it

**Tasks:**
- [ ] Add "Copy to My Recipes" button in Browse cards
- [ ] Add copy button in RecipeDetailPage
- [ ] Call API and show success message
- [ ] Redirect to My Recipes after copy

**Files:**
- `frontend/src/components/RecipeLibrary.jsx`
- `frontend/src/pages/RecipeDetailPage.jsx`

---

### Medium Priority

#### 4. Infinite Scroll for Browse
**Status:** Not started
**Effort:** 3-4 hours

**Current:** "Load More" button
**Goal:** Auto-load when scrolling near bottom

**Tasks:**
- [ ] Add Intersection Observer hook
- [ ] Trigger fetchRecipes when observer fires
- [ ] Handle loading state
- [ ] Prevent multiple simultaneous requests

---

#### 5. Recipe Image Upload
**Status:** Not started
**Effort:** 6-8 hours

**Current:** Manual URL input only
**Goal:** Direct image upload

**Tasks:**
- [ ] Set up cloud storage (Cloudflare R2 or AWS S3)
- [ ] Create upload endpoint in backend
- [ ] Add file input in RecipeFormModal
- [ ] Preview before upload
- [ ] Store URL in database

---

## Next Sprint: Enhanced Features

### Week 1-2

#### Multi-Week Meal Planning
- Navigate to previous/next weeks
- Copy meal plan from previous week
- Save meal plan templates

#### Advanced Search
- Search by ingredients
- Filter by prep time range
- Filter by calorie range
- Filter by servings

### Week 3-4

#### Recipe Collections
- Create named collections (folders)
- Add recipes to collections
- Share collections

#### User Profile
- View/edit profile
- Change password
- Dietary preferences

---

## Future Roadmap

### Q2 Goals

#### Social Features
- [ ] User profiles (public/private)
- [ ] Follow other users
- [ ] Recipe comments
- [ ] Recipe ratings with reviews
- [ ] Activity feed

#### AI Integration
- [ ] Recipe suggestions based on history
- [ ] Ingredient substitution suggestions
- [ ] Meal plan auto-generation
- [ ] Nutritional analysis

### Q3 Goals

#### Mobile App
- [ ] React Native app
- [ ] Offline support
- [ ] Camera for ingredient scanning
- [ ] Push notifications

#### Integrations
- [ ] Import from recipe websites
- [ ] Grocery delivery (Instacart, etc.)
- [ ] Nutrition tracking apps
- [ ] Smart home devices

---

## Technical Debt

### Code Quality
- [ ] Add TypeScript to frontend
- [ ] Add unit tests for API endpoints
- [ ] Add integration tests for UI
- [ ] Refactor RecipeManager.jsx (2,300+ lines)

### Performance
- [ ] Add Redis caching for library
- [ ] Optimize database queries (N+1)
- [ ] Image lazy loading with placeholders
- [ ] Service worker for offline

### Security
- [ ] Add rate limiting per endpoint
- [ ] Add CSRF protection
- [ ] Add input sanitization
- [ ] Security audit

---

## Definition of Done

For each feature to be considered complete:

1. **Code**
   - [ ] Feature implemented
   - [ ] Error handling added
   - [ ] Edge cases covered

2. **Testing**
   - [ ] Manual testing passed
   - [ ] No console errors
   - [ ] Works on mobile

3. **Documentation**
   - [ ] API documented if new endpoints
   - [ ] Feature noted in features.md
   - [ ] Known issues documented

4. **Deployment**
   - [ ] Code merged to main
   - [ ] Deployed to production
   - [ ] Verified in production
