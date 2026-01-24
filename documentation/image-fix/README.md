# Image Mismatch Fix Plan

## Problem Summary

Some recipe images don't match their descriptions. For example:
- A cake recipe showing a salad image
- Multiple different recipes sharing the same image
- Some images not loading at all

## Root Cause

The `seed_library.py` script contains 200 recipes with manually assigned Unsplash image URLs. During data entry:
- **20 image URLs are duplicated** across different recipes
- Some images were assigned to wrong recipe types
- No validation exists to check image-recipe matching

## Duplicate Images Identified

The following Unsplash photo IDs are used for multiple recipes:

| Photo ID | Used For | Should Be |
|----------|----------|-----------|
| `photo-1455619452474` | Green Curry, Chili Con Carne, Vegetable Curry, Chicken Curry | Different images for each |
| `photo-1608039829572` | Buffalo Wings, Eggs Benedict, Eggs Florentine, Deviled Eggs | Unique images per recipe |
| `photo-1476124369491` | Risotto Milanese, Mushroom Risotto, Pumpkin Risotto, Seafood Risotto | Unique risotto images |
| `photo-1544025162` | Various bread recipes (4 recipes) | Different bread/pastry images |
| `photo-1512058564366` | Various beef recipes (4 recipes) | Specific beef dish images |
| `photo-1577805947697` | Various pasta recipes (4 recipes) | Unique pasta dish images |
| `photo-1547592166` | Various soup recipes (4 recipes) | Specific soup images |

## Step-by-Step Fix Process

### Step 1: Identify All Duplicate Images

Run this query to find duplicates:
```sql
SELECT image_url, COUNT(*) as count,
       STRING_AGG(title, ', ') as recipes
FROM recipes
WHERE is_public = true
GROUP BY image_url
HAVING COUNT(*) > 1
ORDER BY count DESC;
```

### Step 2: Find Replacement Images

For each duplicate, search Unsplash for appropriate images:

**Search Format:** `https://unsplash.com/s/photos/{recipe-name}`

**Recommended Search Terms:**

| Recipe Type | Search Terms |
|-------------|--------------|
| Pasta dishes | "spaghetti carbonara", "fettuccine alfredo" |
| Curry dishes | "thai green curry", "indian chicken curry" |
| Risotto | "mushroom risotto", "seafood risotto plate" |
| Eggs | "eggs benedict", "deviled eggs appetizer" |
| Beef | "beef stew", "steak dinner", "beef bourguignon" |
| Soup | "tomato soup bowl", "chicken noodle soup" |
| Bread | "sourdough bread", "croissant pastry" |

### Step 3: Get Image URLs

1. Go to Unsplash.com
2. Search for the recipe name
3. Find a matching image
4. Click the image
5. Right-click and "Copy image address"
6. Use format: `https://images.unsplash.com/photo-XXXXXXXXXX?w=800`

### Step 4: Update seed_library.py

Location: `backend/scripts/seed_library.py`

Find each recipe by title and update the `image_url` field:

```python
# Example: Find and update Green Curry
# Search for: "Green Curry with Chicken"
# Change image_url to new unique URL
```

### Step 5: Re-seed Database

```bash
cd backend
python -m scripts.seed_library
```

**Warning:** This will replace all 200 library recipes. Backup first if needed.

### Step 6: Verify Fixes

1. Open Browse page
2. Scroll through all recipes
3. Check that each recipe has a matching image
4. Verify no broken images (404 errors)

## Recipes Needing New Images

### Curry Dishes (4 recipes)
- [ ] Green Curry with Chicken - needs unique green curry image
- [ ] Chili Con Carne - needs chili/bean dish image
- [ ] Vegetable Curry - needs vegetable curry image
- [ ] Chicken Curry - needs Indian curry image

### Egg Dishes (4 recipes)
- [ ] Buffalo Chicken Wings - needs wings image (not eggs!)
- [ ] Eggs Benedict - needs benedict image
- [ ] Eggs Florentine - needs florentine image
- [ ] Deviled Eggs - needs deviled eggs image

### Risotto Dishes (4 recipes)
- [ ] Risotto alla Milanese - needs saffron risotto image
- [ ] Mushroom Risotto - needs mushroom risotto image
- [ ] Pumpkin Risotto - needs pumpkin risotto image
- [ ] Seafood Risotto - needs seafood risotto image

### Other Duplicates
- [ ] Various bread recipes (4)
- [ ] Various beef recipes (4)
- [ ] Various pasta recipes (4)
- [ ] Various soup recipes (4)

**Total: ~20 recipes need new images**

## Image Quality Guidelines

When selecting replacement images:

1. **Resolution**: Minimum 800x600 pixels
2. **Style**: Food photography with good lighting
3. **Focus**: Recipe should be the main subject
4. **Background**: Clean, not cluttered
5. **Orientation**: Landscape preferred (matches card layout)

## URL Format

Always use this format for consistency:
```
https://images.unsplash.com/photo-{PHOTO_ID}?w=800
```

The `?w=800` parameter optimizes for web display.

## Alternative Solutions

### Option A: AI Image Matching (Future)
- Use image recognition API to validate image-recipe match
- Auto-reject mismatched images
- Suggest better alternatives

### Option B: User-Uploaded Images (Future)
- Allow admins to upload custom images
- Store in cloud storage (AWS S3, Cloudflare R2)
- Add image moderation

### Option C: Recipe Image API (Future)
- Integrate with recipe image API (Spoonacular, Edamam)
- Auto-fetch images by recipe name
- Fallback to generic category images

## Verification Checklist

After fixing images:

- [ ] All 200 library recipes have unique images
- [ ] No duplicate image URLs in database
- [ ] All images load without 404 errors
- [ ] Images match their recipe descriptions
- [ ] Image quality is consistent across recipes
