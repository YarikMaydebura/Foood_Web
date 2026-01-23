#!/usr/bin/env python3
"""
Seed script for Foood Recipe Library
Creates 200 public recipes with full nutritional data
"""
import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from sqlalchemy.orm import Session
from app.db.session import SessionLocal
from app.models.recipe import Recipe
from app.models.ingredient import Ingredient
from app.models.recipe_ingredient import RecipeIngredient
from app.models.tag import Tag
from app.models.user import User
from app.models.email_verification import EmailVerificationCode
from app.models.user_preference import UserPreference
from app.models.user_saved_recipe import UserSavedRecipe
from app.core.security import hash_password
import re

def generate_slug(title: str) -> str:
    """Generate URL-friendly slug from title"""
    slug = title.lower()
    slug = re.sub(r'[^a-z0-9\s-]', '', slug)
    slug = re.sub(r'[\s_]+', '-', slug)
    slug = re.sub(r'-+', '-', slug)
    return slug.strip('-')

# ============================================
# RECIPE DATA
# ============================================

RECIPES = [
    # ==================== ITALIAN (15) ====================
    {
        "title": "Classic Spaghetti Carbonara",
        "description": "Traditional Roman pasta with eggs, pecorino cheese, guanciale, and black pepper",
        "image_url": "https://images.unsplash.com/photo-1612874742237-6526221588e3?w=800",
        "instructions": """1. Bring a large pot of salted water to boil and cook spaghetti until al dente.
2. While pasta cooks, cut guanciale into small cubes and cook in a large pan until crispy.
3. In a bowl, whisk together eggs, egg yolks, pecorino, and black pepper.
4. Reserve 1 cup pasta water, then drain pasta.
5. Remove pan from heat, add pasta to guanciale, toss quickly.
6. Add egg mixture, tossing constantly. Add pasta water as needed for creamy consistency.
7. Serve immediately with extra pecorino and pepper.""",
        "ingredients": [
            ("Spaghetti", 400, "g", None),
            ("Guanciale", 200, "g", "or pancetta"),
            ("Eggs", 3, "whole", None),
            ("Egg yolks", 2, "whole", None),
            ("Pecorino Romano", 100, "g", "finely grated"),
            ("Black pepper", 2, "tsp", "freshly ground"),
            ("Salt", 1, "tsp", "for pasta water")
        ],
        "tags": ["Italian", "Pasta", "Dinner", "Quick"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 10,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 650,
        "protein_g": 28,
        "carbs_g": 72,
        "fat_g": 26,
        "fiber_g": 3,
        "sugar_g": 2,
        "sodium_mg": 890,
        "cholesterol_mg": 245
    },
    {
        "title": "Margherita Pizza",
        "description": "Classic Neapolitan pizza with San Marzano tomatoes, fresh mozzarella, and basil",
        "image_url": "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=800",
        "instructions": """1. Prepare pizza dough and let rise for 2 hours.
2. Preheat oven to 500°F (260°C) with pizza stone.
3. Crush San Marzano tomatoes by hand, season with salt.
4. Stretch dough into 12-inch circle.
5. Spread tomato sauce, leaving 1-inch border.
6. Tear mozzarella and distribute evenly.
7. Drizzle with olive oil.
8. Bake 8-10 minutes until crust is golden and cheese bubbles.
9. Top with fresh basil leaves and serve.""",
        "ingredients": [
            ("Pizza dough", 300, "g", None),
            ("San Marzano tomatoes", 200, "g", "canned"),
            ("Fresh mozzarella", 200, "g", None),
            ("Fresh basil", 10, "leaves", None),
            ("Olive oil", 2, "tbsp", "extra virgin"),
            ("Salt", 1, "tsp", None)
        ],
        "tags": ["Italian", "Pizza", "Dinner", "Vegetarian"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 120,
        "cook_time_minutes": 10,
        "servings": 2,
        "calories": 420,
        "protein_g": 18,
        "carbs_g": 48,
        "fat_g": 16,
        "fiber_g": 3,
        "sugar_g": 4,
        "sodium_mg": 720,
        "cholesterol_mg": 45
    },
    {
        "title": "Chicken Parmesan",
        "description": "Crispy breaded chicken cutlets topped with marinara and melted mozzarella",
        "image_url": "https://images.unsplash.com/photo-1632778149955-e80f8ceca2e8?w=800",
        "instructions": """1. Pound chicken breasts to even thickness.
2. Set up breading station: flour, beaten eggs, breadcrumb-parmesan mixture.
3. Dredge chicken in flour, then egg, then breadcrumbs.
4. Heat oil in large pan, cook chicken 4-5 minutes per side until golden.
5. Transfer to baking dish, top with marinara and mozzarella.
6. Bake at 400°F for 15 minutes until cheese melts.
7. Garnish with fresh basil and serve over pasta.""",
        "ingredients": [
            ("Chicken breasts", 600, "g", "boneless, skinless"),
            ("Breadcrumbs", 150, "g", "Italian seasoned"),
            ("Parmesan cheese", 60, "g", "grated"),
            ("Marinara sauce", 300, "ml", None),
            ("Mozzarella", 200, "g", "shredded"),
            ("Eggs", 2, "whole", "beaten"),
            ("All-purpose flour", 100, "g", None),
            ("Olive oil", 60, "ml", None),
            ("Fresh basil", 6, "leaves", None)
        ],
        "tags": ["Italian", "Chicken", "Dinner"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 35,
        "servings": 4,
        "calories": 520,
        "protein_g": 45,
        "carbs_g": 28,
        "fat_g": 24,
        "fiber_g": 2,
        "sugar_g": 5,
        "sodium_mg": 980,
        "cholesterol_mg": 165
    },
    {
        "title": "Risotto alla Milanese",
        "description": "Creamy saffron-infused risotto, a classic from Milan",
        "image_url": "https://images.unsplash.com/photo-1476124369491-e7addf5db371?w=800",
        "instructions": """1. Heat broth in saucepan, add saffron to steep.
2. Sauté onion in butter until soft.
3. Add rice, toast for 2 minutes.
4. Add wine, stir until absorbed.
5. Add warm broth one ladle at a time, stirring constantly.
6. Continue for 18-20 minutes until rice is creamy but al dente.
7. Remove from heat, stir in remaining butter and parmesan.
8. Season with salt and pepper, serve immediately.""",
        "ingredients": [
            ("Arborio rice", 320, "g", None),
            ("Chicken broth", 1000, "ml", "warm"),
            ("Saffron threads", 0.5, "g", None),
            ("White onion", 1, "medium", "finely diced"),
            ("Butter", 80, "g", None),
            ("Dry white wine", 120, "ml", None),
            ("Parmesan cheese", 80, "g", "grated"),
            ("Salt", 1, "tsp", None)
        ],
        "tags": ["Italian", "Risotto", "Dinner", "Vegetarian"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "hard",
        "prep_time_minutes": 10,
        "cook_time_minutes": 30,
        "servings": 4,
        "calories": 480,
        "protein_g": 12,
        "carbs_g": 68,
        "fat_g": 18,
        "fiber_g": 1,
        "sugar_g": 2,
        "sodium_mg": 720,
        "cholesterol_mg": 55
    },
    {
        "title": "Lasagna Bolognese",
        "description": "Layered pasta with rich meat sauce, béchamel, and parmesan",
        "image_url": "https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=800",
        "instructions": """1. Make Bolognese sauce: brown meat, add vegetables, tomatoes, simmer 2 hours.
2. Make béchamel: melt butter, whisk in flour, gradually add milk, cook until thick.
3. Cook lasagna sheets until just pliable.
4. Layer in baking dish: sauce, pasta, béchamel, parmesan. Repeat 4 times.
5. Top with béchamel and extra parmesan.
6. Bake at 375°F for 45 minutes until golden and bubbling.
7. Rest 15 minutes before serving.""",
        "ingredients": [
            ("Lasagna sheets", 400, "g", None),
            ("Ground beef", 500, "g", None),
            ("Ground pork", 250, "g", None),
            ("Crushed tomatoes", 800, "g", "canned"),
            ("Milk", 750, "ml", None),
            ("Butter", 75, "g", None),
            ("All-purpose flour", 75, "g", None),
            ("Parmesan cheese", 150, "g", "grated"),
            ("Onion", 1, "medium", "diced"),
            ("Carrot", 1, "medium", "diced"),
            ("Celery", 2, "stalks", "diced")
        ],
        "tags": ["Italian", "Pasta", "Dinner", "Comfort Food"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "hard",
        "prep_time_minutes": 45,
        "cook_time_minutes": 180,
        "servings": 8,
        "calories": 580,
        "protein_g": 32,
        "carbs_g": 45,
        "fat_g": 28,
        "fiber_g": 4,
        "sugar_g": 8,
        "sodium_mg": 850,
        "cholesterol_mg": 95
    },
    {
        "title": "Caprese Salad",
        "description": "Fresh tomatoes, mozzarella, and basil drizzled with olive oil",
        "image_url": "https://images.unsplash.com/photo-1592417817098-8fd3d9eb14a5?w=800",
        "instructions": """1. Slice tomatoes and mozzarella into 1/4-inch rounds.
2. Arrange alternating slices on a platter.
3. Tuck fresh basil leaves between slices.
4. Drizzle generously with olive oil.
5. Season with flaky sea salt and black pepper.
6. Optional: add balsamic glaze.
7. Serve immediately at room temperature.""",
        "ingredients": [
            ("Tomatoes", 400, "g", "ripe, heirloom preferred"),
            ("Fresh mozzarella", 300, "g", None),
            ("Fresh basil", 20, "leaves", None),
            ("Olive oil", 3, "tbsp", "extra virgin"),
            ("Sea salt", 1, "tsp", "flaky"),
            ("Black pepper", 0.5, "tsp", None)
        ],
        "tags": ["Italian", "Salad", "Healthy", "Vegetarian", "Quick"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 0,
        "servings": 4,
        "calories": 240,
        "protein_g": 14,
        "carbs_g": 6,
        "fat_g": 18,
        "fiber_g": 1,
        "sugar_g": 4,
        "sodium_mg": 380,
        "cholesterol_mg": 45
    },
    {
        "title": "Penne Arrabbiata",
        "description": "Spicy tomato sauce pasta with garlic and red chili flakes",
        "image_url": "https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=800",
        "instructions": """1. Cook penne in salted boiling water until al dente.
2. Sauté garlic and chili flakes in olive oil until fragrant.
3. Add crushed tomatoes, salt, and simmer 15 minutes.
4. Drain pasta, add to sauce, toss well.
5. Finish with fresh parsley and parmesan.
6. Serve hot.""",
        "ingredients": [
            ("Penne pasta", 400, "g", None),
            ("Crushed tomatoes", 400, "g", "canned"),
            ("Garlic", 4, "cloves", "minced"),
            ("Red chili flakes", 1, "tsp", None),
            ("Olive oil", 60, "ml", None),
            ("Fresh parsley", 3, "tbsp", "chopped"),
            ("Parmesan cheese", 60, "g", "grated")
        ],
        "tags": ["Italian", "Pasta", "Spicy", "Quick", "Vegetarian"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 420,
        "protein_g": 14,
        "carbs_g": 68,
        "fat_g": 12,
        "fiber_g": 4,
        "sugar_g": 6,
        "sodium_mg": 520,
        "cholesterol_mg": 8
    },
    {
        "title": "Osso Buco",
        "description": "Braised veal shanks in white wine with gremolata",
        "image_url": "https://images.unsplash.com/photo-1544025162-d76694265947?w=800",
        "instructions": """1. Season veal shanks with salt and pepper, dredge in flour.
2. Brown shanks in olive oil on all sides, set aside.
3. Sauté onion, carrot, celery until soft.
4. Add garlic, tomato paste, cook 1 minute.
5. Add wine, broth, tomatoes, return shanks.
6. Cover and braise at 325°F for 2 hours.
7. Make gremolata: mix parsley, lemon zest, garlic.
8. Serve shanks with gremolata, traditionally over risotto.""",
        "ingredients": [
            ("Veal shanks", 1200, "g", "4 pieces"),
            ("White wine", 250, "ml", "dry"),
            ("Chicken broth", 500, "ml", None),
            ("Diced tomatoes", 400, "g", "canned"),
            ("Onion", 1, "large", "diced"),
            ("Carrot", 2, "medium", "diced"),
            ("Celery", 2, "stalks", "diced"),
            ("Fresh parsley", 4, "tbsp", "for gremolata"),
            ("Lemon zest", 1, "tbsp", None),
            ("Garlic", 6, "cloves", None)
        ],
        "tags": ["Italian", "Dinner", "Special Occasion"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "hard",
        "prep_time_minutes": 30,
        "cook_time_minutes": 150,
        "servings": 4,
        "calories": 480,
        "protein_g": 52,
        "carbs_g": 12,
        "fat_g": 22,
        "fiber_g": 3,
        "sugar_g": 5,
        "sodium_mg": 680,
        "cholesterol_mg": 165
    },
    {
        "title": "Tiramisu",
        "description": "Classic Italian coffee-flavored layered dessert with mascarpone",
        "image_url": "https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=800",
        "instructions": """1. Brew strong espresso, mix with Marsala, let cool.
2. Whisk egg yolks with sugar until pale and thick.
3. Add mascarpone, mix until smooth.
4. Whip cream to soft peaks, fold into mascarpone mixture.
5. Dip ladyfingers in coffee mixture, layer in dish.
6. Spread half mascarpone cream over ladyfingers.
7. Repeat layers.
8. Refrigerate 6 hours or overnight.
9. Dust with cocoa powder before serving.""",
        "ingredients": [
            ("Mascarpone cheese", 500, "g", None),
            ("Ladyfingers", 300, "g", "savoiardi"),
            ("Espresso", 300, "ml", "cooled"),
            ("Egg yolks", 4, "whole", None),
            ("Sugar", 100, "g", None),
            ("Heavy cream", 250, "ml", None),
            ("Marsala wine", 3, "tbsp", None),
            ("Cocoa powder", 2, "tbsp", "for dusting")
        ],
        "tags": ["Italian", "Dessert", "Coffee"],
        "cuisine": "Italian",
        "category": "dessert",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 0,
        "servings": 8,
        "calories": 380,
        "protein_g": 7,
        "carbs_g": 32,
        "fat_g": 24,
        "fiber_g": 0,
        "sugar_g": 22,
        "sodium_mg": 85,
        "cholesterol_mg": 165
    },
    {
        "title": "Bruschetta al Pomodoro",
        "description": "Toasted bread topped with fresh tomato, basil, and garlic",
        "image_url": "https://images.unsplash.com/photo-1572695157366-5e585ab2b69f?w=800",
        "instructions": """1. Dice tomatoes, remove excess seeds.
2. Mix tomatoes with minced garlic, torn basil, olive oil.
3. Season with salt and pepper, let marinate 15 minutes.
4. Toast or grill bread slices until golden.
5. Rub warm bread with cut garlic clove.
6. Top generously with tomato mixture.
7. Drizzle with extra olive oil, serve immediately.""",
        "ingredients": [
            ("Tomatoes", 400, "g", "ripe, diced"),
            ("Crusty bread", 8, "slices", None),
            ("Garlic", 3, "cloves", "minced"),
            ("Fresh basil", 15, "leaves", "torn"),
            ("Olive oil", 4, "tbsp", "extra virgin"),
            ("Salt", 0.5, "tsp", None),
            ("Black pepper", 0.25, "tsp", None)
        ],
        "tags": ["Italian", "Appetizer", "Quick", "Vegetarian"],
        "cuisine": "Italian",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 5,
        "servings": 4,
        "calories": 180,
        "protein_g": 4,
        "carbs_g": 22,
        "fat_g": 9,
        "fiber_g": 2,
        "sugar_g": 3,
        "sodium_mg": 280,
        "cholesterol_mg": 0
    },

    # ==================== ASIAN/CHINESE (15) ====================
    {
        "title": "Kung Pao Chicken",
        "description": "Spicy Sichuan stir-fry with chicken, peanuts, and dried chilies",
        "image_url": "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=800",
        "instructions": """1. Cut chicken into 1-inch cubes, marinate in soy sauce and cornstarch.
2. Mix sauce: soy sauce, vinegar, sugar, sesame oil, cornstarch.
3. Heat wok until smoking, add oil.
4. Stir-fry dried chilies and Sichuan peppercorns until fragrant.
5. Add chicken, cook until golden.
6. Add garlic, ginger, stir 30 seconds.
7. Pour in sauce, add peanuts, toss until glossy.
8. Garnish with green onions, serve with rice.""",
        "ingredients": [
            ("Chicken breast", 500, "g", "cubed"),
            ("Dried red chilies", 12, "whole", None),
            ("Roasted peanuts", 80, "g", None),
            ("Soy sauce", 3, "tbsp", None),
            ("Rice vinegar", 2, "tbsp", None),
            ("Sugar", 1, "tbsp", None),
            ("Garlic", 3, "cloves", "minced"),
            ("Ginger", 1, "tbsp", "minced"),
            ("Green onions", 3, "stalks", "chopped"),
            ("Sichuan peppercorns", 1, "tsp", None),
            ("Sesame oil", 1, "tbsp", None),
            ("Vegetable oil", 3, "tbsp", None)
        ],
        "tags": ["Chinese", "Spicy", "Dinner", "Quick"],
        "cuisine": "Chinese",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 380,
        "protein_g": 32,
        "carbs_g": 18,
        "fat_g": 22,
        "fiber_g": 2,
        "sugar_g": 6,
        "sodium_mg": 920,
        "cholesterol_mg": 85
    },
    {
        "title": "Beef and Broccoli",
        "description": "Classic Chinese-American stir-fry in savory brown sauce",
        "image_url": "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800",
        "instructions": """1. Slice beef against the grain, marinate in soy sauce and cornstarch.
2. Blanch broccoli florets for 2 minutes, drain.
3. Mix sauce: oyster sauce, soy sauce, broth, cornstarch.
4. Heat wok, sear beef in batches until browned, set aside.
5. Add garlic and ginger, stir 30 seconds.
6. Add broccoli, toss briefly.
7. Return beef, pour in sauce, cook until thickened.
8. Serve over steamed rice.""",
        "ingredients": [
            ("Beef sirloin", 500, "g", "thinly sliced"),
            ("Broccoli", 400, "g", "florets"),
            ("Oyster sauce", 3, "tbsp", None),
            ("Soy sauce", 2, "tbsp", None),
            ("Beef broth", 120, "ml", None),
            ("Cornstarch", 2, "tbsp", None),
            ("Garlic", 4, "cloves", "minced"),
            ("Ginger", 1, "tbsp", "minced"),
            ("Vegetable oil", 3, "tbsp", None)
        ],
        "tags": ["Chinese", "Beef", "Dinner", "Quick"],
        "cuisine": "Chinese",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 340,
        "protein_g": 30,
        "carbs_g": 14,
        "fat_g": 18,
        "fiber_g": 3,
        "sugar_g": 4,
        "sodium_mg": 880,
        "cholesterol_mg": 75
    },
    {
        "title": "Sweet and Sour Pork",
        "description": "Crispy pork pieces in tangy pineapple sauce with bell peppers",
        "image_url": "https://images.unsplash.com/photo-1563245372-f21724e3856d?w=800",
        "instructions": """1. Cut pork into 1-inch cubes, season with salt.
2. Coat in cornstarch, then egg, then cornstarch again.
3. Deep fry at 350°F until golden and crispy.
4. Sauté bell peppers and onion until crisp-tender.
5. Add pineapple chunks and juice.
6. Mix sauce: ketchup, vinegar, sugar, soy sauce. Add to wok.
7. Add fried pork, toss to coat.
8. Serve immediately over rice.""",
        "ingredients": [
            ("Pork shoulder", 500, "g", "cubed"),
            ("Pineapple chunks", 250, "g", "with juice"),
            ("Bell peppers", 2, "medium", "mixed colors, cubed"),
            ("Onion", 1, "medium", "cubed"),
            ("Ketchup", 80, "ml", None),
            ("Rice vinegar", 60, "ml", None),
            ("Sugar", 60, "g", None),
            ("Soy sauce", 2, "tbsp", None),
            ("Cornstarch", 100, "g", None),
            ("Eggs", 2, "whole", "beaten"),
            ("Vegetable oil", 500, "ml", "for frying")
        ],
        "tags": ["Chinese", "Pork", "Dinner"],
        "cuisine": "Chinese",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 25,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 520,
        "protein_g": 26,
        "carbs_g": 48,
        "fat_g": 24,
        "fiber_g": 2,
        "sugar_g": 28,
        "sodium_mg": 780,
        "cholesterol_mg": 115
    },
    {
        "title": "Fried Rice",
        "description": "Classic Chinese fried rice with eggs, vegetables, and soy sauce",
        "image_url": "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800",
        "instructions": """1. Use day-old cold rice for best results.
2. Beat eggs, scramble in wok, set aside.
3. Stir-fry vegetables until crisp-tender.
4. Add rice, break up clumps, stir-fry 3-4 minutes.
5. Push rice to sides, add soy sauce in center, mix through.
6. Return eggs, add green onions.
7. Season with white pepper and sesame oil.
8. Serve hot.""",
        "ingredients": [
            ("Cooked rice", 600, "g", "day-old, cold"),
            ("Eggs", 3, "whole", None),
            ("Peas", 100, "g", "frozen"),
            ("Carrots", 1, "medium", "diced small"),
            ("Green onions", 4, "stalks", "chopped"),
            ("Soy sauce", 3, "tbsp", None),
            ("Sesame oil", 1, "tbsp", None),
            ("Vegetable oil", 3, "tbsp", None),
            ("White pepper", 0.5, "tsp", None)
        ],
        "tags": ["Chinese", "Rice", "Quick", "Vegetarian"],
        "cuisine": "Chinese",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 320,
        "protein_g": 10,
        "carbs_g": 48,
        "fat_g": 10,
        "fiber_g": 2,
        "sugar_g": 3,
        "sodium_mg": 680,
        "cholesterol_mg": 140
    },
    {
        "title": "Mapo Tofu",
        "description": "Spicy Sichuan tofu dish with ground pork and fermented black beans",
        "image_url": "https://images.unsplash.com/photo-1582452932084-a36e3f3c7f4f?w=800",
        "instructions": """1. Cut tofu into 1-inch cubes, blanch in salted water 2 minutes.
2. Brown ground pork in wok, breaking into small pieces.
3. Add doubanjiang, fermented black beans, stir until fragrant.
4. Add garlic, ginger, cook 30 seconds.
5. Add broth, bring to simmer.
6. Gently add tofu, simmer 5 minutes.
7. Add cornstarch slurry to thicken.
8. Top with Sichuan peppercorn powder, green onions, and chili oil.""",
        "ingredients": [
            ("Silken tofu", 400, "g", "firm"),
            ("Ground pork", 200, "g", None),
            ("Doubanjiang", 2, "tbsp", "chili bean paste"),
            ("Fermented black beans", 1, "tbsp", None),
            ("Chicken broth", 250, "ml", None),
            ("Garlic", 3, "cloves", "minced"),
            ("Ginger", 1, "tbsp", "minced"),
            ("Green onions", 3, "stalks", "chopped"),
            ("Sichuan peppercorn", 1, "tsp", "ground"),
            ("Chili oil", 2, "tbsp", None)
        ],
        "tags": ["Chinese", "Spicy", "Tofu", "Dinner"],
        "cuisine": "Chinese",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 15,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 280,
        "protein_g": 18,
        "carbs_g": 8,
        "fat_g": 20,
        "fiber_g": 1,
        "sugar_g": 2,
        "sodium_mg": 720,
        "cholesterol_mg": 35
    },

    # ==================== JAPANESE (10) ====================
    {
        "title": "Chicken Teriyaki",
        "description": "Glazed chicken thighs in sweet soy teriyaki sauce",
        "image_url": "https://images.unsplash.com/photo-1609183480237-cccd3b2dbcf4?w=800",
        "instructions": """1. Score chicken thighs for even cooking.
2. Mix teriyaki sauce: soy sauce, mirin, sake, sugar.
3. Sear chicken skin-side down until crispy.
4. Flip, cook until almost done.
5. Pour sauce over chicken, reduce until glossy.
6. Slice and serve over rice with sauce drizzled on top.
7. Garnish with sesame seeds and green onions.""",
        "ingredients": [
            ("Chicken thighs", 600, "g", "bone-in, skin-on"),
            ("Soy sauce", 80, "ml", None),
            ("Mirin", 60, "ml", None),
            ("Sake", 60, "ml", None),
            ("Sugar", 2, "tbsp", None),
            ("Sesame seeds", 1, "tbsp", None),
            ("Green onions", 2, "stalks", "sliced")
        ],
        "tags": ["Japanese", "Chicken", "Dinner", "Quick"],
        "cuisine": "Japanese",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 380,
        "protein_g": 32,
        "carbs_g": 18,
        "fat_g": 18,
        "fiber_g": 0,
        "sugar_g": 14,
        "sodium_mg": 1100,
        "cholesterol_mg": 130
    },
    {
        "title": "Tonkotsu Ramen",
        "description": "Rich pork bone broth ramen with chashu and soft-boiled egg",
        "image_url": "https://images.unsplash.com/photo-1557872943-16a5ac26437e?w=800",
        "instructions": """1. Prepare broth by simmering pork bones 12+ hours (or use quality instant).
2. Make chashu: roll pork belly, braise in soy, mirin, sake for 2 hours.
3. Prepare soft-boiled eggs: 6.5 minutes, marinate in soy mixture.
4. Cook ramen noodles according to package.
5. Heat broth, season with tare (seasoning sauce).
6. Add noodles to bowl, ladle in hot broth.
7. Top with sliced chashu, egg, nori, green onions, corn.
8. Drizzle with sesame oil and serve immediately.""",
        "ingredients": [
            ("Ramen noodles", 400, "g", "fresh"),
            ("Pork broth", 1500, "ml", "tonkotsu"),
            ("Pork belly", 400, "g", "for chashu"),
            ("Eggs", 4, "whole", "soft-boiled"),
            ("Soy sauce", 4, "tbsp", None),
            ("Mirin", 2, "tbsp", None),
            ("Nori", 4, "sheets", None),
            ("Green onions", 3, "stalks", "sliced"),
            ("Corn", 100, "g", "canned"),
            ("Sesame oil", 2, "tsp", None)
        ],
        "tags": ["Japanese", "Ramen", "Dinner", "Comfort Food"],
        "cuisine": "Japanese",
        "category": "meal",
        "difficulty": "hard",
        "prep_time_minutes": 30,
        "cook_time_minutes": 180,
        "servings": 4,
        "calories": 680,
        "protein_g": 35,
        "carbs_g": 58,
        "fat_g": 32,
        "fiber_g": 3,
        "sugar_g": 6,
        "sodium_mg": 1450,
        "cholesterol_mg": 215
    },
    {
        "title": "Sushi Roll - California Roll",
        "description": "Inside-out roll with crab, avocado, and cucumber",
        "image_url": "https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=800",
        "instructions": """1. Cook sushi rice with rice vinegar, sugar, salt mixture.
2. Prepare fillings: slice avocado, cucumber into strips.
3. Lay nori on bamboo mat, spread rice over entire surface.
4. Flip so nori faces up, place fillings in center.
5. Roll tightly using bamboo mat.
6. Coat outside with sesame seeds or tobiko.
7. Slice into 6-8 pieces with wet knife.
8. Serve with soy sauce, wasabi, and pickled ginger.""",
        "ingredients": [
            ("Sushi rice", 300, "g", "cooked"),
            ("Nori sheets", 4, "whole", None),
            ("Imitation crab", 200, "g", "shredded"),
            ("Avocado", 2, "whole", "sliced"),
            ("Cucumber", 1, "whole", "julienned"),
            ("Rice vinegar", 3, "tbsp", None),
            ("Sugar", 1, "tbsp", None),
            ("Sesame seeds", 2, "tbsp", None),
            ("Wasabi", 1, "tbsp", None),
            ("Pickled ginger", 50, "g", None)
        ],
        "tags": ["Japanese", "Sushi", "Seafood", "Healthy"],
        "cuisine": "Japanese",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 320,
        "protein_g": 12,
        "carbs_g": 48,
        "fat_g": 10,
        "fiber_g": 4,
        "sugar_g": 5,
        "sodium_mg": 580,
        "cholesterol_mg": 20
    },
    {
        "title": "Miso Soup",
        "description": "Traditional Japanese soup with tofu, wakame, and green onions",
        "image_url": "https://images.unsplash.com/photo-1547928576-b822bc410bdf?w=800",
        "instructions": """1. Soak dried wakame in water until expanded.
2. Bring dashi stock to a simmer.
3. Cut tofu into small cubes.
4. Place miso paste in a small bowl, whisk in some hot dashi to dissolve.
5. Add tofu and wakame to pot.
6. Remove from heat, stir in miso mixture (don't boil).
7. Serve immediately, garnished with green onions.""",
        "ingredients": [
            ("Dashi stock", 800, "ml", None),
            ("Miso paste", 4, "tbsp", "white or mixed"),
            ("Silken tofu", 200, "g", "cubed"),
            ("Dried wakame", 10, "g", None),
            ("Green onions", 2, "stalks", "thinly sliced")
        ],
        "tags": ["Japanese", "Soup", "Healthy", "Quick", "Vegetarian"],
        "cuisine": "Japanese",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 65,
        "protein_g": 5,
        "carbs_g": 6,
        "fat_g": 2,
        "fiber_g": 1,
        "sugar_g": 2,
        "sodium_mg": 820,
        "cholesterol_mg": 0
    },
    {
        "title": "Gyoza (Japanese Dumplings)",
        "description": "Pan-fried dumplings with pork and cabbage filling",
        "image_url": "https://images.unsplash.com/photo-1496116218417-1a781b1c416c?w=800",
        "instructions": """1. Mix ground pork with minced cabbage, garlic, ginger, soy sauce, sesame oil.
2. Place filling in center of each wrapper.
3. Wet edges, fold and pleat to seal.
4. Heat oil in non-stick pan, arrange gyoza in circle.
5. Fry until bottoms are golden.
6. Add water, cover immediately for steam-frying.
7. Remove lid when water evaporates, crisp bottoms.
8. Serve with dipping sauce (soy sauce, rice vinegar, chili oil).""",
        "ingredients": [
            ("Ground pork", 300, "g", None),
            ("Napa cabbage", 200, "g", "minced, squeezed dry"),
            ("Gyoza wrappers", 40, "pieces", None),
            ("Garlic", 2, "cloves", "minced"),
            ("Ginger", 1, "tbsp", "grated"),
            ("Soy sauce", 2, "tbsp", None),
            ("Sesame oil", 1, "tbsp", None),
            ("Green onions", 2, "stalks", "minced"),
            ("Vegetable oil", 2, "tbsp", None)
        ],
        "tags": ["Japanese", "Appetizer", "Pork", "Dinner"],
        "cuisine": "Japanese",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 45,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 340,
        "protein_g": 18,
        "carbs_g": 32,
        "fat_g": 15,
        "fiber_g": 2,
        "sugar_g": 2,
        "sodium_mg": 680,
        "cholesterol_mg": 55
    },

    # ==================== MEXICAN (15) ====================
    {
        "title": "Tacos al Pastor",
        "description": "Marinated pork tacos with pineapple, cilantro, and onion",
        "image_url": "https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?w=800",
        "instructions": """1. Blend marinade: guajillo chilies, achiote, pineapple juice, vinegar, spices.
2. Marinate sliced pork shoulder overnight.
3. Grill or pan-fry pork until charred and cooked through.
4. Chop pork finely.
5. Warm corn tortillas.
6. Fill with pork, top with diced pineapple, onion, cilantro.
7. Serve with lime wedges and salsa verde.""",
        "ingredients": [
            ("Pork shoulder", 600, "g", "thinly sliced"),
            ("Corn tortillas", 12, "small", None),
            ("Pineapple", 200, "g", "diced"),
            ("White onion", 1, "medium", "diced"),
            ("Fresh cilantro", 0.5, "cup", "chopped"),
            ("Guajillo chilies", 4, "dried", None),
            ("Achiote paste", 2, "tbsp", None),
            ("Pineapple juice", 120, "ml", None),
            ("White vinegar", 2, "tbsp", None),
            ("Lime", 2, "whole", "wedges")
        ],
        "tags": ["Mexican", "Tacos", "Pork", "Dinner"],
        "cuisine": "Mexican",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 25,
        "servings": 4,
        "calories": 420,
        "protein_g": 28,
        "carbs_g": 38,
        "fat_g": 18,
        "fiber_g": 4,
        "sugar_g": 10,
        "sodium_mg": 580,
        "cholesterol_mg": 75
    },
    {
        "title": "Chicken Enchiladas",
        "description": "Rolled tortillas filled with chicken, covered in red sauce and cheese",
        "image_url": "https://images.unsplash.com/photo-1534352956036-cd81e27fed9d?w=800",
        "instructions": """1. Poach chicken breasts, shred when cool.
2. Make enchilada sauce: blend tomatoes, chilies, garlic, cumin, oregano.
3. Mix chicken with some sauce and cheese.
4. Dip tortillas in warm sauce to soften.
5. Fill and roll tortillas, place seam-down in baking dish.
6. Cover with remaining sauce and cheese.
7. Bake at 375°F for 20 minutes until bubbly.
8. Top with sour cream, cilantro, and sliced jalapeños.""",
        "ingredients": [
            ("Chicken breasts", 500, "g", None),
            ("Corn tortillas", 12, "medium", None),
            ("Enchilada sauce", 500, "ml", "red"),
            ("Cheddar cheese", 200, "g", "shredded"),
            ("Monterey Jack", 100, "g", "shredded"),
            ("Sour cream", 120, "ml", None),
            ("Fresh cilantro", 0.25, "cup", None),
            ("Jalapeños", 2, "whole", "sliced"),
            ("White onion", 1, "small", "diced")
        ],
        "tags": ["Mexican", "Chicken", "Dinner", "Comfort Food"],
        "cuisine": "Mexican",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 25,
        "cook_time_minutes": 35,
        "servings": 4,
        "calories": 480,
        "protein_g": 35,
        "carbs_g": 32,
        "fat_g": 24,
        "fiber_g": 4,
        "sugar_g": 4,
        "sodium_mg": 920,
        "cholesterol_mg": 105
    },
    {
        "title": "Guacamole",
        "description": "Fresh avocado dip with lime, cilantro, onion, and jalapeño",
        "image_url": "https://images.unsplash.com/photo-1600335895229-6e75511892c8?w=800",
        "instructions": """1. Cut avocados in half, remove pit.
2. Scoop flesh into bowl, mash to desired consistency.
3. Add lime juice immediately to prevent browning.
4. Fold in diced onion, tomato, jalapeño, and cilantro.
5. Season with salt and cumin.
6. Taste and adjust seasoning.
7. Serve immediately with tortilla chips or as taco topping.""",
        "ingredients": [
            ("Avocados", 3, "ripe", None),
            ("Lime juice", 2, "tbsp", "fresh"),
            ("White onion", 0.25, "cup", "finely diced"),
            ("Tomato", 1, "medium", "seeded, diced"),
            ("Jalapeño", 1, "small", "minced"),
            ("Fresh cilantro", 3, "tbsp", "chopped"),
            ("Salt", 0.5, "tsp", None),
            ("Cumin", 0.25, "tsp", "ground")
        ],
        "tags": ["Mexican", "Dip", "Healthy", "Quick", "Vegetarian"],
        "cuisine": "Mexican",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 0,
        "servings": 6,
        "calories": 160,
        "protein_g": 2,
        "carbs_g": 9,
        "fat_g": 14,
        "fiber_g": 6,
        "sugar_g": 1,
        "sodium_mg": 200,
        "cholesterol_mg": 0
    },
    {
        "title": "Carnitas",
        "description": "Slow-braised pulled pork with crispy edges, perfect for tacos",
        "image_url": "https://images.unsplash.com/photo-1599974579688-8dbdd335c77f?w=800",
        "instructions": """1. Cut pork shoulder into 3-inch chunks.
2. Season generously with salt, pepper, cumin, oregano.
3. Place in Dutch oven with orange juice, lime juice, garlic, bay leaves.
4. Cover and braise at 300°F for 3-4 hours until tender.
5. Remove pork, shred with forks.
6. Spread on baking sheet, drizzle with cooking liquid.
7. Broil until edges are crispy, 5-10 minutes.
8. Serve in tacos with pickled onions, cilantro, salsa.""",
        "ingredients": [
            ("Pork shoulder", 1500, "g", "bone-in"),
            ("Orange juice", 250, "ml", "fresh"),
            ("Lime juice", 60, "ml", None),
            ("Garlic", 6, "cloves", "smashed"),
            ("Bay leaves", 3, "whole", None),
            ("Cumin", 2, "tsp", "ground"),
            ("Dried oregano", 1, "tsp", None),
            ("Salt", 1, "tbsp", None),
            ("Black pepper", 1, "tsp", None)
        ],
        "tags": ["Mexican", "Pork", "Dinner", "Slow Cooked"],
        "cuisine": "Mexican",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 240,
        "servings": 8,
        "calories": 380,
        "protein_g": 35,
        "carbs_g": 5,
        "fat_g": 24,
        "fiber_g": 0,
        "sugar_g": 3,
        "sodium_mg": 680,
        "cholesterol_mg": 115
    },
    {
        "title": "Quesadillas",
        "description": "Crispy grilled tortillas with melted cheese and optional fillings",
        "image_url": "https://images.unsplash.com/photo-1618040996337-56904b7850b9?w=800",
        "instructions": """1. Heat large skillet or griddle over medium heat.
2. Place flour tortilla in dry pan.
3. Spread cheese evenly over half of tortilla.
4. Add optional fillings: cooked chicken, peppers, onions.
5. Fold tortilla in half, press gently.
6. Cook 2-3 minutes per side until golden and cheese melts.
7. Cut into wedges.
8. Serve with sour cream, guacamole, and salsa.""",
        "ingredients": [
            ("Flour tortillas", 4, "large", None),
            ("Mexican cheese blend", 300, "g", "shredded"),
            ("Cooked chicken", 200, "g", "shredded, optional"),
            ("Bell pepper", 1, "medium", "sliced"),
            ("Onion", 0.5, "medium", "sliced"),
            ("Sour cream", 100, "ml", None),
            ("Salsa", 100, "ml", None)
        ],
        "tags": ["Mexican", "Quick", "Lunch", "Comfort Food"],
        "cuisine": "Mexican",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 420,
        "protein_g": 22,
        "carbs_g": 34,
        "fat_g": 22,
        "fiber_g": 2,
        "sugar_g": 2,
        "sodium_mg": 720,
        "cholesterol_mg": 65
    },

    # ==================== AMERICAN (15) ====================
    {
        "title": "Classic Cheeseburger",
        "description": "Juicy beef patty with American cheese, lettuce, tomato, and special sauce",
        "image_url": "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=800",
        "instructions": """1. Season ground beef with salt and pepper, form into patties.
2. Make indentation in center of each patty.
3. Grill or pan-fry patties 4 minutes per side for medium.
4. Add cheese in last minute of cooking.
5. Toast buns on grill.
6. Assemble: bottom bun, sauce, lettuce, patty, tomato, onion, top bun.
7. Serve immediately with fries.""",
        "ingredients": [
            ("Ground beef", 600, "g", "80/20"),
            ("American cheese", 4, "slices", None),
            ("Burger buns", 4, "whole", None),
            ("Lettuce", 4, "leaves", "iceberg"),
            ("Tomato", 1, "large", "sliced"),
            ("Red onion", 0.5, "medium", "sliced"),
            ("Pickles", 8, "slices", None),
            ("Ketchup", 4, "tbsp", None),
            ("Mayonnaise", 4, "tbsp", None),
            ("Mustard", 2, "tbsp", None)
        ],
        "tags": ["American", "Burger", "Dinner", "Comfort Food"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 620,
        "protein_g": 35,
        "carbs_g": 32,
        "fat_g": 38,
        "fiber_g": 2,
        "sugar_g": 6,
        "sodium_mg": 980,
        "cholesterol_mg": 115
    },
    {
        "title": "BBQ Pulled Pork Sandwich",
        "description": "Slow-smoked pulled pork with tangy BBQ sauce on a brioche bun",
        "image_url": "https://images.unsplash.com/photo-1529006557810-274b9b2fc783?w=800",
        "instructions": """1. Rub pork shoulder with dry spice mix (paprika, brown sugar, cumin, garlic powder).
2. Smoke at 225°F for 8-10 hours until internal temp reaches 195°F.
3. Let rest 30 minutes, then shred with forks.
4. Mix pulled pork with BBQ sauce.
5. Toast brioche buns.
6. Pile pork on buns, top with coleslaw.
7. Serve with extra sauce and pickles.""",
        "ingredients": [
            ("Pork shoulder", 2000, "g", "bone-in"),
            ("BBQ sauce", 350, "ml", None),
            ("Brioche buns", 8, "whole", None),
            ("Coleslaw", 300, "g", "prepared"),
            ("Paprika", 2, "tbsp", None),
            ("Brown sugar", 2, "tbsp", None),
            ("Garlic powder", 1, "tbsp", None),
            ("Cumin", 1, "tsp", None),
            ("Salt", 1, "tbsp", None),
            ("Black pepper", 1, "tsp", None)
        ],
        "tags": ["American", "BBQ", "Pork", "Dinner"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 600,
        "servings": 8,
        "calories": 520,
        "protein_g": 32,
        "carbs_g": 42,
        "fat_g": 24,
        "fiber_g": 1,
        "sugar_g": 18,
        "sodium_mg": 890,
        "cholesterol_mg": 95
    },
    {
        "title": "Buffalo Chicken Wings",
        "description": "Crispy fried wings tossed in spicy buffalo sauce",
        "image_url": "https://images.unsplash.com/photo-1608039829572-9b8be10bd011?w=800",
        "instructions": """1. Pat wings completely dry with paper towels.
2. Season with salt, pepper, and baking powder.
3. Bake at 425°F for 45 minutes, flipping halfway, until crispy.
4. Alternatively, deep fry at 375°F for 10-12 minutes.
5. Melt butter, mix with hot sauce for buffalo sauce.
6. Toss hot wings in sauce until coated.
7. Serve with blue cheese dressing, celery, and carrot sticks.""",
        "ingredients": [
            ("Chicken wings", 1000, "g", "split at joint"),
            ("Hot sauce", 120, "ml", "Frank's RedHot"),
            ("Butter", 60, "g", "melted"),
            ("Baking powder", 1, "tbsp", None),
            ("Salt", 1, "tsp", None),
            ("Blue cheese dressing", 120, "ml", None),
            ("Celery", 4, "stalks", "cut into sticks"),
            ("Carrots", 2, "medium", "cut into sticks")
        ],
        "tags": ["American", "Appetizer", "Chicken", "Spicy"],
        "cuisine": "American",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 45,
        "servings": 4,
        "calories": 480,
        "protein_g": 32,
        "carbs_g": 4,
        "fat_g": 38,
        "fiber_g": 1,
        "sugar_g": 1,
        "sodium_mg": 1200,
        "cholesterol_mg": 145
    },
    {
        "title": "New York Style Cheesecake",
        "description": "Dense, creamy cheesecake with graham cracker crust",
        "image_url": "https://images.unsplash.com/photo-1524351199678-941a58a3df50?w=800",
        "instructions": """1. Crush graham crackers, mix with melted butter, press into springform pan.
2. Bake crust at 325°F for 10 minutes.
3. Beat cream cheese until smooth.
4. Add sugar, eggs one at a time, vanilla, sour cream.
5. Pour over crust, smooth top.
6. Bake at 325°F for 55-60 minutes until set but still slightly jiggly.
7. Turn off oven, crack door, let cool 1 hour inside.
8. Refrigerate at least 4 hours before serving.""",
        "ingredients": [
            ("Cream cheese", 900, "g", "room temperature"),
            ("Sugar", 200, "g", None),
            ("Eggs", 4, "large", None),
            ("Sour cream", 240, "ml", None),
            ("Vanilla extract", 2, "tsp", None),
            ("Graham crackers", 200, "g", "crushed"),
            ("Butter", 80, "g", "melted")
        ],
        "tags": ["American", "Dessert", "Cheesecake"],
        "cuisine": "American",
        "category": "dessert",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 60,
        "servings": 12,
        "calories": 420,
        "protein_g": 7,
        "carbs_g": 32,
        "fat_g": 30,
        "fiber_g": 0,
        "sugar_g": 24,
        "sodium_mg": 320,
        "cholesterol_mg": 125
    },
    {
        "title": "Mac and Cheese",
        "description": "Creamy baked macaroni with three cheeses and crispy breadcrumb topping",
        "image_url": "https://images.unsplash.com/photo-1543339494-b4cd4f7ba686?w=800",
        "instructions": """1. Cook macaroni until just al dente, drain.
2. Make roux: melt butter, whisk in flour, cook 1 minute.
3. Gradually add milk, whisking constantly until thick.
4. Remove from heat, stir in cheeses until melted.
5. Season with mustard powder, salt, pepper.
6. Fold in pasta, transfer to baking dish.
7. Top with breadcrumbs mixed with melted butter.
8. Bake at 375°F for 25 minutes until golden and bubbly.""",
        "ingredients": [
            ("Elbow macaroni", 450, "g", None),
            ("Sharp cheddar", 250, "g", "shredded"),
            ("Gruyere", 120, "g", "shredded"),
            ("Parmesan", 60, "g", "grated"),
            ("Milk", 720, "ml", "whole"),
            ("Butter", 60, "g", None),
            ("All-purpose flour", 45, "g", None),
            ("Breadcrumbs", 60, "g", "panko"),
            ("Mustard powder", 1, "tsp", None)
        ],
        "tags": ["American", "Pasta", "Comfort Food", "Vegetarian"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 40,
        "servings": 8,
        "calories": 480,
        "protein_g": 18,
        "carbs_g": 42,
        "fat_g": 26,
        "fiber_g": 2,
        "sugar_g": 5,
        "sodium_mg": 580,
        "cholesterol_mg": 75
    },

    # ==================== THAI (10) ====================
    {
        "title": "Pad Thai",
        "description": "Stir-fried rice noodles with shrimp, tofu, peanuts, and tamarind sauce",
        "image_url": "https://images.unsplash.com/photo-1559314809-0d155014e29e?w=800",
        "instructions": """1. Soak rice noodles in warm water until pliable.
2. Mix sauce: tamarind paste, fish sauce, sugar, water.
3. Heat wok, scramble eggs, set aside.
4. Stir-fry shrimp and tofu until cooked.
5. Add noodles and sauce, toss until noodles absorb liquid.
6. Add bean sprouts, garlic chives, return eggs.
7. Serve topped with crushed peanuts, lime wedges, chili flakes.""",
        "ingredients": [
            ("Rice noodles", 250, "g", "flat"),
            ("Shrimp", 200, "g", "peeled"),
            ("Firm tofu", 150, "g", "cubed"),
            ("Eggs", 2, "whole", None),
            ("Tamarind paste", 3, "tbsp", None),
            ("Fish sauce", 3, "tbsp", None),
            ("Sugar", 2, "tbsp", "palm sugar preferred"),
            ("Bean sprouts", 100, "g", None),
            ("Crushed peanuts", 60, "g", None),
            ("Lime", 1, "whole", "wedges"),
            ("Garlic chives", 50, "g", "cut into 2-inch pieces")
        ],
        "tags": ["Thai", "Noodles", "Seafood", "Dinner"],
        "cuisine": "Thai",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 420,
        "protein_g": 22,
        "carbs_g": 52,
        "fat_g": 14,
        "fiber_g": 2,
        "sugar_g": 10,
        "sodium_mg": 980,
        "cholesterol_mg": 145
    },
    {
        "title": "Green Curry with Chicken",
        "description": "Aromatic Thai curry with coconut milk, bamboo shoots, and Thai basil",
        "image_url": "https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=800",
        "instructions": """1. Fry green curry paste in coconut cream until fragrant.
2. Add chicken, cook until nearly done.
3. Pour in coconut milk, bring to simmer.
4. Add bamboo shoots, Thai eggplant if using.
5. Season with fish sauce and palm sugar.
6. Add Thai basil leaves and kaffir lime leaves.
7. Serve with jasmine rice.""",
        "ingredients": [
            ("Chicken thigh", 500, "g", "sliced"),
            ("Green curry paste", 4, "tbsp", None),
            ("Coconut milk", 400, "ml", None),
            ("Coconut cream", 100, "ml", None),
            ("Bamboo shoots", 150, "g", "sliced"),
            ("Thai basil", 1, "cup", "leaves"),
            ("Kaffir lime leaves", 4, "whole", None),
            ("Fish sauce", 2, "tbsp", None),
            ("Palm sugar", 1, "tbsp", None),
            ("Red chili", 2, "whole", "sliced, for garnish")
        ],
        "tags": ["Thai", "Curry", "Chicken", "Dinner", "Spicy"],
        "cuisine": "Thai",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 15,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 380,
        "protein_g": 28,
        "carbs_g": 12,
        "fat_g": 26,
        "fiber_g": 2,
        "sugar_g": 6,
        "sodium_mg": 720,
        "cholesterol_mg": 95
    },
    {
        "title": "Tom Yum Soup",
        "description": "Spicy and sour Thai soup with shrimp, mushrooms, and lemongrass",
        "image_url": "https://images.unsplash.com/photo-1548943487-a2e4e43b4853?w=800",
        "instructions": """1. Bring chicken broth to boil with lemongrass, galangal, kaffir lime leaves.
2. Add mushrooms, cook 3 minutes.
3. Add shrimp, cook until pink.
4. Remove from heat, add fish sauce, lime juice, chili paste.
5. Add tomatoes and cilantro.
6. Taste and adjust seasoning (should be sour, spicy, and savory).
7. Serve immediately.""",
        "ingredients": [
            ("Shrimp", 300, "g", "shell-on for flavor"),
            ("Chicken broth", 1000, "ml", None),
            ("Lemongrass", 3, "stalks", "bruised"),
            ("Galangal", 8, "slices", None),
            ("Kaffir lime leaves", 6, "whole", "torn"),
            ("Oyster mushrooms", 150, "g", None),
            ("Cherry tomatoes", 8, "whole", "halved"),
            ("Fish sauce", 3, "tbsp", None),
            ("Lime juice", 4, "tbsp", None),
            ("Thai chili paste", 2, "tbsp", "nam prik pao"),
            ("Fresh cilantro", 0.25, "cup", None)
        ],
        "tags": ["Thai", "Soup", "Seafood", "Spicy", "Healthy"],
        "cuisine": "Thai",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 180,
        "protein_g": 22,
        "carbs_g": 8,
        "fat_g": 6,
        "fiber_g": 1,
        "sugar_g": 4,
        "sodium_mg": 1100,
        "cholesterol_mg": 145
    },

    # ==================== INDIAN (10) ====================
    {
        "title": "Butter Chicken",
        "description": "Tender chicken in creamy tomato-based curry sauce",
        "image_url": "https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=800",
        "instructions": """1. Marinate chicken in yogurt, garam masala, turmeric, chili powder.
2. Grill or pan-fry chicken until charred.
3. Make sauce: sauté onions until golden, add ginger-garlic paste.
4. Add tomato puree, cook until oil separates.
5. Add spices, cream, butter, kasuri methi.
6. Add chicken pieces, simmer 10 minutes.
7. Garnish with cream swirl and fresh cilantro.
8. Serve with naan or basmati rice.""",
        "ingredients": [
            ("Chicken thighs", 600, "g", "boneless, cubed"),
            ("Heavy cream", 200, "ml", None),
            ("Tomato puree", 400, "g", None),
            ("Butter", 60, "g", None),
            ("Yogurt", 100, "g", "for marinade"),
            ("Garam masala", 2, "tsp", None),
            ("Kasuri methi", 2, "tbsp", "dried fenugreek leaves"),
            ("Ginger-garlic paste", 2, "tbsp", None),
            ("Onion", 2, "medium", "pureed"),
            ("Red chili powder", 1, "tsp", None),
            ("Turmeric", 0.5, "tsp", None)
        ],
        "tags": ["Indian", "Curry", "Chicken", "Dinner", "Comfort Food"],
        "cuisine": "Indian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 40,
        "servings": 4,
        "calories": 450,
        "protein_g": 32,
        "carbs_g": 14,
        "fat_g": 30,
        "fiber_g": 3,
        "sugar_g": 8,
        "sodium_mg": 680,
        "cholesterol_mg": 145
    },
    {
        "title": "Chicken Tikka Masala",
        "description": "Grilled chicken chunks in spiced creamy tomato sauce",
        "image_url": "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=800",
        "instructions": """1. Make tikka marinade: yogurt, ginger, garlic, spices, lemon juice.
2. Marinate chicken 4 hours or overnight.
3. Thread on skewers, grill until charred.
4. Make masala: fry onions, add tomatoes, spices, cream.
5. Simmer until thick.
6. Add grilled chicken, cook 5 more minutes.
7. Garnish with cilantro and serve with rice or naan.""",
        "ingredients": [
            ("Chicken breast", 600, "g", "cubed"),
            ("Yogurt", 200, "g", None),
            ("Heavy cream", 150, "ml", None),
            ("Tomatoes", 400, "g", "pureed"),
            ("Onion", 2, "large", "sliced"),
            ("Ginger", 2, "tbsp", "grated"),
            ("Garlic", 4, "cloves", "minced"),
            ("Garam masala", 2, "tsp", None),
            ("Cumin", 1, "tsp", None),
            ("Coriander", 1, "tsp", "ground"),
            ("Paprika", 2, "tsp", None),
            ("Turmeric", 0.5, "tsp", None)
        ],
        "tags": ["Indian", "Curry", "Chicken", "Dinner"],
        "cuisine": "Indian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 30,
        "servings": 4,
        "calories": 420,
        "protein_g": 38,
        "carbs_g": 16,
        "fat_g": 22,
        "fiber_g": 3,
        "sugar_g": 8,
        "sodium_mg": 580,
        "cholesterol_mg": 125
    },
    {
        "title": "Palak Paneer",
        "description": "Cottage cheese cubes in creamy spinach gravy",
        "image_url": "https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800",
        "instructions": """1. Blanch spinach, shock in ice water, blend to smooth puree.
2. Fry paneer cubes until golden, set aside.
3. Sauté onions until soft, add ginger-garlic paste.
4. Add tomatoes, cook until oil separates.
5. Add spices, cook 1 minute.
6. Add spinach puree, simmer 5 minutes.
7. Stir in cream and fried paneer.
8. Serve with roti or naan.""",
        "ingredients": [
            ("Paneer", 300, "g", "cubed"),
            ("Spinach", 500, "g", "fresh"),
            ("Onion", 1, "large", "chopped"),
            ("Tomatoes", 2, "medium", "chopped"),
            ("Heavy cream", 60, "ml", None),
            ("Ginger-garlic paste", 1, "tbsp", None),
            ("Green chili", 2, "whole", None),
            ("Garam masala", 1, "tsp", None),
            ("Cumin seeds", 1, "tsp", None),
            ("Ghee", 3, "tbsp", None)
        ],
        "tags": ["Indian", "Vegetarian", "Dinner", "Healthy"],
        "cuisine": "Indian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 25,
        "servings": 4,
        "calories": 320,
        "protein_g": 18,
        "carbs_g": 12,
        "fat_g": 24,
        "fiber_g": 4,
        "sugar_g": 4,
        "sodium_mg": 480,
        "cholesterol_mg": 55
    },
    {
        "title": "Samosas",
        "description": "Crispy pastry triangles filled with spiced potatoes and peas",
        "image_url": "https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?w=800",
        "instructions": """1. Make dough: flour, oil, carom seeds, water. Rest 30 minutes.
2. Boil potatoes, mash coarsely.
3. Sauté cumin seeds, add green chilies, peas, potatoes, spices.
4. Roll dough into thin circles, cut in half.
5. Form cones, fill with potato mixture, seal edges.
6. Deep fry at 350°F until golden and crispy.
7. Serve hot with tamarind and mint chutneys.""",
        "ingredients": [
            ("All-purpose flour", 250, "g", None),
            ("Potatoes", 400, "g", "boiled"),
            ("Green peas", 100, "g", "cooked"),
            ("Cumin seeds", 1, "tsp", None),
            ("Garam masala", 1, "tsp", None),
            ("Green chilies", 2, "whole", "minced"),
            ("Fresh cilantro", 3, "tbsp", "chopped"),
            ("Vegetable oil", 500, "ml", "for frying"),
            ("Carom seeds", 0.5, "tsp", "ajwain")
        ],
        "tags": ["Indian", "Appetizer", "Vegetarian", "Snack"],
        "cuisine": "Indian",
        "category": "snack",
        "difficulty": "hard",
        "prep_time_minutes": 45,
        "cook_time_minutes": 30,
        "servings": 12,
        "calories": 180,
        "protein_g": 4,
        "carbs_g": 22,
        "fat_g": 9,
        "fiber_g": 2,
        "sugar_g": 1,
        "sodium_mg": 280,
        "cholesterol_mg": 0
    },

    # ==================== MEDITERRANEAN (10) ====================
    {
        "title": "Greek Salad",
        "description": "Fresh vegetables with feta cheese, olives, and oregano dressing",
        "image_url": "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=800",
        "instructions": """1. Cut tomatoes into wedges, cucumber into half-moons.
2. Slice red onion into thin rings.
3. Cut green pepper into rings.
4. Arrange vegetables on platter.
5. Top with feta block and Kalamata olives.
6. Drizzle with olive oil, sprinkle oregano, salt, pepper.
7. Serve with crusty bread.""",
        "ingredients": [
            ("Tomatoes", 400, "g", "ripe"),
            ("Cucumber", 1, "large", None),
            ("Red onion", 0.5, "medium", None),
            ("Green bell pepper", 1, "medium", None),
            ("Feta cheese", 200, "g", "block"),
            ("Kalamata olives", 100, "g", None),
            ("Olive oil", 60, "ml", "extra virgin"),
            ("Dried oregano", 1, "tsp", None),
            ("Salt", 0.5, "tsp", None)
        ],
        "tags": ["Greek", "Salad", "Healthy", "Vegetarian", "Quick"],
        "cuisine": "Mediterranean",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 0,
        "servings": 4,
        "calories": 280,
        "protein_g": 10,
        "carbs_g": 12,
        "fat_g": 22,
        "fiber_g": 3,
        "sugar_g": 6,
        "sodium_mg": 720,
        "cholesterol_mg": 35
    },
    {
        "title": "Hummus",
        "description": "Creamy chickpea dip with tahini, lemon, and garlic",
        "image_url": "https://images.unsplash.com/photo-1577805947697-89e18249d767?w=800",
        "instructions": """1. Drain chickpeas, reserve liquid.
2. Blend tahini with lemon juice and garlic until smooth.
3. Add chickpeas gradually, blend until creamy.
4. Add ice water or aquafaba to achieve desired consistency.
5. Season with salt and cumin.
6. Spread on plate, create swirls.
7. Drizzle with olive oil, sprinkle paprika, garnish with whole chickpeas.
8. Serve with warm pita bread.""",
        "ingredients": [
            ("Chickpeas", 400, "g", "canned, drained"),
            ("Tahini", 80, "g", None),
            ("Lemon juice", 60, "ml", "fresh"),
            ("Garlic", 2, "cloves", None),
            ("Olive oil", 3, "tbsp", "for drizzling"),
            ("Cumin", 0.5, "tsp", "ground"),
            ("Paprika", 0.5, "tsp", "for garnish"),
            ("Salt", 0.5, "tsp", None),
            ("Ice water", 60, "ml", None)
        ],
        "tags": ["Mediterranean", "Dip", "Healthy", "Vegan", "Quick"],
        "cuisine": "Mediterranean",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 0,
        "servings": 6,
        "calories": 180,
        "protein_g": 6,
        "carbs_g": 18,
        "fat_g": 10,
        "fiber_g": 4,
        "sugar_g": 2,
        "sodium_mg": 280,
        "cholesterol_mg": 0
    },
    {
        "title": "Falafel",
        "description": "Crispy fried chickpea patties with herbs and spices",
        "image_url": "https://images.unsplash.com/photo-1593001874117-c99c800e3eb7?w=800",
        "instructions": """1. Soak dried chickpeas overnight (don't use canned).
2. Drain and blend with onion, garlic, parsley, cilantro, cumin, coriander.
3. Mixture should be coarse, not paste-like.
4. Refrigerate 1 hour.
5. Form into balls or patties.
6. Deep fry at 350°F until deep golden brown.
7. Serve in pita with tahini sauce, pickles, and vegetables.""",
        "ingredients": [
            ("Dried chickpeas", 250, "g", "soaked overnight"),
            ("Fresh parsley", 1, "cup", None),
            ("Fresh cilantro", 0.5, "cup", None),
            ("Onion", 0.5, "medium", "quartered"),
            ("Garlic", 4, "cloves", None),
            ("Cumin", 1, "tsp", "ground"),
            ("Coriander", 1, "tsp", "ground"),
            ("Baking powder", 0.5, "tsp", None),
            ("Salt", 1, "tsp", None),
            ("Vegetable oil", 500, "ml", "for frying")
        ],
        "tags": ["Mediterranean", "Vegetarian", "Vegan", "Healthy"],
        "cuisine": "Mediterranean",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 15,
        "servings": 6,
        "calories": 220,
        "protein_g": 8,
        "carbs_g": 26,
        "fat_g": 10,
        "fiber_g": 5,
        "sugar_g": 4,
        "sodium_mg": 420,
        "cholesterol_mg": 0
    },

    # ==================== BREAKFAST (15) ====================
    {
        "title": "Classic Pancakes",
        "description": "Fluffy American-style pancakes with maple syrup and butter",
        "image_url": "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=800",
        "instructions": """1. Mix dry ingredients: flour, sugar, baking powder, salt.
2. Whisk wet ingredients: milk, eggs, melted butter, vanilla.
3. Combine wet and dry, mix until just combined (lumps OK).
4. Let batter rest 5 minutes.
5. Heat griddle to 375°F, lightly butter.
6. Pour 1/4 cup batter, cook until bubbles form.
7. Flip, cook 1-2 more minutes.
8. Serve stacked with butter and warm maple syrup.""",
        "ingredients": [
            ("All-purpose flour", 200, "g", None),
            ("Milk", 240, "ml", None),
            ("Eggs", 2, "large", None),
            ("Butter", 45, "g", "melted, plus extra for cooking"),
            ("Sugar", 2, "tbsp", None),
            ("Baking powder", 2, "tsp", None),
            ("Salt", 0.5, "tsp", None),
            ("Vanilla extract", 1, "tsp", None),
            ("Maple syrup", 120, "ml", "for serving")
        ],
        "tags": ["American", "Breakfast", "Sweet"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 380,
        "protein_g": 10,
        "carbs_g": 52,
        "fat_g": 14,
        "fiber_g": 1,
        "sugar_g": 18,
        "sodium_mg": 480,
        "cholesterol_mg": 95
    },
    {
        "title": "Eggs Benedict",
        "description": "Poached eggs on English muffins with Canadian bacon and hollandaise",
        "image_url": "https://images.unsplash.com/photo-1608039829572-9b8be10bd011?w=800",
        "instructions": """1. Make hollandaise: whisk egg yolks over double boiler, slowly add melted butter, lemon juice.
2. Toast English muffins, butter lightly.
3. Cook Canadian bacon until lightly browned.
4. Poach eggs in simmering water with vinegar, 3 minutes.
5. Assemble: muffin, bacon, poached egg, hollandaise.
6. Season with salt, pepper, and paprika.
7. Serve immediately.""",
        "ingredients": [
            ("English muffins", 4, "whole", "split"),
            ("Canadian bacon", 8, "slices", None),
            ("Eggs", 8, "large", "4 for poaching, 4 yolks for hollandaise"),
            ("Butter", 200, "g", "melted"),
            ("Lemon juice", 2, "tbsp", None),
            ("White vinegar", 2, "tbsp", "for poaching"),
            ("Paprika", 0.25, "tsp", "for garnish"),
            ("Salt", 0.5, "tsp", None)
        ],
        "tags": ["American", "Breakfast", "Eggs", "Brunch"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "hard",
        "prep_time_minutes": 15,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 520,
        "protein_g": 22,
        "carbs_g": 26,
        "fat_g": 38,
        "fiber_g": 1,
        "sugar_g": 2,
        "sodium_mg": 980,
        "cholesterol_mg": 425
    },
    {
        "title": "Avocado Toast",
        "description": "Smashed avocado on sourdough with cherry tomatoes and poached egg",
        "image_url": "https://images.unsplash.com/photo-1541519227354-08fa5d50c44d?w=800",
        "instructions": """1. Toast sourdough bread until golden.
2. Mash avocado with lime juice, salt, and red pepper flakes.
3. Poach egg to desired doneness.
4. Spread avocado generously on toast.
5. Top with poached egg and halved cherry tomatoes.
6. Season with flaky salt and black pepper.
7. Optional: add microgreens or everything bagel seasoning.""",
        "ingredients": [
            ("Sourdough bread", 4, "slices", "thick"),
            ("Avocados", 2, "ripe", None),
            ("Eggs", 4, "large", None),
            ("Cherry tomatoes", 100, "g", "halved"),
            ("Lime juice", 1, "tbsp", None),
            ("Red pepper flakes", 0.25, "tsp", None),
            ("Flaky sea salt", 0.5, "tsp", None),
            ("Black pepper", 0.25, "tsp", None)
        ],
        "tags": ["Breakfast", "Healthy", "Quick", "Vegetarian"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 320,
        "protein_g": 12,
        "carbs_g": 28,
        "fat_g": 18,
        "fiber_g": 8,
        "sugar_g": 3,
        "sodium_mg": 380,
        "cholesterol_mg": 185
    },
    {
        "title": "French Toast",
        "description": "Custardy brioche French toast with berries and powdered sugar",
        "image_url": "https://images.unsplash.com/photo-1484723091739-30a097e8f929?w=800",
        "instructions": """1. Whisk eggs, milk, vanilla, cinnamon, and sugar.
2. Heat butter in large pan over medium heat.
3. Dip bread slices in egg mixture, coat both sides.
4. Cook 3-4 minutes per side until golden.
5. Keep warm in 200°F oven while cooking batches.
6. Serve topped with fresh berries, powdered sugar, and maple syrup.""",
        "ingredients": [
            ("Brioche bread", 8, "slices", "thick"),
            ("Eggs", 4, "large", None),
            ("Milk", 180, "ml", "whole"),
            ("Vanilla extract", 1, "tsp", None),
            ("Cinnamon", 0.5, "tsp", None),
            ("Sugar", 2, "tbsp", None),
            ("Butter", 4, "tbsp", None),
            ("Mixed berries", 200, "g", None),
            ("Powdered sugar", 2, "tbsp", None),
            ("Maple syrup", 120, "ml", None)
        ],
        "tags": ["Breakfast", "Brunch", "Sweet"],
        "cuisine": "French",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 420,
        "protein_g": 12,
        "carbs_g": 48,
        "fat_g": 20,
        "fiber_g": 2,
        "sugar_g": 22,
        "sodium_mg": 420,
        "cholesterol_mg": 215
    },
    {
        "title": "Overnight Oats",
        "description": "No-cook oatmeal with yogurt, chia seeds, and fresh fruit",
        "image_url": "https://images.unsplash.com/photo-1517673400267-0251440c45dc?w=800",
        "instructions": """1. Mix oats, milk, yogurt, chia seeds, maple syrup, and vanilla.
2. Divide into jars or containers.
3. Refrigerate overnight or at least 4 hours.
4. In the morning, stir and adjust consistency with more milk if needed.
5. Top with fresh berries, banana slices, and nut butter.
6. Sprinkle with granola for crunch.""",
        "ingredients": [
            ("Rolled oats", 160, "g", None),
            ("Milk", 480, "ml", "any kind"),
            ("Greek yogurt", 200, "g", None),
            ("Chia seeds", 2, "tbsp", None),
            ("Maple syrup", 3, "tbsp", None),
            ("Vanilla extract", 1, "tsp", None),
            ("Mixed berries", 150, "g", None),
            ("Banana", 1, "medium", "sliced"),
            ("Almond butter", 2, "tbsp", None)
        ],
        "tags": ["Breakfast", "Healthy", "Quick", "Vegetarian"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 0,
        "servings": 4,
        "calories": 320,
        "protein_g": 14,
        "carbs_g": 48,
        "fat_g": 10,
        "fiber_g": 8,
        "sugar_g": 18,
        "sodium_mg": 120,
        "cholesterol_mg": 5
    },

    # ==================== DRINKS (20) ====================
    {
        "title": "Classic Margarita",
        "description": "Refreshing tequila cocktail with lime and orange liqueur",
        "image_url": "https://images.unsplash.com/photo-1556855810-ac404aa91e85?w=800",
        "instructions": """1. Run lime wedge around glass rim, dip in salt.
2. Fill cocktail shaker with ice.
3. Add tequila, lime juice, and triple sec.
4. Shake vigorously for 15 seconds.
5. Strain into prepared glass over fresh ice.
6. Garnish with lime wheel.""",
        "ingredients": [
            ("Tequila", 60, "ml", "blanco"),
            ("Fresh lime juice", 30, "ml", None),
            ("Triple sec", 30, "ml", None),
            ("Ice", 1, "cup", None),
            ("Lime wedge", 1, "whole", "for garnish"),
            ("Coarse salt", 1, "tbsp", "for rim")
        ],
        "tags": ["Cocktail", "Mexican", "Drink"],
        "cuisine": "Mexican",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 1,
        "calories": 220,
        "protein_g": 0,
        "carbs_g": 12,
        "fat_g": 0,
        "fiber_g": 0,
        "sugar_g": 10,
        "sodium_mg": 580,
        "cholesterol_mg": 0
    },
    {
        "title": "Mango Lassi",
        "description": "Creamy Indian yogurt smoothie with sweet mango",
        "image_url": "https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=800",
        "instructions": """1. Add mango chunks, yogurt, milk, sugar, and cardamom to blender.
2. Blend until completely smooth.
3. Taste and adjust sweetness.
4. Pour into glasses.
5. Garnish with a pinch of cardamom and mango slice.
6. Serve chilled.""",
        "ingredients": [
            ("Mango", 300, "g", "fresh or frozen chunks"),
            ("Plain yogurt", 240, "g", None),
            ("Milk", 120, "ml", "cold"),
            ("Sugar", 2, "tbsp", "or to taste"),
            ("Cardamom", 0.25, "tsp", "ground")
        ],
        "tags": ["Indian", "Smoothie", "Drink", "Sweet"],
        "cuisine": "Indian",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 2,
        "calories": 220,
        "protein_g": 8,
        "carbs_g": 42,
        "fat_g": 4,
        "fiber_g": 2,
        "sugar_g": 38,
        "sodium_mg": 80,
        "cholesterol_mg": 12
    },
    {
        "title": "Iced Matcha Latte",
        "description": "Creamy green tea latte with a hint of sweetness",
        "image_url": "https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=800",
        "instructions": """1. Sift matcha powder into a bowl to remove lumps.
2. Add hot water (not boiling) and whisk until smooth.
3. Add sweetener and stir.
4. Fill glass with ice.
5. Pour in cold milk.
6. Add matcha mixture, stir or leave layered.
7. Enjoy immediately.""",
        "ingredients": [
            ("Matcha powder", 2, "tsp", "ceremonial grade"),
            ("Hot water", 60, "ml", "175°F"),
            ("Milk", 240, "ml", "oat or regular"),
            ("Honey", 1, "tbsp", "or maple syrup"),
            ("Ice", 1, "cup", None)
        ],
        "tags": ["Japanese", "Tea", "Drink", "Healthy"],
        "cuisine": "Japanese",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 1,
        "calories": 140,
        "protein_g": 6,
        "carbs_g": 18,
        "fat_g": 4,
        "fiber_g": 0,
        "sugar_g": 14,
        "sodium_mg": 120,
        "cholesterol_mg": 12
    },
    {
        "title": "Berry Smoothie Bowl",
        "description": "Thick fruit smoothie topped with granola, fruit, and seeds",
        "image_url": "https://images.unsplash.com/photo-1590301157890-4810ed352733?w=800",
        "instructions": """1. Blend frozen berries, banana, and milk until thick and smooth.
2. Add more liquid only if needed - should be spoonable.
3. Pour into a bowl.
4. Arrange toppings in rows: granola, fresh berries, banana slices.
5. Drizzle with honey and sprinkle chia seeds.
6. Serve immediately with a spoon.""",
        "ingredients": [
            ("Frozen mixed berries", 200, "g", None),
            ("Frozen banana", 1, "medium", None),
            ("Milk", 60, "ml", "any kind"),
            ("Granola", 60, "g", None),
            ("Fresh berries", 50, "g", None),
            ("Banana", 0.5, "medium", "sliced"),
            ("Chia seeds", 1, "tbsp", None),
            ("Honey", 1, "tbsp", None)
        ],
        "tags": ["Breakfast", "Smoothie", "Healthy", "Vegetarian"],
        "cuisine": "American",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 0,
        "servings": 1,
        "calories": 380,
        "protein_g": 8,
        "carbs_g": 72,
        "fat_g": 8,
        "fiber_g": 10,
        "sugar_g": 42,
        "sodium_mg": 80,
        "cholesterol_mg": 5
    },
    {
        "title": "Mojito",
        "description": "Cuban cocktail with rum, fresh mint, lime, and soda water",
        "image_url": "https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=800",
        "instructions": """1. Muddle mint leaves gently with sugar and lime juice.
2. Add rum and stir.
3. Fill glass with ice.
4. Top with soda water.
5. Stir gently to combine.
6. Garnish with mint sprig and lime wheel.
7. Serve with a straw.""",
        "ingredients": [
            ("White rum", 60, "ml", None),
            ("Fresh mint leaves", 10, "whole", None),
            ("Fresh lime juice", 30, "ml", None),
            ("Sugar", 2, "tsp", "or simple syrup"),
            ("Soda water", 60, "ml", None),
            ("Ice", 1, "cup", None),
            ("Lime wheel", 1, "whole", "for garnish")
        ],
        "tags": ["Cocktail", "Cuban", "Drink"],
        "cuisine": "Cuban",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 1,
        "calories": 160,
        "protein_g": 0,
        "carbs_g": 14,
        "fat_g": 0,
        "fiber_g": 0,
        "sugar_g": 12,
        "sodium_mg": 10,
        "cholesterol_mg": 0
    },
    {
        "title": "Hot Chocolate",
        "description": "Rich and creamy hot cocoa with marshmallows",
        "image_url": "https://images.unsplash.com/photo-1517578239113-b03992dcdd25?w=800",
        "instructions": """1. Heat milk in saucepan over medium heat until steaming.
2. Whisk in cocoa powder and sugar until dissolved.
3. Add chocolate chips, stir until melted.
4. Add vanilla extract.
5. Pour into mugs.
6. Top with whipped cream and marshmallows.
7. Dust with cocoa powder.""",
        "ingredients": [
            ("Milk", 480, "ml", "whole"),
            ("Cocoa powder", 3, "tbsp", "unsweetened"),
            ("Sugar", 3, "tbsp", None),
            ("Chocolate chips", 60, "g", "dark"),
            ("Vanilla extract", 0.5, "tsp", None),
            ("Whipped cream", 60, "ml", None),
            ("Mini marshmallows", 30, "g", None)
        ],
        "tags": ["Drink", "Sweet", "Comfort Food"],
        "cuisine": "American",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 10,
        "servings": 2,
        "calories": 320,
        "protein_g": 10,
        "carbs_g": 42,
        "fat_g": 14,
        "fiber_g": 3,
        "sugar_g": 34,
        "sodium_mg": 140,
        "cholesterol_mg": 25
    },
    {
        "title": "Green Detox Smoothie",
        "description": "Healthy green smoothie with spinach, banana, and ginger",
        "image_url": "https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=800",
        "instructions": """1. Add all ingredients to blender.
2. Blend on high until completely smooth.
3. Add more liquid if too thick.
4. Taste and adjust sweetness with honey.
5. Pour into glass.
6. Serve immediately for best nutrition.""",
        "ingredients": [
            ("Spinach", 60, "g", "fresh"),
            ("Banana", 1, "medium", "frozen"),
            ("Green apple", 1, "small", "cored"),
            ("Fresh ginger", 1, "tsp", "grated"),
            ("Lemon juice", 1, "tbsp", None),
            ("Coconut water", 240, "ml", None),
            ("Honey", 1, "tsp", "optional")
        ],
        "tags": ["Smoothie", "Healthy", "Vegan", "Drink"],
        "cuisine": "American",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 1,
        "calories": 180,
        "protein_g": 3,
        "carbs_g": 42,
        "fat_g": 1,
        "fiber_g": 6,
        "sugar_g": 28,
        "sodium_mg": 80,
        "cholesterol_mg": 0
    },

    # ==================== SNACKS & DESSERTS (15) ====================
    {
        "title": "Chocolate Chip Cookies",
        "description": "Classic soft and chewy cookies with melty chocolate chips",
        "image_url": "https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=800",
        "instructions": """1. Cream butter and sugars until light and fluffy.
2. Beat in eggs one at a time, then vanilla.
3. Mix flour, baking soda, and salt separately.
4. Gradually add dry ingredients to wet.
5. Fold in chocolate chips.
6. Chill dough 30 minutes.
7. Scoop onto baking sheets.
8. Bake at 375°F for 9-11 minutes until edges golden.
9. Cool on pan 5 minutes before transferring.""",
        "ingredients": [
            ("Butter", 230, "g", "softened"),
            ("Brown sugar", 200, "g", "packed"),
            ("White sugar", 100, "g", None),
            ("Eggs", 2, "large", None),
            ("Vanilla extract", 2, "tsp", None),
            ("All-purpose flour", 280, "g", None),
            ("Baking soda", 1, "tsp", None),
            ("Salt", 1, "tsp", None),
            ("Chocolate chips", 340, "g", None)
        ],
        "tags": ["Dessert", "Cookies", "Sweet", "American"],
        "cuisine": "American",
        "category": "dessert",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 11,
        "servings": 24,
        "calories": 180,
        "protein_g": 2,
        "carbs_g": 24,
        "fat_g": 9,
        "fiber_g": 1,
        "sugar_g": 15,
        "sodium_mg": 140,
        "cholesterol_mg": 25
    },
    {
        "title": "Brownies",
        "description": "Fudgy chocolate brownies with a crackly top",
        "image_url": "https://images.unsplash.com/photo-1564355808539-22fda35bed7e?w=800",
        "instructions": """1. Melt butter and chocolate together, let cool slightly.
2. Whisk in sugar until combined.
3. Add eggs one at a time, then vanilla.
4. Fold in flour, cocoa, and salt until just combined.
5. Spread in greased 9x13 pan.
6. Bake at 350°F for 25-30 minutes.
7. Do not overbake - center should be slightly underdone.
8. Cool completely before cutting.""",
        "ingredients": [
            ("Butter", 230, "g", None),
            ("Dark chocolate", 200, "g", "chopped"),
            ("Sugar", 400, "g", None),
            ("Eggs", 4, "large", None),
            ("Vanilla extract", 1, "tsp", None),
            ("All-purpose flour", 130, "g", None),
            ("Cocoa powder", 30, "g", None),
            ("Salt", 0.5, "tsp", None)
        ],
        "tags": ["Dessert", "Chocolate", "Sweet", "American"],
        "cuisine": "American",
        "category": "dessert",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 30,
        "servings": 16,
        "calories": 280,
        "protein_g": 4,
        "carbs_g": 38,
        "fat_g": 14,
        "fiber_g": 2,
        "sugar_g": 28,
        "sodium_mg": 120,
        "cholesterol_mg": 75
    },
    {
        "title": "Banana Bread",
        "description": "Moist and tender banana bread with walnuts",
        "image_url": "https://images.unsplash.com/photo-1584568694244-14fbdf83bd30?w=800",
        "instructions": """1. Mash ripe bananas in a large bowl.
2. Mix in melted butter.
3. Add sugar, egg, and vanilla.
4. Combine flour, baking soda, and salt separately.
5. Add dry ingredients, mix until just combined.
6. Fold in walnuts if using.
7. Pour into greased loaf pan.
8. Bake at 350°F for 55-65 minutes until toothpick comes clean.
9. Cool in pan 10 minutes, then turn out.""",
        "ingredients": [
            ("Ripe bananas", 4, "medium", "very ripe"),
            ("Butter", 115, "g", "melted"),
            ("Sugar", 150, "g", None),
            ("Egg", 1, "large", "beaten"),
            ("Vanilla extract", 1, "tsp", None),
            ("All-purpose flour", 190, "g", None),
            ("Baking soda", 1, "tsp", None),
            ("Salt", 0.25, "tsp", None),
            ("Walnuts", 80, "g", "chopped, optional")
        ],
        "tags": ["Breakfast", "Snack", "Sweet", "Baking"],
        "cuisine": "American",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 60,
        "servings": 10,
        "calories": 240,
        "protein_g": 4,
        "carbs_g": 36,
        "fat_g": 10,
        "fiber_g": 2,
        "sugar_g": 18,
        "sodium_mg": 180,
        "cholesterol_mg": 35
    },
    {
        "title": "Apple Pie",
        "description": "Classic American double-crust apple pie with cinnamon",
        "image_url": "https://images.unsplash.com/photo-1621743478914-cc8a86d7e7b5?w=800",
        "instructions": """1. Make pie dough, chill 1 hour.
2. Peel and slice apples, toss with sugar, cinnamon, nutmeg, lemon juice.
3. Roll out bottom crust, place in pie dish.
4. Add apple filling, dot with butter.
5. Roll out top crust, place over filling, crimp edges.
6. Cut vents, brush with egg wash, sprinkle sugar.
7. Bake at 425°F for 45-55 minutes until golden.
8. Cool at least 2 hours before slicing.""",
        "ingredients": [
            ("Granny Smith apples", 1000, "g", "about 6"),
            ("Sugar", 150, "g", None),
            ("Cinnamon", 1, "tsp", "ground"),
            ("Nutmeg", 0.25, "tsp", "ground"),
            ("Lemon juice", 1, "tbsp", None),
            ("Butter", 30, "g", "diced"),
            ("Pie dough", 2, "crusts", "homemade or store-bought"),
            ("Egg", 1, "whole", "for egg wash")
        ],
        "tags": ["Dessert", "Pie", "American", "Sweet"],
        "cuisine": "American",
        "category": "dessert",
        "difficulty": "medium",
        "prep_time_minutes": 45,
        "cook_time_minutes": 55,
        "servings": 8,
        "calories": 320,
        "protein_g": 3,
        "carbs_g": 52,
        "fat_g": 12,
        "fiber_g": 3,
        "sugar_g": 28,
        "sodium_mg": 220,
        "cholesterol_mg": 25
    },
    {
        "title": "Energy Balls",
        "description": "No-bake protein balls with oats, peanut butter, and chocolate chips",
        "image_url": "https://images.unsplash.com/photo-1604329760661-e71dc83f8f26?w=800",
        "instructions": """1. Mix oats, peanut butter, honey, and vanilla in large bowl.
2. Add chocolate chips and any add-ins.
3. Refrigerate mixture 30 minutes until firm.
4. Roll into 1-inch balls.
5. Store in refrigerator up to 1 week.
6. Can be frozen for up to 3 months.""",
        "ingredients": [
            ("Rolled oats", 160, "g", None),
            ("Peanut butter", 180, "g", "creamy"),
            ("Honey", 80, "ml", None),
            ("Vanilla extract", 1, "tsp", None),
            ("Mini chocolate chips", 60, "g", None),
            ("Chia seeds", 2, "tbsp", "optional"),
            ("Flax seeds", 2, "tbsp", "ground, optional")
        ],
        "tags": ["Snack", "Healthy", "No-Bake", "Vegetarian"],
        "cuisine": "American",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 0,
        "servings": 20,
        "calories": 120,
        "protein_g": 4,
        "carbs_g": 14,
        "fat_g": 6,
        "fiber_g": 2,
        "sugar_g": 7,
        "sodium_mg": 40,
        "cholesterol_mg": 0
    },

    # ==================== FRENCH (10) ====================
    {
        "title": "Coq au Vin",
        "description": "Classic French braised chicken in red wine with mushrooms and pearl onions",
        "image_url": "https://images.unsplash.com/photo-1600891964092-4316c288032e?w=800",
        "instructions": """1. Brown chicken pieces in butter, set aside.
2. Sauté bacon lardons until crispy.
3. Brown pearl onions and mushrooms.
4. Add garlic, thyme, bay leaf.
5. Return chicken, pour in wine and stock.
6. Braise in oven at 325°F for 1.5 hours.
7. Thicken sauce if needed, garnish with parsley.""",
        "ingredients": [
            ("Chicken pieces", 1500, "g", "bone-in"),
            ("Red wine", 750, "ml", "Burgundy"),
            ("Bacon lardons", 150, "g", None),
            ("Pearl onions", 200, "g", None),
            ("Cremini mushrooms", 250, "g", "quartered"),
            ("Chicken stock", 250, "ml", None),
            ("Butter", 45, "g", None),
            ("Fresh thyme", 4, "sprigs", None),
            ("Bay leaves", 2, "whole", None),
            ("Garlic", 4, "cloves", "minced")
        ],
        "tags": ["French", "Chicken", "Dinner", "Comfort Food"],
        "cuisine": "French",
        "category": "meal",
        "difficulty": "hard",
        "prep_time_minutes": 30,
        "cook_time_minutes": 120,
        "servings": 6,
        "calories": 520,
        "protein_g": 42,
        "carbs_g": 12,
        "fat_g": 28,
        "fiber_g": 2,
        "sugar_g": 4,
        "sodium_mg": 680,
        "cholesterol_mg": 165
    },
    {
        "title": "French Onion Soup",
        "description": "Caramelized onion soup topped with crusty bread and melted Gruyère",
        "image_url": "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800",
        "instructions": """1. Slice onions thinly, caramelize in butter 45 minutes.
2. Add garlic, cook 1 minute.
3. Deglaze with white wine.
4. Add beef broth, thyme, bay leaf.
5. Simmer 20 minutes.
6. Ladle into oven-safe bowls, top with bread and cheese.
7. Broil until cheese is bubbly and golden.""",
        "ingredients": [
            ("Yellow onions", 1000, "g", "thinly sliced"),
            ("Beef broth", 1500, "ml", None),
            ("Gruyère cheese", 200, "g", "shredded"),
            ("Butter", 60, "g", None),
            ("White wine", 120, "ml", "dry"),
            ("Baguette", 6, "slices", "toasted"),
            ("Fresh thyme", 3, "sprigs", None),
            ("Bay leaf", 1, "whole", None),
            ("Garlic", 3, "cloves", "minced")
        ],
        "tags": ["French", "Soup", "Comfort Food", "Vegetarian"],
        "cuisine": "French",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 15,
        "cook_time_minutes": 75,
        "servings": 6,
        "calories": 380,
        "protein_g": 16,
        "carbs_g": 32,
        "fat_g": 20,
        "fiber_g": 3,
        "sugar_g": 10,
        "sodium_mg": 890,
        "cholesterol_mg": 55
    },
    {
        "title": "Beef Bourguignon",
        "description": "Tender beef stew braised in red wine with vegetables",
        "image_url": "https://images.unsplash.com/photo-1534939561126-855b8675edd7?w=800",
        "instructions": """1. Cut beef into 2-inch cubes, season and brown in batches.
2. Sauté bacon, onions, carrots, celery.
3. Add tomato paste and flour, stir.
4. Return beef, add wine and stock to cover.
5. Add bouquet garni, braise 2-3 hours at 325°F.
6. Add mushrooms and pearl onions last 30 minutes.
7. Serve over mashed potatoes or egg noodles.""",
        "ingredients": [
            ("Beef chuck", 1000, "g", "cubed"),
            ("Red wine", 500, "ml", "Burgundy"),
            ("Beef stock", 500, "ml", None),
            ("Bacon", 150, "g", "diced"),
            ("Pearl onions", 200, "g", None),
            ("Carrots", 3, "medium", "chunked"),
            ("Mushrooms", 250, "g", "quartered"),
            ("Tomato paste", 2, "tbsp", None),
            ("Fresh thyme", 4, "sprigs", None),
            ("Bay leaves", 2, "whole", None)
        ],
        "tags": ["French", "Beef", "Dinner", "Comfort Food"],
        "cuisine": "French",
        "category": "meal",
        "difficulty": "hard",
        "prep_time_minutes": 30,
        "cook_time_minutes": 180,
        "servings": 6,
        "calories": 580,
        "protein_g": 45,
        "carbs_g": 18,
        "fat_g": 32,
        "fiber_g": 3,
        "sugar_g": 6,
        "sodium_mg": 720,
        "cholesterol_mg": 145
    },
    {
        "title": "Crêpes",
        "description": "Thin French pancakes perfect for sweet or savory fillings",
        "image_url": "https://images.unsplash.com/photo-1519676867240-f03562e64548?w=800",
        "instructions": """1. Blend flour, eggs, milk, butter, salt until smooth.
2. Rest batter 1 hour.
3. Heat non-stick pan, brush with butter.
4. Pour thin layer of batter, swirl to coat.
5. Cook 1-2 minutes, flip, cook 30 seconds more.
6. Fill with Nutella and bananas, or ham and cheese.
7. Fold and serve immediately.""",
        "ingredients": [
            ("All-purpose flour", 150, "g", None),
            ("Eggs", 3, "whole", None),
            ("Whole milk", 350, "ml", None),
            ("Butter", 30, "g", "melted, plus more for pan"),
            ("Sugar", 1, "tbsp", None),
            ("Salt", 0.25, "tsp", None),
            ("Vanilla extract", 1, "tsp", "for sweet crêpes")
        ],
        "tags": ["French", "Breakfast", "Dessert", "Vegetarian"],
        "cuisine": "French",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 70,
        "cook_time_minutes": 20,
        "servings": 8,
        "calories": 140,
        "protein_g": 5,
        "carbs_g": 18,
        "fat_g": 5,
        "fiber_g": 0,
        "sugar_g": 3,
        "sodium_mg": 95,
        "cholesterol_mg": 75
    },
    {
        "title": "Ratatouille",
        "description": "Provençal vegetable stew with eggplant, zucchini, and tomatoes",
        "image_url": "https://images.unsplash.com/photo-1572453800999-e8d2d1589b7c?w=800",
        "instructions": """1. Slice all vegetables into thin rounds.
2. Make tomato sauce: sauté onions, garlic, add crushed tomatoes.
3. Spread sauce in baking dish.
4. Arrange vegetable slices in alternating pattern.
5. Drizzle with olive oil, season with herbs.
6. Cover and bake at 375°F for 45 minutes.
7. Uncover, bake 20 more minutes until tender.""",
        "ingredients": [
            ("Eggplant", 1, "medium", "sliced"),
            ("Zucchini", 2, "medium", "sliced"),
            ("Yellow squash", 1, "medium", "sliced"),
            ("Roma tomatoes", 4, "medium", "sliced"),
            ("Bell pepper", 1, "red", "diced for sauce"),
            ("Crushed tomatoes", 400, "g", "for sauce"),
            ("Olive oil", 60, "ml", None),
            ("Garlic", 4, "cloves", "minced"),
            ("Fresh thyme", 1, "tbsp", "chopped"),
            ("Fresh basil", 0.25, "cup", "chopped")
        ],
        "tags": ["French", "Vegetarian", "Healthy", "Vegan"],
        "cuisine": "French",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 65,
        "servings": 6,
        "calories": 120,
        "protein_g": 3,
        "carbs_g": 14,
        "fat_g": 7,
        "fiber_g": 5,
        "sugar_g": 8,
        "sodium_mg": 180,
        "cholesterol_mg": 0
    },

    # ==================== KOREAN (10) ====================
    {
        "title": "Bibimbap",
        "description": "Korean rice bowl with vegetables, meat, and spicy gochujang sauce",
        "image_url": "https://images.unsplash.com/photo-1553163147-622ab57be1c7?w=800",
        "instructions": """1. Cook rice and keep warm.
2. Prepare vegetables: blanch spinach, sauté mushrooms, julienne carrots.
3. Season each vegetable with sesame oil and salt.
4. Cook beef with soy sauce, garlic, sugar.
5. Fry egg sunny-side up.
6. Arrange rice in bowl, top with vegetables, beef, egg.
7. Serve with gochujang and sesame seeds. Mix before eating.""",
        "ingredients": [
            ("Short-grain rice", 400, "g", "cooked"),
            ("Beef sirloin", 200, "g", "thinly sliced"),
            ("Spinach", 150, "g", "blanched"),
            ("Bean sprouts", 100, "g", "blanched"),
            ("Carrots", 1, "medium", "julienned"),
            ("Shiitake mushrooms", 100, "g", "sliced"),
            ("Zucchini", 1, "small", "julienned"),
            ("Eggs", 4, "whole", None),
            ("Gochujang", 4, "tbsp", None),
            ("Sesame oil", 2, "tbsp", None),
            ("Sesame seeds", 1, "tbsp", None)
        ],
        "tags": ["Korean", "Rice Bowl", "Dinner", "Healthy"],
        "cuisine": "Korean",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 480,
        "protein_g": 22,
        "carbs_g": 58,
        "fat_g": 16,
        "fiber_g": 4,
        "sugar_g": 6,
        "sodium_mg": 680,
        "cholesterol_mg": 215
    },
    {
        "title": "Korean Fried Chicken",
        "description": "Double-fried crispy chicken coated in sweet and spicy gochujang glaze",
        "image_url": "https://images.unsplash.com/photo-1575932444877-5106bee2a599?w=800",
        "instructions": """1. Cut chicken into pieces, marinate in ginger, garlic, soy sauce.
2. Coat in cornstarch and flour mixture.
3. Fry at 350°F for 10 minutes, rest 5 minutes.
4. Fry again at 375°F for 5 minutes until extra crispy.
5. Make sauce: combine gochujang, honey, soy sauce, garlic.
6. Toss hot chicken in sauce.
7. Garnish with sesame seeds and green onions.""",
        "ingredients": [
            ("Chicken wings", 1000, "g", None),
            ("Cornstarch", 100, "g", None),
            ("All-purpose flour", 50, "g", None),
            ("Gochujang", 4, "tbsp", None),
            ("Honey", 3, "tbsp", None),
            ("Soy sauce", 2, "tbsp", None),
            ("Rice vinegar", 1, "tbsp", None),
            ("Garlic", 4, "cloves", "minced"),
            ("Ginger", 1, "tbsp", "grated"),
            ("Vegetable oil", 1, "L", "for frying"),
            ("Sesame seeds", 2, "tbsp", None)
        ],
        "tags": ["Korean", "Chicken", "Dinner", "Spicy"],
        "cuisine": "Korean",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 30,
        "servings": 4,
        "calories": 520,
        "protein_g": 35,
        "carbs_g": 32,
        "fat_g": 28,
        "fiber_g": 1,
        "sugar_g": 14,
        "sodium_mg": 920,
        "cholesterol_mg": 125
    },
    {
        "title": "Japchae",
        "description": "Korean glass noodles stir-fried with vegetables and beef",
        "image_url": "https://images.unsplash.com/photo-1583224944520-b05150ecb8d8?w=800",
        "instructions": """1. Soak glass noodles in hot water 10 minutes, drain.
2. Cook beef with soy sauce, sugar, sesame oil.
3. Stir-fry each vegetable separately: spinach, carrots, mushrooms, onions.
4. Cook noodles with soy sauce and sugar.
5. Combine everything in large bowl.
6. Season with more sesame oil, toss well.
7. Serve warm or at room temperature.""",
        "ingredients": [
            ("Sweet potato noodles", 250, "g", "dangmyeon"),
            ("Beef sirloin", 150, "g", "sliced thin"),
            ("Spinach", 200, "g", None),
            ("Carrots", 1, "medium", "julienned"),
            ("Shiitake mushrooms", 100, "g", "sliced"),
            ("Onion", 1, "medium", "sliced"),
            ("Soy sauce", 4, "tbsp", None),
            ("Sugar", 2, "tbsp", None),
            ("Sesame oil", 3, "tbsp", None),
            ("Garlic", 3, "cloves", "minced"),
            ("Sesame seeds", 1, "tbsp", None)
        ],
        "tags": ["Korean", "Noodles", "Dinner"],
        "cuisine": "Korean",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 25,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 380,
        "protein_g": 15,
        "carbs_g": 52,
        "fat_g": 12,
        "fiber_g": 3,
        "sugar_g": 10,
        "sodium_mg": 780,
        "cholesterol_mg": 35
    },
    {
        "title": "Kimchi Jjigae",
        "description": "Spicy fermented cabbage stew with pork and tofu",
        "image_url": "https://images.unsplash.com/photo-1498654896293-37aacf113fd9?w=800",
        "instructions": """1. Sauté pork belly until fat renders.
2. Add aged kimchi, stir-fry 3 minutes.
3. Add water or anchovy stock, bring to boil.
4. Add gochugaru, gochujang, soy sauce.
5. Simmer 15 minutes.
6. Add tofu cubes, cook 5 more minutes.
7. Top with green onions, serve with rice.""",
        "ingredients": [
            ("Aged kimchi", 400, "g", "well-fermented"),
            ("Pork belly", 200, "g", "sliced"),
            ("Firm tofu", 300, "g", "cubed"),
            ("Anchovy stock", 500, "ml", "or water"),
            ("Gochugaru", 1, "tbsp", "Korean red pepper flakes"),
            ("Gochujang", 1, "tbsp", None),
            ("Soy sauce", 1, "tbsp", None),
            ("Garlic", 3, "cloves", "minced"),
            ("Green onions", 2, "stalks", "chopped")
        ],
        "tags": ["Korean", "Soup", "Spicy", "Dinner"],
        "cuisine": "Korean",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 25,
        "servings": 4,
        "calories": 320,
        "protein_g": 18,
        "carbs_g": 12,
        "fat_g": 22,
        "fiber_g": 3,
        "sugar_g": 4,
        "sodium_mg": 1100,
        "cholesterol_mg": 45
    },
    {
        "title": "Bulgogi",
        "description": "Korean marinated grilled beef with sweet soy and pear",
        "image_url": "https://images.unsplash.com/photo-1590301157890-4810ed352733?w=800",
        "instructions": """1. Slice beef thinly against the grain.
2. Make marinade: soy sauce, pear puree, sugar, sesame oil, garlic.
3. Marinate beef 2-4 hours or overnight.
4. Grill on high heat 2-3 minutes per side.
5. Or cook in hot skillet until caramelized.
6. Garnish with sesame seeds and green onions.
7. Serve with rice and lettuce wraps.""",
        "ingredients": [
            ("Beef ribeye", 600, "g", "thinly sliced"),
            ("Asian pear", 0.5, "whole", "pureed"),
            ("Soy sauce", 60, "ml", None),
            ("Sugar", 2, "tbsp", None),
            ("Sesame oil", 2, "tbsp", None),
            ("Garlic", 4, "cloves", "minced"),
            ("Ginger", 1, "tbsp", "grated"),
            ("Green onions", 3, "stalks", "chopped"),
            ("Sesame seeds", 1, "tbsp", None),
            ("Black pepper", 0.5, "tsp", None)
        ],
        "tags": ["Korean", "Beef", "Grill", "Dinner"],
        "cuisine": "Korean",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 380,
        "protein_g": 32,
        "carbs_g": 14,
        "fat_g": 22,
        "fiber_g": 1,
        "sugar_g": 10,
        "sodium_mg": 820,
        "cholesterol_mg": 95
    },

    # ==================== VIETNAMESE (8) ====================
    {
        "title": "Pho Bo",
        "description": "Vietnamese beef noodle soup with aromatic broth and fresh herbs",
        "image_url": "https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=800",
        "instructions": """1. Char onion and ginger over flame.
2. Toast spices: star anise, cinnamon, cloves, coriander.
3. Simmer beef bones 6-8 hours with aromatics.
4. Season broth with fish sauce, rock sugar.
5. Cook rice noodles according to package.
6. Slice beef paper-thin.
7. Assemble: noodles, raw beef, pour hot broth over.
8. Serve with bean sprouts, basil, lime, hoisin, sriracha.""",
        "ingredients": [
            ("Beef bones", 1500, "g", "marrow and knuckle"),
            ("Beef sirloin", 300, "g", "thinly sliced"),
            ("Rice noodles", 400, "g", "banh pho"),
            ("Onion", 2, "large", "halved"),
            ("Ginger", 100, "g", "halved"),
            ("Star anise", 5, "whole", None),
            ("Cinnamon stick", 1, "whole", None),
            ("Fish sauce", 60, "ml", None),
            ("Bean sprouts", 200, "g", None),
            ("Thai basil", 1, "cup", None),
            ("Lime", 2, "whole", "wedges"),
            ("Green onions", 4, "stalks", "sliced")
        ],
        "tags": ["Vietnamese", "Soup", "Beef", "Dinner"],
        "cuisine": "Vietnamese",
        "category": "meal",
        "difficulty": "hard",
        "prep_time_minutes": 30,
        "cook_time_minutes": 480,
        "servings": 6,
        "calories": 420,
        "protein_g": 28,
        "carbs_g": 48,
        "fat_g": 12,
        "fiber_g": 2,
        "sugar_g": 4,
        "sodium_mg": 980,
        "cholesterol_mg": 65
    },
    {
        "title": "Banh Mi",
        "description": "Vietnamese baguette sandwich with pickled vegetables and pâté",
        "image_url": "https://images.unsplash.com/photo-1600688640154-9619e002df30?w=800",
        "instructions": """1. Make pickles: julienne carrots and daikon, pickle in vinegar and sugar.
2. Prepare protein: grill pork or slice cold cuts.
3. Toast baguette lightly.
4. Spread pâté on one side, mayo on other.
5. Layer: meat, pickled vegetables, cucumber, jalapeño.
6. Add fresh cilantro.
7. Drizzle with Maggi sauce if desired.""",
        "ingredients": [
            ("Vietnamese baguette", 4, "whole", None),
            ("Pork tenderloin", 400, "g", "grilled, sliced"),
            ("Pâté", 100, "g", None),
            ("Carrots", 2, "medium", "julienned"),
            ("Daikon radish", 150, "g", "julienned"),
            ("Cucumber", 1, "medium", "sliced"),
            ("Jalapeño", 2, "whole", "sliced"),
            ("Fresh cilantro", 1, "cup", None),
            ("Mayonnaise", 60, "g", None),
            ("Rice vinegar", 120, "ml", None),
            ("Sugar", 3, "tbsp", None)
        ],
        "tags": ["Vietnamese", "Sandwich", "Lunch", "Pork"],
        "cuisine": "Vietnamese",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 450,
        "protein_g": 28,
        "carbs_g": 42,
        "fat_g": 18,
        "fiber_g": 3,
        "sugar_g": 8,
        "sodium_mg": 820,
        "cholesterol_mg": 75
    },
    {
        "title": "Fresh Spring Rolls",
        "description": "Light rice paper rolls with shrimp, vermicelli, and fresh vegetables",
        "image_url": "https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=800",
        "instructions": """1. Cook vermicelli noodles, cool.
2. Poach shrimp, slice in half lengthwise.
3. Prep vegetables: lettuce, mint, cilantro, cucumber.
4. Dip rice paper in warm water until pliable.
5. Place fillings in center, fold sides in, roll tightly.
6. Make peanut dipping sauce.
7. Serve immediately or refrigerate covered with damp towel.""",
        "ingredients": [
            ("Rice paper wrappers", 12, "sheets", None),
            ("Shrimp", 300, "g", "cooked, halved"),
            ("Rice vermicelli", 150, "g", "cooked"),
            ("Lettuce leaves", 12, "whole", "butter lettuce"),
            ("Fresh mint", 0.5, "cup", None),
            ("Fresh cilantro", 0.5, "cup", None),
            ("Cucumber", 1, "medium", "julienned"),
            ("Peanut butter", 60, "g", "for sauce"),
            ("Hoisin sauce", 3, "tbsp", "for sauce"),
            ("Sriracha", 1, "tsp", "for sauce")
        ],
        "tags": ["Vietnamese", "Appetizer", "Healthy", "Seafood"],
        "cuisine": "Vietnamese",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 30,
        "cook_time_minutes": 10,
        "servings": 6,
        "calories": 180,
        "protein_g": 14,
        "carbs_g": 22,
        "fat_g": 4,
        "fiber_g": 2,
        "sugar_g": 3,
        "sodium_mg": 380,
        "cholesterol_mg": 85
    },
    {
        "title": "Bun Cha",
        "description": "Grilled pork meatballs with vermicelli noodles and dipping sauce",
        "image_url": "https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=800",
        "instructions": """1. Make meatballs: mix ground pork with fish sauce, sugar, garlic.
2. Slice pork belly, marinate same way.
3. Grill meatballs and pork belly until charred.
4. Make nuoc cham: fish sauce, lime, sugar, garlic, chili.
5. Cook vermicelli noodles.
6. Serve noodles with meat, fresh herbs, pickled vegetables.
7. Dip in nuoc cham while eating.""",
        "ingredients": [
            ("Ground pork", 400, "g", None),
            ("Pork belly", 300, "g", "sliced"),
            ("Rice vermicelli", 300, "g", None),
            ("Fish sauce", 80, "ml", None),
            ("Lime juice", 60, "ml", None),
            ("Sugar", 4, "tbsp", None),
            ("Garlic", 6, "cloves", "minced"),
            ("Thai chili", 3, "whole", "sliced"),
            ("Fresh herbs", 2, "cups", "mint, perilla, cilantro"),
            ("Lettuce", 1, "head", "leaves separated")
        ],
        "tags": ["Vietnamese", "Pork", "Noodles", "Dinner"],
        "cuisine": "Vietnamese",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 25,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 520,
        "protein_g": 32,
        "carbs_g": 45,
        "fat_g": 24,
        "fiber_g": 2,
        "sugar_g": 12,
        "sodium_mg": 1050,
        "cholesterol_mg": 95
    },

    # ==================== SPANISH (8) ====================
    {
        "title": "Paella Valenciana",
        "description": "Traditional Spanish rice dish with chicken, rabbit, and green beans",
        "image_url": "https://images.unsplash.com/photo-1534080564583-6be75777b70a?w=800",
        "instructions": """1. Heat olive oil in paella pan, brown chicken and rabbit.
2. Add green beans, cook 5 minutes.
3. Add tomato, paprika, saffron, stir.
4. Pour in stock, bring to boil.
5. Add rice in even layer, do not stir.
6. Cook 18-20 minutes until rice absorbs liquid.
7. Let rest 5 minutes, create socarrat (crispy bottom).
8. Garnish with rosemary and lemon wedges.""",
        "ingredients": [
            ("Bomba rice", 400, "g", "or Calasparra"),
            ("Chicken thighs", 500, "g", "bone-in, cut"),
            ("Rabbit", 400, "g", "cut into pieces"),
            ("Green beans", 200, "g", "trimmed"),
            ("Chicken stock", 1200, "ml", "hot"),
            ("Saffron", 0.5, "g", "threads"),
            ("Smoked paprika", 1, "tsp", None),
            ("Tomato", 2, "medium", "grated"),
            ("Olive oil", 80, "ml", None),
            ("Rosemary", 2, "sprigs", None),
            ("Lemon", 1, "whole", "wedges")
        ],
        "tags": ["Spanish", "Rice", "Chicken", "Dinner"],
        "cuisine": "Spanish",
        "category": "meal",
        "difficulty": "hard",
        "prep_time_minutes": 25,
        "cook_time_minutes": 45,
        "servings": 6,
        "calories": 520,
        "protein_g": 38,
        "carbs_g": 48,
        "fat_g": 18,
        "fiber_g": 3,
        "sugar_g": 4,
        "sodium_mg": 680,
        "cholesterol_mg": 125
    },
    {
        "title": "Gazpacho",
        "description": "Chilled Spanish tomato soup with cucumber and peppers",
        "image_url": "https://images.unsplash.com/photo-1529566652340-2c41a1eb6d93?w=800",
        "instructions": """1. Roughly chop tomatoes, cucumber, pepper, onion.
2. Soak bread in water, squeeze out excess.
3. Blend vegetables with bread, garlic, vinegar, olive oil.
4. Season with salt and pepper.
5. Strain for smoother texture if desired.
6. Chill at least 2 hours.
7. Serve with diced vegetable garnish and croutons.""",
        "ingredients": [
            ("Ripe tomatoes", 1000, "g", None),
            ("Cucumber", 1, "medium", "peeled"),
            ("Red bell pepper", 1, "medium", None),
            ("Red onion", 0.5, "small", None),
            ("Garlic", 2, "cloves", None),
            ("Day-old bread", 100, "g", "crust removed"),
            ("Sherry vinegar", 3, "tbsp", None),
            ("Olive oil", 80, "ml", "extra virgin"),
            ("Salt", 1, "tsp", None)
        ],
        "tags": ["Spanish", "Soup", "Healthy", "Vegetarian", "Cold"],
        "cuisine": "Spanish",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 0,
        "servings": 6,
        "calories": 180,
        "protein_g": 3,
        "carbs_g": 18,
        "fat_g": 11,
        "fiber_g": 3,
        "sugar_g": 10,
        "sodium_mg": 420,
        "cholesterol_mg": 0
    },
    {
        "title": "Patatas Bravas",
        "description": "Crispy fried potatoes with spicy tomato sauce and aioli",
        "image_url": "https://images.unsplash.com/photo-1600335895229-6e75511892c8?w=800",
        "instructions": """1. Cut potatoes into 1-inch cubes.
2. Parboil potatoes 10 minutes, drain and dry.
3. Deep fry at 350°F until golden and crispy.
4. Make bravas sauce: sauté onion, add tomato, paprika, cayenne.
5. Make aioli: blend garlic, egg yolk, lemon, olive oil.
6. Arrange potatoes on plate.
7. Drizzle with both sauces, serve hot.""",
        "ingredients": [
            ("Potatoes", 800, "g", "Yukon Gold"),
            ("Tomato passata", 200, "g", None),
            ("Smoked paprika", 2, "tsp", None),
            ("Cayenne pepper", 0.5, "tsp", None),
            ("Garlic", 4, "cloves", None),
            ("Olive oil", 400, "ml", "for frying and aioli"),
            ("Egg yolk", 1, "whole", "for aioli"),
            ("Lemon juice", 1, "tbsp", None),
            ("Onion", 1, "small", "minced")
        ],
        "tags": ["Spanish", "Appetizer", "Vegetarian", "Tapas"],
        "cuisine": "Spanish",
        "category": "snack",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 30,
        "servings": 4,
        "calories": 320,
        "protein_g": 5,
        "carbs_g": 38,
        "fat_g": 16,
        "fiber_g": 4,
        "sugar_g": 3,
        "sodium_mg": 380,
        "cholesterol_mg": 50
    },
    {
        "title": "Spanish Tortilla",
        "description": "Classic potato and onion omelette served warm or cold",
        "image_url": "https://images.unsplash.com/photo-1557700836-25f2c5c71f47?w=800",
        "instructions": """1. Slice potatoes and onions thinly.
2. Poach in olive oil over low heat 20-25 minutes.
3. Drain, reserving oil.
4. Beat eggs, season, mix with potatoes.
5. Cook in pan with reserved oil until bottom sets.
6. Flip using plate, cook other side.
7. Rest 5 minutes before slicing.""",
        "ingredients": [
            ("Potatoes", 600, "g", "thinly sliced"),
            ("Onion", 1, "large", "thinly sliced"),
            ("Eggs", 6, "whole", None),
            ("Olive oil", 200, "ml", None),
            ("Salt", 1, "tsp", None)
        ],
        "tags": ["Spanish", "Eggs", "Vegetarian", "Tapas"],
        "cuisine": "Spanish",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 15,
        "cook_time_minutes": 35,
        "servings": 6,
        "calories": 280,
        "protein_g": 10,
        "carbs_g": 22,
        "fat_g": 18,
        "fiber_g": 2,
        "sugar_g": 2,
        "sodium_mg": 420,
        "cholesterol_mg": 190
    },

    # ==================== MIDDLE EASTERN (8) ====================
    {
        "title": "Shawarma",
        "description": "Spiced meat wrapped in pita with garlic sauce and pickles",
        "image_url": "https://images.unsplash.com/photo-1529006557810-274b9b2fc783?w=800",
        "instructions": """1. Slice chicken or lamb thinly.
2. Marinate in shawarma spices, yogurt, lemon, garlic.
3. Grill or pan-fry until charred edges.
4. Make garlic sauce: blend garlic, lemon, oil until emulsified.
5. Warm pita bread.
6. Layer meat, pickled turnips, tomatoes, lettuce.
7. Drizzle with garlic sauce, wrap tightly.""",
        "ingredients": [
            ("Chicken thighs", 600, "g", "boneless, sliced"),
            ("Pita bread", 4, "whole", None),
            ("Greek yogurt", 100, "g", "for marinade"),
            ("Garlic", 8, "cloves", None),
            ("Lemon juice", 60, "ml", None),
            ("Vegetable oil", 120, "ml", None),
            ("Cumin", 2, "tsp", None),
            ("Paprika", 2, "tsp", None),
            ("Turmeric", 1, "tsp", None),
            ("Pickled turnips", 100, "g", None),
            ("Tomatoes", 2, "medium", "sliced")
        ],
        "tags": ["Middle Eastern", "Chicken", "Wrap", "Dinner"],
        "cuisine": "Middle Eastern",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 480,
        "protein_g": 35,
        "carbs_g": 38,
        "fat_g": 22,
        "fiber_g": 3,
        "sugar_g": 4,
        "sodium_mg": 680,
        "cholesterol_mg": 125
    },
    {
        "title": "Tabbouleh",
        "description": "Fresh parsley salad with bulgur, tomatoes, and lemon dressing",
        "image_url": "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800",
        "instructions": """1. Soak bulgur in hot water 20 minutes, drain well.
2. Finely chop parsley (lots!), mint, tomatoes, onion.
3. Combine bulgur with vegetables.
4. Dress with lemon juice and olive oil.
5. Season with salt and allspice.
6. Let sit 30 minutes for flavors to meld.
7. Serve with romaine lettuce leaves for scooping.""",
        "ingredients": [
            ("Fresh parsley", 4, "cups", "finely chopped"),
            ("Fresh mint", 0.5, "cup", "finely chopped"),
            ("Bulgur wheat", 60, "g", "fine"),
            ("Tomatoes", 3, "medium", "diced small"),
            ("Green onions", 4, "stalks", "sliced"),
            ("Lemon juice", 80, "ml", "fresh"),
            ("Olive oil", 60, "ml", "extra virgin"),
            ("Allspice", 0.5, "tsp", None),
            ("Salt", 1, "tsp", None)
        ],
        "tags": ["Middle Eastern", "Salad", "Healthy", "Vegetarian", "Vegan"],
        "cuisine": "Middle Eastern",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 30,
        "cook_time_minutes": 0,
        "servings": 6,
        "calories": 120,
        "protein_g": 3,
        "carbs_g": 14,
        "fat_g": 7,
        "fiber_g": 3,
        "sugar_g": 2,
        "sodium_mg": 400,
        "cholesterol_mg": 0
    },
    {
        "title": "Lamb Kofta",
        "description": "Spiced ground lamb skewers grilled over open flame",
        "image_url": "https://images.unsplash.com/photo-1544025162-d76694265947?w=800",
        "instructions": """1. Mix lamb with onion, parsley, spices.
2. Knead mixture well for 5 minutes.
3. Shape onto flat metal skewers.
4. Refrigerate 30 minutes to firm.
5. Grill over high heat 3-4 minutes per side.
6. Serve with pita, tzatziki, and salad.
7. Garnish with sumac and fresh parsley.""",
        "ingredients": [
            ("Ground lamb", 600, "g", None),
            ("Onion", 1, "medium", "grated"),
            ("Fresh parsley", 0.5, "cup", "chopped"),
            ("Cumin", 2, "tsp", None),
            ("Coriander", 1, "tsp", "ground"),
            ("Paprika", 1, "tsp", None),
            ("Cinnamon", 0.5, "tsp", None),
            ("Salt", 1, "tsp", None),
            ("Black pepper", 0.5, "tsp", None),
            ("Sumac", 1, "tsp", "for garnish")
        ],
        "tags": ["Middle Eastern", "Lamb", "Grill", "Dinner"],
        "cuisine": "Middle Eastern",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 350,
        "protein_g": 28,
        "carbs_g": 4,
        "fat_g": 24,
        "fiber_g": 1,
        "sugar_g": 2,
        "sodium_mg": 620,
        "cholesterol_mg": 95
    },
    {
        "title": "Shakshuka",
        "description": "Eggs poached in spiced tomato and pepper sauce",
        "image_url": "https://images.unsplash.com/photo-1590412200988-a436970781fa?w=800",
        "instructions": """1. Sauté onions and peppers until soft.
2. Add garlic, cook 1 minute.
3. Add tomatoes, cumin, paprika, cayenne.
4. Simmer 10 minutes until thickened.
5. Make wells, crack eggs into sauce.
6. Cover, cook 5-8 minutes until whites set.
7. Garnish with feta and cilantro.
8. Serve with crusty bread for dipping.""",
        "ingredients": [
            ("Eggs", 6, "whole", None),
            ("Crushed tomatoes", 800, "g", None),
            ("Red bell pepper", 2, "medium", "diced"),
            ("Onion", 1, "large", "diced"),
            ("Garlic", 4, "cloves", "minced"),
            ("Cumin", 2, "tsp", None),
            ("Paprika", 2, "tsp", None),
            ("Cayenne", 0.5, "tsp", None),
            ("Feta cheese", 60, "g", "crumbled"),
            ("Fresh cilantro", 0.25, "cup", "chopped"),
            ("Olive oil", 3, "tbsp", None)
        ],
        "tags": ["Middle Eastern", "Eggs", "Breakfast", "Vegetarian"],
        "cuisine": "Middle Eastern",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 25,
        "servings": 4,
        "calories": 280,
        "protein_g": 14,
        "carbs_g": 18,
        "fat_g": 18,
        "fiber_g": 4,
        "sugar_g": 10,
        "sodium_mg": 580,
        "cholesterol_mg": 285
    },

    # ==================== MORE DRINKS (15) ====================
    {
        "title": "Iced Caramel Latte",
        "description": "Creamy espresso with caramel syrup over ice",
        "image_url": "https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=800",
        "instructions": """1. Brew 2 shots of espresso.
2. Add caramel syrup to glass.
3. Fill glass with ice.
4. Pour espresso over ice.
5. Add cold milk.
6. Drizzle more caramel on top.
7. Stir and enjoy.""",
        "ingredients": [
            ("Espresso", 60, "ml", "2 shots"),
            ("Caramel syrup", 30, "ml", None),
            ("Whole milk", 200, "ml", "cold"),
            ("Ice cubes", 1, "cup", None)
        ],
        "tags": ["Coffee", "Drink", "Cold", "Sweet"],
        "cuisine": "American",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 1,
        "calories": 180,
        "protein_g": 6,
        "carbs_g": 28,
        "fat_g": 5,
        "fiber_g": 0,
        "sugar_g": 24,
        "sodium_mg": 95,
        "cholesterol_mg": 20
    },
    {
        "title": "Tropical Smoothie",
        "description": "Refreshing blend of mango, pineapple, and coconut milk",
        "image_url": "https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=800",
        "instructions": """1. Add frozen mango and pineapple to blender.
2. Pour in coconut milk.
3. Add honey if desired.
4. Blend until smooth.
5. Pour into glass.
6. Garnish with pineapple wedge.""",
        "ingredients": [
            ("Frozen mango", 150, "g", None),
            ("Frozen pineapple", 100, "g", None),
            ("Coconut milk", 250, "ml", None),
            ("Honey", 1, "tbsp", "optional"),
            ("Banana", 0.5, "whole", "frozen")
        ],
        "tags": ["Smoothie", "Drink", "Healthy", "Tropical", "Vegan"],
        "cuisine": "American",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 2,
        "calories": 220,
        "protein_g": 2,
        "carbs_g": 42,
        "fat_g": 8,
        "fiber_g": 3,
        "sugar_g": 34,
        "sodium_mg": 25,
        "cholesterol_mg": 0
    },
    {
        "title": "Chai Tea Latte",
        "description": "Spiced black tea with steamed milk and warm spices",
        "image_url": "https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=800",
        "instructions": """1. Simmer water with chai spices 5 minutes.
2. Add black tea, steep 3 minutes.
3. Strain into mug.
4. Heat and froth milk.
5. Add honey or sugar.
6. Pour steamed milk over tea.
7. Dust with cinnamon.""",
        "ingredients": [
            ("Black tea", 2, "bags", "or loose leaf"),
            ("Whole milk", 200, "ml", None),
            ("Cinnamon stick", 1, "whole", None),
            ("Cardamom pods", 4, "whole", "crushed"),
            ("Fresh ginger", 1, "tsp", "sliced"),
            ("Cloves", 3, "whole", None),
            ("Honey", 2, "tsp", None),
            ("Water", 150, "ml", None)
        ],
        "tags": ["Tea", "Drink", "Hot", "Spiced"],
        "cuisine": "Indian",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 10,
        "servings": 1,
        "calories": 140,
        "protein_g": 6,
        "carbs_g": 20,
        "fat_g": 4,
        "fiber_g": 0,
        "sugar_g": 18,
        "sodium_mg": 85,
        "cholesterol_mg": 15
    },
    {
        "title": "Strawberry Banana Smoothie",
        "description": "Classic creamy smoothie with fresh strawberries and banana",
        "image_url": "https://images.unsplash.com/photo-1505252585461-04db1eb84625?w=800",
        "instructions": """1. Add frozen strawberries to blender.
2. Add banana and yogurt.
3. Pour in milk.
4. Add honey if desired.
5. Blend until smooth.
6. Serve immediately.""",
        "ingredients": [
            ("Frozen strawberries", 200, "g", None),
            ("Banana", 1, "whole", None),
            ("Greek yogurt", 100, "g", "vanilla"),
            ("Milk", 150, "ml", None),
            ("Honey", 1, "tbsp", "optional")
        ],
        "tags": ["Smoothie", "Drink", "Healthy", "Breakfast"],
        "cuisine": "American",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 2,
        "calories": 180,
        "protein_g": 8,
        "carbs_g": 35,
        "fat_g": 2,
        "fiber_g": 4,
        "sugar_g": 26,
        "sodium_mg": 65,
        "cholesterol_mg": 8
    },
    {
        "title": "Pina Colada",
        "description": "Creamy tropical cocktail with rum, coconut, and pineapple",
        "image_url": "https://images.unsplash.com/photo-1587223962930-cb7f31384c19?w=800",
        "instructions": """1. Add pineapple chunks to blender.
2. Add coconut cream and rum.
3. Add ice cubes.
4. Blend until smooth and frosty.
5. Pour into hurricane glass.
6. Garnish with pineapple wedge and cherry.""",
        "ingredients": [
            ("White rum", 60, "ml", None),
            ("Coconut cream", 90, "ml", None),
            ("Pineapple juice", 90, "ml", None),
            ("Pineapple chunks", 100, "g", "fresh or frozen"),
            ("Ice", 1, "cup", None)
        ],
        "tags": ["Cocktail", "Drink", "Tropical", "Rum"],
        "cuisine": "Caribbean",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 1,
        "calories": 320,
        "protein_g": 1,
        "carbs_g": 32,
        "fat_g": 12,
        "fiber_g": 1,
        "sugar_g": 28,
        "sodium_mg": 15,
        "cholesterol_mg": 0
    },
    {
        "title": "Cold Brew Coffee",
        "description": "Smooth, less acidic coffee steeped overnight",
        "image_url": "https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?w=800",
        "instructions": """1. Coarsely grind coffee beans.
2. Combine with cold water in jar.
3. Stir to fully saturate grounds.
4. Cover and refrigerate 12-24 hours.
5. Strain through fine mesh and coffee filter.
6. Dilute concentrate 1:1 with water or milk.
7. Serve over ice.""",
        "ingredients": [
            ("Coffee beans", 100, "g", "coarsely ground"),
            ("Cold water", 700, "ml", "filtered"),
            ("Ice", 1, "cup", None),
            ("Milk", 100, "ml", "optional")
        ],
        "tags": ["Coffee", "Drink", "Cold", "Caffeinated"],
        "cuisine": "American",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 0,
        "servings": 4,
        "calories": 5,
        "protein_g": 0,
        "carbs_g": 0,
        "fat_g": 0,
        "fiber_g": 0,
        "sugar_g": 0,
        "sodium_mg": 5,
        "cholesterol_mg": 0
    },
    {
        "title": "Lemonade",
        "description": "Classic homemade lemonade with fresh lemons",
        "image_url": "https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=800",
        "instructions": """1. Make simple syrup: heat sugar and water until dissolved.
2. Cool syrup completely.
3. Juice lemons, strain out seeds.
4. Combine syrup, lemon juice, and cold water.
5. Taste and adjust sweetness.
6. Serve over ice with lemon slices.""",
        "ingredients": [
            ("Lemons", 6, "whole", "juiced"),
            ("Sugar", 200, "g", None),
            ("Water", 1000, "ml", None),
            ("Ice", 2, "cups", None)
        ],
        "tags": ["Drink", "Cold", "Summer", "Refreshing"],
        "cuisine": "American",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 5,
        "servings": 6,
        "calories": 130,
        "protein_g": 0,
        "carbs_g": 34,
        "fat_g": 0,
        "fiber_g": 0,
        "sugar_g": 32,
        "sodium_mg": 5,
        "cholesterol_mg": 0
    },
    {
        "title": "Espresso Martini",
        "description": "Coffee cocktail with vodka and coffee liqueur",
        "image_url": "https://images.unsplash.com/photo-1545438102-799c3991ffb2?w=800",
        "instructions": """1. Brew fresh espresso, let cool slightly.
2. Add ice to cocktail shaker.
3. Pour in vodka, coffee liqueur, espresso.
4. Add simple syrup.
5. Shake vigorously 15 seconds.
6. Strain into chilled martini glass.
7. Garnish with three coffee beans.""",
        "ingredients": [
            ("Vodka", 45, "ml", None),
            ("Coffee liqueur", 30, "ml", "Kahlua"),
            ("Espresso", 30, "ml", "fresh, cooled"),
            ("Simple syrup", 15, "ml", None),
            ("Coffee beans", 3, "whole", "for garnish")
        ],
        "tags": ["Cocktail", "Coffee", "Drink"],
        "cuisine": "American",
        "category": "drink",
        "difficulty": "medium",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 1,
        "calories": 220,
        "protein_g": 0,
        "carbs_g": 18,
        "fat_g": 0,
        "fiber_g": 0,
        "sugar_g": 16,
        "sodium_mg": 5,
        "cholesterol_mg": 0
    },
    {
        "title": "Golden Milk",
        "description": "Anti-inflammatory turmeric latte with warm spices",
        "image_url": "https://images.unsplash.com/photo-1578020190125-f4f7c18bc9cb?w=800",
        "instructions": """1. Whisk turmeric, ginger, cinnamon, pepper in small bowl.
2. Heat milk in saucepan.
3. Add spice mixture, whisk constantly.
4. Simmer 5 minutes.
5. Add honey and vanilla.
6. Strain if desired.
7. Serve warm with cinnamon dust.""",
        "ingredients": [
            ("Milk", 350, "ml", "or plant-based"),
            ("Turmeric", 1, "tsp", "ground"),
            ("Ginger", 0.5, "tsp", "ground"),
            ("Cinnamon", 0.5, "tsp", None),
            ("Black pepper", 1, "pinch", None),
            ("Honey", 1, "tbsp", None),
            ("Vanilla extract", 0.5, "tsp", None)
        ],
        "tags": ["Drink", "Hot", "Healthy", "Anti-inflammatory"],
        "cuisine": "Indian",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 10,
        "servings": 1,
        "calories": 180,
        "protein_g": 8,
        "carbs_g": 24,
        "fat_g": 6,
        "fiber_g": 0,
        "sugar_g": 20,
        "sodium_mg": 110,
        "cholesterol_mg": 20
    },
    {
        "title": "Watermelon Agua Fresca",
        "description": "Light Mexican fruit water with fresh watermelon and lime",
        "image_url": "https://images.unsplash.com/photo-1525385133512-2f3bdd509b56?w=800",
        "instructions": """1. Cut watermelon into chunks, remove seeds.
2. Blend watermelon until smooth.
3. Strain through fine mesh.
4. Add lime juice and sugar.
5. Stir in cold water.
6. Chill or serve over ice.
7. Garnish with mint leaves.""",
        "ingredients": [
            ("Watermelon", 800, "g", "seedless"),
            ("Water", 500, "ml", "cold"),
            ("Lime juice", 60, "ml", "fresh"),
            ("Sugar", 3, "tbsp", "to taste"),
            ("Fresh mint", 4, "leaves", "for garnish")
        ],
        "tags": ["Drink", "Cold", "Mexican", "Refreshing", "Vegan"],
        "cuisine": "Mexican",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 0,
        "servings": 4,
        "calories": 80,
        "protein_g": 1,
        "carbs_g": 20,
        "fat_g": 0,
        "fiber_g": 1,
        "sugar_g": 18,
        "sodium_mg": 5,
        "cholesterol_mg": 0
    },

    # ==================== MORE BREAKFAST (10) ====================
    {
        "title": "Eggs Florentine",
        "description": "Poached eggs on English muffin with spinach and hollandaise",
        "image_url": "https://images.unsplash.com/photo-1608039829572-9b0b8eb4fa1f?w=800",
        "instructions": """1. Sauté spinach with garlic until wilted.
2. Make hollandaise: whisk yolks, lemon, slowly add melted butter.
3. Bring water to gentle simmer with vinegar.
4. Create whirlpool, drop in eggs, poach 3 minutes.
5. Toast and butter English muffins.
6. Layer: muffin, spinach, poached egg, hollandaise.
7. Season with paprika.""",
        "ingredients": [
            ("Eggs", 4, "whole", "for poaching"),
            ("English muffins", 2, "whole", "split"),
            ("Fresh spinach", 200, "g", None),
            ("Butter", 115, "g", "for hollandaise"),
            ("Egg yolks", 3, "whole", "for hollandaise"),
            ("Lemon juice", 1, "tbsp", None),
            ("White vinegar", 1, "tbsp", None),
            ("Garlic", 2, "cloves", "minced"),
            ("Paprika", 0.25, "tsp", "for garnish")
        ],
        "tags": ["Breakfast", "Eggs", "Brunch", "Vegetarian"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "hard",
        "prep_time_minutes": 15,
        "cook_time_minutes": 20,
        "servings": 2,
        "calories": 520,
        "protein_g": 22,
        "carbs_g": 28,
        "fat_g": 36,
        "fiber_g": 3,
        "sugar_g": 3,
        "sodium_mg": 580,
        "cholesterol_mg": 485
    },
    {
        "title": "Breakfast Burrito",
        "description": "Flour tortilla filled with eggs, cheese, bacon, and potatoes",
        "image_url": "https://images.unsplash.com/photo-1626700051175-6818013e1d4f?w=800",
        "instructions": """1. Cook bacon until crispy, crumble.
2. Cube and fry potatoes until golden.
3. Scramble eggs with cheese.
4. Warm large flour tortillas.
5. Layer: potatoes, eggs, bacon, salsa, avocado.
6. Fold sides in, roll tightly.
7. Optional: grill seam-side down for crispy tortilla.""",
        "ingredients": [
            ("Large flour tortillas", 4, "whole", None),
            ("Eggs", 6, "whole", "scrambled"),
            ("Bacon", 150, "g", None),
            ("Potatoes", 300, "g", "cubed"),
            ("Cheddar cheese", 100, "g", "shredded"),
            ("Salsa", 100, "g", None),
            ("Avocado", 1, "whole", "sliced"),
            ("Sour cream", 60, "g", None)
        ],
        "tags": ["Breakfast", "Mexican", "Eggs"],
        "cuisine": "Mexican",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 580,
        "protein_g": 24,
        "carbs_g": 42,
        "fat_g": 36,
        "fiber_g": 5,
        "sugar_g": 3,
        "sodium_mg": 920,
        "cholesterol_mg": 295
    },
    {
        "title": "Granola",
        "description": "Crunchy homemade oat clusters with nuts and honey",
        "image_url": "https://images.unsplash.com/photo-1517686469429-8bdb88b9f907?w=800",
        "instructions": """1. Mix oats, nuts, coconut, cinnamon, salt.
2. Combine honey, oil, vanilla.
3. Pour wet over dry, mix thoroughly.
4. Spread on baking sheet in even layer.
5. Bake at 325°F for 40 minutes, stirring every 15.
6. Cool completely on pan.
7. Add dried fruit, store in airtight container.""",
        "ingredients": [
            ("Rolled oats", 300, "g", None),
            ("Mixed nuts", 150, "g", "chopped"),
            ("Honey", 120, "ml", None),
            ("Coconut oil", 60, "ml", "melted"),
            ("Shredded coconut", 60, "g", None),
            ("Cinnamon", 1, "tsp", None),
            ("Vanilla extract", 1, "tsp", None),
            ("Dried cranberries", 80, "g", None),
            ("Salt", 0.5, "tsp", None)
        ],
        "tags": ["Breakfast", "Healthy", "Snack", "Vegetarian"],
        "cuisine": "American",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 40,
        "servings": 12,
        "calories": 240,
        "protein_g": 6,
        "carbs_g": 32,
        "fat_g": 11,
        "fiber_g": 4,
        "sugar_g": 14,
        "sodium_mg": 100,
        "cholesterol_mg": 0
    },
    {
        "title": "Belgian Waffles",
        "description": "Light and crispy waffles with deep pockets for toppings",
        "image_url": "https://images.unsplash.com/photo-1562376552-0d160a2f238d?w=800",
        "instructions": """1. Separate eggs, beat whites to stiff peaks.
2. Mix flour, sugar, baking powder, salt.
3. Whisk yolks, milk, butter, vanilla.
4. Combine wet and dry ingredients.
5. Fold in egg whites gently.
6. Cook in preheated waffle iron until golden.
7. Serve with whipped cream and fresh berries.""",
        "ingredients": [
            ("All-purpose flour", 250, "g", None),
            ("Eggs", 2, "whole", "separated"),
            ("Whole milk", 350, "ml", None),
            ("Butter", 85, "g", "melted"),
            ("Sugar", 2, "tbsp", None),
            ("Baking powder", 2, "tsp", None),
            ("Vanilla extract", 1, "tsp", None),
            ("Salt", 0.5, "tsp", None)
        ],
        "tags": ["Breakfast", "Brunch", "Vegetarian", "Sweet"],
        "cuisine": "Belgian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 15,
        "cook_time_minutes": 20,
        "servings": 6,
        "calories": 320,
        "protein_g": 8,
        "carbs_g": 38,
        "fat_g": 15,
        "fiber_g": 1,
        "sugar_g": 8,
        "sodium_mg": 380,
        "cholesterol_mg": 95
    },
    {
        "title": "Shakshuka Green",
        "description": "Eggs in spiced green vegetable sauce with herbs",
        "image_url": "https://images.unsplash.com/photo-1590412200988-a436970781fa?w=800",
        "instructions": """1. Sauté onion and garlic until soft.
2. Add spinach, kale, cook until wilted.
3. Blend with green chili, herbs.
4. Return to pan, add cream.
5. Make wells, crack in eggs.
6. Cover, cook until whites set.
7. Top with feta and fresh herbs.""",
        "ingredients": [
            ("Eggs", 6, "whole", None),
            ("Spinach", 300, "g", None),
            ("Kale", 150, "g", "stems removed"),
            ("Onion", 1, "medium", "diced"),
            ("Garlic", 4, "cloves", None),
            ("Green chili", 2, "whole", None),
            ("Heavy cream", 60, "ml", None),
            ("Feta cheese", 60, "g", "crumbled"),
            ("Fresh dill", 2, "tbsp", "chopped"),
            ("Olive oil", 3, "tbsp", None)
        ],
        "tags": ["Breakfast", "Eggs", "Healthy", "Vegetarian"],
        "cuisine": "Middle Eastern",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 260,
        "protein_g": 16,
        "carbs_g": 10,
        "fat_g": 18,
        "fiber_g": 3,
        "sugar_g": 3,
        "sodium_mg": 420,
        "cholesterol_mg": 290
    },

    # ==================== MORE SNACKS/DESSERTS (15) ====================
    {
        "title": "Churros",
        "description": "Crispy fried dough sticks coated in cinnamon sugar",
        "image_url": "https://images.unsplash.com/photo-1624371475792-c7f4e4e6c8e9?w=800",
        "instructions": """1. Boil water, butter, salt, sugar.
2. Add flour all at once, stir vigorously.
3. Beat in egg until smooth.
4. Pipe through star tip into hot oil.
5. Fry until golden brown.
6. Drain on paper towels.
7. Roll in cinnamon sugar while warm.
8. Serve with chocolate sauce.""",
        "ingredients": [
            ("Water", 250, "ml", None),
            ("Butter", 60, "g", None),
            ("All-purpose flour", 150, "g", None),
            ("Egg", 1, "whole", None),
            ("Sugar", 100, "g", None),
            ("Cinnamon", 2, "tsp", None),
            ("Vegetable oil", 1, "L", "for frying"),
            ("Salt", 0.25, "tsp", None)
        ],
        "tags": ["Dessert", "Spanish", "Sweet", "Fried"],
        "cuisine": "Spanish",
        "category": "dessert",
        "difficulty": "medium",
        "prep_time_minutes": 15,
        "cook_time_minutes": 20,
        "servings": 6,
        "calories": 280,
        "protein_g": 3,
        "carbs_g": 38,
        "fat_g": 13,
        "fiber_g": 1,
        "sugar_g": 18,
        "sodium_mg": 140,
        "cholesterol_mg": 45
    },
    {
        "title": "Mochi Ice Cream",
        "description": "Japanese ice cream wrapped in chewy rice dough",
        "image_url": "https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=800",
        "instructions": """1. Scoop small ice cream balls, freeze solid.
2. Mix mochiko flour, sugar, water.
3. Microwave in intervals, stirring each time.
4. Dust surface with cornstarch.
5. Flatten dough, cut circles.
6. Wrap dough around frozen ice cream.
7. Pinch edges, freeze until firm.""",
        "ingredients": [
            ("Mochiko flour", 150, "g", "sweet rice flour"),
            ("Sugar", 75, "g", None),
            ("Water", 180, "ml", None),
            ("Ice cream", 350, "g", "any flavor"),
            ("Cornstarch", 50, "g", "for dusting")
        ],
        "tags": ["Dessert", "Japanese", "Ice Cream", "Sweet"],
        "cuisine": "Japanese",
        "category": "dessert",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 10,
        "servings": 12,
        "calories": 120,
        "protein_g": 2,
        "carbs_g": 22,
        "fat_g": 3,
        "fiber_g": 0,
        "sugar_g": 14,
        "sodium_mg": 25,
        "cholesterol_mg": 15
    },
    {
        "title": "Baklava",
        "description": "Layered phyllo pastry with nuts and honey syrup",
        "image_url": "https://images.unsplash.com/photo-1598110750624-207050c4f28c?w=800",
        "instructions": """1. Mix chopped nuts with cinnamon.
2. Brush phyllo sheets with butter, layer 8 sheets.
3. Add nut mixture, repeat layers.
4. End with 8 phyllo sheets on top.
5. Cut into diamonds before baking.
6. Bake at 350°F until golden.
7. Make honey syrup, pour over hot baklava.
8. Cool completely before serving.""",
        "ingredients": [
            ("Phyllo dough", 450, "g", "1 package"),
            ("Mixed nuts", 450, "g", "walnuts, pistachios"),
            ("Butter", 230, "g", "melted"),
            ("Honey", 250, "ml", None),
            ("Sugar", 200, "g", None),
            ("Water", 180, "ml", None),
            ("Cinnamon", 1, "tsp", None),
            ("Lemon juice", 1, "tbsp", None)
        ],
        "tags": ["Dessert", "Middle Eastern", "Sweet", "Nuts"],
        "cuisine": "Middle Eastern",
        "category": "dessert",
        "difficulty": "hard",
        "prep_time_minutes": 45,
        "cook_time_minutes": 50,
        "servings": 24,
        "calories": 260,
        "protein_g": 4,
        "carbs_g": 28,
        "fat_g": 16,
        "fiber_g": 2,
        "sugar_g": 18,
        "sodium_mg": 95,
        "cholesterol_mg": 25
    },
    {
        "title": "Panna Cotta",
        "description": "Silky Italian cream dessert with vanilla",
        "image_url": "https://images.unsplash.com/photo-1488477181946-6428a0291777?w=800",
        "instructions": """1. Bloom gelatin in cold water 5 minutes.
2. Heat cream, sugar, vanilla until simmering.
3. Remove from heat, stir in gelatin until dissolved.
4. Pour into ramekins.
5. Refrigerate 4 hours or overnight.
6. Unmold by dipping in hot water.
7. Top with berry compote.""",
        "ingredients": [
            ("Heavy cream", 500, "ml", None),
            ("Sugar", 75, "g", None),
            ("Vanilla bean", 1, "whole", "seeds scraped"),
            ("Gelatin", 7, "g", "1 packet"),
            ("Cold water", 45, "ml", None),
            ("Fresh berries", 200, "g", "for topping")
        ],
        "tags": ["Dessert", "Italian", "No-Bake", "Elegant"],
        "cuisine": "Italian",
        "category": "dessert",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 10,
        "servings": 6,
        "calories": 320,
        "protein_g": 4,
        "carbs_g": 22,
        "fat_g": 24,
        "fiber_g": 1,
        "sugar_g": 18,
        "sodium_mg": 45,
        "cholesterol_mg": 90
    },
    {
        "title": "Guacamole",
        "description": "Fresh avocado dip with lime, cilantro, and jalapeño",
        "image_url": "https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=800",
        "instructions": """1. Halve avocados, remove pit.
2. Scoop flesh into bowl.
3. Add lime juice immediately.
4. Mash to desired consistency.
5. Fold in onion, tomato, cilantro, jalapeño.
6. Season with salt and cumin.
7. Serve immediately with tortilla chips.""",
        "ingredients": [
            ("Ripe avocados", 3, "whole", None),
            ("Lime juice", 2, "tbsp", "fresh"),
            ("Red onion", 0.25, "cup", "finely diced"),
            ("Roma tomato", 1, "medium", "diced"),
            ("Fresh cilantro", 3, "tbsp", "chopped"),
            ("Jalapeño", 1, "whole", "seeded, minced"),
            ("Salt", 0.5, "tsp", None),
            ("Garlic", 1, "clove", "minced")
        ],
        "tags": ["Mexican", "Appetizer", "Dip", "Vegan", "Healthy"],
        "cuisine": "Mexican",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 0,
        "servings": 6,
        "calories": 160,
        "protein_g": 2,
        "carbs_g": 9,
        "fat_g": 14,
        "fiber_g": 7,
        "sugar_g": 1,
        "sodium_mg": 200,
        "cholesterol_mg": 0
    },
    {
        "title": "Caprese Skewers",
        "description": "Cherry tomatoes, mozzarella, and basil on toothpicks",
        "image_url": "https://images.unsplash.com/photo-1608897013039-887f21d8c804?w=800",
        "instructions": """1. Thread on toothpick: basil leaf.
2. Add cherry tomato.
3. Add mozzarella ball.
4. Repeat pattern.
5. Arrange on platter.
6. Drizzle with balsamic glaze.
7. Season with salt and pepper.""",
        "ingredients": [
            ("Cherry tomatoes", 24, "whole", None),
            ("Fresh mozzarella balls", 24, "small", "bocconcini"),
            ("Fresh basil leaves", 24, "whole", None),
            ("Balsamic glaze", 3, "tbsp", None),
            ("Olive oil", 2, "tbsp", None),
            ("Salt", 0.25, "tsp", None),
            ("Black pepper", 0.25, "tsp", None)
        ],
        "tags": ["Italian", "Appetizer", "Vegetarian", "Quick"],
        "cuisine": "Italian",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 0,
        "servings": 8,
        "calories": 120,
        "protein_g": 8,
        "carbs_g": 4,
        "fat_g": 8,
        "fiber_g": 0,
        "sugar_g": 3,
        "sodium_mg": 180,
        "cholesterol_mg": 25
    },

    # ==================== MORE HEALTHY/SALADS (15) ====================
    {
        "title": "Caesar Salad",
        "description": "Crisp romaine with creamy Caesar dressing and croutons",
        "image_url": "https://images.unsplash.com/photo-1550304943-4f24f54ddde9?w=800",
        "instructions": """1. Make dressing: blend anchovies, garlic, egg yolk, lemon, Parmesan.
2. Stream in olive oil while blending.
3. Toast bread cubes in olive oil for croutons.
4. Chop romaine into bite-size pieces.
5. Toss lettuce with dressing.
6. Top with croutons and shaved Parmesan.
7. Add grilled chicken if desired.""",
        "ingredients": [
            ("Romaine lettuce", 2, "heads", "chopped"),
            ("Parmesan cheese", 100, "g", "shaved"),
            ("Croutons", 150, "g", None),
            ("Anchovy fillets", 4, "whole", None),
            ("Garlic", 2, "cloves", None),
            ("Egg yolk", 1, "whole", None),
            ("Lemon juice", 3, "tbsp", None),
            ("Olive oil", 120, "ml", None),
            ("Dijon mustard", 1, "tsp", None)
        ],
        "tags": ["Salad", "Italian", "Classic", "Vegetarian"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 320,
        "protein_g": 12,
        "carbs_g": 18,
        "fat_g": 24,
        "fiber_g": 4,
        "sugar_g": 3,
        "sodium_mg": 580,
        "cholesterol_mg": 65
    },
    {
        "title": "Quinoa Bowl",
        "description": "Protein-packed grain bowl with roasted vegetables and tahini",
        "image_url": "https://images.unsplash.com/photo-1546793665-c74683f339c1?w=800",
        "instructions": """1. Cook quinoa in vegetable broth.
2. Roast sweet potato and chickpeas with cumin.
3. Steam or roast broccoli.
4. Make tahini dressing: tahini, lemon, garlic, water.
5. Assemble bowl: quinoa base, vegetables arranged.
6. Drizzle with tahini dressing.
7. Top with avocado and seeds.""",
        "ingredients": [
            ("Quinoa", 200, "g", None),
            ("Sweet potato", 2, "medium", "cubed"),
            ("Chickpeas", 400, "g", "canned, drained"),
            ("Broccoli", 200, "g", "florets"),
            ("Avocado", 1, "whole", "sliced"),
            ("Tahini", 60, "g", None),
            ("Lemon juice", 2, "tbsp", None),
            ("Garlic", 2, "cloves", "minced"),
            ("Cumin", 1, "tsp", None),
            ("Pumpkin seeds", 30, "g", None)
        ],
        "tags": ["Healthy", "Vegan", "Bowl", "High Protein"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 30,
        "servings": 4,
        "calories": 420,
        "protein_g": 16,
        "carbs_g": 52,
        "fat_g": 18,
        "fiber_g": 12,
        "sugar_g": 8,
        "sodium_mg": 380,
        "cholesterol_mg": 0
    },
    {
        "title": "Cobb Salad",
        "description": "Hearty salad with chicken, bacon, eggs, avocado, and blue cheese",
        "image_url": "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800",
        "instructions": """1. Cook and dice chicken breast.
2. Fry bacon until crispy, crumble.
3. Hard boil eggs, cool and quarter.
4. Dice avocado and tomatoes.
5. Arrange lettuce on large platter.
6. Arrange toppings in rows.
7. Drizzle with red wine vinaigrette.""",
        "ingredients": [
            ("Mixed greens", 300, "g", None),
            ("Chicken breast", 300, "g", "grilled, diced"),
            ("Bacon", 150, "g", "crispy"),
            ("Eggs", 4, "whole", "hard-boiled"),
            ("Avocado", 2, "whole", "diced"),
            ("Cherry tomatoes", 200, "g", "halved"),
            ("Blue cheese", 100, "g", "crumbled"),
            ("Red onion", 0.5, "medium", "sliced"),
            ("Red wine vinegar", 60, "ml", None),
            ("Olive oil", 120, "ml", None)
        ],
        "tags": ["Salad", "American", "High Protein", "Keto"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 25,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 520,
        "protein_g": 35,
        "carbs_g": 12,
        "fat_g": 38,
        "fiber_g": 6,
        "sugar_g": 4,
        "sodium_mg": 720,
        "cholesterol_mg": 285
    },
    {
        "title": "Grilled Chicken Salad",
        "description": "Tender grilled chicken over mixed greens with honey mustard",
        "image_url": "https://images.unsplash.com/photo-1546793665-c74683f339c1?w=800",
        "instructions": """1. Marinate chicken in olive oil, herbs, garlic.
2. Grill chicken 6-7 minutes per side.
3. Rest 5 minutes, slice.
4. Toss greens with cucumber, tomatoes, onion.
5. Make honey mustard: mix mustard, honey, vinegar, oil.
6. Arrange greens, top with sliced chicken.
7. Drizzle with dressing, add croutons.""",
        "ingredients": [
            ("Chicken breast", 500, "g", None),
            ("Mixed greens", 300, "g", None),
            ("Cucumber", 1, "medium", "sliced"),
            ("Cherry tomatoes", 200, "g", "halved"),
            ("Red onion", 0.5, "small", "sliced"),
            ("Honey", 2, "tbsp", None),
            ("Dijon mustard", 2, "tbsp", None),
            ("Apple cider vinegar", 2, "tbsp", None),
            ("Olive oil", 60, "ml", None)
        ],
        "tags": ["Salad", "Chicken", "Healthy", "High Protein"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 380,
        "protein_g": 38,
        "carbs_g": 14,
        "fat_g": 20,
        "fiber_g": 3,
        "sugar_g": 10,
        "sodium_mg": 420,
        "cholesterol_mg": 95
    },
    {
        "title": "Nicoise Salad",
        "description": "French composed salad with tuna, eggs, olives, and green beans",
        "image_url": "https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=800",
        "instructions": """1. Blanch green beans, shock in ice water.
2. Boil potatoes until tender, quarter.
3. Hard boil eggs, cool and halve.
4. Arrange lettuce on platter.
5. Artfully place tuna, vegetables, eggs, olives.
6. Make vinaigrette with Dijon, shallots, herbs.
7. Drizzle dressing over salad.""",
        "ingredients": [
            ("Canned tuna", 400, "g", "oil-packed, drained"),
            ("Green beans", 250, "g", "trimmed"),
            ("Baby potatoes", 400, "g", None),
            ("Eggs", 4, "whole", "hard-boiled"),
            ("Nicoise olives", 100, "g", None),
            ("Cherry tomatoes", 200, "g", "halved"),
            ("Mixed greens", 200, "g", None),
            ("Dijon mustard", 1, "tbsp", None),
            ("Red wine vinegar", 3, "tbsp", None),
            ("Olive oil", 90, "ml", None)
        ],
        "tags": ["French", "Salad", "Seafood", "Classic"],
        "cuisine": "French",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 450,
        "protein_g": 32,
        "carbs_g": 28,
        "fat_g": 24,
        "fiber_g": 5,
        "sugar_g": 4,
        "sodium_mg": 580,
        "cholesterol_mg": 235
    },
    {
        "title": "Asian Chicken Salad",
        "description": "Crunchy cabbage salad with sesame ginger dressing",
        "image_url": "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800",
        "instructions": """1. Shred cabbage and slice vegetables.
2. Cook and shred chicken.
3. Toast almonds and sesame seeds.
4. Make dressing: rice vinegar, sesame oil, ginger, soy.
5. Toss cabbage with dressing.
6. Top with chicken, crispy wontons.
7. Garnish with green onions and cilantro.""",
        "ingredients": [
            ("Napa cabbage", 400, "g", "shredded"),
            ("Chicken breast", 400, "g", "cooked, shredded"),
            ("Carrots", 2, "medium", "julienned"),
            ("Edamame", 100, "g", "shelled"),
            ("Sliced almonds", 60, "g", "toasted"),
            ("Rice vinegar", 60, "ml", None),
            ("Sesame oil", 2, "tbsp", None),
            ("Fresh ginger", 1, "tbsp", "grated"),
            ("Soy sauce", 2, "tbsp", None),
            ("Honey", 1, "tbsp", None)
        ],
        "tags": ["Salad", "Asian", "Chicken", "Healthy"],
        "cuisine": "Asian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 25,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 340,
        "protein_g": 32,
        "carbs_g": 18,
        "fat_g": 16,
        "fiber_g": 5,
        "sugar_g": 8,
        "sodium_mg": 620,
        "cholesterol_mg": 85
    },

    # ==================== MORE QUICK MEALS (15) ====================
    {
        "title": "BLT Sandwich",
        "description": "Classic bacon, lettuce, and tomato sandwich",
        "image_url": "https://images.unsplash.com/photo-1619096252214-ef06c45683e3?w=800",
        "instructions": """1. Cook bacon until crispy.
2. Toast bread slices.
3. Spread mayo on both slices.
4. Layer: lettuce, tomato slices, bacon.
5. Season tomatoes with salt and pepper.
6. Close sandwich, cut diagonally.
7. Serve with chips or salad.""",
        "ingredients": [
            ("Bacon", 8, "slices", None),
            ("Sourdough bread", 4, "slices", None),
            ("Lettuce", 4, "leaves", "iceberg or romaine"),
            ("Tomato", 1, "large", "sliced"),
            ("Mayonnaise", 2, "tbsp", None),
            ("Salt", 0.25, "tsp", None),
            ("Black pepper", 0.25, "tsp", None)
        ],
        "tags": ["Sandwich", "American", "Quick", "Lunch"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 10,
        "servings": 2,
        "calories": 450,
        "protein_g": 18,
        "carbs_g": 32,
        "fat_g": 28,
        "fiber_g": 2,
        "sugar_g": 4,
        "sodium_mg": 1100,
        "cholesterol_mg": 45
    },
    {
        "title": "Grilled Cheese Sandwich",
        "description": "Buttery toasted bread with melted cheese",
        "image_url": "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=800",
        "instructions": """1. Butter one side of each bread slice.
2. Place cheese between bread, butter sides out.
3. Cook in skillet over medium heat.
4. Press down with spatula.
5. Flip when golden, about 3 minutes.
6. Cook other side until cheese melts.
7. Cut in half and serve with tomato soup.""",
        "ingredients": [
            ("White bread", 4, "slices", None),
            ("Cheddar cheese", 120, "g", "sliced"),
            ("Butter", 30, "g", "softened")
        ],
        "tags": ["Sandwich", "American", "Quick", "Vegetarian", "Comfort Food"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 8,
        "servings": 2,
        "calories": 420,
        "protein_g": 16,
        "carbs_g": 32,
        "fat_g": 26,
        "fiber_g": 1,
        "sugar_g": 4,
        "sodium_mg": 680,
        "cholesterol_mg": 70
    },
    {
        "title": "Tuna Melt",
        "description": "Tuna salad on toast with melted cheese",
        "image_url": "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=800",
        "instructions": """1. Mix tuna with mayo, celery, onion, lemon.
2. Season with salt and pepper.
3. Toast bread slices.
4. Spread tuna mixture on toast.
5. Top with cheese slices.
6. Broil until cheese melts and bubbles.
7. Serve hot.""",
        "ingredients": [
            ("Canned tuna", 300, "g", "drained"),
            ("Mayonnaise", 60, "g", None),
            ("Celery", 1, "stalk", "diced"),
            ("Red onion", 2, "tbsp", "minced"),
            ("Lemon juice", 1, "tbsp", None),
            ("Bread", 4, "slices", "sourdough"),
            ("Cheddar cheese", 100, "g", "sliced")
        ],
        "tags": ["Sandwich", "Seafood", "Quick", "Lunch"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 5,
        "servings": 2,
        "calories": 480,
        "protein_g": 38,
        "carbs_g": 30,
        "fat_g": 24,
        "fiber_g": 2,
        "sugar_g": 4,
        "sodium_mg": 780,
        "cholesterol_mg": 75
    },
    {
        "title": "Club Sandwich",
        "description": "Triple-decker sandwich with turkey, bacon, and all the fixings",
        "image_url": "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=800",
        "instructions": """1. Toast three slices of bread.
2. Cook bacon until crispy.
3. Spread mayo on all toast slices.
4. Layer 1: turkey, lettuce, tomato.
5. Add middle toast, mayo side up.
6. Layer 2: bacon, turkey, lettuce.
7. Top with final toast, secure with toothpicks, cut into triangles.""",
        "ingredients": [
            ("White bread", 6, "slices", None),
            ("Turkey breast", 200, "g", "sliced"),
            ("Bacon", 6, "slices", None),
            ("Lettuce", 6, "leaves", None),
            ("Tomato", 1, "large", "sliced"),
            ("Mayonnaise", 3, "tbsp", None)
        ],
        "tags": ["Sandwich", "American", "Classic", "Lunch"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 10,
        "servings": 2,
        "calories": 580,
        "protein_g": 38,
        "carbs_g": 42,
        "fat_g": 30,
        "fiber_g": 3,
        "sugar_g": 6,
        "sodium_mg": 1350,
        "cholesterol_mg": 95
    },
    {
        "title": "Quesadilla",
        "description": "Crispy tortilla filled with melted cheese and your choice of fillings",
        "image_url": "https://images.unsplash.com/photo-1618040996337-56904b7850b9?w=800",
        "instructions": """1. Heat large skillet over medium heat.
2. Place tortilla in pan.
3. Spread cheese on half the tortilla.
4. Add optional fillings: chicken, peppers, onions.
5. Fold tortilla in half.
6. Cook 2-3 minutes per side until golden.
7. Cut into wedges, serve with salsa and sour cream.""",
        "ingredients": [
            ("Large flour tortillas", 4, "whole", None),
            ("Shredded cheese", 300, "g", "Mexican blend"),
            ("Chicken breast", 200, "g", "cooked, shredded, optional"),
            ("Bell peppers", 1, "medium", "sliced"),
            ("Onion", 0.5, "medium", "sliced"),
            ("Salsa", 100, "g", None),
            ("Sour cream", 60, "g", None)
        ],
        "tags": ["Mexican", "Quick", "Cheese", "Dinner"],
        "cuisine": "Mexican",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 420,
        "protein_g": 22,
        "carbs_g": 36,
        "fat_g": 22,
        "fiber_g": 2,
        "sugar_g": 3,
        "sodium_mg": 720,
        "cholesterol_mg": 65
    },
    {
        "title": "Stir Fry Vegetables",
        "description": "Quick-cooked mixed vegetables in savory sauce",
        "image_url": "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800",
        "instructions": """1. Prep all vegetables, cut uniform sizes.
2. Mix sauce: soy sauce, oyster sauce, sesame oil, cornstarch.
3. Heat wok until smoking.
4. Add oil, then garlic and ginger.
5. Add vegetables in order of cook time.
6. Pour sauce, toss until vegetables are coated.
7. Serve over rice.""",
        "ingredients": [
            ("Broccoli", 200, "g", "florets"),
            ("Bell peppers", 2, "medium", "sliced"),
            ("Snap peas", 150, "g", None),
            ("Carrots", 2, "medium", "sliced"),
            ("Mushrooms", 150, "g", "sliced"),
            ("Soy sauce", 3, "tbsp", None),
            ("Oyster sauce", 2, "tbsp", None),
            ("Sesame oil", 1, "tbsp", None),
            ("Garlic", 4, "cloves", "minced"),
            ("Ginger", 1, "tbsp", "minced"),
            ("Vegetable oil", 2, "tbsp", None)
        ],
        "tags": ["Asian", "Vegetarian", "Quick", "Healthy", "Vegan"],
        "cuisine": "Chinese",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 180,
        "protein_g": 6,
        "carbs_g": 22,
        "fat_g": 8,
        "fiber_g": 5,
        "sugar_g": 10,
        "sodium_mg": 820,
        "cholesterol_mg": 0
    },
    {
        "title": "Chicken Wrap",
        "description": "Grilled chicken with vegetables wrapped in flour tortilla",
        "image_url": "https://images.unsplash.com/photo-1626700051175-6818013e1d4f?w=800",
        "instructions": """1. Grill or pan-fry seasoned chicken.
2. Slice chicken into strips.
3. Warm tortillas.
4. Spread sauce on tortilla.
5. Layer: lettuce, chicken, tomatoes, cheese.
6. Fold sides in, roll tightly.
7. Cut in half diagonally to serve.""",
        "ingredients": [
            ("Large flour tortillas", 4, "whole", None),
            ("Chicken breast", 400, "g", None),
            ("Lettuce", 2, "cups", "shredded"),
            ("Tomatoes", 2, "medium", "diced"),
            ("Shredded cheese", 100, "g", None),
            ("Ranch dressing", 60, "g", None),
            ("Paprika", 1, "tsp", None),
            ("Garlic powder", 0.5, "tsp", None)
        ],
        "tags": ["Wrap", "Chicken", "Quick", "Lunch"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 420,
        "protein_g": 32,
        "carbs_g": 36,
        "fat_g": 16,
        "fiber_g": 2,
        "sugar_g": 3,
        "sodium_mg": 680,
        "cholesterol_mg": 85
    },

    # ==================== MORE PASTA/ITALIAN (12) ====================
    {
        "title": "Fettuccine Alfredo",
        "description": "Creamy pasta with Parmesan and butter sauce",
        "image_url": "https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=800",
        "instructions": """1. Cook fettuccine until al dente, reserve pasta water.
2. Melt butter in large pan.
3. Add cream, simmer 2 minutes.
4. Add cooked pasta, toss well.
5. Remove from heat, add Parmesan.
6. Toss, adding pasta water for consistency.
7. Season with pepper, serve immediately.""",
        "ingredients": [
            ("Fettuccine", 400, "g", None),
            ("Heavy cream", 300, "ml", None),
            ("Butter", 60, "g", None),
            ("Parmesan cheese", 150, "g", "grated"),
            ("Garlic", 3, "cloves", "minced"),
            ("Black pepper", 0.5, "tsp", None),
            ("Fresh parsley", 2, "tbsp", "chopped")
        ],
        "tags": ["Italian", "Pasta", "Creamy", "Vegetarian"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 580,
        "protein_g": 18,
        "carbs_g": 52,
        "fat_g": 34,
        "fiber_g": 2,
        "sugar_g": 3,
        "sodium_mg": 420,
        "cholesterol_mg": 110
    },
    {
        "title": "Pasta Primavera",
        "description": "Pasta with fresh spring vegetables in light garlic sauce",
        "image_url": "https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=800",
        "instructions": """1. Cook pasta according to package.
2. Sauté garlic in olive oil.
3. Add vegetables in order of cook time.
4. Add white wine, simmer 1 minute.
5. Toss with pasta and pasta water.
6. Add Parmesan and fresh basil.
7. Season with salt and pepper.""",
        "ingredients": [
            ("Penne pasta", 400, "g", None),
            ("Zucchini", 1, "medium", "sliced"),
            ("Yellow squash", 1, "medium", "sliced"),
            ("Cherry tomatoes", 200, "g", "halved"),
            ("Asparagus", 150, "g", "cut into 2-inch pieces"),
            ("Bell pepper", 1, "medium", "sliced"),
            ("Garlic", 4, "cloves", "minced"),
            ("White wine", 60, "ml", None),
            ("Olive oil", 60, "ml", None),
            ("Parmesan cheese", 80, "g", "grated"),
            ("Fresh basil", 0.25, "cup", "chopped")
        ],
        "tags": ["Italian", "Pasta", "Vegetarian", "Healthy"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 420,
        "protein_g": 14,
        "carbs_g": 58,
        "fat_g": 14,
        "fiber_g": 5,
        "sugar_g": 6,
        "sodium_mg": 320,
        "cholesterol_mg": 15
    },
    {
        "title": "Pasta Puttanesca",
        "description": "Spicy tomato pasta with olives, capers, and anchovies",
        "image_url": "https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=800",
        "instructions": """1. Cook spaghetti until al dente.
2. Sauté garlic and anchovies in olive oil until anchovies dissolve.
3. Add chili flakes, tomatoes.
4. Simmer 15 minutes.
5. Add olives and capers.
6. Toss with pasta.
7. Garnish with fresh parsley.""",
        "ingredients": [
            ("Spaghetti", 400, "g", None),
            ("Canned tomatoes", 800, "g", "crushed"),
            ("Kalamata olives", 100, "g", "pitted"),
            ("Capers", 3, "tbsp", "drained"),
            ("Anchovy fillets", 6, "whole", None),
            ("Garlic", 4, "cloves", "sliced"),
            ("Red chili flakes", 1, "tsp", None),
            ("Olive oil", 60, "ml", None),
            ("Fresh parsley", 3, "tbsp", "chopped")
        ],
        "tags": ["Italian", "Pasta", "Spicy", "Quick"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 420,
        "protein_g": 14,
        "carbs_g": 62,
        "fat_g": 14,
        "fiber_g": 4,
        "sugar_g": 8,
        "sodium_mg": 920,
        "cholesterol_mg": 10
    },
    {
        "title": "Gnocchi with Sage Butter",
        "description": "Pillowy potato dumplings in brown butter and crispy sage",
        "image_url": "https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=800",
        "instructions": """1. Cook gnocchi according to package.
2. Melt butter in large pan until golden brown.
3. Add sage leaves, fry until crispy.
4. Drain gnocchi, add to butter.
5. Toss gently to coat.
6. Add Parmesan, toss again.
7. Serve immediately with extra sage.""",
        "ingredients": [
            ("Potato gnocchi", 500, "g", None),
            ("Butter", 100, "g", None),
            ("Fresh sage", 20, "leaves", None),
            ("Parmesan cheese", 60, "g", "grated"),
            ("Salt", 0.5, "tsp", None),
            ("Black pepper", 0.25, "tsp", None)
        ],
        "tags": ["Italian", "Pasta", "Quick", "Vegetarian"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 420,
        "protein_g": 12,
        "carbs_g": 48,
        "fat_g": 22,
        "fiber_g": 2,
        "sugar_g": 2,
        "sodium_mg": 580,
        "cholesterol_mg": 60
    },

    # ==================== MORE SEAFOOD (10) ====================
    {
        "title": "Grilled Salmon",
        "description": "Simple grilled salmon with lemon and herbs",
        "image_url": "https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=800",
        "instructions": """1. Pat salmon dry, season with salt and pepper.
2. Drizzle with olive oil.
3. Preheat grill to high.
4. Grill skin-side down 4 minutes.
5. Flip, grill 3 more minutes.
6. Rest 2 minutes.
7. Serve with lemon wedges and fresh dill.""",
        "ingredients": [
            ("Salmon fillets", 600, "g", "4 pieces"),
            ("Olive oil", 2, "tbsp", None),
            ("Lemon", 1, "whole", "cut into wedges"),
            ("Fresh dill", 2, "tbsp", "chopped"),
            ("Salt", 1, "tsp", None),
            ("Black pepper", 0.5, "tsp", None),
            ("Garlic powder", 0.5, "tsp", None)
        ],
        "tags": ["Seafood", "Healthy", "Keto", "Quick"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 320,
        "protein_g": 34,
        "carbs_g": 1,
        "fat_g": 20,
        "fiber_g": 0,
        "sugar_g": 0,
        "sodium_mg": 620,
        "cholesterol_mg": 95
    },
    {
        "title": "Shrimp Scampi",
        "description": "Garlicky shrimp in white wine butter sauce over pasta",
        "image_url": "https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=800",
        "instructions": """1. Cook linguine until al dente.
2. Sauté shrimp in butter until pink, remove.
3. Add garlic, cook 30 seconds.
4. Add wine and lemon juice, simmer.
5. Whisk in cold butter pieces.
6. Return shrimp, add pasta.
7. Toss with parsley and red pepper flakes.""",
        "ingredients": [
            ("Large shrimp", 500, "g", "peeled, deveined"),
            ("Linguine", 350, "g", None),
            ("Butter", 115, "g", None),
            ("White wine", 120, "ml", "dry"),
            ("Garlic", 6, "cloves", "minced"),
            ("Lemon juice", 3, "tbsp", None),
            ("Red pepper flakes", 0.5, "tsp", None),
            ("Fresh parsley", 0.25, "cup", "chopped")
        ],
        "tags": ["Seafood", "Italian", "Pasta", "Dinner"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 15,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 520,
        "protein_g": 32,
        "carbs_g": 48,
        "fat_g": 22,
        "fiber_g": 2,
        "sugar_g": 2,
        "sodium_mg": 580,
        "cholesterol_mg": 245
    },
    {
        "title": "Fish Tacos",
        "description": "Crispy battered fish with cabbage slaw and crema",
        "image_url": "https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?w=800",
        "instructions": """1. Make slaw: toss cabbage with lime, cilantro.
2. Make crema: mix sour cream, lime, chipotle.
3. Season fish, coat in batter.
4. Fry fish until golden and crispy.
5. Warm tortillas.
6. Assemble: fish, slaw, crema, lime wedge.
7. Serve immediately.""",
        "ingredients": [
            ("White fish fillets", 500, "g", "cod or mahi-mahi"),
            ("Small corn tortillas", 12, "whole", None),
            ("Cabbage", 300, "g", "shredded"),
            ("Sour cream", 120, "g", None),
            ("Lime", 3, "whole", None),
            ("Fresh cilantro", 0.5, "cup", "chopped"),
            ("Chipotle in adobo", 1, "tbsp", None),
            ("All-purpose flour", 150, "g", None),
            ("Beer", 180, "ml", "light"),
            ("Vegetable oil", 500, "ml", "for frying")
        ],
        "tags": ["Mexican", "Seafood", "Tacos", "Dinner"],
        "cuisine": "Mexican",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 25,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 450,
        "protein_g": 28,
        "carbs_g": 42,
        "fat_g": 18,
        "fiber_g": 4,
        "sugar_g": 3,
        "sodium_mg": 580,
        "cholesterol_mg": 75
    },
    {
        "title": "Garlic Butter Shrimp",
        "description": "Quick pan-fried shrimp in garlic herb butter",
        "image_url": "https://images.unsplash.com/photo-1599084993091-1cb5c0721cc6?w=800",
        "instructions": """1. Season shrimp with salt, pepper, paprika.
2. Melt butter in large skillet.
3. Add garlic, cook 30 seconds.
4. Add shrimp in single layer.
5. Cook 2 minutes per side.
6. Add lemon juice and parsley.
7. Serve over rice or with crusty bread.""",
        "ingredients": [
            ("Large shrimp", 500, "g", "peeled, deveined"),
            ("Butter", 60, "g", None),
            ("Garlic", 6, "cloves", "minced"),
            ("Lemon juice", 2, "tbsp", None),
            ("Fresh parsley", 3, "tbsp", "chopped"),
            ("Paprika", 1, "tsp", None),
            ("Salt", 0.5, "tsp", None),
            ("Black pepper", 0.25, "tsp", None)
        ],
        "tags": ["Seafood", "Quick", "Keto", "Dinner"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 8,
        "servings": 4,
        "calories": 220,
        "protein_g": 26,
        "carbs_g": 3,
        "fat_g": 12,
        "fiber_g": 0,
        "sugar_g": 0,
        "sodium_mg": 520,
        "cholesterol_mg": 215
    },

    # ==================== MORE COMFORT FOOD (15) ====================
    {
        "title": "Shepherd's Pie",
        "description": "Savory lamb mince topped with creamy mashed potatoes",
        "image_url": "https://images.unsplash.com/photo-1600891964092-4316c288032e?w=800",
        "instructions": """1. Brown lamb mince with onion.
2. Add carrots, peas, tomato paste, Worcestershire.
3. Add stock, simmer 20 minutes.
4. Make mashed potatoes with butter and milk.
5. Transfer meat to baking dish.
6. Top with mashed potatoes, create peaks.
7. Bake at 400°F until golden, about 25 minutes.""",
        "ingredients": [
            ("Ground lamb", 600, "g", None),
            ("Potatoes", 800, "g", "peeled, cubed"),
            ("Carrots", 2, "medium", "diced"),
            ("Frozen peas", 150, "g", None),
            ("Onion", 1, "large", "diced"),
            ("Tomato paste", 2, "tbsp", None),
            ("Worcestershire sauce", 2, "tbsp", None),
            ("Beef stock", 250, "ml", None),
            ("Butter", 60, "g", None),
            ("Milk", 100, "ml", None)
        ],
        "tags": ["British", "Comfort Food", "Beef", "Dinner"],
        "cuisine": "British",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 45,
        "servings": 6,
        "calories": 480,
        "protein_g": 28,
        "carbs_g": 38,
        "fat_g": 24,
        "fiber_g": 5,
        "sugar_g": 6,
        "sodium_mg": 620,
        "cholesterol_mg": 95
    },
    {
        "title": "Chicken Pot Pie",
        "description": "Creamy chicken and vegetables under flaky pastry crust",
        "image_url": "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800",
        "instructions": """1. Poach chicken, shred into pieces.
2. Sauté onion, carrots, celery in butter.
3. Add flour, cook 1 minute.
4. Gradually add stock and cream.
5. Add chicken, peas, thyme.
6. Pour into pie dish.
7. Top with puff pastry, brush with egg.
8. Bake at 400°F for 30 minutes until golden.""",
        "ingredients": [
            ("Chicken breast", 500, "g", "cooked, shredded"),
            ("Puff pastry", 250, "g", None),
            ("Carrots", 2, "medium", "diced"),
            ("Celery", 2, "stalks", "diced"),
            ("Onion", 1, "medium", "diced"),
            ("Frozen peas", 100, "g", None),
            ("Chicken stock", 350, "ml", None),
            ("Heavy cream", 100, "ml", None),
            ("Butter", 45, "g", None),
            ("All-purpose flour", 45, "g", None),
            ("Fresh thyme", 1, "tsp", None),
            ("Egg", 1, "whole", "for wash")
        ],
        "tags": ["American", "Comfort Food", "Chicken", "Dinner"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 45,
        "servings": 6,
        "calories": 520,
        "protein_g": 28,
        "carbs_g": 34,
        "fat_g": 30,
        "fiber_g": 3,
        "sugar_g": 5,
        "sodium_mg": 680,
        "cholesterol_mg": 125
    },
    {
        "title": "Meatloaf",
        "description": "Classic American meatloaf with tangy glaze",
        "image_url": "https://images.unsplash.com/photo-1544025162-d76694265947?w=800",
        "instructions": """1. Mix beef with breadcrumbs, egg, onion, seasonings.
2. Form into loaf shape on baking sheet.
3. Make glaze: ketchup, brown sugar, mustard.
4. Brush half the glaze on meatloaf.
5. Bake at 350°F for 45 minutes.
6. Brush remaining glaze, bake 15 more minutes.
7. Rest 10 minutes before slicing.""",
        "ingredients": [
            ("Ground beef", 900, "g", None),
            ("Breadcrumbs", 100, "g", None),
            ("Egg", 2, "whole", None),
            ("Onion", 1, "medium", "diced"),
            ("Ketchup", 120, "g", None),
            ("Brown sugar", 3, "tbsp", None),
            ("Dijon mustard", 1, "tbsp", None),
            ("Worcestershire sauce", 2, "tbsp", None),
            ("Garlic", 3, "cloves", "minced"),
            ("Salt", 1, "tsp", None),
            ("Black pepper", 0.5, "tsp", None)
        ],
        "tags": ["American", "Comfort Food", "Beef", "Dinner"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 60,
        "servings": 8,
        "calories": 380,
        "protein_g": 28,
        "carbs_g": 18,
        "fat_g": 22,
        "fiber_g": 1,
        "sugar_g": 10,
        "sodium_mg": 680,
        "cholesterol_mg": 115
    },
    {
        "title": "Beef Stroganoff",
        "description": "Tender beef strips in creamy mushroom sauce",
        "image_url": "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800",
        "instructions": """1. Slice beef into thin strips.
2. Brown beef quickly over high heat, set aside.
3. Sauté mushrooms and onions.
4. Add garlic, cook 30 seconds.
5. Add stock, simmer until reduced.
6. Stir in sour cream and mustard.
7. Return beef, warm through.
8. Serve over egg noodles.""",
        "ingredients": [
            ("Beef sirloin", 600, "g", "sliced thin"),
            ("Mushrooms", 300, "g", "sliced"),
            ("Onion", 1, "large", "sliced"),
            ("Sour cream", 200, "g", None),
            ("Beef stock", 250, "ml", None),
            ("Dijon mustard", 1, "tbsp", None),
            ("Garlic", 3, "cloves", "minced"),
            ("Butter", 45, "g", None),
            ("Egg noodles", 400, "g", None),
            ("Fresh parsley", 2, "tbsp", "chopped")
        ],
        "tags": ["Russian", "Beef", "Comfort Food", "Dinner"],
        "cuisine": "Russian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 25,
        "servings": 4,
        "calories": 580,
        "protein_g": 38,
        "carbs_g": 48,
        "fat_g": 26,
        "fiber_g": 3,
        "sugar_g": 5,
        "sodium_mg": 580,
        "cholesterol_mg": 145
    },
    {
        "title": "Chili Con Carne",
        "description": "Hearty beef and bean chili with warm spices",
        "image_url": "https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=800",
        "instructions": """1. Brown beef in large pot.
2. Add onion, peppers, cook until soft.
3. Add garlic, spices, cook 1 minute.
4. Add tomatoes, beans, stock.
5. Simmer 45 minutes to 1 hour.
6. Adjust seasoning.
7. Serve with cornbread, sour cream, cheese.""",
        "ingredients": [
            ("Ground beef", 600, "g", None),
            ("Kidney beans", 400, "g", "canned, drained"),
            ("Crushed tomatoes", 800, "g", None),
            ("Onion", 1, "large", "diced"),
            ("Bell pepper", 1, "medium", "diced"),
            ("Garlic", 4, "cloves", "minced"),
            ("Chili powder", 3, "tbsp", None),
            ("Cumin", 2, "tsp", None),
            ("Cayenne pepper", 0.5, "tsp", None),
            ("Beef stock", 250, "ml", None)
        ],
        "tags": ["Mexican", "Beef", "Spicy", "Comfort Food"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 60,
        "servings": 6,
        "calories": 420,
        "protein_g": 32,
        "carbs_g": 28,
        "fat_g": 22,
        "fiber_g": 8,
        "sugar_g": 8,
        "sodium_mg": 720,
        "cholesterol_mg": 85
    },

    # ==================== MORE CHICKEN DISHES (12) ====================
    {
        "title": "Lemon Herb Roasted Chicken",
        "description": "Juicy whole roasted chicken with lemon and fresh herbs",
        "image_url": "https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=800",
        "instructions": """1. Pat chicken dry, season inside and out.
2. Stuff cavity with lemon and herbs.
3. Rub butter under and over skin.
4. Roast at 425°F for 1 hour 15 minutes.
5. Let rest 15 minutes.
6. Carve and serve with pan juices.""",
        "ingredients": [
            ("Whole chicken", 1800, "g", None),
            ("Butter", 60, "g", "softened"),
            ("Lemon", 2, "whole", None),
            ("Fresh rosemary", 4, "sprigs", None),
            ("Fresh thyme", 6, "sprigs", None),
            ("Garlic", 6, "cloves", "whole"),
            ("Salt", 2, "tsp", None),
            ("Black pepper", 1, "tsp", None)
        ],
        "tags": ["Chicken", "Roasted", "Dinner", "Classic"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 15,
        "cook_time_minutes": 75,
        "servings": 6,
        "calories": 380,
        "protein_g": 42,
        "carbs_g": 2,
        "fat_g": 22,
        "fiber_g": 0,
        "sugar_g": 0,
        "sodium_mg": 520,
        "cholesterol_mg": 145
    },
    {
        "title": "Honey Garlic Chicken",
        "description": "Sticky sweet chicken thighs with honey garlic glaze",
        "image_url": "https://images.unsplash.com/photo-1527477396000-e27163b481c2?w=800",
        "instructions": """1. Season chicken thighs with salt and pepper.
2. Pan fry skin-side down until crispy.
3. Flip, cook 5 more minutes.
4. Mix honey, soy sauce, garlic, ginger.
5. Pour sauce into pan, simmer until thick.
6. Baste chicken with glaze.
7. Garnish with sesame seeds and green onions.""",
        "ingredients": [
            ("Chicken thighs", 800, "g", "bone-in, skin-on"),
            ("Honey", 80, "ml", None),
            ("Soy sauce", 60, "ml", None),
            ("Garlic", 6, "cloves", "minced"),
            ("Fresh ginger", 1, "tbsp", "minced"),
            ("Rice vinegar", 2, "tbsp", None),
            ("Sesame seeds", 1, "tbsp", None),
            ("Green onions", 2, "stalks", "sliced")
        ],
        "tags": ["Chicken", "Asian", "Quick", "Dinner"],
        "cuisine": "Asian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 25,
        "servings": 4,
        "calories": 420,
        "protein_g": 35,
        "carbs_g": 24,
        "fat_g": 20,
        "fiber_g": 0,
        "sugar_g": 22,
        "sodium_mg": 920,
        "cholesterol_mg": 145
    },
    {
        "title": "Chicken Marsala",
        "description": "Pan-fried chicken cutlets in Marsala wine mushroom sauce",
        "image_url": "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800",
        "instructions": """1. Pound chicken breasts thin.
2. Dredge in seasoned flour.
3. Pan fry in butter until golden.
4. Remove chicken, add mushrooms.
5. Add Marsala wine, scrape up browned bits.
6. Add stock, simmer until reduced.
7. Return chicken, finish with butter and parsley.""",
        "ingredients": [
            ("Chicken breast", 600, "g", "pounded thin"),
            ("Cremini mushrooms", 250, "g", "sliced"),
            ("Marsala wine", 180, "ml", None),
            ("Chicken stock", 120, "ml", None),
            ("All-purpose flour", 60, "g", None),
            ("Butter", 60, "g", None),
            ("Olive oil", 2, "tbsp", None),
            ("Fresh parsley", 2, "tbsp", "chopped"),
            ("Salt", 1, "tsp", None),
            ("Black pepper", 0.5, "tsp", None)
        ],
        "tags": ["Italian", "Chicken", "Dinner", "Elegant"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 15,
        "cook_time_minutes": 25,
        "servings": 4,
        "calories": 380,
        "protein_g": 38,
        "carbs_g": 14,
        "fat_g": 18,
        "fiber_g": 1,
        "sugar_g": 3,
        "sodium_mg": 580,
        "cholesterol_mg": 125
    },
    {
        "title": "Orange Chicken",
        "description": "Crispy chicken in sweet and tangy orange sauce",
        "image_url": "https://images.unsplash.com/photo-1525755662778-989d0524087e?w=800",
        "instructions": """1. Cut chicken into bite-size pieces.
2. Coat in cornstarch mixture.
3. Deep fry until golden and crispy.
4. Make sauce: orange juice, zest, soy, sugar, vinegar.
5. Simmer sauce until thick.
6. Toss fried chicken in sauce.
7. Garnish with orange zest and green onions.""",
        "ingredients": [
            ("Chicken thighs", 600, "g", "boneless, cubed"),
            ("Orange juice", 180, "ml", "fresh"),
            ("Orange zest", 2, "tbsp", None),
            ("Soy sauce", 3, "tbsp", None),
            ("Rice vinegar", 2, "tbsp", None),
            ("Sugar", 100, "g", None),
            ("Cornstarch", 100, "g", None),
            ("Garlic", 3, "cloves", "minced"),
            ("Ginger", 1, "tbsp", "minced"),
            ("Vegetable oil", 500, "ml", "for frying")
        ],
        "tags": ["Chinese", "Chicken", "Sweet", "Dinner"],
        "cuisine": "Chinese",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 480,
        "protein_g": 32,
        "carbs_g": 48,
        "fat_g": 18,
        "fiber_g": 1,
        "sugar_g": 32,
        "sodium_mg": 820,
        "cholesterol_mg": 125
    },

    # ==================== MORE SOUPS (10) ====================
    {
        "title": "Chicken Noodle Soup",
        "description": "Classic comfort soup with tender chicken and egg noodles",
        "image_url": "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800",
        "instructions": """1. Simmer chicken in water with aromatics 1 hour.
2. Remove chicken, shred meat.
3. Strain broth.
4. Sauté onion, celery, carrots.
5. Add broth, bring to boil.
6. Add noodles, cook until tender.
7. Return chicken, add fresh dill.
8. Season to taste.""",
        "ingredients": [
            ("Chicken", 1000, "g", "whole, or pieces"),
            ("Egg noodles", 200, "g", None),
            ("Carrots", 3, "medium", "sliced"),
            ("Celery", 3, "stalks", "sliced"),
            ("Onion", 1, "large", "diced"),
            ("Chicken stock", 2000, "ml", None),
            ("Fresh dill", 3, "tbsp", "chopped"),
            ("Bay leaves", 2, "whole", None),
            ("Salt", 1, "tsp", None),
            ("Black pepper", 0.5, "tsp", None)
        ],
        "tags": ["Soup", "Chicken", "Comfort Food", "Classic"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 75,
        "servings": 8,
        "calories": 220,
        "protein_g": 22,
        "carbs_g": 18,
        "fat_g": 6,
        "fiber_g": 2,
        "sugar_g": 4,
        "sodium_mg": 680,
        "cholesterol_mg": 75
    },
    {
        "title": "Tomato Basil Soup",
        "description": "Creamy roasted tomato soup with fresh basil",
        "image_url": "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800",
        "instructions": """1. Roast tomatoes with garlic and onion at 400°F.
2. Transfer to pot, add stock.
3. Simmer 20 minutes.
4. Blend until smooth.
5. Return to pot, add cream.
6. Stir in fresh basil.
7. Serve with grilled cheese sandwich.""",
        "ingredients": [
            ("Roma tomatoes", 1000, "g", "halved"),
            ("Vegetable stock", 500, "ml", None),
            ("Heavy cream", 120, "ml", None),
            ("Onion", 1, "large", "quartered"),
            ("Garlic", 6, "cloves", "whole"),
            ("Fresh basil", 0.5, "cup", "chopped"),
            ("Olive oil", 3, "tbsp", None),
            ("Sugar", 1, "tsp", None),
            ("Salt", 1, "tsp", None),
            ("Black pepper", 0.5, "tsp", None)
        ],
        "tags": ["Soup", "Vegetarian", "Comfort Food", "Classic"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 45,
        "servings": 6,
        "calories": 180,
        "protein_g": 4,
        "carbs_g": 16,
        "fat_g": 12,
        "fiber_g": 3,
        "sugar_g": 10,
        "sodium_mg": 580,
        "cholesterol_mg": 25
    },
    {
        "title": "Minestrone Soup",
        "description": "Hearty Italian vegetable soup with pasta and beans",
        "image_url": "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800",
        "instructions": """1. Sauté onion, celery, carrots in olive oil.
2. Add garlic, tomatoes, stock.
3. Add potatoes, zucchini, green beans.
4. Simmer 20 minutes.
5. Add cannellini beans and pasta.
6. Cook until pasta is tender.
7. Serve with Parmesan and crusty bread.""",
        "ingredients": [
            ("Vegetable stock", 1500, "ml", None),
            ("Diced tomatoes", 400, "g", "canned"),
            ("Cannellini beans", 400, "g", "canned, drained"),
            ("Ditalini pasta", 100, "g", None),
            ("Zucchini", 1, "medium", "diced"),
            ("Carrots", 2, "medium", "diced"),
            ("Celery", 2, "stalks", "diced"),
            ("Onion", 1, "medium", "diced"),
            ("Green beans", 100, "g", "cut"),
            ("Potato", 1, "medium", "diced"),
            ("Garlic", 3, "cloves", "minced"),
            ("Olive oil", 3, "tbsp", None),
            ("Parmesan", 60, "g", "for serving")
        ],
        "tags": ["Italian", "Soup", "Vegetarian", "Healthy"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 35,
        "servings": 8,
        "calories": 220,
        "protein_g": 10,
        "carbs_g": 34,
        "fat_g": 6,
        "fiber_g": 8,
        "sugar_g": 6,
        "sodium_mg": 620,
        "cholesterol_mg": 5
    },
    {
        "title": "Butternut Squash Soup",
        "description": "Velvety smooth soup with roasted butternut squash",
        "image_url": "https://images.unsplash.com/photo-1476718406336-bb5a9690ee2a?w=800",
        "instructions": """1. Roast butternut squash at 400°F until tender.
2. Sauté onion and garlic.
3. Add squash and stock, simmer 15 minutes.
4. Blend until silky smooth.
5. Add cream and maple syrup.
6. Season with nutmeg.
7. Serve with pumpkin seeds and sage.""",
        "ingredients": [
            ("Butternut squash", 1000, "g", "peeled, cubed"),
            ("Vegetable stock", 750, "ml", None),
            ("Heavy cream", 100, "ml", None),
            ("Onion", 1, "medium", "diced"),
            ("Garlic", 3, "cloves", None),
            ("Maple syrup", 2, "tbsp", None),
            ("Butter", 30, "g", None),
            ("Nutmeg", 0.25, "tsp", None),
            ("Salt", 1, "tsp", None),
            ("Pumpkin seeds", 30, "g", "for garnish")
        ],
        "tags": ["Soup", "Vegetarian", "Fall", "Comfort Food"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 45,
        "servings": 6,
        "calories": 180,
        "protein_g": 4,
        "carbs_g": 26,
        "fat_g": 8,
        "fiber_g": 4,
        "sugar_g": 10,
        "sodium_mg": 480,
        "cholesterol_mg": 20
    },

    # ==================== MORE VEGETARIAN (15) ====================
    {
        "title": "Vegetable Curry",
        "description": "Creamy coconut curry with mixed vegetables",
        "image_url": "https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=800",
        "instructions": """1. Heat oil, fry curry paste 1 minute.
2. Add onion, cook until soft.
3. Add vegetables that take longer to cook first.
4. Pour in coconut milk.
5. Simmer until vegetables tender.
6. Add spinach at end.
7. Serve over basmati rice.""",
        "ingredients": [
            ("Coconut milk", 400, "ml", None),
            ("Curry paste", 3, "tbsp", "red or yellow"),
            ("Chickpeas", 400, "g", "canned, drained"),
            ("Sweet potato", 1, "large", "cubed"),
            ("Bell pepper", 1, "medium", "sliced"),
            ("Spinach", 150, "g", None),
            ("Onion", 1, "medium", "diced"),
            ("Garlic", 3, "cloves", "minced"),
            ("Vegetable oil", 2, "tbsp", None),
            ("Basmati rice", 300, "g", "for serving")
        ],
        "tags": ["Indian", "Vegetarian", "Vegan", "Curry"],
        "cuisine": "Indian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 25,
        "servings": 4,
        "calories": 380,
        "protein_g": 12,
        "carbs_g": 42,
        "fat_g": 20,
        "fiber_g": 8,
        "sugar_g": 8,
        "sodium_mg": 520,
        "cholesterol_mg": 0
    },
    {
        "title": "Stuffed Bell Peppers",
        "description": "Bell peppers filled with rice, beans, and cheese",
        "image_url": "https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=800",
        "instructions": """1. Cut tops off peppers, remove seeds.
2. Mix cooked rice with beans, corn, tomatoes, spices.
3. Stuff peppers with mixture.
4. Top with cheese.
5. Bake at 375°F for 35 minutes.
6. Garnish with cilantro and sour cream.""",
        "ingredients": [
            ("Bell peppers", 6, "large", "any color"),
            ("Cooked rice", 300, "g", None),
            ("Black beans", 400, "g", "canned, drained"),
            ("Corn", 150, "g", None),
            ("Diced tomatoes", 200, "g", None),
            ("Shredded cheese", 150, "g", "Mexican blend"),
            ("Cumin", 1, "tsp", None),
            ("Chili powder", 1, "tsp", None),
            ("Fresh cilantro", 3, "tbsp", "chopped"),
            ("Salt", 0.5, "tsp", None)
        ],
        "tags": ["Vegetarian", "Mexican", "Healthy", "Dinner"],
        "cuisine": "Mexican",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 35,
        "servings": 6,
        "calories": 320,
        "protein_g": 14,
        "carbs_g": 44,
        "fat_g": 10,
        "fiber_g": 8,
        "sugar_g": 6,
        "sodium_mg": 580,
        "cholesterol_mg": 25
    },
    {
        "title": "Eggplant Parmesan",
        "description": "Breaded eggplant slices layered with marinara and mozzarella",
        "image_url": "https://images.unsplash.com/photo-1625944525533-473f1a3d54e7?w=800",
        "instructions": """1. Slice eggplant, salt and drain 30 minutes.
2. Bread slices: flour, egg, breadcrumbs.
3. Fry until golden on both sides.
4. Layer in baking dish: sauce, eggplant, mozzarella.
5. Repeat layers.
6. Top with Parmesan.
7. Bake at 375°F for 30 minutes.""",
        "ingredients": [
            ("Eggplant", 2, "large", "sliced 1/2 inch"),
            ("Marinara sauce", 600, "g", None),
            ("Mozzarella", 300, "g", "sliced"),
            ("Parmesan", 100, "g", "grated"),
            ("Eggs", 3, "whole", "beaten"),
            ("Breadcrumbs", 200, "g", None),
            ("All-purpose flour", 100, "g", None),
            ("Fresh basil", 0.25, "cup", None),
            ("Olive oil", 120, "ml", "for frying")
        ],
        "tags": ["Italian", "Vegetarian", "Comfort Food", "Dinner"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 45,
        "cook_time_minutes": 45,
        "servings": 6,
        "calories": 420,
        "protein_g": 20,
        "carbs_g": 36,
        "fat_g": 24,
        "fiber_g": 6,
        "sugar_g": 10,
        "sodium_mg": 720,
        "cholesterol_mg": 95
    },
    {
        "title": "Black Bean Tacos",
        "description": "Crispy corn tacos with seasoned black beans and fresh toppings",
        "image_url": "https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?w=800",
        "instructions": """1. Mash half the beans, leave half whole.
2. Cook beans with cumin, chili, garlic.
3. Warm corn tortillas.
4. Fill with bean mixture.
5. Top with cabbage, avocado, salsa.
6. Add lime crema.
7. Garnish with cilantro and lime wedge.""",
        "ingredients": [
            ("Black beans", 800, "g", "canned, drained"),
            ("Corn tortillas", 12, "small", None),
            ("Red cabbage", 200, "g", "shredded"),
            ("Avocado", 2, "whole", "sliced"),
            ("Salsa", 150, "g", None),
            ("Sour cream", 100, "g", None),
            ("Lime", 2, "whole", None),
            ("Cumin", 1, "tsp", None),
            ("Chili powder", 1, "tsp", None),
            ("Garlic", 2, "cloves", "minced"),
            ("Fresh cilantro", 0.25, "cup", None)
        ],
        "tags": ["Mexican", "Vegetarian", "Vegan", "Quick"],
        "cuisine": "Mexican",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 380,
        "protein_g": 14,
        "carbs_g": 52,
        "fat_g": 14,
        "fiber_g": 16,
        "sugar_g": 4,
        "sodium_mg": 620,
        "cholesterol_mg": 10
    },
    {
        "title": "Vegetable Fried Rice",
        "description": "Quick stir-fried rice with mixed vegetables and eggs",
        "image_url": "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800",
        "instructions": """1. Use day-old cold rice for best results.
2. Scramble eggs, set aside.
3. Stir-fry vegetables in hot wok.
4. Add rice, break up clumps.
5. Add soy sauce, cook until rice is slightly crispy.
6. Return eggs, add green onions.
7. Drizzle with sesame oil.""",
        "ingredients": [
            ("Cooked rice", 600, "g", "cold, day-old"),
            ("Eggs", 3, "whole", None),
            ("Mixed vegetables", 300, "g", "peas, carrots, corn"),
            ("Soy sauce", 3, "tbsp", None),
            ("Sesame oil", 1, "tbsp", None),
            ("Vegetable oil", 3, "tbsp", None),
            ("Green onions", 4, "stalks", "sliced"),
            ("Garlic", 3, "cloves", "minced"),
            ("Ginger", 1, "tsp", "minced")
        ],
        "tags": ["Chinese", "Vegetarian", "Rice", "Quick"],
        "cuisine": "Chinese",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 320,
        "protein_g": 10,
        "carbs_g": 48,
        "fat_g": 10,
        "fiber_g": 3,
        "sugar_g": 4,
        "sodium_mg": 680,
        "cholesterol_mg": 140
    },

    # ==================== MORE INTERNATIONAL (25) ====================
    {
        "title": "Gyros",
        "description": "Greek spiced meat in warm pita with tzatziki",
        "image_url": "https://images.unsplash.com/photo-1561651823-34feb02250e4?w=800",
        "instructions": """1. Mix lamb with spices, form into loaf.
2. Roast at 350°F for 45 minutes.
3. Make tzatziki: yogurt, cucumber, garlic, dill.
4. Slice meat thinly.
5. Warm pita bread.
6. Fill with meat, tzatziki, tomatoes, onion.
7. Serve with lemon wedge.""",
        "ingredients": [
            ("Ground lamb", 600, "g", None),
            ("Pita bread", 4, "whole", None),
            ("Greek yogurt", 200, "g", None),
            ("Cucumber", 1, "medium", "grated for tzatziki"),
            ("Tomatoes", 2, "medium", "sliced"),
            ("Red onion", 0.5, "medium", "sliced thin"),
            ("Garlic", 4, "cloves", "minced"),
            ("Fresh dill", 2, "tbsp", "chopped"),
            ("Dried oregano", 2, "tsp", None),
            ("Cumin", 1, "tsp", None),
            ("Paprika", 1, "tsp", None)
        ],
        "tags": ["Greek", "Lamb", "Wrap", "Dinner"],
        "cuisine": "Greek",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 50,
        "servings": 4,
        "calories": 520,
        "protein_g": 35,
        "carbs_g": 38,
        "fat_g": 26,
        "fiber_g": 3,
        "sugar_g": 5,
        "sodium_mg": 680,
        "cholesterol_mg": 110
    },
    {
        "title": "Moussaka",
        "description": "Greek layered eggplant casserole with lamb and béchamel",
        "image_url": "https://images.unsplash.com/photo-1574484284002-952d92456975?w=800",
        "instructions": """1. Slice and salt eggplant, let drain.
2. Fry eggplant slices until golden.
3. Brown lamb with onion, add tomatoes, spices.
4. Make béchamel: butter, flour, milk, nutmeg.
5. Layer: eggplant, meat, eggplant, béchamel.
6. Top with cheese.
7. Bake at 375°F for 45 minutes.""",
        "ingredients": [
            ("Eggplant", 2, "large", "sliced"),
            ("Ground lamb", 500, "g", None),
            ("Crushed tomatoes", 400, "g", None),
            ("Onion", 1, "large", "diced"),
            ("Milk", 500, "ml", "for béchamel"),
            ("Butter", 60, "g", None),
            ("All-purpose flour", 60, "g", None),
            ("Parmesan", 80, "g", "grated"),
            ("Cinnamon", 0.5, "tsp", None),
            ("Nutmeg", 0.25, "tsp", None),
            ("Olive oil", 80, "ml", None)
        ],
        "tags": ["Greek", "Lamb", "Casserole", "Dinner"],
        "cuisine": "Greek",
        "category": "meal",
        "difficulty": "hard",
        "prep_time_minutes": 45,
        "cook_time_minutes": 60,
        "servings": 8,
        "calories": 420,
        "protein_g": 22,
        "carbs_g": 24,
        "fat_g": 28,
        "fiber_g": 5,
        "sugar_g": 8,
        "sodium_mg": 520,
        "cholesterol_mg": 85
    },
    {
        "title": "Doner Kebab",
        "description": "Turkish spiced lamb with flatbread and vegetables",
        "image_url": "https://images.unsplash.com/photo-1561651823-34feb02250e4?w=800",
        "instructions": """1. Mix lamb with spices and onion.
2. Form around skewers or into patties.
3. Grill until cooked through.
4. Warm flatbread.
5. Slice meat thinly.
6. Serve with salad, pickles, garlic sauce.
7. Wrap or serve open-faced.""",
        "ingredients": [
            ("Ground lamb", 600, "g", None),
            ("Flatbread", 4, "whole", None),
            ("Onion", 1, "medium", "grated"),
            ("Red cabbage", 150, "g", "shredded"),
            ("Tomatoes", 2, "medium", "sliced"),
            ("Garlic sauce", 100, "g", None),
            ("Cumin", 2, "tsp", None),
            ("Paprika", 1, "tsp", None),
            ("Sumac", 1, "tsp", None),
            ("Salt", 1, "tsp", None)
        ],
        "tags": ["Turkish", "Lamb", "Street Food", "Dinner"],
        "cuisine": "Turkish",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 480,
        "protein_g": 32,
        "carbs_g": 36,
        "fat_g": 24,
        "fiber_g": 3,
        "sugar_g": 4,
        "sodium_mg": 720,
        "cholesterol_mg": 105
    },
    {
        "title": "Jerk Chicken",
        "description": "Spicy Caribbean grilled chicken with scotch bonnet marinade",
        "image_url": "https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=800",
        "instructions": """1. Blend jerk marinade: scotch bonnets, allspice, thyme, garlic.
2. Marinate chicken overnight.
3. Grill over medium heat, turning often.
4. Baste with extra marinade.
5. Cook until internal temp reaches 165°F.
6. Rest 5 minutes.
7. Serve with rice and peas.""",
        "ingredients": [
            ("Chicken pieces", 1200, "g", "legs and thighs"),
            ("Scotch bonnet peppers", 3, "whole", None),
            ("Green onions", 6, "stalks", None),
            ("Fresh thyme", 6, "sprigs", None),
            ("Allspice", 2, "tbsp", "ground"),
            ("Garlic", 6, "cloves", None),
            ("Soy sauce", 3, "tbsp", None),
            ("Lime juice", 3, "tbsp", None),
            ("Brown sugar", 2, "tbsp", None),
            ("Vegetable oil", 3, "tbsp", None)
        ],
        "tags": ["Caribbean", "Chicken", "Spicy", "Grill"],
        "cuisine": "Caribbean",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 35,
        "servings": 6,
        "calories": 380,
        "protein_g": 38,
        "carbs_g": 8,
        "fat_g": 22,
        "fiber_g": 1,
        "sugar_g": 5,
        "sodium_mg": 620,
        "cholesterol_mg": 145
    },
    {
        "title": "Chicken Schnitzel",
        "description": "Crispy breaded chicken cutlet, Austrian style",
        "image_url": "https://images.unsplash.com/photo-1599921841143-819065a55cc6?w=800",
        "instructions": """1. Pound chicken breasts very thin.
2. Season with salt and pepper.
3. Set up breading station: flour, egg, breadcrumbs.
4. Coat each cutlet.
5. Pan fry in butter and oil until golden.
6. Drain on paper towels.
7. Serve with lemon wedge and parsley.""",
        "ingredients": [
            ("Chicken breast", 600, "g", "pounded thin"),
            ("Breadcrumbs", 200, "g", "fine"),
            ("All-purpose flour", 100, "g", None),
            ("Eggs", 3, "whole", "beaten"),
            ("Butter", 60, "g", None),
            ("Vegetable oil", 60, "ml", None),
            ("Lemon", 1, "whole", "wedges"),
            ("Fresh parsley", 2, "tbsp", "chopped"),
            ("Salt", 1, "tsp", None)
        ],
        "tags": ["Austrian", "Chicken", "Fried", "Dinner"],
        "cuisine": "Austrian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 420,
        "protein_g": 38,
        "carbs_g": 28,
        "fat_g": 18,
        "fiber_g": 1,
        "sugar_g": 2,
        "sodium_mg": 580,
        "cholesterol_mg": 180
    },
    {
        "title": "Pierogi",
        "description": "Polish dumplings filled with potato and cheese",
        "image_url": "https://images.unsplash.com/photo-1534939561126-855b8675edd7?w=800",
        "instructions": """1. Make dough: flour, egg, water, sour cream.
2. Make filling: mashed potatoes with cheese and onion.
3. Roll dough thin, cut circles.
4. Fill and seal edges with fork.
5. Boil until they float.
6. Pan fry in butter until golden.
7. Serve with sour cream and fried onions.""",
        "ingredients": [
            ("All-purpose flour", 300, "g", None),
            ("Potatoes", 500, "g", "mashed"),
            ("Cheddar cheese", 150, "g", "shredded"),
            ("Egg", 1, "whole", None),
            ("Sour cream", 60, "g", "plus more for serving"),
            ("Onion", 2, "medium", "diced"),
            ("Butter", 60, "g", None),
            ("Salt", 1, "tsp", None),
            ("Black pepper", 0.5, "tsp", None)
        ],
        "tags": ["Polish", "Dumplings", "Vegetarian", "Comfort Food"],
        "cuisine": "Polish",
        "category": "meal",
        "difficulty": "hard",
        "prep_time_minutes": 60,
        "cook_time_minutes": 20,
        "servings": 6,
        "calories": 380,
        "protein_g": 12,
        "carbs_g": 48,
        "fat_g": 16,
        "fiber_g": 3,
        "sugar_g": 3,
        "sodium_mg": 520,
        "cholesterol_mg": 65
    },
    {
        "title": "Chicken Satay",
        "description": "Grilled chicken skewers with peanut dipping sauce",
        "image_url": "https://images.unsplash.com/photo-1529563021893-cc83c992d75d?w=800",
        "instructions": """1. Marinate chicken in coconut milk, turmeric, cumin.
2. Thread on bamboo skewers.
3. Make peanut sauce: peanut butter, coconut milk, soy, lime.
4. Grill skewers 3-4 minutes per side.
5. Baste with marinade while cooking.
6. Serve with warm peanut sauce.
7. Garnish with chopped peanuts and cilantro.""",
        "ingredients": [
            ("Chicken thighs", 600, "g", "cubed"),
            ("Peanut butter", 120, "g", None),
            ("Coconut milk", 200, "ml", None),
            ("Soy sauce", 3, "tbsp", None),
            ("Lime juice", 2, "tbsp", None),
            ("Turmeric", 1, "tsp", None),
            ("Cumin", 1, "tsp", None),
            ("Brown sugar", 2, "tbsp", None),
            ("Garlic", 3, "cloves", "minced"),
            ("Red chili flakes", 0.5, "tsp", None)
        ],
        "tags": ["Thai", "Chicken", "Grilled", "Appetizer"],
        "cuisine": "Thai",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 25,
        "cook_time_minutes": 12,
        "servings": 4,
        "calories": 420,
        "protein_g": 35,
        "carbs_g": 14,
        "fat_g": 26,
        "fiber_g": 2,
        "sugar_g": 8,
        "sodium_mg": 680,
        "cholesterol_mg": 125
    },
    {
        "title": "Beef Rendang",
        "description": "Indonesian dry curry with tender coconut beef",
        "image_url": "https://images.unsplash.com/photo-1574653853027-5382a3d23a15?w=800",
        "instructions": """1. Blend spice paste: shallots, ginger, galangal, chilies.
2. Brown beef cubes in oil.
3. Add spice paste, cook fragrant.
4. Add coconut milk, lemongrass, lime leaves.
5. Simmer 2-3 hours until dry and dark.
6. Stir frequently near end.
7. Serve with steamed rice.""",
        "ingredients": [
            ("Beef chuck", 800, "g", "cubed"),
            ("Coconut milk", 800, "ml", None),
            ("Shallots", 10, "whole", None),
            ("Galangal", 50, "g", "sliced"),
            ("Lemongrass", 3, "stalks", "bruised"),
            ("Dried chilies", 15, "whole", "soaked"),
            ("Kaffir lime leaves", 6, "whole", None),
            ("Turmeric", 1, "tsp", "fresh or ground"),
            ("Toasted coconut", 100, "g", "shredded"),
            ("Salt", 1, "tsp", None)
        ],
        "tags": ["Indonesian", "Beef", "Curry", "Spicy"],
        "cuisine": "Indonesian",
        "category": "meal",
        "difficulty": "hard",
        "prep_time_minutes": 30,
        "cook_time_minutes": 180,
        "servings": 6,
        "calories": 480,
        "protein_g": 35,
        "carbs_g": 12,
        "fat_g": 34,
        "fiber_g": 3,
        "sugar_g": 4,
        "sodium_mg": 580,
        "cholesterol_mg": 95
    },

    # ==================== MORE DRINKS (10) ====================
    {
        "title": "Horchata",
        "description": "Mexican sweet rice and cinnamon drink",
        "image_url": "https://images.unsplash.com/photo-1541658016709-82535e94bc69?w=800",
        "instructions": """1. Soak rice and cinnamon in water overnight.
2. Blend rice mixture until smooth.
3. Strain through cheesecloth.
4. Add sugar and vanilla.
5. Stir until sugar dissolves.
6. Chill well.
7. Serve over ice with cinnamon stick.""",
        "ingredients": [
            ("Long grain rice", 200, "g", None),
            ("Cinnamon sticks", 2, "whole", None),
            ("Water", 1500, "ml", None),
            ("Sugar", 150, "g", None),
            ("Vanilla extract", 1, "tsp", None),
            ("Ice", 2, "cups", None)
        ],
        "tags": ["Mexican", "Drink", "Sweet", "Cold", "Vegan"],
        "cuisine": "Mexican",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 0,
        "servings": 6,
        "calories": 150,
        "protein_g": 2,
        "carbs_g": 34,
        "fat_g": 0,
        "fiber_g": 0,
        "sugar_g": 26,
        "sodium_mg": 10,
        "cholesterol_mg": 0
    },
    {
        "title": "Mint Julep",
        "description": "Classic bourbon cocktail with fresh mint",
        "image_url": "https://images.unsplash.com/photo-1551024709-8f23befc6f87?w=800",
        "instructions": """1. Muddle mint with simple syrup in julep cup.
2. Fill cup with crushed ice.
3. Add bourbon.
4. Stir until cup frosts.
5. Add more crushed ice.
6. Garnish with mint sprig.
7. Serve with short straw.""",
        "ingredients": [
            ("Bourbon", 75, "ml", None),
            ("Fresh mint", 8, "leaves", "plus sprig"),
            ("Simple syrup", 15, "ml", None),
            ("Crushed ice", 2, "cups", None)
        ],
        "tags": ["Cocktail", "Bourbon", "Drink", "Classic"],
        "cuisine": "American",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 1,
        "calories": 180,
        "protein_g": 0,
        "carbs_g": 8,
        "fat_g": 0,
        "fiber_g": 0,
        "sugar_g": 8,
        "sodium_mg": 5,
        "cholesterol_mg": 0
    },
    {
        "title": "Thai Iced Tea",
        "description": "Sweet creamy orange tea over ice",
        "image_url": "https://images.unsplash.com/photo-1558857563-b371033873b8?w=800",
        "instructions": """1. Brew Thai tea strongly with spices.
2. Strain tea.
3. Add sugar while hot, stir to dissolve.
4. Let cool.
5. Fill glass with ice.
6. Pour tea to 3/4 full.
7. Top with evaporated milk or cream.""",
        "ingredients": [
            ("Thai tea mix", 60, "g", None),
            ("Water", 500, "ml", None),
            ("Sugar", 80, "g", None),
            ("Evaporated milk", 120, "ml", None),
            ("Ice", 2, "cups", None),
            ("Star anise", 1, "whole", "optional")
        ],
        "tags": ["Thai", "Drink", "Tea", "Sweet", "Cold"],
        "cuisine": "Thai",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 10,
        "servings": 2,
        "calories": 180,
        "protein_g": 4,
        "carbs_g": 36,
        "fat_g": 4,
        "fiber_g": 0,
        "sugar_g": 32,
        "sodium_mg": 60,
        "cholesterol_mg": 15
    },
    {
        "title": "Moscow Mule",
        "description": "Vodka cocktail with ginger beer and lime",
        "image_url": "https://images.unsplash.com/photo-1551024709-8f23befc6f87?w=800",
        "instructions": """1. Fill copper mug with ice.
2. Add vodka.
3. Squeeze lime juice over.
4. Top with ginger beer.
5. Gently stir.
6. Garnish with lime wheel and mint.
7. Serve immediately.""",
        "ingredients": [
            ("Vodka", 60, "ml", None),
            ("Ginger beer", 120, "ml", None),
            ("Lime juice", 15, "ml", "fresh"),
            ("Ice", 1, "cup", None),
            ("Lime wheel", 1, "whole", "for garnish"),
            ("Fresh mint", 2, "sprigs", "optional")
        ],
        "tags": ["Cocktail", "Vodka", "Drink"],
        "cuisine": "American",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 1,
        "calories": 180,
        "protein_g": 0,
        "carbs_g": 16,
        "fat_g": 0,
        "fiber_g": 0,
        "sugar_g": 14,
        "sodium_mg": 10,
        "cholesterol_mg": 0
    },
    {
        "title": "Hot Toddy",
        "description": "Warming whiskey drink with honey, lemon, and spices",
        "image_url": "https://images.unsplash.com/photo-1544145945-f90425340c7e?w=800",
        "instructions": """1. Heat water until hot but not boiling.
2. Add honey, stir to dissolve.
3. Add whiskey and lemon juice.
4. Add cinnamon stick and cloves.
5. Stir gently.
6. Garnish with lemon wheel.
7. Serve warm.""",
        "ingredients": [
            ("Whiskey", 45, "ml", "bourbon or rye"),
            ("Hot water", 180, "ml", None),
            ("Honey", 1, "tbsp", None),
            ("Lemon juice", 15, "ml", "fresh"),
            ("Cinnamon stick", 1, "whole", None),
            ("Whole cloves", 3, "whole", None),
            ("Lemon wheel", 1, "whole", "for garnish")
        ],
        "tags": ["Cocktail", "Whiskey", "Drink", "Hot", "Winter"],
        "cuisine": "American",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 5,
        "servings": 1,
        "calories": 150,
        "protein_g": 0,
        "carbs_g": 14,
        "fat_g": 0,
        "fiber_g": 0,
        "sugar_g": 12,
        "sodium_mg": 5,
        "cholesterol_mg": 0
    },

    # ==================== MORE SNACKS/APPETIZERS (15) ====================
    {
        "title": "Spinach Artichoke Dip",
        "description": "Creamy baked dip with spinach, artichokes, and cheese",
        "image_url": "https://images.unsplash.com/photo-1576506295286-5cda18df43e7?w=800",
        "instructions": """1. Squeeze moisture from spinach and artichokes.
2. Mix cream cheese, sour cream, mayo.
3. Add spinach, artichokes, garlic.
4. Fold in Parmesan and mozzarella.
5. Transfer to baking dish.
6. Bake at 350°F for 25 minutes until bubbly.
7. Serve with tortilla chips or bread.""",
        "ingredients": [
            ("Frozen spinach", 300, "g", "thawed, drained"),
            ("Artichoke hearts", 400, "g", "canned, chopped"),
            ("Cream cheese", 225, "g", "softened"),
            ("Sour cream", 120, "g", None),
            ("Mayonnaise", 60, "g", None),
            ("Parmesan", 80, "g", "grated"),
            ("Mozzarella", 100, "g", "shredded"),
            ("Garlic", 3, "cloves", "minced")
        ],
        "tags": ["Appetizer", "Dip", "Vegetarian", "Party"],
        "cuisine": "American",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 25,
        "servings": 10,
        "calories": 220,
        "protein_g": 8,
        "carbs_g": 8,
        "fat_g": 18,
        "fiber_g": 3,
        "sugar_g": 2,
        "sodium_mg": 420,
        "cholesterol_mg": 45
    },
    {
        "title": "Bruschetta",
        "description": "Toasted bread topped with fresh tomato and basil",
        "image_url": "https://images.unsplash.com/photo-1572695157366-5e585ab2b69f?w=800",
        "instructions": """1. Dice tomatoes, remove excess juice.
2. Mix with garlic, basil, olive oil, balsamic.
3. Season with salt and pepper.
4. Let sit 15 minutes.
5. Toast baguette slices with olive oil.
6. Rub with garlic clove.
7. Top with tomato mixture, serve immediately.""",
        "ingredients": [
            ("Roma tomatoes", 500, "g", "diced"),
            ("Fresh basil", 0.5, "cup", "chiffonade"),
            ("Garlic", 3, "cloves", "minced"),
            ("Baguette", 1, "whole", "sliced"),
            ("Olive oil", 60, "ml", None),
            ("Balsamic vinegar", 2, "tbsp", None),
            ("Salt", 0.5, "tsp", None),
            ("Black pepper", 0.25, "tsp", None)
        ],
        "tags": ["Italian", "Appetizer", "Vegetarian", "Fresh"],
        "cuisine": "Italian",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 5,
        "servings": 6,
        "calories": 160,
        "protein_g": 4,
        "carbs_g": 22,
        "fat_g": 6,
        "fiber_g": 2,
        "sugar_g": 4,
        "sodium_mg": 280,
        "cholesterol_mg": 0
    },
    {
        "title": "Deviled Eggs",
        "description": "Classic stuffed eggs with creamy paprika filling",
        "image_url": "https://images.unsplash.com/photo-1608039829572-9b0b8eb4fa1f?w=800",
        "instructions": """1. Hard boil eggs 12 minutes, cool in ice bath.
2. Peel eggs, cut in half lengthwise.
3. Remove yolks to bowl.
4. Mash yolks with mayo, mustard, vinegar.
5. Season with salt and pepper.
6. Pipe or spoon filling into whites.
7. Dust with paprika and garnish with chives.""",
        "ingredients": [
            ("Eggs", 12, "whole", "hard-boiled"),
            ("Mayonnaise", 80, "g", None),
            ("Dijon mustard", 2, "tsp", None),
            ("White wine vinegar", 1, "tsp", None),
            ("Paprika", 0.5, "tsp", "for garnish"),
            ("Fresh chives", 2, "tbsp", "chopped"),
            ("Salt", 0.5, "tsp", None),
            ("White pepper", 0.25, "tsp", None)
        ],
        "tags": ["Appetizer", "Eggs", "Classic", "Party"],
        "cuisine": "American",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 12,
        "servings": 12,
        "calories": 80,
        "protein_g": 5,
        "carbs_g": 1,
        "fat_g": 6,
        "fiber_g": 0,
        "sugar_g": 0,
        "sodium_mg": 120,
        "cholesterol_mg": 165
    },
    {
        "title": "Stuffed Mushrooms",
        "description": "Baked mushroom caps with herb cream cheese filling",
        "image_url": "https://images.unsplash.com/photo-1518977676601-b53f82ber6b?w=800",
        "instructions": """1. Remove stems from mushrooms, chop stems.
2. Sauté stems with garlic and herbs.
3. Mix with cream cheese and Parmesan.
4. Fill mushroom caps.
5. Top with extra Parmesan.
6. Bake at 375°F for 20 minutes.
7. Broil 2 minutes to brown tops.""",
        "ingredients": [
            ("Cremini mushrooms", 450, "g", "large"),
            ("Cream cheese", 115, "g", "softened"),
            ("Parmesan", 60, "g", "grated"),
            ("Garlic", 3, "cloves", "minced"),
            ("Fresh parsley", 3, "tbsp", "chopped"),
            ("Fresh thyme", 1, "tsp", "chopped"),
            ("Olive oil", 2, "tbsp", None),
            ("Salt", 0.5, "tsp", None)
        ],
        "tags": ["Appetizer", "Vegetarian", "Party", "Baked"],
        "cuisine": "American",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 22,
        "servings": 8,
        "calories": 110,
        "protein_g": 5,
        "carbs_g": 4,
        "fat_g": 9,
        "fiber_g": 1,
        "sugar_g": 2,
        "sodium_mg": 180,
        "cholesterol_mg": 25
    },
    {
        "title": "Nachos Supreme",
        "description": "Loaded tortilla chips with cheese, beans, and toppings",
        "image_url": "https://images.unsplash.com/photo-1513456852971-30c0b8199d4d?w=800",
        "instructions": """1. Spread chips on baking sheet.
2. Add layers of cheese and beans.
3. Add ground beef if using.
4. Bake at 400°F until cheese melts.
5. Top with pico de gallo.
6. Add sour cream, guacamole, jalapeños.
7. Serve immediately.""",
        "ingredients": [
            ("Tortilla chips", 300, "g", None),
            ("Shredded cheese", 300, "g", "Mexican blend"),
            ("Refried beans", 200, "g", None),
            ("Ground beef", 200, "g", "seasoned, optional"),
            ("Pico de gallo", 150, "g", None),
            ("Sour cream", 100, "g", None),
            ("Guacamole", 150, "g", None),
            ("Pickled jalapeños", 60, "g", "sliced")
        ],
        "tags": ["Mexican", "Appetizer", "Party", "Comfort Food"],
        "cuisine": "Mexican",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 10,
        "servings": 6,
        "calories": 480,
        "protein_g": 18,
        "carbs_g": 38,
        "fat_g": 30,
        "fiber_g": 6,
        "sugar_g": 4,
        "sodium_mg": 920,
        "cholesterol_mg": 55
    },

    # ==================== FINAL BATCH - MORE RECIPES (43) ====================
    {
        "title": "Pork Chops with Apple",
        "description": "Pan-seared pork chops with caramelized apple slices",
        "image_url": "https://images.unsplash.com/photo-1432139555190-58524dae6a55?w=800",
        "instructions": """1. Season pork chops with salt, pepper, sage.
2. Sear in hot pan 4 minutes per side.
3. Remove, add butter to pan.
4. Sauté apple slices until golden.
5. Add cider, scrape up browned bits.
6. Return pork, simmer until cooked.
7. Serve with apple sauce.""",
        "ingredients": [
            ("Bone-in pork chops", 4, "whole", "thick-cut"),
            ("Apples", 2, "medium", "sliced"),
            ("Apple cider", 120, "ml", None),
            ("Butter", 45, "g", None),
            ("Fresh sage", 6, "leaves", None),
            ("Salt", 1, "tsp", None),
            ("Black pepper", 0.5, "tsp", None)
        ],
        "tags": ["Pork", "Fall", "Dinner", "Quick"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 380,
        "protein_g": 32,
        "carbs_g": 16,
        "fat_g": 22,
        "fiber_g": 2,
        "sugar_g": 12,
        "sodium_mg": 520,
        "cholesterol_mg": 95
    },
    {
        "title": "Lamb Chops",
        "description": "Herb-crusted lamb chops grilled to perfection",
        "image_url": "https://images.unsplash.com/photo-1544025162-d76694265947?w=800",
        "instructions": """1. Mix herbs, garlic, and olive oil into paste.
2. Rub on lamb chops, marinate 1 hour.
3. Preheat grill to high.
4. Grill 3-4 minutes per side for medium-rare.
5. Rest 5 minutes.
6. Serve with mint sauce.
7. Garnish with fresh rosemary.""",
        "ingredients": [
            ("Lamb chops", 8, "whole", "French-trimmed"),
            ("Fresh rosemary", 2, "tbsp", "chopped"),
            ("Fresh thyme", 1, "tbsp", "chopped"),
            ("Garlic", 4, "cloves", "minced"),
            ("Olive oil", 60, "ml", None),
            ("Dijon mustard", 2, "tbsp", None),
            ("Salt", 1, "tsp", None),
            ("Black pepper", 0.5, "tsp", None)
        ],
        "tags": ["Lamb", "Grill", "Elegant", "Dinner"],
        "cuisine": "French",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 15,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 420,
        "protein_g": 35,
        "carbs_g": 2,
        "fat_g": 30,
        "fiber_g": 0,
        "sugar_g": 0,
        "sodium_mg": 580,
        "cholesterol_mg": 120
    },
    {
        "title": "Chicken Adobo",
        "description": "Filipino braised chicken in soy and vinegar",
        "image_url": "https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=800",
        "instructions": """1. Marinate chicken in soy sauce, vinegar, garlic, bay leaves.
2. Brown chicken pieces in oil.
3. Add marinade to pan.
4. Simmer covered 30 minutes.
5. Uncover, reduce sauce until thick.
6. Serve with steamed rice.
7. Garnish with green onions.""",
        "ingredients": [
            ("Chicken pieces", 1200, "g", "thighs and drumsticks"),
            ("Soy sauce", 120, "ml", None),
            ("White vinegar", 80, "ml", None),
            ("Garlic", 8, "cloves", "crushed"),
            ("Bay leaves", 4, "whole", None),
            ("Black peppercorns", 1, "tsp", "whole"),
            ("Vegetable oil", 3, "tbsp", None),
            ("Water", 120, "ml", None)
        ],
        "tags": ["Filipino", "Chicken", "Braised", "Comfort Food"],
        "cuisine": "Filipino",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 40,
        "servings": 6,
        "calories": 380,
        "protein_g": 35,
        "carbs_g": 6,
        "fat_g": 24,
        "fiber_g": 0,
        "sugar_g": 2,
        "sodium_mg": 1200,
        "cholesterol_mg": 145
    },
    {
        "title": "Spaghetti Aglio e Olio",
        "description": "Simple pasta with garlic, olive oil, and chili",
        "image_url": "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=800",
        "instructions": """1. Cook spaghetti until al dente, reserve pasta water.
2. Slice garlic thinly.
3. Heat olive oil, add garlic and chili.
4. Cook until garlic is golden.
5. Add pasta and pasta water.
6. Toss to emulsify.
7. Finish with parsley and Parmesan.""",
        "ingredients": [
            ("Spaghetti", 400, "g", None),
            ("Garlic", 8, "cloves", "thinly sliced"),
            ("Olive oil", 120, "ml", "extra virgin"),
            ("Red chili flakes", 1, "tsp", None),
            ("Fresh parsley", 0.25, "cup", "chopped"),
            ("Parmesan", 60, "g", "grated"),
            ("Salt", 1, "tsp", None)
        ],
        "tags": ["Italian", "Pasta", "Quick", "Vegetarian"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 420,
        "protein_g": 12,
        "carbs_g": 56,
        "fat_g": 18,
        "fiber_g": 3,
        "sugar_g": 2,
        "sodium_mg": 380,
        "cholesterol_mg": 10
    },
    {
        "title": "Beef Tacos",
        "description": "Seasoned ground beef in crunchy taco shells",
        "image_url": "https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=800",
        "instructions": """1. Brown beef, drain excess fat.
2. Add taco seasoning and water.
3. Simmer until sauce thickens.
4. Warm taco shells.
5. Fill with beef.
6. Top with lettuce, cheese, tomatoes, sour cream.
7. Add hot sauce if desired.""",
        "ingredients": [
            ("Ground beef", 500, "g", None),
            ("Taco shells", 12, "whole", None),
            ("Taco seasoning", 2, "tbsp", None),
            ("Shredded lettuce", 150, "g", None),
            ("Shredded cheese", 150, "g", None),
            ("Tomatoes", 2, "medium", "diced"),
            ("Sour cream", 100, "g", None),
            ("Water", 120, "ml", None)
        ],
        "tags": ["Mexican", "Beef", "Quick", "Dinner"],
        "cuisine": "Mexican",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 480,
        "protein_g": 28,
        "carbs_g": 32,
        "fat_g": 28,
        "fiber_g": 3,
        "sugar_g": 4,
        "sodium_mg": 720,
        "cholesterol_mg": 85
    },
    {
        "title": "Omelette",
        "description": "Classic French omelette with cheese and herbs",
        "image_url": "https://images.unsplash.com/photo-1510693206972-df098062cb71?w=800",
        "instructions": """1. Beat eggs with salt and pepper.
2. Heat butter in non-stick pan.
3. Pour in eggs, let set slightly.
4. Gently push edges toward center.
5. Add cheese and herbs when almost set.
6. Fold omelette in thirds.
7. Slide onto plate, serve immediately.""",
        "ingredients": [
            ("Eggs", 3, "whole", None),
            ("Butter", 15, "g", None),
            ("Gruyère cheese", 30, "g", "grated"),
            ("Fresh chives", 1, "tbsp", "chopped"),
            ("Salt", 0.25, "tsp", None),
            ("White pepper", 1, "pinch", None)
        ],
        "tags": ["French", "Eggs", "Breakfast", "Quick"],
        "cuisine": "French",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 5,
        "cook_time_minutes": 3,
        "servings": 1,
        "calories": 380,
        "protein_g": 22,
        "carbs_g": 2,
        "fat_g": 32,
        "fiber_g": 0,
        "sugar_g": 1,
        "sodium_mg": 480,
        "cholesterol_mg": 580
    },
    {
        "title": "Baked Ziti",
        "description": "Baked pasta with meat sauce and ricotta",
        "image_url": "https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=800",
        "instructions": """1. Cook ziti until slightly undercooked.
2. Make meat sauce with beef, tomatoes, herbs.
3. Mix ricotta with egg and Parmesan.
4. Layer in baking dish: sauce, pasta, ricotta.
5. Repeat layers, top with mozzarella.
6. Bake at 375°F for 30 minutes.
7. Let rest 10 minutes before serving.""",
        "ingredients": [
            ("Ziti pasta", 450, "g", None),
            ("Ground beef", 450, "g", None),
            ("Ricotta cheese", 425, "g", None),
            ("Mozzarella", 300, "g", "shredded"),
            ("Marinara sauce", 700, "g", None),
            ("Parmesan", 60, "g", "grated"),
            ("Egg", 1, "whole", None),
            ("Italian seasoning", 1, "tbsp", None)
        ],
        "tags": ["Italian", "Pasta", "Baked", "Comfort Food"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 25,
        "cook_time_minutes": 45,
        "servings": 8,
        "calories": 520,
        "protein_g": 28,
        "carbs_g": 48,
        "fat_g": 24,
        "fiber_g": 3,
        "sugar_g": 8,
        "sodium_mg": 720,
        "cholesterol_mg": 95
    },
    {
        "title": "Chicken Fajitas",
        "description": "Sizzling chicken strips with peppers and onions",
        "image_url": "https://images.unsplash.com/photo-1611250503393-c89093b4d64e?w=800",
        "instructions": """1. Slice chicken and marinate in lime, cumin, chili.
2. Slice peppers and onions.
3. Cook chicken over high heat until charred.
4. Cook vegetables until crisp-tender.
5. Warm flour tortillas.
6. Serve with salsa, guacamole, sour cream.
7. Let everyone build their own.""",
        "ingredients": [
            ("Chicken breast", 500, "g", "sliced"),
            ("Bell peppers", 3, "medium", "mixed colors, sliced"),
            ("Onion", 1, "large", "sliced"),
            ("Flour tortillas", 8, "large", None),
            ("Lime juice", 3, "tbsp", None),
            ("Cumin", 2, "tsp", None),
            ("Chili powder", 1, "tsp", None),
            ("Vegetable oil", 3, "tbsp", None),
            ("Salsa", 150, "g", None),
            ("Sour cream", 100, "g", None)
        ],
        "tags": ["Mexican", "Chicken", "Quick", "Dinner"],
        "cuisine": "Mexican",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 450,
        "protein_g": 32,
        "carbs_g": 42,
        "fat_g": 18,
        "fiber_g": 4,
        "sugar_g": 6,
        "sodium_mg": 680,
        "cholesterol_mg": 85
    },
    {
        "title": "Sloppy Joes",
        "description": "Sweet and tangy ground beef on burger buns",
        "image_url": "https://images.unsplash.com/photo-1626645738196-c2a72c7a1d1f?w=800",
        "instructions": """1. Brown beef with onion and bell pepper.
2. Add tomato sauce, ketchup, Worcestershire.
3. Add brown sugar and mustard.
4. Simmer 20 minutes.
5. Toast burger buns.
6. Spoon mixture onto buns.
7. Serve with pickles on the side.""",
        "ingredients": [
            ("Ground beef", 500, "g", None),
            ("Onion", 1, "medium", "diced"),
            ("Bell pepper", 1, "medium", "diced"),
            ("Tomato sauce", 200, "g", None),
            ("Ketchup", 80, "g", None),
            ("Worcestershire sauce", 2, "tbsp", None),
            ("Brown sugar", 2, "tbsp", None),
            ("Mustard", 1, "tbsp", None),
            ("Hamburger buns", 6, "whole", None)
        ],
        "tags": ["American", "Beef", "Quick", "Comfort Food"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 25,
        "servings": 6,
        "calories": 420,
        "protein_g": 24,
        "carbs_g": 42,
        "fat_g": 18,
        "fiber_g": 2,
        "sugar_g": 16,
        "sodium_mg": 780,
        "cholesterol_mg": 70
    },
    {
        "title": "Chicken Piccata",
        "description": "Pan-fried chicken in lemon caper butter sauce",
        "image_url": "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800",
        "instructions": """1. Pound chicken breasts thin.
2. Season and dredge in flour.
3. Pan fry in olive oil until golden.
4. Remove chicken, add wine to deglaze.
5. Add lemon juice, capers, stock.
6. Simmer, whisk in cold butter.
7. Return chicken, spoon sauce over.""",
        "ingredients": [
            ("Chicken breast", 600, "g", "pounded thin"),
            ("All-purpose flour", 60, "g", None),
            ("White wine", 120, "ml", "dry"),
            ("Chicken stock", 120, "ml", None),
            ("Lemon juice", 60, "ml", "fresh"),
            ("Capers", 3, "tbsp", "drained"),
            ("Butter", 60, "g", None),
            ("Olive oil", 3, "tbsp", None),
            ("Fresh parsley", 2, "tbsp", "chopped")
        ],
        "tags": ["Italian", "Chicken", "Quick", "Elegant"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 15,
        "cook_time_minutes": 20,
        "servings": 4,
        "calories": 380,
        "protein_g": 38,
        "carbs_g": 10,
        "fat_g": 20,
        "fiber_g": 1,
        "sugar_g": 1,
        "sodium_mg": 520,
        "cholesterol_mg": 125
    },
    {
        "title": "Pulled Pork Sliders",
        "description": "Mini sandwiches with slow-cooked pulled pork",
        "image_url": "https://images.unsplash.com/photo-1513185158878-8d8c2a2a3da3?w=800",
        "instructions": """1. Season pork shoulder with dry rub.
2. Slow cook 8 hours until falling apart.
3. Shred pork, mix with cooking liquid.
4. Add BBQ sauce to taste.
5. Toast slider buns.
6. Pile pork on buns.
7. Top with coleslaw if desired.""",
        "ingredients": [
            ("Pork shoulder", 1500, "g", None),
            ("Slider buns", 12, "whole", None),
            ("BBQ sauce", 250, "g", None),
            ("Brown sugar", 3, "tbsp", None),
            ("Paprika", 2, "tbsp", None),
            ("Garlic powder", 1, "tbsp", None),
            ("Onion powder", 1, "tbsp", None),
            ("Apple cider vinegar", 3, "tbsp", None),
            ("Coleslaw", 200, "g", "optional")
        ],
        "tags": ["American", "Pork", "BBQ", "Party"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 480,
        "servings": 12,
        "calories": 350,
        "protein_g": 22,
        "carbs_g": 28,
        "fat_g": 16,
        "fiber_g": 1,
        "sugar_g": 14,
        "sodium_mg": 620,
        "cholesterol_mg": 75
    },
    {
        "title": "Shrimp Cocktail",
        "description": "Chilled poached shrimp with zesty cocktail sauce",
        "image_url": "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=800",
        "instructions": """1. Make court bouillon with aromatics.
2. Poach shrimp 2-3 minutes until pink.
3. Transfer to ice bath immediately.
4. Make cocktail sauce: ketchup, horseradish, lemon.
5. Arrange shrimp on ice.
6. Serve with cocktail sauce and lemon.
7. Garnish with parsley.""",
        "ingredients": [
            ("Large shrimp", 500, "g", "shell-on"),
            ("Ketchup", 120, "g", None),
            ("Horseradish", 2, "tbsp", "prepared"),
            ("Lemon juice", 2, "tbsp", None),
            ("Worcestershire", 1, "tsp", None),
            ("Hot sauce", 0.5, "tsp", None),
            ("Bay leaves", 2, "whole", None),
            ("Lemon", 1, "whole", "sliced")
        ],
        "tags": ["Appetizer", "Seafood", "Cold", "Classic"],
        "cuisine": "American",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 5,
        "servings": 6,
        "calories": 120,
        "protein_g": 18,
        "carbs_g": 10,
        "fat_g": 1,
        "fiber_g": 0,
        "sugar_g": 8,
        "sodium_mg": 480,
        "cholesterol_mg": 145
    },
    {
        "title": "Crème Brûlée",
        "description": "Vanilla custard with caramelized sugar crust",
        "image_url": "https://images.unsplash.com/photo-1470124182917-cc6e71b22ecc?w=800",
        "instructions": """1. Heat cream with vanilla bean.
2. Whisk yolks with sugar until pale.
3. Temper yolks with hot cream.
4. Strain into ramekins.
5. Bake in water bath at 325°F for 45 minutes.
6. Chill thoroughly.
7. Sprinkle sugar, torch until caramelized.""",
        "ingredients": [
            ("Heavy cream", 480, "ml", None),
            ("Egg yolks", 6, "whole", None),
            ("Sugar", 100, "g", "plus more for topping"),
            ("Vanilla bean", 1, "whole", "or 1 tsp extract"),
            ("Salt", 1, "pinch", None)
        ],
        "tags": ["French", "Dessert", "Elegant", "Custard"],
        "cuisine": "French",
        "category": "dessert",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 50,
        "servings": 6,
        "calories": 380,
        "protein_g": 5,
        "carbs_g": 28,
        "fat_g": 28,
        "fiber_g": 0,
        "sugar_g": 26,
        "sodium_mg": 45,
        "cholesterol_mg": 280
    },
    {
        "title": "Lemon Bars",
        "description": "Buttery shortbread crust with tangy lemon curd",
        "image_url": "https://images.unsplash.com/photo-1587314168485-3236d6710814?w=800",
        "instructions": """1. Make crust: mix flour, butter, powdered sugar.
2. Press into pan, bake 20 minutes.
3. Whisk eggs, sugar, lemon juice, zest, flour.
4. Pour over hot crust.
5. Bake 20-25 more minutes until set.
6. Cool completely.
7. Dust with powdered sugar, cut into bars.""",
        "ingredients": [
            ("All-purpose flour", 300, "g", "divided"),
            ("Butter", 170, "g", "cold, cubed"),
            ("Powdered sugar", 180, "g", "plus more for dusting"),
            ("Eggs", 4, "whole", None),
            ("Sugar", 300, "g", None),
            ("Lemon juice", 120, "ml", "fresh"),
            ("Lemon zest", 2, "tbsp", None),
            ("Salt", 0.25, "tsp", None)
        ],
        "tags": ["Dessert", "Lemon", "Bars", "Baked"],
        "cuisine": "American",
        "category": "dessert",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 45,
        "servings": 16,
        "calories": 240,
        "protein_g": 3,
        "carbs_g": 38,
        "fat_g": 9,
        "fiber_g": 0,
        "sugar_g": 28,
        "sodium_mg": 95,
        "cholesterol_mg": 75
    },
    {
        "title": "Bread Pudding",
        "description": "Custardy baked dessert with day-old bread",
        "image_url": "https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=800",
        "instructions": """1. Cube bread, spread in baking dish.
2. Whisk eggs, milk, cream, sugar, vanilla, cinnamon.
3. Pour custard over bread.
4. Let soak 30 minutes.
5. Add raisins if using.
6. Bake at 350°F for 45 minutes.
7. Serve warm with vanilla sauce or whipped cream.""",
        "ingredients": [
            ("French bread", 450, "g", "cubed, day-old"),
            ("Eggs", 4, "whole", None),
            ("Whole milk", 350, "ml", None),
            ("Heavy cream", 180, "ml", None),
            ("Sugar", 200, "g", None),
            ("Vanilla extract", 2, "tsp", None),
            ("Cinnamon", 1, "tsp", None),
            ("Raisins", 100, "g", "optional"),
            ("Butter", 30, "g", "for greasing")
        ],
        "tags": ["Dessert", "Comfort Food", "Baked", "Classic"],
        "cuisine": "American",
        "category": "dessert",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 50,
        "servings": 10,
        "calories": 320,
        "protein_g": 8,
        "carbs_g": 48,
        "fat_g": 11,
        "fiber_g": 1,
        "sugar_g": 28,
        "sodium_mg": 280,
        "cholesterol_mg": 105
    },
    {
        "title": "Rice Pudding",
        "description": "Creamy stovetop rice dessert with cinnamon",
        "image_url": "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800",
        "instructions": """1. Simmer rice in water until almost cooked.
2. Add milk, sugar, salt.
3. Cook over low heat, stirring often.
4. Continue until thick and creamy.
5. Remove from heat, add vanilla and butter.
6. Stir in raisins if using.
7. Serve warm or cold with cinnamon.""",
        "ingredients": [
            ("Short-grain rice", 150, "g", None),
            ("Whole milk", 700, "ml", None),
            ("Sugar", 100, "g", None),
            ("Vanilla extract", 1, "tsp", None),
            ("Butter", 30, "g", None),
            ("Cinnamon", 1, "tsp", "for topping"),
            ("Raisins", 60, "g", "optional"),
            ("Salt", 0.25, "tsp", None)
        ],
        "tags": ["Dessert", "Comfort Food", "Classic", "Vegetarian"],
        "cuisine": "American",
        "category": "dessert",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 40,
        "servings": 6,
        "calories": 260,
        "protein_g": 6,
        "carbs_g": 44,
        "fat_g": 7,
        "fiber_g": 0,
        "sugar_g": 24,
        "sodium_mg": 120,
        "cholesterol_mg": 25
    },
    {
        "title": "Carrot Cake",
        "description": "Moist spiced cake with cream cheese frosting",
        "image_url": "https://images.unsplash.com/photo-1621303837174-89787a7d4729?w=800",
        "instructions": """1. Mix flour, baking soda, cinnamon, nutmeg, salt.
2. Whisk eggs, sugar, oil.
3. Combine wet and dry ingredients.
4. Fold in carrots, walnuts, raisins.
5. Bake at 350°F for 35-40 minutes.
6. Cool completely.
7. Frost with cream cheese frosting.""",
        "ingredients": [
            ("All-purpose flour", 300, "g", None),
            ("Carrots", 400, "g", "grated"),
            ("Sugar", 300, "g", None),
            ("Vegetable oil", 240, "ml", None),
            ("Eggs", 4, "whole", None),
            ("Cream cheese", 450, "g", "for frosting"),
            ("Butter", 115, "g", "for frosting"),
            ("Powdered sugar", 300, "g", "for frosting"),
            ("Walnuts", 100, "g", "chopped"),
            ("Cinnamon", 2, "tsp", None),
            ("Baking soda", 2, "tsp", None)
        ],
        "tags": ["Dessert", "Cake", "Baked", "Classic"],
        "cuisine": "American",
        "category": "dessert",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 40,
        "servings": 12,
        "calories": 520,
        "protein_g": 6,
        "carbs_g": 62,
        "fat_g": 28,
        "fiber_g": 2,
        "sugar_g": 48,
        "sodium_mg": 320,
        "cholesterol_mg": 95
    },
    {
        "title": "Cheesecake",
        "description": "Rich and creamy New York style cheesecake",
        "image_url": "https://images.unsplash.com/photo-1524351199678-941a58a3df50?w=800",
        "instructions": """1. Make crust: mix graham crumbs, butter, sugar.
2. Press into springform pan.
3. Beat cream cheese until smooth.
4. Add sugar, eggs one at a time, sour cream, vanilla.
5. Pour over crust.
6. Bake at 325°F for 55 minutes.
7. Turn off oven, leave door cracked 1 hour.
8. Chill overnight before serving.""",
        "ingredients": [
            ("Cream cheese", 900, "g", "room temperature"),
            ("Sugar", 200, "g", None),
            ("Eggs", 4, "whole", None),
            ("Sour cream", 200, "g", None),
            ("Vanilla extract", 1, "tbsp", None),
            ("Graham crackers", 200, "g", "crushed"),
            ("Butter", 100, "g", "melted"),
            ("Salt", 0.25, "tsp", None)
        ],
        "tags": ["Dessert", "Cheesecake", "Elegant", "Classic"],
        "cuisine": "American",
        "category": "dessert",
        "difficulty": "medium",
        "prep_time_minutes": 25,
        "cook_time_minutes": 60,
        "servings": 12,
        "calories": 480,
        "protein_g": 8,
        "carbs_g": 38,
        "fat_g": 34,
        "fiber_g": 0,
        "sugar_g": 28,
        "sodium_mg": 380,
        "cholesterol_mg": 145
    },
    {
        "title": "Pecan Pie",
        "description": "Sweet Southern pie with caramelized pecans",
        "image_url": "https://images.unsplash.com/photo-1574085733277-851d9d856a3a?w=800",
        "instructions": """1. Roll out pie dough, fit into pan.
2. Whisk eggs, corn syrup, sugar, butter, vanilla.
3. Fold in pecans.
4. Pour into crust.
5. Arrange extra pecans on top.
6. Bake at 350°F for 50-55 minutes.
7. Cool completely before slicing.""",
        "ingredients": [
            ("Pie crust", 1, "whole", None),
            ("Pecans", 300, "g", "halves and pieces"),
            ("Eggs", 3, "whole", None),
            ("Corn syrup", 240, "ml", None),
            ("Brown sugar", 150, "g", None),
            ("Butter", 60, "g", "melted"),
            ("Vanilla extract", 1, "tsp", None),
            ("Salt", 0.25, "tsp", None)
        ],
        "tags": ["Dessert", "Pie", "Southern", "Thanksgiving"],
        "cuisine": "American",
        "category": "dessert",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 55,
        "servings": 10,
        "calories": 480,
        "protein_g": 5,
        "carbs_g": 58,
        "fat_g": 26,
        "fiber_g": 2,
        "sugar_g": 42,
        "sodium_mg": 220,
        "cholesterol_mg": 85
    },
    {
        "title": "Banoffee Pie",
        "description": "British dessert with banana, toffee, and cream",
        "image_url": "https://images.unsplash.com/photo-1574085733277-851d9d856a3a?w=800",
        "instructions": """1. Make crust from crushed digestive biscuits and butter.
2. Make toffee by boiling condensed milk 3 hours.
3. Spread toffee over crust.
4. Layer sliced bananas on toffee.
5. Top with whipped cream.
6. Shave chocolate over top.
7. Chill before serving.""",
        "ingredients": [
            ("Digestive biscuits", 250, "g", "crushed"),
            ("Butter", 115, "g", "melted"),
            ("Condensed milk", 400, "g", "1 can"),
            ("Bananas", 3, "whole", "ripe, sliced"),
            ("Heavy cream", 300, "ml", "whipped"),
            ("Dark chocolate", 30, "g", "shaved")
        ],
        "tags": ["British", "Dessert", "No-Bake", "Sweet"],
        "cuisine": "British",
        "category": "dessert",
        "difficulty": "easy",
        "prep_time_minutes": 30,
        "cook_time_minutes": 180,
        "servings": 8,
        "calories": 480,
        "protein_g": 6,
        "carbs_g": 58,
        "fat_g": 26,
        "fiber_g": 2,
        "sugar_g": 42,
        "sodium_mg": 220,
        "cholesterol_mg": 75
    },
    {
        "title": "Affogato",
        "description": "Vanilla ice cream drowned in hot espresso",
        "image_url": "https://images.unsplash.com/photo-1551024709-8f23befc6f87?w=800",
        "instructions": """1. Brew fresh espresso.
2. Scoop vanilla gelato into serving glass.
3. Pour hot espresso over gelato.
4. Serve immediately.
5. Optional: add amaretto or Kahlua.""",
        "ingredients": [
            ("Vanilla gelato", 150, "g", "2 scoops"),
            ("Espresso", 60, "ml", "1 double shot"),
            ("Amaretto", 15, "ml", "optional")
        ],
        "tags": ["Italian", "Dessert", "Coffee", "Quick"],
        "cuisine": "Italian",
        "category": "dessert",
        "difficulty": "easy",
        "prep_time_minutes": 2,
        "cook_time_minutes": 0,
        "servings": 1,
        "calories": 240,
        "protein_g": 4,
        "carbs_g": 28,
        "fat_g": 12,
        "fiber_g": 0,
        "sugar_g": 24,
        "sodium_mg": 60,
        "cholesterol_mg": 45
    },
    {
        "title": "Hummus with Pita",
        "description": "Creamy chickpea dip with warm pita bread",
        "image_url": "https://images.unsplash.com/photo-1577805947697-89e18249d767?w=800",
        "instructions": """1. Blend chickpeas, tahini, lemon juice, garlic.
2. Add olive oil while blending.
3. Add ice water for smooth texture.
4. Season with cumin and salt.
5. Transfer to serving bowl.
6. Drizzle with olive oil, sprinkle paprika.
7. Serve with warm pita triangles.""",
        "ingredients": [
            ("Chickpeas", 400, "g", "canned, drained"),
            ("Tahini", 80, "g", None),
            ("Lemon juice", 60, "ml", "fresh"),
            ("Garlic", 2, "cloves", None),
            ("Olive oil", 60, "ml", None),
            ("Cumin", 0.5, "tsp", None),
            ("Paprika", 0.5, "tsp", "for garnish"),
            ("Pita bread", 4, "whole", None),
            ("Salt", 0.5, "tsp", None)
        ],
        "tags": ["Middle Eastern", "Dip", "Vegan", "Healthy"],
        "cuisine": "Middle Eastern",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 0,
        "servings": 6,
        "calories": 220,
        "protein_g": 8,
        "carbs_g": 28,
        "fat_g": 10,
        "fiber_g": 5,
        "sugar_g": 2,
        "sodium_mg": 420,
        "cholesterol_mg": 0
    },
    {
        "title": "Baba Ganoush",
        "description": "Smoky roasted eggplant dip with tahini",
        "image_url": "https://images.unsplash.com/photo-1577805947697-89e18249d767?w=800",
        "instructions": """1. Char eggplant over flame until collapsed.
2. Scoop out flesh, drain excess liquid.
3. Blend with tahini, lemon juice, garlic.
4. Season with cumin and salt.
5. Let flavors meld 30 minutes.
6. Drizzle with olive oil.
7. Serve with pita or vegetables.""",
        "ingredients": [
            ("Eggplant", 2, "large", None),
            ("Tahini", 60, "g", None),
            ("Lemon juice", 45, "ml", "fresh"),
            ("Garlic", 2, "cloves", None),
            ("Olive oil", 3, "tbsp", None),
            ("Cumin", 0.5, "tsp", None),
            ("Smoked paprika", 0.25, "tsp", "for garnish"),
            ("Fresh parsley", 2, "tbsp", "chopped"),
            ("Salt", 0.5, "tsp", None)
        ],
        "tags": ["Middle Eastern", "Dip", "Vegan", "Smoky"],
        "cuisine": "Middle Eastern",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 30,
        "servings": 6,
        "calories": 120,
        "protein_g": 3,
        "carbs_g": 10,
        "fat_g": 8,
        "fiber_g": 4,
        "sugar_g": 4,
        "sodium_mg": 200,
        "cholesterol_mg": 0
    },
    {
        "title": "Tzatziki",
        "description": "Cool cucumber yogurt sauce with garlic and dill",
        "image_url": "https://images.unsplash.com/photo-1577805947697-89e18249d767?w=800",
        "instructions": """1. Grate cucumber, salt and drain 30 minutes.
2. Squeeze out excess moisture.
3. Mix yogurt with garlic and olive oil.
4. Add cucumber and fresh dill.
5. Season with salt and white pepper.
6. Chill at least 1 hour.
7. Serve with pita or as gyros sauce.""",
        "ingredients": [
            ("Greek yogurt", 450, "g", "full-fat"),
            ("Cucumber", 1, "medium", "grated"),
            ("Garlic", 3, "cloves", "minced"),
            ("Fresh dill", 3, "tbsp", "chopped"),
            ("Olive oil", 2, "tbsp", None),
            ("Lemon juice", 1, "tbsp", None),
            ("Salt", 0.5, "tsp", None),
            ("White pepper", 0.25, "tsp", None)
        ],
        "tags": ["Greek", "Sauce", "Dip", "Vegetarian"],
        "cuisine": "Greek",
        "category": "snack",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 0,
        "servings": 8,
        "calories": 60,
        "protein_g": 4,
        "carbs_g": 4,
        "fat_g": 3,
        "fiber_g": 0,
        "sugar_g": 3,
        "sodium_mg": 180,
        "cholesterol_mg": 10
    },
    {
        "title": "Vietnamese Coffee",
        "description": "Strong drip coffee with sweetened condensed milk",
        "image_url": "https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?w=800",
        "instructions": """1. Add condensed milk to glass.
2. Place phin filter on glass.
3. Add coarse ground coffee to filter.
4. Add hot water, cover, let drip 5 minutes.
5. Stir coffee into condensed milk.
6. For iced: pour over ice.
7. Adjust sweetness to taste.""",
        "ingredients": [
            ("Vietnamese coffee", 20, "g", "coarse ground"),
            ("Condensed milk", 45, "ml", None),
            ("Hot water", 100, "ml", None),
            ("Ice", 1, "cup", "for iced version")
        ],
        "tags": ["Vietnamese", "Coffee", "Drink", "Sweet"],
        "cuisine": "Vietnamese",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 5,
        "servings": 1,
        "calories": 180,
        "protein_g": 3,
        "carbs_g": 28,
        "fat_g": 5,
        "fiber_g": 0,
        "sugar_g": 26,
        "sodium_mg": 45,
        "cholesterol_mg": 15
    },
    {
        "title": "Protein Shake",
        "description": "Quick post-workout shake with protein powder",
        "image_url": "https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=800",
        "instructions": """1. Add milk to blender.
2. Add protein powder.
3. Add banana for sweetness.
4. Add peanut butter for extra protein.
5. Blend until smooth.
6. Add ice if desired.
7. Drink immediately.""",
        "ingredients": [
            ("Protein powder", 30, "g", "vanilla or chocolate"),
            ("Milk", 300, "ml", None),
            ("Banana", 1, "whole", "frozen works best"),
            ("Peanut butter", 2, "tbsp", "optional"),
            ("Ice", 0.5, "cup", "optional")
        ],
        "tags": ["Drink", "Healthy", "High Protein", "Quick"],
        "cuisine": "American",
        "category": "drink",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 1,
        "calories": 380,
        "protein_g": 32,
        "carbs_g": 38,
        "fat_g": 12,
        "fiber_g": 3,
        "sugar_g": 24,
        "sodium_mg": 280,
        "cholesterol_mg": 25
    },
    {
        "title": "Chia Pudding",
        "description": "Overnight chia seed pudding with fresh fruit",
        "image_url": "https://images.unsplash.com/photo-1517686469429-8bdb88b9f907?w=800",
        "instructions": """1. Mix chia seeds with milk.
2. Add maple syrup and vanilla.
3. Stir well to prevent clumping.
4. Refrigerate overnight.
5. Stir again in morning.
6. Top with fresh berries.
7. Add granola for crunch.""",
        "ingredients": [
            ("Chia seeds", 45, "g", None),
            ("Milk", 250, "ml", "or plant-based"),
            ("Maple syrup", 2, "tbsp", None),
            ("Vanilla extract", 0.5, "tsp", None),
            ("Fresh berries", 100, "g", None),
            ("Granola", 30, "g", "optional")
        ],
        "tags": ["Breakfast", "Healthy", "Vegan", "No-Cook"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 5,
        "cook_time_minutes": 0,
        "servings": 2,
        "calories": 220,
        "protein_g": 8,
        "carbs_g": 28,
        "fat_g": 10,
        "fiber_g": 12,
        "sugar_g": 14,
        "sodium_mg": 80,
        "cholesterol_mg": 5
    },
    {
        "title": "Acai Bowl",
        "description": "Thick smoothie bowl with acai and tropical toppings",
        "image_url": "https://images.unsplash.com/photo-1590301157890-4810ed352733?w=800",
        "instructions": """1. Blend frozen acai with banana.
2. Add just enough liquid to blend thick.
3. Pour into bowl.
4. Arrange toppings artfully.
5. Add granola for crunch.
6. Drizzle with honey.
7. Eat immediately with spoon.""",
        "ingredients": [
            ("Frozen acai", 200, "g", "packs"),
            ("Banana", 1, "whole", "frozen"),
            ("Almond milk", 60, "ml", None),
            ("Granola", 45, "g", None),
            ("Fresh berries", 100, "g", None),
            ("Coconut flakes", 2, "tbsp", None),
            ("Honey", 1, "tbsp", None),
            ("Chia seeds", 1, "tbsp", None)
        ],
        "tags": ["Breakfast", "Healthy", "Vegan", "Superfood"],
        "cuisine": "Brazilian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 0,
        "servings": 1,
        "calories": 420,
        "protein_g": 8,
        "carbs_g": 68,
        "fat_g": 14,
        "fiber_g": 12,
        "sugar_g": 38,
        "sodium_mg": 60,
        "cholesterol_mg": 0
    },

    # ==================== FINAL 15 RECIPES ====================
    {
        "title": "Salmon Teriyaki",
        "description": "Glazed salmon with homemade teriyaki sauce",
        "image_url": "https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=800",
        "instructions": """1. Make teriyaki: soy sauce, mirin, sake, sugar.
2. Simmer until slightly thickened.
3. Pat salmon dry, season with salt.
4. Pan sear skin-side down 4 minutes.
5. Flip, brush with teriyaki.
6. Cook 3 more minutes, basting.
7. Serve over rice with extra sauce.""",
        "ingredients": [
            ("Salmon fillets", 600, "g", "4 pieces"),
            ("Soy sauce", 80, "ml", None),
            ("Mirin", 60, "ml", None),
            ("Sake", 60, "ml", None),
            ("Sugar", 3, "tbsp", None),
            ("Ginger", 1, "tbsp", "grated"),
            ("Sesame seeds", 1, "tbsp", None),
            ("Green onions", 2, "stalks", "sliced")
        ],
        "tags": ["Japanese", "Seafood", "Quick", "Healthy"],
        "cuisine": "Japanese",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 380,
        "protein_g": 34,
        "carbs_g": 16,
        "fat_g": 18,
        "fiber_g": 0,
        "sugar_g": 12,
        "sodium_mg": 920,
        "cholesterol_mg": 85
    },
    {
        "title": "Mushroom Risotto",
        "description": "Creamy Italian rice with mixed mushrooms",
        "image_url": "https://images.unsplash.com/photo-1476124369491-e7addf5db371?w=800",
        "instructions": """1. Soak dried porcini, reserve liquid.
2. Sauté fresh mushrooms, set aside.
3. Toast rice in butter 2 minutes.
4. Add wine, stir until absorbed.
5. Add warm stock ladle by ladle, stirring.
6. Add mushrooms and porcini near end.
7. Finish with butter and Parmesan.""",
        "ingredients": [
            ("Arborio rice", 350, "g", None),
            ("Mixed mushrooms", 400, "g", "cremini, shiitake"),
            ("Dried porcini", 30, "g", None),
            ("Chicken stock", 1200, "ml", "warm"),
            ("White wine", 120, "ml", "dry"),
            ("Parmesan", 100, "g", "grated"),
            ("Butter", 60, "g", None),
            ("Shallot", 2, "medium", "minced"),
            ("Fresh thyme", 2, "tsp", "chopped")
        ],
        "tags": ["Italian", "Rice", "Vegetarian", "Comfort Food"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 15,
        "cook_time_minutes": 30,
        "servings": 4,
        "calories": 480,
        "protein_g": 14,
        "carbs_g": 62,
        "fat_g": 18,
        "fiber_g": 3,
        "sugar_g": 3,
        "sodium_mg": 580,
        "cholesterol_mg": 45
    },
    {
        "title": "Beef Stir Fry",
        "description": "Quick beef and vegetable stir fry with oyster sauce",
        "image_url": "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800",
        "instructions": """1. Slice beef thin, marinate in soy and cornstarch.
2. Heat wok until smoking.
3. Sear beef quickly, remove.
4. Stir fry vegetables 2-3 minutes.
5. Return beef, add sauce.
6. Toss until coated.
7. Serve immediately over rice.""",
        "ingredients": [
            ("Beef sirloin", 400, "g", "thinly sliced"),
            ("Broccoli", 200, "g", "florets"),
            ("Bell peppers", 2, "medium", "sliced"),
            ("Oyster sauce", 3, "tbsp", None),
            ("Soy sauce", 2, "tbsp", None),
            ("Cornstarch", 1, "tbsp", None),
            ("Garlic", 4, "cloves", "minced"),
            ("Ginger", 1, "tbsp", "minced"),
            ("Vegetable oil", 3, "tbsp", None)
        ],
        "tags": ["Chinese", "Beef", "Quick", "Stir Fry"],
        "cuisine": "Chinese",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 320,
        "protein_g": 28,
        "carbs_g": 14,
        "fat_g": 18,
        "fiber_g": 3,
        "sugar_g": 5,
        "sodium_mg": 780,
        "cholesterol_mg": 75
    },
    {
        "title": "Chicken Curry",
        "description": "Simple home-style curry with tender chicken",
        "image_url": "https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=800",
        "instructions": """1. Sauté onions until golden.
2. Add ginger, garlic, cook 1 minute.
3. Add curry powder, cumin, turmeric.
4. Add chicken, brown lightly.
5. Add tomatoes and coconut milk.
6. Simmer 25 minutes until chicken cooked.
7. Garnish with cilantro, serve with naan.""",
        "ingredients": [
            ("Chicken thighs", 600, "g", "boneless, cubed"),
            ("Coconut milk", 400, "ml", None),
            ("Diced tomatoes", 400, "g", None),
            ("Onion", 1, "large", "diced"),
            ("Curry powder", 3, "tbsp", None),
            ("Garlic", 4, "cloves", "minced"),
            ("Ginger", 1, "tbsp", "grated"),
            ("Fresh cilantro", 0.25, "cup", "chopped"),
            ("Vegetable oil", 2, "tbsp", None)
        ],
        "tags": ["Indian", "Chicken", "Curry", "Comfort Food"],
        "cuisine": "Indian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 35,
        "servings": 4,
        "calories": 420,
        "protein_g": 32,
        "carbs_g": 16,
        "fat_g": 26,
        "fiber_g": 4,
        "sugar_g": 6,
        "sodium_mg": 520,
        "cholesterol_mg": 125
    },
    {
        "title": "Vegetable Lo Mein",
        "description": "Stir-fried noodles with vegetables in savory sauce",
        "image_url": "https://images.unsplash.com/photo-1534939561126-855b8675edd7?w=800",
        "instructions": """1. Cook noodles, drain and toss with oil.
2. Make sauce: soy, oyster sauce, sesame oil.
3. Heat wok, stir fry vegetables.
4. Add noodles and sauce.
5. Toss until well combined and hot.
6. Add bean sprouts at end.
7. Garnish with green onions.""",
        "ingredients": [
            ("Lo mein noodles", 400, "g", None),
            ("Mixed vegetables", 400, "g", "cabbage, carrots, bok choy"),
            ("Soy sauce", 4, "tbsp", None),
            ("Oyster sauce", 2, "tbsp", None),
            ("Sesame oil", 1, "tbsp", None),
            ("Bean sprouts", 100, "g", None),
            ("Garlic", 3, "cloves", "minced"),
            ("Green onions", 4, "stalks", "sliced"),
            ("Vegetable oil", 3, "tbsp", None)
        ],
        "tags": ["Chinese", "Noodles", "Vegetarian", "Quick"],
        "cuisine": "Chinese",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 380,
        "protein_g": 12,
        "carbs_g": 56,
        "fat_g": 12,
        "fiber_g": 4,
        "sugar_g": 6,
        "sodium_mg": 920,
        "cholesterol_mg": 0
    },
    {
        "title": "Shakshuka with Feta",
        "description": "Eggs poached in spiced tomato sauce with crumbled feta",
        "image_url": "https://images.unsplash.com/photo-1590412200988-a436970781fa?w=800",
        "instructions": """1. Sauté onion and bell peppers.
2. Add garlic, cumin, paprika, cayenne.
3. Add tomatoes, simmer 10 minutes.
4. Make wells, crack in eggs.
5. Cover, cook until whites set.
6. Crumble feta over top.
7. Garnish with parsley, serve with bread.""",
        "ingredients": [
            ("Eggs", 6, "whole", None),
            ("Crushed tomatoes", 800, "g", None),
            ("Red bell pepper", 2, "medium", "diced"),
            ("Onion", 1, "medium", "diced"),
            ("Feta cheese", 100, "g", "crumbled"),
            ("Garlic", 4, "cloves", "minced"),
            ("Cumin", 2, "tsp", None),
            ("Paprika", 2, "tsp", None),
            ("Olive oil", 3, "tbsp", None),
            ("Fresh parsley", 0.25, "cup", "chopped")
        ],
        "tags": ["Middle Eastern", "Eggs", "Breakfast", "Vegetarian"],
        "cuisine": "Middle Eastern",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 25,
        "servings": 4,
        "calories": 320,
        "protein_g": 18,
        "carbs_g": 18,
        "fat_g": 22,
        "fiber_g": 4,
        "sugar_g": 10,
        "sodium_mg": 680,
        "cholesterol_mg": 295
    },
    {
        "title": "Crispy Tofu Bowl",
        "description": "Crispy baked tofu with vegetables and peanut sauce",
        "image_url": "https://images.unsplash.com/photo-1546793665-c74683f339c1?w=800",
        "instructions": """1. Press tofu 30 minutes to remove water.
2. Cube and toss with cornstarch, soy sauce.
3. Bake at 400°F until crispy.
4. Prep vegetables and rice.
5. Make peanut sauce: peanut butter, soy, lime, sriracha.
6. Assemble bowls: rice, veggies, tofu.
7. Drizzle with peanut sauce.""",
        "ingredients": [
            ("Extra-firm tofu", 400, "g", "pressed"),
            ("Brown rice", 300, "g", "cooked"),
            ("Edamame", 150, "g", None),
            ("Cucumber", 1, "medium", "sliced"),
            ("Carrots", 2, "medium", "shredded"),
            ("Peanut butter", 60, "g", None),
            ("Soy sauce", 3, "tbsp", None),
            ("Cornstarch", 3, "tbsp", None),
            ("Lime juice", 2, "tbsp", None),
            ("Sriracha", 1, "tsp", None)
        ],
        "tags": ["Vegan", "Bowl", "Healthy", "High Protein"],
        "cuisine": "Asian",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 30,
        "servings": 4,
        "calories": 420,
        "protein_g": 22,
        "carbs_g": 46,
        "fat_g": 18,
        "fiber_g": 6,
        "sugar_g": 5,
        "sodium_mg": 620,
        "cholesterol_mg": 0
    },
    {
        "title": "BBQ Chicken Pizza",
        "description": "Homemade pizza with BBQ sauce, chicken, and red onion",
        "image_url": "https://images.unsplash.com/photo-1513104890138-7c749659a591?w=800",
        "instructions": """1. Roll out pizza dough.
2. Spread BBQ sauce as base.
3. Top with mozzarella.
4. Add shredded chicken and red onion.
5. Bake at 475°F for 12-15 minutes.
6. Drizzle with more BBQ sauce.
7. Top with fresh cilantro.""",
        "ingredients": [
            ("Pizza dough", 400, "g", None),
            ("BBQ sauce", 150, "g", None),
            ("Mozzarella", 250, "g", "shredded"),
            ("Chicken breast", 300, "g", "cooked, shredded"),
            ("Red onion", 1, "small", "thinly sliced"),
            ("Fresh cilantro", 0.25, "cup", "chopped"),
            ("Olive oil", 1, "tbsp", None)
        ],
        "tags": ["Pizza", "Chicken", "BBQ", "American"],
        "cuisine": "American",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 15,
        "cook_time_minutes": 15,
        "servings": 4,
        "calories": 480,
        "protein_g": 28,
        "carbs_g": 52,
        "fat_g": 18,
        "fiber_g": 2,
        "sugar_g": 12,
        "sodium_mg": 780,
        "cholesterol_mg": 75
    },
    {
        "title": "Shrimp Fried Rice",
        "description": "Classic Chinese fried rice with shrimp and vegetables",
        "image_url": "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800",
        "instructions": """1. Use cold, day-old rice.
2. Cook shrimp, set aside.
3. Scramble eggs, set aside.
4. Stir fry vegetables quickly.
5. Add rice, break up clumps.
6. Season with soy sauce.
7. Return shrimp and eggs, toss well.""",
        "ingredients": [
            ("Cooked rice", 600, "g", "cold, day-old"),
            ("Shrimp", 300, "g", "peeled"),
            ("Eggs", 3, "whole", None),
            ("Green peas", 100, "g", None),
            ("Carrots", 1, "medium", "diced small"),
            ("Soy sauce", 3, "tbsp", None),
            ("Sesame oil", 1, "tbsp", None),
            ("Green onions", 4, "stalks", "sliced"),
            ("Vegetable oil", 3, "tbsp", None)
        ],
        "tags": ["Chinese", "Seafood", "Rice", "Quick"],
        "cuisine": "Chinese",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 10,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 420,
        "protein_g": 22,
        "carbs_g": 52,
        "fat_g": 14,
        "fiber_g": 3,
        "sugar_g": 4,
        "sodium_mg": 780,
        "cholesterol_mg": 225
    },
    {
        "title": "Fish and Chips",
        "description": "British classic - beer-battered fish with thick-cut fries",
        "image_url": "https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=800",
        "instructions": """1. Cut potatoes into thick chips, soak in water.
2. Make batter: flour, beer, baking powder.
3. Double fry chips: 300°F then 375°F.
4. Dip fish in batter.
5. Fry fish until golden and crispy.
6. Season chips with salt.
7. Serve with malt vinegar and tartar sauce.""",
        "ingredients": [
            ("Cod fillets", 600, "g", None),
            ("Potatoes", 800, "g", "russet"),
            ("All-purpose flour", 200, "g", None),
            ("Beer", 250, "ml", "lager"),
            ("Baking powder", 1, "tsp", None),
            ("Vegetable oil", 1, "L", "for frying"),
            ("Malt vinegar", 60, "ml", "for serving"),
            ("Salt", 1, "tsp", None)
        ],
        "tags": ["British", "Seafood", "Fried", "Classic"],
        "cuisine": "British",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 30,
        "servings": 4,
        "calories": 620,
        "protein_g": 32,
        "carbs_g": 58,
        "fat_g": 28,
        "fiber_g": 4,
        "sugar_g": 2,
        "sodium_mg": 620,
        "cholesterol_mg": 75
    },
    {
        "title": "Chicken Souvlaki",
        "description": "Greek grilled chicken skewers with tzatziki",
        "image_url": "https://images.unsplash.com/photo-1529563021893-cc83c992d75d?w=800",
        "instructions": """1. Marinate chicken in olive oil, lemon, oregano, garlic.
2. Thread onto skewers.
3. Grill over high heat 4 minutes per side.
4. Warm pita bread.
5. Make tzatziki with yogurt, cucumber, dill.
6. Serve chicken in pita with tzatziki.
7. Add tomatoes, onions, lettuce.""",
        "ingredients": [
            ("Chicken breast", 600, "g", "cubed"),
            ("Pita bread", 4, "whole", None),
            ("Greek yogurt", 200, "g", "for tzatziki"),
            ("Cucumber", 1, "medium", "for tzatziki"),
            ("Lemon juice", 60, "ml", None),
            ("Olive oil", 60, "ml", None),
            ("Dried oregano", 2, "tsp", None),
            ("Garlic", 4, "cloves", "minced"),
            ("Tomatoes", 2, "medium", "sliced"),
            ("Red onion", 0.5, "medium", "sliced")
        ],
        "tags": ["Greek", "Chicken", "Grilled", "Mediterranean"],
        "cuisine": "Greek",
        "category": "meal",
        "difficulty": "easy",
        "prep_time_minutes": 20,
        "cook_time_minutes": 10,
        "servings": 4,
        "calories": 420,
        "protein_g": 38,
        "carbs_g": 32,
        "fat_g": 16,
        "fiber_g": 2,
        "sugar_g": 5,
        "sodium_mg": 520,
        "cholesterol_mg": 95
    },
    {
        "title": "Pasta alla Norma",
        "description": "Sicilian pasta with eggplant, tomatoes, and ricotta salata",
        "image_url": "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=800",
        "instructions": """1. Cube and salt eggplant, let drain.
2. Fry eggplant until golden, drain.
3. Sauté garlic in olive oil.
4. Add tomatoes, basil, simmer 15 minutes.
5. Cook pasta al dente.
6. Toss pasta with sauce and eggplant.
7. Top with shaved ricotta salata.""",
        "ingredients": [
            ("Rigatoni", 400, "g", None),
            ("Eggplant", 500, "g", "cubed"),
            ("San Marzano tomatoes", 800, "g", "crushed"),
            ("Ricotta salata", 100, "g", "shaved"),
            ("Fresh basil", 0.5, "cup", "torn"),
            ("Garlic", 4, "cloves", "sliced"),
            ("Olive oil", 80, "ml", None),
            ("Red chili flakes", 0.5, "tsp", None),
            ("Salt", 1, "tsp", None)
        ],
        "tags": ["Italian", "Pasta", "Vegetarian", "Sicilian"],
        "cuisine": "Italian",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 25,
        "servings": 4,
        "calories": 480,
        "protein_g": 14,
        "carbs_g": 68,
        "fat_g": 18,
        "fiber_g": 6,
        "sugar_g": 10,
        "sodium_mg": 580,
        "cholesterol_mg": 15
    },
    {
        "title": "Banh Xeo",
        "description": "Vietnamese crispy crepes with shrimp and pork",
        "image_url": "https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=800",
        "instructions": """1. Make batter: rice flour, turmeric, coconut milk.
2. Let rest 30 minutes.
3. Cook pork and shrimp.
4. Pour thin layer of batter in hot pan.
5. Add fillings to one half.
6. Cook until crispy, fold over.
7. Serve with lettuce and nuoc cham.""",
        "ingredients": [
            ("Rice flour", 200, "g", None),
            ("Coconut milk", 200, "ml", None),
            ("Shrimp", 200, "g", "peeled"),
            ("Pork belly", 150, "g", "sliced thin"),
            ("Bean sprouts", 150, "g", None),
            ("Turmeric", 1, "tsp", None),
            ("Green onions", 4, "stalks", "sliced"),
            ("Lettuce", 1, "head", "for wrapping"),
            ("Nuoc cham", 100, "ml", "dipping sauce")
        ],
        "tags": ["Vietnamese", "Crepe", "Seafood", "Crispy"],
        "cuisine": "Vietnamese",
        "category": "meal",
        "difficulty": "medium",
        "prep_time_minutes": 20,
        "cook_time_minutes": 25,
        "servings": 4,
        "calories": 380,
        "protein_g": 22,
        "carbs_g": 36,
        "fat_g": 18,
        "fiber_g": 2,
        "sugar_g": 4,
        "sodium_mg": 720,
        "cholesterol_mg": 145
    },
    {
        "title": "Mango Sticky Rice",
        "description": "Thai dessert with sweet coconut rice and fresh mango",
        "image_url": "https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=800",
        "instructions": """1. Soak sticky rice overnight.
2. Steam rice 25 minutes.
3. Make coconut sauce: coconut milk, sugar, salt.
4. Mix half the sauce into warm rice.
5. Let rice absorb sauce 30 minutes.
6. Slice ripe mangoes.
7. Serve rice with mango, drizzle remaining sauce.""",
        "ingredients": [
            ("Sticky rice", 300, "g", "glutinous"),
            ("Coconut milk", 400, "ml", None),
            ("Sugar", 100, "g", None),
            ("Ripe mangoes", 2, "whole", "sliced"),
            ("Salt", 0.5, "tsp", None),
            ("Sesame seeds", 1, "tbsp", "toasted, optional")
        ],
        "tags": ["Thai", "Dessert", "Sweet", "Mango"],
        "cuisine": "Thai",
        "category": "dessert",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 25,
        "servings": 4,
        "calories": 380,
        "protein_g": 5,
        "carbs_g": 68,
        "fat_g": 12,
        "fiber_g": 3,
        "sugar_g": 38,
        "sodium_mg": 320,
        "cholesterol_mg": 0
    },
    {
        "title": "Chocolate Mousse",
        "description": "Light and airy French chocolate dessert",
        "image_url": "https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=800",
        "instructions": """1. Melt chocolate with butter.
2. Whisk egg yolks with half the sugar.
3. Combine chocolate with yolk mixture.
4. Whip cream to soft peaks.
5. Whip egg whites with remaining sugar.
6. Fold cream then whites into chocolate.
7. Chill at least 4 hours before serving.""",
        "ingredients": [
            ("Dark chocolate", 200, "g", "70% cocoa"),
            ("Eggs", 4, "whole", "separated"),
            ("Heavy cream", 200, "ml", None),
            ("Sugar", 60, "g", None),
            ("Butter", 30, "g", None),
            ("Vanilla extract", 1, "tsp", None),
            ("Salt", 1, "pinch", None)
        ],
        "tags": ["French", "Dessert", "Chocolate", "Elegant"],
        "cuisine": "French",
        "category": "dessert",
        "difficulty": "medium",
        "prep_time_minutes": 30,
        "cook_time_minutes": 10,
        "servings": 6,
        "calories": 380,
        "protein_g": 6,
        "carbs_g": 28,
        "fat_g": 28,
        "fiber_g": 3,
        "sugar_g": 22,
        "sodium_mg": 65,
        "cholesterol_mg": 175
    },
]


def get_or_create_ingredient(db: Session, name: str) -> Ingredient:
    """Get existing or create new ingredient"""
    ingredient = db.query(Ingredient).filter(Ingredient.name == name).first()
    if not ingredient:
        ingredient = Ingredient(name=name)
        db.add(ingredient)
        db.flush()
    return ingredient


def get_or_create_tag(db: Session, user_id: int, name: str) -> Tag:
    """Get existing or create new tag for user"""
    tag = db.query(Tag).filter(Tag.user_id == user_id, Tag.name == name).first()
    if not tag:
        tag = Tag(user_id=user_id, name=name)
        db.add(tag)
        db.flush()
    return tag


def seed_library(db: Session):
    """Seed the recipe library with public recipes"""

    # Create or get library user (system user for public recipes)
    library_user = db.query(User).filter(User.email == "library@foood.it.com").first()
    if not library_user:
        library_user = User(
            name="Foood Library",
            email="library@foood.it.com",
            password_hash=hash_password("library-system-user-2024"),
            email_verified=True,
            onboarding_completed=True
        )
        db.add(library_user)
        db.commit()
        db.refresh(library_user)
        print(f"Created library user: {library_user.email}")

    # Add recipes
    recipes_added = 0
    for recipe_data in RECIPES:
        # Check if recipe already exists
        existing = db.query(Recipe).filter(
            Recipe.slug == generate_slug(recipe_data["title"])
        ).first()

        if existing:
            print(f"Recipe already exists: {recipe_data['title']}")
            continue

        # Create recipe
        recipe = Recipe(
            user_id=library_user.id,
            title=recipe_data["title"],
            slug=generate_slug(recipe_data["title"]),
            description=recipe_data["description"],
            image_url=recipe_data["image_url"],
            instructions=recipe_data["instructions"],
            calories=recipe_data.get("calories"),
            protein_g=recipe_data.get("protein_g"),
            carbs_g=recipe_data.get("carbs_g"),
            fat_g=recipe_data.get("fat_g"),
            fiber_g=recipe_data.get("fiber_g"),
            sugar_g=recipe_data.get("sugar_g"),
            sodium_mg=recipe_data.get("sodium_mg"),
            cholesterol_mg=recipe_data.get("cholesterol_mg"),
            servings=recipe_data.get("servings", 4),
            prep_time_minutes=recipe_data.get("prep_time_minutes"),
            cook_time_minutes=recipe_data.get("cook_time_minutes"),
            difficulty=recipe_data.get("difficulty"),
            cuisine=recipe_data.get("cuisine"),
            category=recipe_data.get("category", "meal"),
            is_public=True,
            source="library"
        )
        db.add(recipe)
        db.flush()

        # Add ingredients
        for ing_data in recipe_data.get("ingredients", []):
            name, quantity, unit, note = ing_data
            ingredient = get_or_create_ingredient(db, name)
            recipe_ingredient = RecipeIngredient(
                recipe_id=recipe.id,
                ingredient_id=ingredient.id,
                quantity=quantity,
                unit=unit,
                note=note
            )
            db.add(recipe_ingredient)

        # Add tags
        for tag_name in recipe_data.get("tags", []):
            tag = get_or_create_tag(db, library_user.id, tag_name)
            recipe.tags.append(tag)

        recipes_added += 1
        print(f"Added recipe: {recipe.title}")

    db.commit()
    print(f"\nSuccessfully added {recipes_added} recipes to the library!")
    return recipes_added


def main():
    """Main function to run the seeding"""
    print("Starting Foood Recipe Library Seeding...")
    print("=" * 50)

    db = SessionLocal()
    try:
        count = seed_library(db)
        print("=" * 50)
        print(f"Seeding complete! Total recipes in library: {count}")
    except Exception as e:
        print(f"Error during seeding: {e}")
        db.rollback()
        raise
    finally:
        db.close()


if __name__ == "__main__":
    main()
