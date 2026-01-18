"""
Seed script to populate the database with demo users and real recipes.
Run from backend folder: python -m scripts.seed_database
"""
import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from app.db.session import SessionLocal, engine
from app.db.base import Base
from app.models.user import User
from app.models.recipe import Recipe
from app.models.ingredient import Ingredient
from app.models.recipe_ingredient import RecipeIngredient
from app.models.tag import Tag
from app.core.security import hash_password

# Create all tables
Base.metadata.create_all(bind=engine)

# Demo Users
DEMO_USERS = [
    {
        "name": "Chef Maria",
        "email": "maria@foood.it.com",
        "password": "demo123"
    },
    {
        "name": "Home Cook John",
        "email": "john@foood.it.com",
        "password": "demo123"
    },
    {
        "name": "Healthy Eater Sarah",
        "email": "sarah@foood.it.com",
        "password": "demo123"
    }
]

# Real Recipes with Unsplash images (free to use)
RECIPES = [
    {
        "title": "Classic Spaghetti Carbonara",
        "description": "A traditional Italian pasta dish from Rome made with eggs, cheese, pancetta, and black pepper. Creamy without any cream!",
        "image_url": "https://images.unsplash.com/photo-1612874742237-6526221588e3?w=800",
        "instructions": """1. Bring a large pot of salted water to boil. Cook spaghetti according to package directions until al dente.

2. While pasta cooks, cut the pancetta into small cubes and cook in a large skillet over medium heat until crispy, about 8 minutes. Remove from heat.

3. In a bowl, whisk together eggs, egg yolks, grated Pecorino Romano, and Parmesan. Season with black pepper.

4. Reserve 1 cup pasta water, then drain spaghetti. Add hot pasta to the skillet with pancetta (off heat).

5. Quickly pour egg mixture over pasta, tossing constantly. The residual heat will cook the eggs into a creamy sauce. Add pasta water as needed.

6. Serve immediately with extra cheese and black pepper.""",
        "ingredients": [
            ("Spaghetti", 400, "g", None),
            ("Pancetta", 200, "g", "or guanciale"),
            ("Eggs", 4, "whole", "room temperature"),
            ("Egg yolks", 2, "whole", None),
            ("Pecorino Romano", 100, "g", "freshly grated"),
            ("Parmesan cheese", 50, "g", "freshly grated"),
            ("Black pepper", 2, "tsp", "freshly ground"),
            ("Salt", None, "to taste", None)
        ],
        "tags": ["Italian", "Pasta", "Quick", "Dinner"]
    },
    {
        "title": "Thai Green Curry with Chicken",
        "description": "A fragrant and spicy Thai curry with tender chicken, vegetables, and aromatic herbs in creamy coconut milk.",
        "image_url": "https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=800",
        "instructions": """1. Heat oil in a wok or large pan over high heat. Add green curry paste and fry for 1 minute until fragrant.

2. Add chicken pieces and stir-fry for 3-4 minutes until no longer pink on the outside.

3. Pour in coconut milk and bring to a simmer. Add fish sauce and palm sugar.

4. Add bamboo shoots, Thai eggplant, and bell peppers. Simmer for 10 minutes.

5. Add Thai basil leaves and kaffir lime leaves in the last minute of cooking.

6. Taste and adjust seasoning. Serve over jasmine rice with fresh Thai basil.""",
        "ingredients": [
            ("Chicken breast", 500, "g", "sliced"),
            ("Green curry paste", 3, "tbsp", None),
            ("Coconut milk", 400, "ml", "full fat"),
            ("Fish sauce", 2, "tbsp", None),
            ("Palm sugar", 1, "tbsp", "or brown sugar"),
            ("Thai eggplant", 100, "g", "quartered"),
            ("Bamboo shoots", 100, "g", "sliced"),
            ("Bell pepper", 1, "whole", "sliced"),
            ("Thai basil", 1, "cup", "fresh leaves"),
            ("Kaffir lime leaves", 4, "leaves", "torn"),
            ("Vegetable oil", 2, "tbsp", None)
        ],
        "tags": ["Thai", "Curry", "Spicy", "Asian"]
    },
    {
        "title": "Classic Beef Burger",
        "description": "The ultimate juicy homemade beef burger with all the classic toppings. Perfect for summer grilling or weeknight dinners.",
        "image_url": "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=800",
        "instructions": """1. In a large bowl, gently mix ground beef with salt, pepper, and Worcestershire sauce. Don't overwork the meat.

2. Divide into 4 equal portions and form patties slightly larger than your buns (they shrink when cooking). Make a small indent in the center.

3. Heat grill or cast iron pan to high heat. Cook patties for 4 minutes per side for medium, or until desired doneness.

4. In the last minute, add cheese slices on top and cover to melt.

5. Toast buns on the grill for 30 seconds.

6. Assemble: bottom bun, lettuce, tomato, patty with cheese, onion, pickles, sauce, top bun. Serve immediately.""",
        "ingredients": [
            ("Ground beef", 600, "g", "80/20 blend"),
            ("Burger buns", 4, "whole", "brioche or sesame"),
            ("Cheddar cheese", 4, "slices", None),
            ("Lettuce", 4, "leaves", "iceberg or romaine"),
            ("Tomato", 1, "large", "sliced"),
            ("Red onion", 1, "medium", "sliced into rings"),
            ("Pickles", 8, "slices", "dill pickles"),
            ("Worcestershire sauce", 1, "tbsp", None),
            ("Salt", 1, "tsp", None),
            ("Black pepper", 0.5, "tsp", None),
            ("Ketchup", None, "to taste", None),
            ("Mayonnaise", None, "to taste", None)
        ],
        "tags": ["American", "Burger", "Grilling", "Dinner"]
    },
    {
        "title": "Mediterranean Quinoa Salad",
        "description": "A fresh and healthy salad packed with protein-rich quinoa, colorful vegetables, feta cheese, and a zesty lemon dressing.",
        "image_url": "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800",
        "instructions": """1. Rinse quinoa under cold water. Cook in 2 cups water with a pinch of salt for 15 minutes until fluffy. Let cool.

2. While quinoa cools, prepare the dressing: whisk olive oil, lemon juice, garlic, oregano, salt, and pepper.

3. Dice cucumber, tomatoes, red onion, and bell pepper into similar-sized pieces.

4. In a large bowl, combine cooled quinoa with all vegetables.

5. Add olives, crumbled feta, and fresh herbs.

6. Pour dressing over salad and toss gently. Refrigerate for 30 minutes to let flavors meld.

7. Serve chilled or at room temperature. Keeps well for 3 days refrigerated.""",
        "ingredients": [
            ("Quinoa", 200, "g", "rinsed"),
            ("Cucumber", 1, "large", "diced"),
            ("Cherry tomatoes", 250, "g", "halved"),
            ("Red bell pepper", 1, "whole", "diced"),
            ("Red onion", 0.5, "whole", "finely diced"),
            ("Kalamata olives", 100, "g", "pitted"),
            ("Feta cheese", 150, "g", "crumbled"),
            ("Fresh parsley", 0.5, "cup", "chopped"),
            ("Fresh mint", 0.25, "cup", "chopped"),
            ("Olive oil", 60, "ml", "extra virgin"),
            ("Lemon juice", 3, "tbsp", "fresh"),
            ("Garlic", 1, "clove", "minced"),
            ("Dried oregano", 1, "tsp", None),
            ("Salt", None, "to taste", None),
            ("Black pepper", None, "to taste", None)
        ],
        "tags": ["Mediterranean", "Salad", "Healthy", "Vegetarian"]
    },
    {
        "title": "Japanese Chicken Katsu",
        "description": "Crispy panko-breaded chicken cutlet served with tonkatsu sauce and shredded cabbage. A Japanese comfort food classic.",
        "image_url": "https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800",
        "instructions": """1. Place chicken breasts between plastic wrap and pound to 1cm thickness for even cooking.

2. Set up breading station: flour in one dish, beaten eggs in another, panko breadcrumbs in third.

3. Season chicken with salt and pepper. Dredge in flour, dip in egg, then coat thoroughly in panko, pressing gently.

4. Heat oil in a deep pan to 170°C (340°F). The oil should be about 2cm deep.

5. Fry chicken for 4-5 minutes per side until golden brown and cooked through (internal temp 74°C/165°F).

6. Rest on wire rack for 2 minutes, then slice into strips.

7. Serve over rice with shredded cabbage, tonkatsu sauce, and Japanese mayo.""",
        "ingredients": [
            ("Chicken breast", 2, "large", "boneless, skinless"),
            ("Panko breadcrumbs", 200, "g", None),
            ("All-purpose flour", 100, "g", None),
            ("Eggs", 2, "whole", "beaten"),
            ("Vegetable oil", 500, "ml", "for frying"),
            ("Cabbage", 0.25, "head", "finely shredded"),
            ("Tonkatsu sauce", 4, "tbsp", None),
            ("Japanese rice", 2, "cups", "cooked"),
            ("Salt", None, "to taste", None),
            ("Black pepper", None, "to taste", None)
        ],
        "tags": ["Japanese", "Fried", "Comfort Food", "Dinner"]
    },
    {
        "title": "Classic French Onion Soup",
        "description": "Rich, deeply caramelized onion soup topped with crusty bread and melted Gruyère cheese. The ultimate comfort soup.",
        "image_url": "https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800",
        "instructions": """1. Slice onions into thin half-moons. Melt butter in a large Dutch oven over medium heat.

2. Add onions and cook for 45-60 minutes, stirring occasionally, until deeply caramelized and golden brown. Don't rush this step!

3. Add garlic and thyme, cook 1 minute. Sprinkle flour and stir for 1 minute.

4. Pour in wine and scrape up any browned bits. Add beef broth and bay leaves. Simmer 20 minutes.

5. Season with salt and pepper. Remove bay leaves and thyme.

6. Ladle soup into oven-safe bowls. Top with baguette slices and generous Gruyère cheese.

7. Broil until cheese is bubbly and golden, about 3-4 minutes. Serve immediately.""",
        "ingredients": [
            ("Yellow onions", 1.5, "kg", "about 6 large"),
            ("Butter", 60, "g", "unsalted"),
            ("Garlic", 4, "cloves", "minced"),
            ("Fresh thyme", 4, "sprigs", None),
            ("All-purpose flour", 2, "tbsp", None),
            ("Dry white wine", 250, "ml", None),
            ("Beef broth", 1.5, "L", "low sodium"),
            ("Bay leaves", 2, "whole", None),
            ("Baguette", 1, "whole", "sliced 1cm thick"),
            ("Gruyère cheese", 200, "g", "grated"),
            ("Salt", None, "to taste", None),
            ("Black pepper", None, "to taste", None)
        ],
        "tags": ["French", "Soup", "Comfort Food", "Winter"]
    },
    {
        "title": "Avocado Toast with Poached Eggs",
        "description": "The brunch classic done right - creamy avocado on toasted sourdough topped with perfectly poached eggs and everything bagel seasoning.",
        "image_url": "https://images.unsplash.com/photo-1525351484163-7529414344d8?w=800",
        "instructions": """1. Bring a pot of water to a gentle simmer. Add a splash of vinegar.

2. Crack each egg into a small cup. Create a gentle whirlpool in water and slide egg in. Poach for 3 minutes for runny yolk.

3. Meanwhile, toast sourdough bread until golden and crispy.

4. Cut avocados in half, remove pit. Scoop flesh into a bowl, add lemon juice, salt, and pepper. Mash to desired consistency.

5. Spread mashed avocado generously on toast.

6. Remove poached eggs with slotted spoon, pat dry, place on avocado toast.

7. Sprinkle with everything bagel seasoning, red pepper flakes, and microgreens. Drizzle with olive oil.""",
        "ingredients": [
            ("Sourdough bread", 4, "slices", "thick cut"),
            ("Avocados", 2, "ripe", None),
            ("Eggs", 4, "whole", "fresh"),
            ("Lemon juice", 1, "tbsp", None),
            ("Everything bagel seasoning", 2, "tsp", None),
            ("Red pepper flakes", 0.5, "tsp", None),
            ("Microgreens", 1, "handful", "optional"),
            ("Olive oil", 1, "tbsp", "extra virgin"),
            ("White vinegar", 1, "tbsp", "for poaching"),
            ("Salt", None, "to taste", None),
            ("Black pepper", None, "to taste", None)
        ],
        "tags": ["Breakfast", "Brunch", "Healthy", "Quick"]
    },
    {
        "title": "Chocolate Lava Cake",
        "description": "Decadent individual chocolate cakes with a warm, molten center. An impressive dessert that's surprisingly easy to make.",
        "image_url": "https://images.unsplash.com/photo-1624353365286-3f8d62daad51?w=800",
        "instructions": """1. Preheat oven to 220°C (425°F). Butter 4 ramekins and dust with cocoa powder.

2. Melt chocolate and butter together in microwave or double boiler. Stir until smooth. Let cool slightly.

3. In a bowl, whisk eggs, egg yolks, and sugar until thick and pale, about 2 minutes.

4. Fold chocolate mixture into egg mixture. Sift in flour and fold gently until just combined.

5. Divide batter among ramekins. (Can refrigerate up to 24 hours at this point.)

6. Bake for 12-14 minutes until edges are set but center is soft and jiggles.

7. Let cool 1 minute, then invert onto plates. Serve immediately with vanilla ice cream.""",
        "ingredients": [
            ("Dark chocolate", 200, "g", "70% cocoa, chopped"),
            ("Butter", 100, "g", "unsalted, plus extra for ramekins"),
            ("Eggs", 2, "whole", "room temperature"),
            ("Egg yolks", 2, "whole", None),
            ("Sugar", 100, "g", None),
            ("All-purpose flour", 50, "g", "sifted"),
            ("Cocoa powder", 1, "tbsp", "for dusting"),
            ("Vanilla ice cream", 4, "scoops", "for serving"),
            ("Powdered sugar", None, "for dusting", "optional")
        ],
        "tags": ["Dessert", "Chocolate", "French", "Special Occasion"]
    },
    {
        "title": "Homemade Margherita Pizza",
        "description": "Classic Neapolitan-style pizza with San Marzano tomatoes, fresh mozzarella, and fragrant basil on a crispy, chewy crust.",
        "image_url": "https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=800",
        "instructions": """1. For dough: Mix flour, yeast, salt. Add warm water and olive oil. Knead 10 minutes until smooth. Rise 1-2 hours.

2. Make sauce: Crush San Marzano tomatoes by hand, add salt, garlic, and olive oil. Don't cook it.

3. Preheat oven to highest setting (ideally 260°C/500°F) with pizza stone for 30 minutes.

4. Divide dough into 2 balls. Stretch each into 12-inch round, keeping edges thicker for crust.

5. Spread thin layer of sauce, leaving 1-inch border. Tear mozzarella and distribute evenly.

6. Slide onto hot stone. Bake 8-10 minutes until crust is charred in spots and cheese is bubbly.

7. Top with fresh basil leaves and drizzle of olive oil. Slice and serve immediately.""",
        "ingredients": [
            ("Bread flour", 500, "g", "or 00 flour"),
            ("Instant yeast", 7, "g", "1 packet"),
            ("Salt", 10, "g", None),
            ("Warm water", 325, "ml", "about 40°C"),
            ("Olive oil", 2, "tbsp", "plus more for drizzling"),
            ("San Marzano tomatoes", 400, "g", "canned, crushed"),
            ("Fresh mozzarella", 250, "g", "torn into pieces"),
            ("Fresh basil", 12, "leaves", None),
            ("Garlic", 1, "clove", "minced for sauce")
        ],
        "tags": ["Italian", "Pizza", "Dinner", "Vegetarian"]
    },
    {
        "title": "Honey Garlic Salmon",
        "description": "Tender, flaky salmon fillets glazed with a sweet and savory honey garlic sauce. Ready in just 20 minutes!",
        "image_url": "https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=800",
        "instructions": """1. Pat salmon fillets dry and season with salt and pepper.

2. Mix honey, soy sauce, minced garlic, rice vinegar, and sesame oil in a small bowl.

3. Heat olive oil in an oven-safe skillet over medium-high heat.

4. Place salmon skin-side up and sear for 3 minutes until golden crust forms.

5. Flip salmon, pour honey garlic sauce around fish. Transfer to 400°F (200°C) oven.

6. Bake 8-10 minutes until salmon flakes easily and sauce has thickened.

7. Garnish with sesame seeds and green onions. Serve with rice and steamed vegetables.""",
        "ingredients": [
            ("Salmon fillets", 4, "pieces", "about 170g each"),
            ("Honey", 60, "ml", None),
            ("Soy sauce", 60, "ml", "low sodium"),
            ("Garlic", 4, "cloves", "minced"),
            ("Rice vinegar", 1, "tbsp", None),
            ("Sesame oil", 1, "tsp", None),
            ("Olive oil", 2, "tbsp", None),
            ("Sesame seeds", 1, "tbsp", "for garnish"),
            ("Green onions", 2, "stalks", "sliced for garnish"),
            ("Salt", None, "to taste", None),
            ("Black pepper", None, "to taste", None)
        ],
        "tags": ["Seafood", "Healthy", "Quick", "Asian-Fusion"]
    }
]

def seed_database():
    db = SessionLocal()

    try:
        # Check if already seeded
        existing_users = db.query(User).filter(User.email.like("%@foood.it.com")).count()
        if existing_users > 0:
            print("Database already seeded! Skipping...")
            return

        print("Starting database seed...")

        # Create demo users
        users = []
        for user_data in DEMO_USERS:
            user = User(
                name=user_data["name"],
                email=user_data["email"],
                password_hash=hash_password(user_data["password"])
            )
            db.add(user)
            users.append(user)

        db.flush()  # Get user IDs
        print(f"Created {len(users)} demo users")

        # Create tags (unique)
        tag_names = set()
        for recipe in RECIPES:
            tag_names.update(recipe.get("tags", []))

        tags_map = {}
        for tag_name in tag_names:
            existing_tag = db.query(Tag).filter(Tag.name == tag_name, Tag.user_id == users[0].id).first()
            if not existing_tag:
                tag = Tag(name=tag_name, user_id=users[0].id)
                db.add(tag)
                tags_map[tag_name] = tag
            else:
                tags_map[tag_name] = existing_tag

        db.flush()
        print(f"Created {len(tag_names)} tags")

        # Create ingredients (unique)
        ingredients_map = {}
        for recipe in RECIPES:
            for ing_data in recipe["ingredients"]:
                ing_name = ing_data[0]
                if ing_name not in ingredients_map:
                    existing = db.query(Ingredient).filter(Ingredient.name == ing_name).first()
                    if not existing:
                        ingredient = Ingredient(name=ing_name)
                        db.add(ingredient)
                        ingredients_map[ing_name] = ingredient
                    else:
                        ingredients_map[ing_name] = existing

        db.flush()
        print(f"Created {len(ingredients_map)} ingredients")

        # Create recipes and associate ingredients
        recipes_created = 0
        for i, recipe_data in enumerate(RECIPES):
            # Distribute recipes among users
            user = users[i % len(users)]

            recipe = Recipe(
                user_id=user.id,
                title=recipe_data["title"],
                description=recipe_data["description"],
                image_url=recipe_data["image_url"],
                instructions=recipe_data["instructions"]
            )
            db.add(recipe)
            db.flush()

            # Add ingredients to recipe
            for ing_data in recipe_data["ingredients"]:
                ing_name, quantity, unit, note = ing_data
                ingredient = ingredients_map[ing_name]

                recipe_ingredient = RecipeIngredient(
                    recipe_id=recipe.id,
                    ingredient_id=ingredient.id,
                    quantity=quantity,
                    unit=unit,
                    note=note
                )
                db.add(recipe_ingredient)

            # Add tags to recipe
            for tag_name in recipe_data.get("tags", []):
                if tag_name in tags_map:
                    recipe.tags.append(tags_map[tag_name])

            recipes_created += 1

        db.commit()
        print(f"Created {recipes_created} recipes with ingredients and tags")
        print("\nDatabase seeded successfully!")
        print("\nDemo accounts:")
        for user in DEMO_USERS:
            print(f"  Email: {user['email']} | Password: {user['password']}")

    except Exception as e:
        db.rollback()
        print(f"Error seeding database: {e}")
        raise
    finally:
        db.close()

if __name__ == "__main__":
    seed_database()
