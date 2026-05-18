-- Foood Recipe Library Seed Data
-- Generated from seed_library.py
-- Library user ID: 3
-- Run via: psql DATABASE_URL -f seed_recipes.sql

BEGIN;

-- Create tags for library user (id=3)
-- Tags are user-specific, unique constraint on (user_id, name)
INSERT INTO tags (user_id, name) VALUES (3, 'American') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Anti-inflammatory') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Appetizer') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Asian') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Austrian') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'BBQ') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Baked') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Baking') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Bars') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Beef') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Bourbon') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Bowl') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Braised') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Breakfast') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'British') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Brunch') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Burger') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Caffeinated') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Cake') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Caribbean') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Casserole') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Cheese') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Cheesecake') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Chicken') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Chinese') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Chocolate') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Classic') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Cocktail') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Coffee') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Cold') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Comfort Food') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Cookies') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Creamy') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Crepe') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Crispy') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Cuban') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Curry') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Custard') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Dessert') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Dinner') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Dip') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Drink') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Dumplings') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Eggs') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Elegant') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Fall') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Filipino') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'French') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Fresh') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Fried') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Greek') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Grill') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Grilled') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Healthy') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'High Protein') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Hot') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Ice Cream') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Indian') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Indonesian') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Italian') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Japanese') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Keto') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Korean') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Lamb') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Lemon') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Lunch') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Mango') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Mediterranean') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Mexican') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Middle Eastern') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'No-Bake') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'No-Cook') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Noodles') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Nuts') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Party') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Pasta') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Pie') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Pizza') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Polish') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Pork') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Quick') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Ramen') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Refreshing') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Rice') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Rice Bowl') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Risotto') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Roasted') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Rum') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Russian') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Salad') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Sandwich') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Sauce') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Seafood') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Sicilian') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Slow Cooked') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Smoky') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Smoothie') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Snack') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Soup') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Southern') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Spanish') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Special Occasion') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Spiced') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Spicy') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Stir Fry') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Street Food') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Summer') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Superfood') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Sushi') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Sweet') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Tacos') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Tapas') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Tea') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Thai') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Thanksgiving') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Tofu') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Tropical') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Turkish') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Vegan') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Vegetarian') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Vietnamese') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Vodka') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Whiskey') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Winter') ON CONFLICT (user_id, name) DO NOTHING;
INSERT INTO tags (user_id, name) VALUES (3, 'Wrap') ON CONFLICT (user_id, name) DO NOTHING;

-- Insert recipes owned by library user
-- Recipe 1: Classic Spaghetti Carbonara
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Classic Spaghetti Carbonara',
    'classic-spaghetti-carbonara',
    'Traditional Roman pasta with eggs, pecorino cheese, guanciale, and black pepper',
    'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=800',
    '1. Bring a large pot of salted water to boil and cook spaghetti until al dente.
2. While pasta cooks, cut guanciale into small cubes and cook in a large pan until crispy.
3. In a bowl, whisk together eggs, egg yolks, pecorino, and black pepper.
4. Reserve 1 cup pasta water, then drain pasta.
5. Remove pan from heat, add pasta to guanciale, toss quickly.
6. Add egg mixture, tossing constantly. Add pasta water as needed for creamy consistency.
7. Serve immediately with extra pecorino and pepper.',
    'Italian',
    'meal',
    'medium',
    10,
    20,
    4,
    650,
    28,
    72,
    26,
    3,
    2,
    890,
    245,
    true,
    'library'
);

-- Recipe 2: Margherita Pizza
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Margherita Pizza',
    'margherita-pizza',
    'Classic Neapolitan pizza with San Marzano tomatoes, fresh mozzarella, and basil',
    'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=800',
    '1. Prepare pizza dough and let rise for 2 hours.
2. Preheat oven to 500°F (260°C) with pizza stone.
3. Crush San Marzano tomatoes by hand, season with salt.
4. Stretch dough into 12-inch circle.
5. Spread tomato sauce, leaving 1-inch border.
6. Tear mozzarella and distribute evenly.
7. Drizzle with olive oil.
8. Bake 8-10 minutes until crust is golden and cheese bubbles.
9. Top with fresh basil leaves and serve.',
    'Italian',
    'meal',
    'medium',
    120,
    10,
    2,
    420,
    18,
    48,
    16,
    3,
    4,
    720,
    45,
    true,
    'library'
);

-- Recipe 3: Chicken Parmesan
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Parmesan',
    'chicken-parmesan',
    'Crispy breaded chicken cutlets topped with marinara and melted mozzarella',
    'https://images.unsplash.com/photo-1632778149955-e80f8ceca2e8?w=800',
    '1. Pound chicken breasts to even thickness.
2. Set up breading station: flour, beaten eggs, breadcrumb-parmesan mixture.
3. Dredge chicken in flour, then egg, then breadcrumbs.
4. Heat oil in large pan, cook chicken 4-5 minutes per side until golden.
5. Transfer to baking dish, top with marinara and mozzarella.
6. Bake at 400°F for 15 minutes until cheese melts.
7. Garnish with fresh basil and serve over pasta.',
    'Italian',
    'meal',
    'medium',
    20,
    35,
    4,
    520,
    45,
    28,
    24,
    2,
    5,
    980,
    165,
    true,
    'library'
);

-- Recipe 4: Risotto alla Milanese
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Risotto alla Milanese',
    'risotto-alla-milanese',
    'Creamy saffron-infused risotto, a classic from Milan',
    'https://images.unsplash.com/photo-1476124369491-e7addf5db371?w=800',
    '1. Heat broth in saucepan, add saffron to steep.
2. Sauté onion in butter until soft.
3. Add rice, toast for 2 minutes.
4. Add wine, stir until absorbed.
5. Add warm broth one ladle at a time, stirring constantly.
6. Continue for 18-20 minutes until rice is creamy but al dente.
7. Remove from heat, stir in remaining butter and parmesan.
8. Season with salt and pepper, serve immediately.',
    'Italian',
    'meal',
    'hard',
    10,
    30,
    4,
    480,
    12,
    68,
    18,
    1,
    2,
    720,
    55,
    true,
    'library'
);

-- Recipe 5: Lasagna Bolognese
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Lasagna Bolognese',
    'lasagna-bolognese',
    'Layered pasta with rich meat sauce, béchamel, and parmesan',
    'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=800',
    '1. Make Bolognese sauce: brown meat, add vegetables, tomatoes, simmer 2 hours.
2. Make béchamel: melt butter, whisk in flour, gradually add milk, cook until thick.
3. Cook lasagna sheets until just pliable.
4. Layer in baking dish: sauce, pasta, béchamel, parmesan. Repeat 4 times.
5. Top with béchamel and extra parmesan.
6. Bake at 375°F for 45 minutes until golden and bubbling.
7. Rest 15 minutes before serving.',
    'Italian',
    'meal',
    'hard',
    45,
    180,
    8,
    580,
    32,
    45,
    28,
    4,
    8,
    850,
    95,
    true,
    'library'
);

-- Recipe 6: Caprese Salad
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Caprese Salad',
    'caprese-salad',
    'Fresh tomatoes, mozzarella, and basil drizzled with olive oil',
    'https://images.unsplash.com/photo-1592417817098-8fd3d9eb14a5?w=800',
    '1. Slice tomatoes and mozzarella into 1/4-inch rounds.
2. Arrange alternating slices on a platter.
3. Tuck fresh basil leaves between slices.
4. Drizzle generously with olive oil.
5. Season with flaky sea salt and black pepper.
6. Optional: add balsamic glaze.
7. Serve immediately at room temperature.',
    'Italian',
    'meal',
    'easy',
    10,
    NULL,
    4,
    240,
    14,
    6,
    18,
    1,
    4,
    380,
    45,
    true,
    'library'
);

-- Recipe 7: Penne Arrabbiata
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Penne Arrabbiata',
    'penne-arrabbiata',
    'Spicy tomato sauce pasta with garlic and red chili flakes',
    'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=800',
    '1. Cook penne in salted boiling water until al dente.
2. Sauté garlic and chili flakes in olive oil until fragrant.
3. Add crushed tomatoes, salt, and simmer 15 minutes.
4. Drain pasta, add to sauce, toss well.
5. Finish with fresh parsley and parmesan.
6. Serve hot.',
    'Italian',
    'meal',
    'easy',
    10,
    20,
    4,
    420,
    14,
    68,
    12,
    4,
    6,
    520,
    8,
    true,
    'library'
);

-- Recipe 8: Osso Buco
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Osso Buco',
    'osso-buco',
    'Braised veal shanks in white wine with gremolata',
    'https://images.unsplash.com/photo-1544025162-d76694265947?w=800',
    '1. Season veal shanks with salt and pepper, dredge in flour.
2. Brown shanks in olive oil on all sides, set aside.
3. Sauté onion, carrot, celery until soft.
4. Add garlic, tomato paste, cook 1 minute.
5. Add wine, broth, tomatoes, return shanks.
6. Cover and braise at 325°F for 2 hours.
7. Make gremolata: mix parsley, lemon zest, garlic.
8. Serve shanks with gremolata, traditionally over risotto.',
    'Italian',
    'meal',
    'hard',
    30,
    150,
    4,
    480,
    52,
    12,
    22,
    3,
    5,
    680,
    165,
    true,
    'library'
);

-- Recipe 9: Tiramisu
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Tiramisu',
    'tiramisu',
    'Classic Italian coffee-flavored layered dessert with mascarpone',
    'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=800',
    '1. Brew strong espresso, mix with Marsala, let cool.
2. Whisk egg yolks with sugar until pale and thick.
3. Add mascarpone, mix until smooth.
4. Whip cream to soft peaks, fold into mascarpone mixture.
5. Dip ladyfingers in coffee mixture, layer in dish.
6. Spread half mascarpone cream over ladyfingers.
7. Repeat layers.
8. Refrigerate 6 hours or overnight.
9. Dust with cocoa powder before serving.',
    'Italian',
    'dessert',
    'medium',
    30,
    NULL,
    8,
    380,
    7,
    32,
    24,
    NULL,
    22,
    85,
    165,
    true,
    'library'
);

-- Recipe 10: Bruschetta al Pomodoro
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Bruschetta al Pomodoro',
    'bruschetta-al-pomodoro',
    'Toasted bread topped with fresh tomato, basil, and garlic',
    'https://images.unsplash.com/photo-1572695157366-5e585ab2b69f?w=800',
    '1. Dice tomatoes, remove excess seeds.
2. Mix tomatoes with minced garlic, torn basil, olive oil.
3. Season with salt and pepper, let marinate 15 minutes.
4. Toast or grill bread slices until golden.
5. Rub warm bread with cut garlic clove.
6. Top generously with tomato mixture.
7. Drizzle with extra olive oil, serve immediately.',
    'Italian',
    'snack',
    'easy',
    15,
    5,
    4,
    180,
    4,
    22,
    9,
    2,
    3,
    280,
    NULL,
    true,
    'library'
);

-- Recipe 11: Kung Pao Chicken
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Kung Pao Chicken',
    'kung-pao-chicken',
    'Spicy Sichuan stir-fry with chicken, peanuts, and dried chilies',
    'https://images.unsplash.com/photo-1525755662778-989d0524087e?w=800',
    '1. Cut chicken into 1-inch cubes, marinate in soy sauce and cornstarch.
2. Mix sauce: soy sauce, vinegar, sugar, sesame oil, cornstarch.
3. Heat wok until smoking, add oil.
4. Stir-fry dried chilies and Sichuan peppercorns until fragrant.
5. Add chicken, cook until golden.
6. Add garlic, ginger, stir 30 seconds.
7. Pour in sauce, add peanuts, toss until glossy.
8. Garnish with green onions, serve with rice.',
    'Chinese',
    'meal',
    'medium',
    20,
    15,
    4,
    380,
    32,
    18,
    22,
    2,
    6,
    920,
    85,
    true,
    'library'
);

-- Recipe 12: Beef and Broccoli
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Beef and Broccoli',
    'beef-and-broccoli',
    'Classic Chinese-American stir-fry in savory brown sauce',
    'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800',
    '1. Slice beef against the grain, marinate in soy sauce and cornstarch.
2. Blanch broccoli florets for 2 minutes, drain.
3. Mix sauce: oyster sauce, soy sauce, broth, cornstarch.
4. Heat wok, sear beef in batches until browned, set aside.
5. Add garlic and ginger, stir 30 seconds.
6. Add broccoli, toss briefly.
7. Return beef, pour in sauce, cook until thickened.
8. Serve over steamed rice.',
    'Chinese',
    'meal',
    'easy',
    15,
    15,
    4,
    340,
    30,
    14,
    18,
    3,
    4,
    880,
    75,
    true,
    'library'
);

-- Recipe 13: Sweet and Sour Pork
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Sweet and Sour Pork',
    'sweet-and-sour-pork',
    'Crispy pork pieces in tangy pineapple sauce with bell peppers',
    'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=800',
    '1. Cut pork into 1-inch cubes, season with salt.
2. Coat in cornstarch, then egg, then cornstarch again.
3. Deep fry at 350°F until golden and crispy.
4. Sauté bell peppers and onion until crisp-tender.
5. Add pineapple chunks and juice.
6. Mix sauce: ketchup, vinegar, sugar, soy sauce. Add to wok.
7. Add fried pork, toss to coat.
8. Serve immediately over rice.',
    'Chinese',
    'meal',
    'medium',
    25,
    20,
    4,
    520,
    26,
    48,
    24,
    2,
    28,
    780,
    115,
    true,
    'library'
);

-- Recipe 14: Fried Rice
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Fried Rice',
    'fried-rice',
    'Classic Chinese fried rice with eggs, vegetables, and soy sauce',
    'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800',
    '1. Use day-old cold rice for best results.
2. Beat eggs, scramble in wok, set aside.
3. Stir-fry vegetables until crisp-tender.
4. Add rice, break up clumps, stir-fry 3-4 minutes.
5. Push rice to sides, add soy sauce in center, mix through.
6. Return eggs, add green onions.
7. Season with white pepper and sesame oil.
8. Serve hot.',
    'Chinese',
    'meal',
    'easy',
    10,
    10,
    4,
    320,
    10,
    48,
    10,
    2,
    3,
    680,
    140,
    true,
    'library'
);

-- Recipe 15: Mapo Tofu
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Mapo Tofu',
    'mapo-tofu',
    'Spicy Sichuan tofu dish with ground pork and fermented black beans',
    'https://images.unsplash.com/photo-1582452932084-a36e3f3c7f4f?w=800',
    '1. Cut tofu into 1-inch cubes, blanch in salted water 2 minutes.
2. Brown ground pork in wok, breaking into small pieces.
3. Add doubanjiang, fermented black beans, stir until fragrant.
4. Add garlic, ginger, cook 30 seconds.
5. Add broth, bring to simmer.
6. Gently add tofu, simmer 5 minutes.
7. Add cornstarch slurry to thicken.
8. Top with Sichuan peppercorn powder, green onions, and chili oil.',
    'Chinese',
    'meal',
    'medium',
    15,
    20,
    4,
    280,
    18,
    8,
    20,
    1,
    2,
    720,
    35,
    true,
    'library'
);

-- Recipe 16: Chicken Teriyaki
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Teriyaki',
    'chicken-teriyaki',
    'Glazed chicken thighs in sweet soy teriyaki sauce',
    'https://images.unsplash.com/photo-1609183480237-cccd3b2dbcf4?w=800',
    '1. Score chicken thighs for even cooking.
2. Mix teriyaki sauce: soy sauce, mirin, sake, sugar.
3. Sear chicken skin-side down until crispy.
4. Flip, cook until almost done.
5. Pour sauce over chicken, reduce until glossy.
6. Slice and serve over rice with sauce drizzled on top.
7. Garnish with sesame seeds and green onions.',
    'Japanese',
    'meal',
    'easy',
    10,
    20,
    4,
    380,
    32,
    18,
    18,
    NULL,
    14,
    1100,
    130,
    true,
    'library'
);

-- Recipe 17: Tonkotsu Ramen
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Tonkotsu Ramen',
    'tonkotsu-ramen',
    'Rich pork bone broth ramen with chashu and soft-boiled egg',
    'https://images.unsplash.com/photo-1557872943-16a5ac26437e?w=800',
    '1. Prepare broth by simmering pork bones 12+ hours (or use quality instant).
2. Make chashu: roll pork belly, braise in soy, mirin, sake for 2 hours.
3. Prepare soft-boiled eggs: 6.5 minutes, marinate in soy mixture.
4. Cook ramen noodles according to package.
5. Heat broth, season with tare (seasoning sauce).
6. Add noodles to bowl, ladle in hot broth.
7. Top with sliced chashu, egg, nori, green onions, corn.
8. Drizzle with sesame oil and serve immediately.',
    'Japanese',
    'meal',
    'hard',
    30,
    180,
    4,
    680,
    35,
    58,
    32,
    3,
    6,
    1450,
    215,
    true,
    'library'
);

-- Recipe 18: Sushi Roll - California Roll
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Sushi Roll - California Roll',
    'sushi-roll-california-roll',
    'Inside-out roll with crab, avocado, and cucumber',
    'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=800',
    '1. Cook sushi rice with rice vinegar, sugar, salt mixture.
2. Prepare fillings: slice avocado, cucumber into strips.
3. Lay nori on bamboo mat, spread rice over entire surface.
4. Flip so nori faces up, place fillings in center.
5. Roll tightly using bamboo mat.
6. Coat outside with sesame seeds or tobiko.
7. Slice into 6-8 pieces with wet knife.
8. Serve with soy sauce, wasabi, and pickled ginger.',
    'Japanese',
    'meal',
    'medium',
    30,
    20,
    4,
    320,
    12,
    48,
    10,
    4,
    5,
    580,
    20,
    true,
    'library'
);

-- Recipe 19: Miso Soup
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Miso Soup',
    'miso-soup',
    'Traditional Japanese soup with tofu, wakame, and green onions',
    'https://images.unsplash.com/photo-1547928576-b822bc410bdf?w=800',
    '1. Soak dried wakame in water until expanded.
2. Bring dashi stock to a simmer.
3. Cut tofu into small cubes.
4. Place miso paste in a small bowl, whisk in some hot dashi to dissolve.
5. Add tofu and wakame to pot.
6. Remove from heat, stir in miso mixture (don''t boil).
7. Serve immediately, garnished with green onions.',
    'Japanese',
    'meal',
    'easy',
    10,
    10,
    4,
    65,
    5,
    6,
    2,
    1,
    2,
    820,
    NULL,
    true,
    'library'
);

-- Recipe 20: Gyoza (Japanese Dumplings)
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Gyoza (Japanese Dumplings)',
    'gyoza-japanese-dumplings',
    'Pan-fried dumplings with pork and cabbage filling',
    'https://images.unsplash.com/photo-1496116218417-1a781b1c416c?w=800',
    '1. Mix ground pork with minced cabbage, garlic, ginger, soy sauce, sesame oil.
2. Place filling in center of each wrapper.
3. Wet edges, fold and pleat to seal.
4. Heat oil in non-stick pan, arrange gyoza in circle.
5. Fry until bottoms are golden.
6. Add water, cover immediately for steam-frying.
7. Remove lid when water evaporates, crisp bottoms.
8. Serve with dipping sauce (soy sauce, rice vinegar, chili oil).',
    'Japanese',
    'meal',
    'medium',
    45,
    15,
    4,
    340,
    18,
    32,
    15,
    2,
    2,
    680,
    55,
    true,
    'library'
);

-- Recipe 21: Tacos al Pastor
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Tacos al Pastor',
    'tacos-al-pastor',
    'Marinated pork tacos with pineapple, cilantro, and onion',
    'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?w=800',
    '1. Blend marinade: guajillo chilies, achiote, pineapple juice, vinegar, spices.
2. Marinate sliced pork shoulder overnight.
3. Grill or pan-fry pork until charred and cooked through.
4. Chop pork finely.
5. Warm corn tortillas.
6. Fill with pork, top with diced pineapple, onion, cilantro.
7. Serve with lime wedges and salsa verde.',
    'Mexican',
    'meal',
    'medium',
    30,
    25,
    4,
    420,
    28,
    38,
    18,
    4,
    10,
    580,
    75,
    true,
    'library'
);

-- Recipe 22: Chicken Enchiladas
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Enchiladas',
    'chicken-enchiladas',
    'Rolled tortillas filled with chicken, covered in red sauce and cheese',
    'https://images.unsplash.com/photo-1534352956036-cd81e27fed9d?w=800',
    '1. Poach chicken breasts, shred when cool.
2. Make enchilada sauce: blend tomatoes, chilies, garlic, cumin, oregano.
3. Mix chicken with some sauce and cheese.
4. Dip tortillas in warm sauce to soften.
5. Fill and roll tortillas, place seam-down in baking dish.
6. Cover with remaining sauce and cheese.
7. Bake at 375°F for 20 minutes until bubbly.
8. Top with sour cream, cilantro, and sliced jalapeños.',
    'Mexican',
    'meal',
    'medium',
    25,
    35,
    4,
    480,
    35,
    32,
    24,
    4,
    4,
    920,
    105,
    true,
    'library'
);

-- Recipe 23: Guacamole
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Guacamole',
    'guacamole',
    'Fresh avocado dip with lime, cilantro, onion, and jalapeño',
    'https://images.unsplash.com/photo-1600335895229-6e75511892c8?w=800',
    '1. Cut avocados in half, remove pit.
2. Scoop flesh into bowl, mash to desired consistency.
3. Add lime juice immediately to prevent browning.
4. Fold in diced onion, tomato, jalapeño, and cilantro.
5. Season with salt and cumin.
6. Taste and adjust seasoning.
7. Serve immediately with tortilla chips or as taco topping.',
    'Mexican',
    'snack',
    'easy',
    15,
    NULL,
    6,
    160,
    2,
    9,
    14,
    6,
    1,
    200,
    NULL,
    true,
    'library'
);

-- Recipe 24: Carnitas
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Carnitas',
    'carnitas',
    'Slow-braised pulled pork with crispy edges, perfect for tacos',
    'https://images.unsplash.com/photo-1599974579688-8dbdd335c77f?w=800',
    '1. Cut pork shoulder into 3-inch chunks.
2. Season generously with salt, pepper, cumin, oregano.
3. Place in Dutch oven with orange juice, lime juice, garlic, bay leaves.
4. Cover and braise at 300°F for 3-4 hours until tender.
5. Remove pork, shred with forks.
6. Spread on baking sheet, drizzle with cooking liquid.
7. Broil until edges are crispy, 5-10 minutes.
8. Serve in tacos with pickled onions, cilantro, salsa.',
    'Mexican',
    'meal',
    'easy',
    20,
    240,
    8,
    380,
    35,
    5,
    24,
    NULL,
    3,
    680,
    115,
    true,
    'library'
);

-- Recipe 25: Quesadillas
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Quesadillas',
    'quesadillas',
    'Crispy grilled tortillas with melted cheese and optional fillings',
    'https://images.unsplash.com/photo-1618040996337-56904b7850b9?w=800',
    '1. Heat large skillet or griddle over medium heat.
2. Place flour tortilla in dry pan.
3. Spread cheese evenly over half of tortilla.
4. Add optional fillings: cooked chicken, peppers, onions.
5. Fold tortilla in half, press gently.
6. Cook 2-3 minutes per side until golden and cheese melts.
7. Cut into wedges.
8. Serve with sour cream, guacamole, and salsa.',
    'Mexican',
    'meal',
    'easy',
    10,
    10,
    4,
    420,
    22,
    34,
    22,
    2,
    2,
    720,
    65,
    true,
    'library'
);

-- Recipe 26: Classic Cheeseburger
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Classic Cheeseburger',
    'classic-cheeseburger',
    'Juicy beef patty with American cheese, lettuce, tomato, and special sauce',
    'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=800',
    '1. Season ground beef with salt and pepper, form into patties.
2. Make indentation in center of each patty.
3. Grill or pan-fry patties 4 minutes per side for medium.
4. Add cheese in last minute of cooking.
5. Toast buns on grill.
6. Assemble: bottom bun, sauce, lettuce, patty, tomato, onion, top bun.
7. Serve immediately with fries.',
    'American',
    'meal',
    'easy',
    15,
    15,
    4,
    620,
    35,
    32,
    38,
    2,
    6,
    980,
    115,
    true,
    'library'
);

-- Recipe 27: BBQ Pulled Pork Sandwich
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'BBQ Pulled Pork Sandwich',
    'bbq-pulled-pork-sandwich',
    'Slow-smoked pulled pork with tangy BBQ sauce on a brioche bun',
    'https://images.unsplash.com/photo-1529006557810-274b9b2fc783?w=800',
    '1. Rub pork shoulder with dry spice mix (paprika, brown sugar, cumin, garlic powder).
2. Smoke at 225°F for 8-10 hours until internal temp reaches 195°F.
3. Let rest 30 minutes, then shred with forks.
4. Mix pulled pork with BBQ sauce.
5. Toast brioche buns.
6. Pile pork on buns, top with coleslaw.
7. Serve with extra sauce and pickles.',
    'American',
    'meal',
    'medium',
    30,
    600,
    8,
    520,
    32,
    42,
    24,
    1,
    18,
    890,
    95,
    true,
    'library'
);

-- Recipe 28: Buffalo Chicken Wings
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Buffalo Chicken Wings',
    'buffalo-chicken-wings',
    'Crispy fried wings tossed in spicy buffalo sauce',
    'https://images.unsplash.com/photo-1608039829572-9b8be10bd011?w=800',
    '1. Pat wings completely dry with paper towels.
2. Season with salt, pepper, and baking powder.
3. Bake at 425°F for 45 minutes, flipping halfway, until crispy.
4. Alternatively, deep fry at 375°F for 10-12 minutes.
5. Melt butter, mix with hot sauce for buffalo sauce.
6. Toss hot wings in sauce until coated.
7. Serve with blue cheese dressing, celery, and carrot sticks.',
    'American',
    'snack',
    'easy',
    15,
    45,
    4,
    480,
    32,
    4,
    38,
    1,
    1,
    1200,
    145,
    true,
    'library'
);

-- Recipe 29: New York Style Cheesecake
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'New York Style Cheesecake',
    'new-york-style-cheesecake',
    'Dense, creamy cheesecake with graham cracker crust',
    'https://images.unsplash.com/photo-1524351199678-941a58a3df50?w=800',
    '1. Crush graham crackers, mix with melted butter, press into springform pan.
2. Bake crust at 325°F for 10 minutes.
3. Beat cream cheese until smooth.
4. Add sugar, eggs one at a time, vanilla, sour cream.
5. Pour over crust, smooth top.
6. Bake at 325°F for 55-60 minutes until set but still slightly jiggly.
7. Turn off oven, crack door, let cool 1 hour inside.
8. Refrigerate at least 4 hours before serving.',
    'American',
    'dessert',
    'medium',
    30,
    60,
    12,
    420,
    7,
    32,
    30,
    NULL,
    24,
    320,
    125,
    true,
    'library'
);

-- Recipe 30: Mac and Cheese
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Mac and Cheese',
    'mac-and-cheese',
    'Creamy baked macaroni with three cheeses and crispy breadcrumb topping',
    'https://images.unsplash.com/photo-1543339494-b4cd4f7ba686?w=800',
    '1. Cook macaroni until just al dente, drain.
2. Make roux: melt butter, whisk in flour, cook 1 minute.
3. Gradually add milk, whisking constantly until thick.
4. Remove from heat, stir in cheeses until melted.
5. Season with mustard powder, salt, pepper.
6. Fold in pasta, transfer to baking dish.
7. Top with breadcrumbs mixed with melted butter.
8. Bake at 375°F for 25 minutes until golden and bubbly.',
    'American',
    'meal',
    'easy',
    15,
    40,
    8,
    480,
    18,
    42,
    26,
    2,
    5,
    580,
    75,
    true,
    'library'
);

-- Recipe 31: Pad Thai
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Pad Thai',
    'pad-thai',
    'Stir-fried rice noodles with shrimp, tofu, peanuts, and tamarind sauce',
    'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=800',
    '1. Soak rice noodles in warm water until pliable.
2. Mix sauce: tamarind paste, fish sauce, sugar, water.
3. Heat wok, scramble eggs, set aside.
4. Stir-fry shrimp and tofu until cooked.
5. Add noodles and sauce, toss until noodles absorb liquid.
6. Add bean sprouts, garlic chives, return eggs.
7. Serve topped with crushed peanuts, lime wedges, chili flakes.',
    'Thai',
    'meal',
    'medium',
    20,
    15,
    4,
    420,
    22,
    52,
    14,
    2,
    10,
    980,
    145,
    true,
    'library'
);

-- Recipe 32: Green Curry with Chicken
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Green Curry with Chicken',
    'green-curry-with-chicken',
    'Aromatic Thai curry with coconut milk, bamboo shoots, and Thai basil',
    'https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=800',
    '1. Fry green curry paste in coconut cream until fragrant.
2. Add chicken, cook until nearly done.
3. Pour in coconut milk, bring to simmer.
4. Add bamboo shoots, Thai eggplant if using.
5. Season with fish sauce and palm sugar.
6. Add Thai basil leaves and kaffir lime leaves.
7. Serve with jasmine rice.',
    'Thai',
    'meal',
    'medium',
    15,
    20,
    4,
    380,
    28,
    12,
    26,
    2,
    6,
    720,
    95,
    true,
    'library'
);

-- Recipe 33: Tom Yum Soup
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Tom Yum Soup',
    'tom-yum-soup',
    'Spicy and sour Thai soup with shrimp, mushrooms, and lemongrass',
    'https://images.unsplash.com/photo-1548943487-a2e4e43b4853?w=800',
    '1. Bring chicken broth to boil with lemongrass, galangal, kaffir lime leaves.
2. Add mushrooms, cook 3 minutes.
3. Add shrimp, cook until pink.
4. Remove from heat, add fish sauce, lime juice, chili paste.
5. Add tomatoes and cilantro.
6. Taste and adjust seasoning (should be sour, spicy, and savory).
7. Serve immediately.',
    'Thai',
    'meal',
    'easy',
    15,
    15,
    4,
    180,
    22,
    8,
    6,
    1,
    4,
    1100,
    145,
    true,
    'library'
);

-- Recipe 34: Butter Chicken
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Butter Chicken',
    'butter-chicken',
    'Tender chicken in creamy tomato-based curry sauce',
    'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398?w=800',
    '1. Marinate chicken in yogurt, garam masala, turmeric, chili powder.
2. Grill or pan-fry chicken until charred.
3. Make sauce: sauté onions until golden, add ginger-garlic paste.
4. Add tomato puree, cook until oil separates.
5. Add spices, cream, butter, kasuri methi.
6. Add chicken pieces, simmer 10 minutes.
7. Garnish with cream swirl and fresh cilantro.
8. Serve with naan or basmati rice.',
    'Indian',
    'meal',
    'medium',
    30,
    40,
    4,
    450,
    32,
    14,
    30,
    3,
    8,
    680,
    145,
    true,
    'library'
);

-- Recipe 35: Chicken Tikka Masala
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Tikka Masala',
    'chicken-tikka-masala',
    'Grilled chicken chunks in spiced creamy tomato sauce',
    'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=800',
    '1. Make tikka marinade: yogurt, ginger, garlic, spices, lemon juice.
2. Marinate chicken 4 hours or overnight.
3. Thread on skewers, grill until charred.
4. Make masala: fry onions, add tomatoes, spices, cream.
5. Simmer until thick.
6. Add grilled chicken, cook 5 more minutes.
7. Garnish with cilantro and serve with rice or naan.',
    'Indian',
    'meal',
    'medium',
    30,
    30,
    4,
    420,
    38,
    16,
    22,
    3,
    8,
    580,
    125,
    true,
    'library'
);

-- Recipe 36: Palak Paneer
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Palak Paneer',
    'palak-paneer',
    'Cottage cheese cubes in creamy spinach gravy',
    'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=800',
    '1. Blanch spinach, shock in ice water, blend to smooth puree.
2. Fry paneer cubes until golden, set aside.
3. Sauté onions until soft, add ginger-garlic paste.
4. Add tomatoes, cook until oil separates.
5. Add spices, cook 1 minute.
6. Add spinach puree, simmer 5 minutes.
7. Stir in cream and fried paneer.
8. Serve with roti or naan.',
    'Indian',
    'meal',
    'medium',
    20,
    25,
    4,
    320,
    18,
    12,
    24,
    4,
    4,
    480,
    55,
    true,
    'library'
);

-- Recipe 37: Samosas
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Samosas',
    'samosas',
    'Crispy pastry triangles filled with spiced potatoes and peas',
    'https://images.unsplash.com/photo-1601050690117-94f5f6fa8bd7?w=800',
    '1. Make dough: flour, oil, carom seeds, water. Rest 30 minutes.
2. Boil potatoes, mash coarsely.
3. Sauté cumin seeds, add green chilies, peas, potatoes, spices.
4. Roll dough into thin circles, cut in half.
5. Form cones, fill with potato mixture, seal edges.
6. Deep fry at 350°F until golden and crispy.
7. Serve hot with tamarind and mint chutneys.',
    'Indian',
    'snack',
    'hard',
    45,
    30,
    12,
    180,
    4,
    22,
    9,
    2,
    1,
    280,
    NULL,
    true,
    'library'
);

-- Recipe 38: Greek Salad
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Greek Salad',
    'greek-salad',
    'Fresh vegetables with feta cheese, olives, and oregano dressing',
    'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=800',
    '1. Cut tomatoes into wedges, cucumber into half-moons.
2. Slice red onion into thin rings.
3. Cut green pepper into rings.
4. Arrange vegetables on platter.
5. Top with feta block and Kalamata olives.
6. Drizzle with olive oil, sprinkle oregano, salt, pepper.
7. Serve with crusty bread.',
    'Mediterranean',
    'meal',
    'easy',
    15,
    NULL,
    4,
    280,
    10,
    12,
    22,
    3,
    6,
    720,
    35,
    true,
    'library'
);

-- Recipe 39: Hummus
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Hummus',
    'hummus',
    'Creamy chickpea dip with tahini, lemon, and garlic',
    'https://images.unsplash.com/photo-1577805947697-89e18249d767?w=800',
    '1. Drain chickpeas, reserve liquid.
2. Blend tahini with lemon juice and garlic until smooth.
3. Add chickpeas gradually, blend until creamy.
4. Add ice water or aquafaba to achieve desired consistency.
5. Season with salt and cumin.
6. Spread on plate, create swirls.
7. Drizzle with olive oil, sprinkle paprika, garnish with whole chickpeas.
8. Serve with warm pita bread.',
    'Mediterranean',
    'snack',
    'easy',
    10,
    NULL,
    6,
    180,
    6,
    18,
    10,
    4,
    2,
    280,
    NULL,
    true,
    'library'
);

-- Recipe 40: Falafel
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Falafel',
    'falafel',
    'Crispy fried chickpea patties with herbs and spices',
    'https://images.unsplash.com/photo-1593001874117-c99c800e3eb7?w=800',
    '1. Soak dried chickpeas overnight (don''t use canned).
2. Drain and blend with onion, garlic, parsley, cilantro, cumin, coriander.
3. Mixture should be coarse, not paste-like.
4. Refrigerate 1 hour.
5. Form into balls or patties.
6. Deep fry at 350°F until deep golden brown.
7. Serve in pita with tahini sauce, pickles, and vegetables.',
    'Mediterranean',
    'meal',
    'medium',
    20,
    15,
    6,
    220,
    8,
    26,
    10,
    5,
    4,
    420,
    NULL,
    true,
    'library'
);

-- Recipe 41: Classic Pancakes
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Classic Pancakes',
    'classic-pancakes',
    'Fluffy American-style pancakes with maple syrup and butter',
    'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=800',
    '1. Mix dry ingredients: flour, sugar, baking powder, salt.
2. Whisk wet ingredients: milk, eggs, melted butter, vanilla.
3. Combine wet and dry, mix until just combined (lumps OK).
4. Let batter rest 5 minutes.
5. Heat griddle to 375°F, lightly butter.
6. Pour 1/4 cup batter, cook until bubbles form.
7. Flip, cook 1-2 more minutes.
8. Serve stacked with butter and warm maple syrup.',
    'American',
    'meal',
    'easy',
    10,
    20,
    4,
    380,
    10,
    52,
    14,
    1,
    18,
    480,
    95,
    true,
    'library'
);

-- Recipe 42: Eggs Benedict
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Eggs Benedict',
    'eggs-benedict',
    'Poached eggs on English muffins with Canadian bacon and hollandaise',
    'https://images.unsplash.com/photo-1608039829572-9b8be10bd011?w=800',
    '1. Make hollandaise: whisk egg yolks over double boiler, slowly add melted butter, lemon juice.
2. Toast English muffins, butter lightly.
3. Cook Canadian bacon until lightly browned.
4. Poach eggs in simmering water with vinegar, 3 minutes.
5. Assemble: muffin, bacon, poached egg, hollandaise.
6. Season with salt, pepper, and paprika.
7. Serve immediately.',
    'American',
    'meal',
    'hard',
    15,
    20,
    4,
    520,
    22,
    26,
    38,
    1,
    2,
    980,
    425,
    true,
    'library'
);

-- Recipe 43: Avocado Toast
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Avocado Toast',
    'avocado-toast',
    'Smashed avocado on sourdough with cherry tomatoes and poached egg',
    'https://images.unsplash.com/photo-1541519227354-08fa5d50c44d?w=800',
    '1. Toast sourdough bread until golden.
2. Mash avocado with lime juice, salt, and red pepper flakes.
3. Poach egg to desired doneness.
4. Spread avocado generously on toast.
5. Top with poached egg and halved cherry tomatoes.
6. Season with flaky salt and black pepper.
7. Optional: add microgreens or everything bagel seasoning.',
    'American',
    'meal',
    'easy',
    10,
    10,
    4,
    320,
    12,
    28,
    18,
    8,
    3,
    380,
    185,
    true,
    'library'
);

-- Recipe 44: French Toast
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'French Toast',
    'french-toast',
    'Custardy brioche French toast with berries and powdered sugar',
    'https://images.unsplash.com/photo-1484723091739-30a097e8f929?w=800',
    '1. Whisk eggs, milk, vanilla, cinnamon, and sugar.
2. Heat butter in large pan over medium heat.
3. Dip bread slices in egg mixture, coat both sides.
4. Cook 3-4 minutes per side until golden.
5. Keep warm in 200°F oven while cooking batches.
6. Serve topped with fresh berries, powdered sugar, and maple syrup.',
    'French',
    'meal',
    'easy',
    10,
    20,
    4,
    420,
    12,
    48,
    20,
    2,
    22,
    420,
    215,
    true,
    'library'
);

-- Recipe 45: Overnight Oats
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Overnight Oats',
    'overnight-oats',
    'No-cook oatmeal with yogurt, chia seeds, and fresh fruit',
    'https://images.unsplash.com/photo-1517673400267-0251440c45dc?w=800',
    '1. Mix oats, milk, yogurt, chia seeds, maple syrup, and vanilla.
2. Divide into jars or containers.
3. Refrigerate overnight or at least 4 hours.
4. In the morning, stir and adjust consistency with more milk if needed.
5. Top with fresh berries, banana slices, and nut butter.
6. Sprinkle with granola for crunch.',
    'American',
    'meal',
    'easy',
    10,
    NULL,
    4,
    320,
    14,
    48,
    10,
    8,
    18,
    120,
    5,
    true,
    'library'
);

-- Recipe 46: Classic Margarita
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Classic Margarita',
    'classic-margarita',
    'Refreshing tequila cocktail with lime and orange liqueur',
    'https://images.unsplash.com/photo-1556855810-ac404aa91e85?w=800',
    '1. Run lime wedge around glass rim, dip in salt.
2. Fill cocktail shaker with ice.
3. Add tequila, lime juice, and triple sec.
4. Shake vigorously for 15 seconds.
5. Strain into prepared glass over fresh ice.
6. Garnish with lime wheel.',
    'Mexican',
    'drink',
    'easy',
    5,
    NULL,
    1,
    220,
    NULL,
    12,
    NULL,
    NULL,
    10,
    580,
    NULL,
    true,
    'library'
);

-- Recipe 47: Mango Lassi
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Mango Lassi',
    'mango-lassi',
    'Creamy Indian yogurt smoothie with sweet mango',
    'https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=800',
    '1. Add mango chunks, yogurt, milk, sugar, and cardamom to blender.
2. Blend until completely smooth.
3. Taste and adjust sweetness.
4. Pour into glasses.
5. Garnish with a pinch of cardamom and mango slice.
6. Serve chilled.',
    'Indian',
    'drink',
    'easy',
    5,
    NULL,
    2,
    220,
    8,
    42,
    4,
    2,
    38,
    80,
    12,
    true,
    'library'
);

-- Recipe 48: Iced Matcha Latte
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Iced Matcha Latte',
    'iced-matcha-latte',
    'Creamy green tea latte with a hint of sweetness',
    'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=800',
    '1. Sift matcha powder into a bowl to remove lumps.
2. Add hot water (not boiling) and whisk until smooth.
3. Add sweetener and stir.
4. Fill glass with ice.
5. Pour in cold milk.
6. Add matcha mixture, stir or leave layered.
7. Enjoy immediately.',
    'Japanese',
    'drink',
    'easy',
    5,
    NULL,
    1,
    140,
    6,
    18,
    4,
    NULL,
    14,
    120,
    12,
    true,
    'library'
);

-- Recipe 49: Berry Smoothie Bowl
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Berry Smoothie Bowl',
    'berry-smoothie-bowl',
    'Thick fruit smoothie topped with granola, fruit, and seeds',
    'https://images.unsplash.com/photo-1590301157890-4810ed352733?w=800',
    '1. Blend frozen berries, banana, and milk until thick and smooth.
2. Add more liquid only if needed - should be spoonable.
3. Pour into a bowl.
4. Arrange toppings in rows: granola, fresh berries, banana slices.
5. Drizzle with honey and sprinkle chia seeds.
6. Serve immediately with a spoon.',
    'American',
    'drink',
    'easy',
    10,
    NULL,
    1,
    380,
    8,
    72,
    8,
    10,
    42,
    80,
    5,
    true,
    'library'
);

-- Recipe 50: Mojito
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Mojito',
    'mojito',
    'Cuban cocktail with rum, fresh mint, lime, and soda water',
    'https://images.unsplash.com/photo-1551538827-9c037cb4f32a?w=800',
    '1. Muddle mint leaves gently with sugar and lime juice.
2. Add rum and stir.
3. Fill glass with ice.
4. Top with soda water.
5. Stir gently to combine.
6. Garnish with mint sprig and lime wheel.
7. Serve with a straw.',
    'Cuban',
    'drink',
    'easy',
    5,
    NULL,
    1,
    160,
    NULL,
    14,
    NULL,
    NULL,
    12,
    10,
    NULL,
    true,
    'library'
);

-- Recipe 51: Hot Chocolate
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Hot Chocolate',
    'hot-chocolate',
    'Rich and creamy hot cocoa with marshmallows',
    'https://images.unsplash.com/photo-1517578239113-b03992dcdd25?w=800',
    '1. Heat milk in saucepan over medium heat until steaming.
2. Whisk in cocoa powder and sugar until dissolved.
3. Add chocolate chips, stir until melted.
4. Add vanilla extract.
5. Pour into mugs.
6. Top with whipped cream and marshmallows.
7. Dust with cocoa powder.',
    'American',
    'drink',
    'easy',
    5,
    10,
    2,
    320,
    10,
    42,
    14,
    3,
    34,
    140,
    25,
    true,
    'library'
);

-- Recipe 52: Green Detox Smoothie
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Green Detox Smoothie',
    'green-detox-smoothie',
    'Healthy green smoothie with spinach, banana, and ginger',
    'https://images.unsplash.com/photo-1610970881699-44a5587cabec?w=800',
    '1. Add all ingredients to blender.
2. Blend on high until completely smooth.
3. Add more liquid if too thick.
4. Taste and adjust sweetness with honey.
5. Pour into glass.
6. Serve immediately for best nutrition.',
    'American',
    'drink',
    'easy',
    5,
    NULL,
    1,
    180,
    3,
    42,
    1,
    6,
    28,
    80,
    NULL,
    true,
    'library'
);

-- Recipe 53: Chocolate Chip Cookies
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chocolate Chip Cookies',
    'chocolate-chip-cookies',
    'Classic soft and chewy cookies with melty chocolate chips',
    'https://images.unsplash.com/photo-1499636136210-6f4ee915583e?w=800',
    '1. Cream butter and sugars until light and fluffy.
2. Beat in eggs one at a time, then vanilla.
3. Mix flour, baking soda, and salt separately.
4. Gradually add dry ingredients to wet.
5. Fold in chocolate chips.
6. Chill dough 30 minutes.
7. Scoop onto baking sheets.
8. Bake at 375°F for 9-11 minutes until edges golden.
9. Cool on pan 5 minutes before transferring.',
    'American',
    'dessert',
    'easy',
    20,
    11,
    24,
    180,
    2,
    24,
    9,
    1,
    15,
    140,
    25,
    true,
    'library'
);

-- Recipe 54: Brownies
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Brownies',
    'brownies',
    'Fudgy chocolate brownies with a crackly top',
    'https://images.unsplash.com/photo-1564355808539-22fda35bed7e?w=800',
    '1. Melt butter and chocolate together, let cool slightly.
2. Whisk in sugar until combined.
3. Add eggs one at a time, then vanilla.
4. Fold in flour, cocoa, and salt until just combined.
5. Spread in greased 9x13 pan.
6. Bake at 350°F for 25-30 minutes.
7. Do not overbake - center should be slightly underdone.
8. Cool completely before cutting.',
    'American',
    'dessert',
    'easy',
    15,
    30,
    16,
    280,
    4,
    38,
    14,
    2,
    28,
    120,
    75,
    true,
    'library'
);

-- Recipe 55: Banana Bread
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Banana Bread',
    'banana-bread',
    'Moist and tender banana bread with walnuts',
    'https://images.unsplash.com/photo-1584568694244-14fbdf83bd30?w=800',
    '1. Mash ripe bananas in a large bowl.
2. Mix in melted butter.
3. Add sugar, egg, and vanilla.
4. Combine flour, baking soda, and salt separately.
5. Add dry ingredients, mix until just combined.
6. Fold in walnuts if using.
7. Pour into greased loaf pan.
8. Bake at 350°F for 55-65 minutes until toothpick comes clean.
9. Cool in pan 10 minutes, then turn out.',
    'American',
    'snack',
    'easy',
    15,
    60,
    10,
    240,
    4,
    36,
    10,
    2,
    18,
    180,
    35,
    true,
    'library'
);

-- Recipe 56: Apple Pie
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Apple Pie',
    'apple-pie',
    'Classic American double-crust apple pie with cinnamon',
    'https://images.unsplash.com/photo-1621743478914-cc8a86d7e7b5?w=800',
    '1. Make pie dough, chill 1 hour.
2. Peel and slice apples, toss with sugar, cinnamon, nutmeg, lemon juice.
3. Roll out bottom crust, place in pie dish.
4. Add apple filling, dot with butter.
5. Roll out top crust, place over filling, crimp edges.
6. Cut vents, brush with egg wash, sprinkle sugar.
7. Bake at 425°F for 45-55 minutes until golden.
8. Cool at least 2 hours before slicing.',
    'American',
    'dessert',
    'medium',
    45,
    55,
    8,
    320,
    3,
    52,
    12,
    3,
    28,
    220,
    25,
    true,
    'library'
);

-- Recipe 57: Energy Balls
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Energy Balls',
    'energy-balls',
    'No-bake protein balls with oats, peanut butter, and chocolate chips',
    'https://images.unsplash.com/photo-1604329760661-e71dc83f8f26?w=800',
    '1. Mix oats, peanut butter, honey, and vanilla in large bowl.
2. Add chocolate chips and any add-ins.
3. Refrigerate mixture 30 minutes until firm.
4. Roll into 1-inch balls.
5. Store in refrigerator up to 1 week.
6. Can be frozen for up to 3 months.',
    'American',
    'snack',
    'easy',
    15,
    NULL,
    20,
    120,
    4,
    14,
    6,
    2,
    7,
    40,
    NULL,
    true,
    'library'
);

-- Recipe 58: Coq au Vin
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Coq au Vin',
    'coq-au-vin',
    'Classic French braised chicken in red wine with mushrooms and pearl onions',
    'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=800',
    '1. Brown chicken pieces in butter, set aside.
2. Sauté bacon lardons until crispy.
3. Brown pearl onions and mushrooms.
4. Add garlic, thyme, bay leaf.
5. Return chicken, pour in wine and stock.
6. Braise in oven at 325°F for 1.5 hours.
7. Thicken sauce if needed, garnish with parsley.',
    'French',
    'meal',
    'hard',
    30,
    120,
    6,
    520,
    42,
    12,
    28,
    2,
    4,
    680,
    165,
    true,
    'library'
);

-- Recipe 59: French Onion Soup
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'French Onion Soup',
    'french-onion-soup',
    'Caramelized onion soup topped with crusty bread and melted Gruyère',
    'https://images.unsplash.com/photo-1547592166-23ac45744acd?w=800',
    '1. Slice onions thinly, caramelize in butter 45 minutes.
2. Add garlic, cook 1 minute.
3. Deglaze with white wine.
4. Add beef broth, thyme, bay leaf.
5. Simmer 20 minutes.
6. Ladle into oven-safe bowls, top with bread and cheese.
7. Broil until cheese is bubbly and golden.',
    'French',
    'meal',
    'medium',
    15,
    75,
    6,
    380,
    16,
    32,
    20,
    3,
    10,
    890,
    55,
    true,
    'library'
);

-- Recipe 60: Beef Bourguignon
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Beef Bourguignon',
    'beef-bourguignon',
    'Tender beef stew braised in red wine with vegetables',
    'https://images.unsplash.com/photo-1534939561126-855b8675edd7?w=800',
    '1. Cut beef into 2-inch cubes, season and brown in batches.
2. Sauté bacon, onions, carrots, celery.
3. Add tomato paste and flour, stir.
4. Return beef, add wine and stock to cover.
5. Add bouquet garni, braise 2-3 hours at 325°F.
6. Add mushrooms and pearl onions last 30 minutes.
7. Serve over mashed potatoes or egg noodles.',
    'French',
    'meal',
    'hard',
    30,
    180,
    6,
    580,
    45,
    18,
    32,
    3,
    6,
    720,
    145,
    true,
    'library'
);

-- Recipe 61: Crêpes
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Crêpes',
    'crpes',
    'Thin French pancakes perfect for sweet or savory fillings',
    'https://images.unsplash.com/photo-1519676867240-f03562e64548?w=800',
    '1. Blend flour, eggs, milk, butter, salt until smooth.
2. Rest batter 1 hour.
3. Heat non-stick pan, brush with butter.
4. Pour thin layer of batter, swirl to coat.
5. Cook 1-2 minutes, flip, cook 30 seconds more.
6. Fill with Nutella and bananas, or ham and cheese.
7. Fold and serve immediately.',
    'French',
    'meal',
    'medium',
    70,
    20,
    8,
    140,
    5,
    18,
    5,
    NULL,
    3,
    95,
    75,
    true,
    'library'
);

-- Recipe 62: Ratatouille
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Ratatouille',
    'ratatouille',
    'Provençal vegetable stew with eggplant, zucchini, and tomatoes',
    'https://images.unsplash.com/photo-1572453800999-e8d2d1589b7c?w=800',
    '1. Slice all vegetables into thin rounds.
2. Make tomato sauce: sauté onions, garlic, add crushed tomatoes.
3. Spread sauce in baking dish.
4. Arrange vegetable slices in alternating pattern.
5. Drizzle with olive oil, season with herbs.
6. Cover and bake at 375°F for 45 minutes.
7. Uncover, bake 20 more minutes until tender.',
    'French',
    'meal',
    'medium',
    30,
    65,
    6,
    120,
    3,
    14,
    7,
    5,
    8,
    180,
    NULL,
    true,
    'library'
);

-- Recipe 63: Bibimbap
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Bibimbap',
    'bibimbap',
    'Korean rice bowl with vegetables, meat, and spicy gochujang sauce',
    'https://images.unsplash.com/photo-1553163147-622ab57be1c7?w=800',
    '1. Cook rice and keep warm.
2. Prepare vegetables: blanch spinach, sauté mushrooms, julienne carrots.
3. Season each vegetable with sesame oil and salt.
4. Cook beef with soy sauce, garlic, sugar.
5. Fry egg sunny-side up.
6. Arrange rice in bowl, top with vegetables, beef, egg.
7. Serve with gochujang and sesame seeds. Mix before eating.',
    'Korean',
    'meal',
    'medium',
    30,
    20,
    4,
    480,
    22,
    58,
    16,
    4,
    6,
    680,
    215,
    true,
    'library'
);

-- Recipe 64: Korean Fried Chicken
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Korean Fried Chicken',
    'korean-fried-chicken',
    'Double-fried crispy chicken coated in sweet and spicy gochujang glaze',
    'https://images.unsplash.com/photo-1575932444877-5106bee2a599?w=800',
    '1. Cut chicken into pieces, marinate in ginger, garlic, soy sauce.
2. Coat in cornstarch and flour mixture.
3. Fry at 350°F for 10 minutes, rest 5 minutes.
4. Fry again at 375°F for 5 minutes until extra crispy.
5. Make sauce: combine gochujang, honey, soy sauce, garlic.
6. Toss hot chicken in sauce.
7. Garnish with sesame seeds and green onions.',
    'Korean',
    'meal',
    'medium',
    20,
    30,
    4,
    520,
    35,
    32,
    28,
    1,
    14,
    920,
    125,
    true,
    'library'
);

-- Recipe 65: Japchae
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Japchae',
    'japchae',
    'Korean glass noodles stir-fried with vegetables and beef',
    'https://images.unsplash.com/photo-1583224944520-b05150ecb8d8?w=800',
    '1. Soak glass noodles in hot water 10 minutes, drain.
2. Cook beef with soy sauce, sugar, sesame oil.
3. Stir-fry each vegetable separately: spinach, carrots, mushrooms, onions.
4. Cook noodles with soy sauce and sugar.
5. Combine everything in large bowl.
6. Season with more sesame oil, toss well.
7. Serve warm or at room temperature.',
    'Korean',
    'meal',
    'medium',
    25,
    20,
    4,
    380,
    15,
    52,
    12,
    3,
    10,
    780,
    35,
    true,
    'library'
);

-- Recipe 66: Kimchi Jjigae
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Kimchi Jjigae',
    'kimchi-jjigae',
    'Spicy fermented cabbage stew with pork and tofu',
    'https://images.unsplash.com/photo-1498654896293-37aacf113fd9?w=800',
    '1. Sauté pork belly until fat renders.
2. Add aged kimchi, stir-fry 3 minutes.
3. Add water or anchovy stock, bring to boil.
4. Add gochugaru, gochujang, soy sauce.
5. Simmer 15 minutes.
6. Add tofu cubes, cook 5 more minutes.
7. Top with green onions, serve with rice.',
    'Korean',
    'meal',
    'easy',
    10,
    25,
    4,
    320,
    18,
    12,
    22,
    3,
    4,
    1100,
    45,
    true,
    'library'
);

-- Recipe 67: Bulgogi
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Bulgogi',
    'bulgogi',
    'Korean marinated grilled beef with sweet soy and pear',
    'https://images.unsplash.com/photo-1590301157890-4810ed352733?w=800',
    '1. Slice beef thinly against the grain.
2. Make marinade: soy sauce, pear puree, sugar, sesame oil, garlic.
3. Marinate beef 2-4 hours or overnight.
4. Grill on high heat 2-3 minutes per side.
5. Or cook in hot skillet until caramelized.
6. Garnish with sesame seeds and green onions.
7. Serve with rice and lettuce wraps.',
    'Korean',
    'meal',
    'easy',
    15,
    10,
    4,
    380,
    32,
    14,
    22,
    1,
    10,
    820,
    95,
    true,
    'library'
);

-- Recipe 68: Pho Bo
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Pho Bo',
    'pho-bo',
    'Vietnamese beef noodle soup with aromatic broth and fresh herbs',
    'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=800',
    '1. Char onion and ginger over flame.
2. Toast spices: star anise, cinnamon, cloves, coriander.
3. Simmer beef bones 6-8 hours with aromatics.
4. Season broth with fish sauce, rock sugar.
5. Cook rice noodles according to package.
6. Slice beef paper-thin.
7. Assemble: noodles, raw beef, pour hot broth over.
8. Serve with bean sprouts, basil, lime, hoisin, sriracha.',
    'Vietnamese',
    'meal',
    'hard',
    30,
    480,
    6,
    420,
    28,
    48,
    12,
    2,
    4,
    980,
    65,
    true,
    'library'
);

-- Recipe 69: Banh Mi
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Banh Mi',
    'banh-mi',
    'Vietnamese baguette sandwich with pickled vegetables and pâté',
    'https://images.unsplash.com/photo-1600688640154-9619e002df30?w=800',
    '1. Make pickles: julienne carrots and daikon, pickle in vinegar and sugar.
2. Prepare protein: grill pork or slice cold cuts.
3. Toast baguette lightly.
4. Spread pâté on one side, mayo on other.
5. Layer: meat, pickled vegetables, cucumber, jalapeño.
6. Add fresh cilantro.
7. Drizzle with Maggi sauce if desired.',
    'Vietnamese',
    'meal',
    'medium',
    30,
    15,
    4,
    450,
    28,
    42,
    18,
    3,
    8,
    820,
    75,
    true,
    'library'
);

-- Recipe 70: Fresh Spring Rolls
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Fresh Spring Rolls',
    'fresh-spring-rolls',
    'Light rice paper rolls with shrimp, vermicelli, and fresh vegetables',
    'https://images.unsplash.com/photo-1534422298391-e4f8c172dddb?w=800',
    '1. Cook vermicelli noodles, cool.
2. Poach shrimp, slice in half lengthwise.
3. Prep vegetables: lettuce, mint, cilantro, cucumber.
4. Dip rice paper in warm water until pliable.
5. Place fillings in center, fold sides in, roll tightly.
6. Make peanut dipping sauce.
7. Serve immediately or refrigerate covered with damp towel.',
    'Vietnamese',
    'meal',
    'easy',
    30,
    10,
    6,
    180,
    14,
    22,
    4,
    2,
    3,
    380,
    85,
    true,
    'library'
);

-- Recipe 71: Bun Cha
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Bun Cha',
    'bun-cha',
    'Grilled pork meatballs with vermicelli noodles and dipping sauce',
    'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=800',
    '1. Make meatballs: mix ground pork with fish sauce, sugar, garlic.
2. Slice pork belly, marinate same way.
3. Grill meatballs and pork belly until charred.
4. Make nuoc cham: fish sauce, lime, sugar, garlic, chili.
5. Cook vermicelli noodles.
6. Serve noodles with meat, fresh herbs, pickled vegetables.
7. Dip in nuoc cham while eating.',
    'Vietnamese',
    'meal',
    'medium',
    25,
    20,
    4,
    520,
    32,
    45,
    24,
    2,
    12,
    1050,
    95,
    true,
    'library'
);

-- Recipe 72: Paella Valenciana
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Paella Valenciana',
    'paella-valenciana',
    'Traditional Spanish rice dish with chicken, rabbit, and green beans',
    'https://images.unsplash.com/photo-1534080564583-6be75777b70a?w=800',
    '1. Heat olive oil in paella pan, brown chicken and rabbit.
2. Add green beans, cook 5 minutes.
3. Add tomato, paprika, saffron, stir.
4. Pour in stock, bring to boil.
5. Add rice in even layer, do not stir.
6. Cook 18-20 minutes until rice absorbs liquid.
7. Let rest 5 minutes, create socarrat (crispy bottom).
8. Garnish with rosemary and lemon wedges.',
    'Spanish',
    'meal',
    'hard',
    25,
    45,
    6,
    520,
    38,
    48,
    18,
    3,
    4,
    680,
    125,
    true,
    'library'
);

-- Recipe 73: Gazpacho
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Gazpacho',
    'gazpacho',
    'Chilled Spanish tomato soup with cucumber and peppers',
    'https://images.unsplash.com/photo-1529566652340-2c41a1eb6d93?w=800',
    '1. Roughly chop tomatoes, cucumber, pepper, onion.
2. Soak bread in water, squeeze out excess.
3. Blend vegetables with bread, garlic, vinegar, olive oil.
4. Season with salt and pepper.
5. Strain for smoother texture if desired.
6. Chill at least 2 hours.
7. Serve with diced vegetable garnish and croutons.',
    'Spanish',
    'meal',
    'easy',
    20,
    NULL,
    6,
    180,
    3,
    18,
    11,
    3,
    10,
    420,
    NULL,
    true,
    'library'
);

-- Recipe 74: Patatas Bravas
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Patatas Bravas',
    'patatas-bravas',
    'Crispy fried potatoes with spicy tomato sauce and aioli',
    'https://images.unsplash.com/photo-1600335895229-6e75511892c8?w=800',
    '1. Cut potatoes into 1-inch cubes.
2. Parboil potatoes 10 minutes, drain and dry.
3. Deep fry at 350°F until golden and crispy.
4. Make bravas sauce: sauté onion, add tomato, paprika, cayenne.
5. Make aioli: blend garlic, egg yolk, lemon, olive oil.
6. Arrange potatoes on plate.
7. Drizzle with both sauces, serve hot.',
    'Spanish',
    'snack',
    'medium',
    20,
    30,
    4,
    320,
    5,
    38,
    16,
    4,
    3,
    380,
    50,
    true,
    'library'
);

-- Recipe 75: Spanish Tortilla
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Spanish Tortilla',
    'spanish-tortilla',
    'Classic potato and onion omelette served warm or cold',
    'https://images.unsplash.com/photo-1557700836-25f2c5c71f47?w=800',
    '1. Slice potatoes and onions thinly.
2. Poach in olive oil over low heat 20-25 minutes.
3. Drain, reserving oil.
4. Beat eggs, season, mix with potatoes.
5. Cook in pan with reserved oil until bottom sets.
6. Flip using plate, cook other side.
7. Rest 5 minutes before slicing.',
    'Spanish',
    'meal',
    'medium',
    15,
    35,
    6,
    280,
    10,
    22,
    18,
    2,
    2,
    420,
    190,
    true,
    'library'
);

-- Recipe 76: Shawarma
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Shawarma',
    'shawarma',
    'Spiced meat wrapped in pita with garlic sauce and pickles',
    'https://images.unsplash.com/photo-1529006557810-274b9b2fc783?w=800',
    '1. Slice chicken or lamb thinly.
2. Marinate in shawarma spices, yogurt, lemon, garlic.
3. Grill or pan-fry until charred edges.
4. Make garlic sauce: blend garlic, lemon, oil until emulsified.
5. Warm pita bread.
6. Layer meat, pickled turnips, tomatoes, lettuce.
7. Drizzle with garlic sauce, wrap tightly.',
    'Middle Eastern',
    'meal',
    'medium',
    20,
    15,
    4,
    480,
    35,
    38,
    22,
    3,
    4,
    680,
    125,
    true,
    'library'
);

-- Recipe 77: Tabbouleh
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Tabbouleh',
    'tabbouleh',
    'Fresh parsley salad with bulgur, tomatoes, and lemon dressing',
    'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800',
    '1. Soak bulgur in hot water 20 minutes, drain well.
2. Finely chop parsley (lots!), mint, tomatoes, onion.
3. Combine bulgur with vegetables.
4. Dress with lemon juice and olive oil.
5. Season with salt and allspice.
6. Let sit 30 minutes for flavors to meld.
7. Serve with romaine lettuce leaves for scooping.',
    'Middle Eastern',
    'meal',
    'easy',
    30,
    NULL,
    6,
    120,
    3,
    14,
    7,
    3,
    2,
    400,
    NULL,
    true,
    'library'
);

-- Recipe 78: Lamb Kofta
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Lamb Kofta',
    'lamb-kofta',
    'Spiced ground lamb skewers grilled over open flame',
    'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?w=800',
    '1. Mix lamb with onion, parsley, spices.
2. Knead mixture well for 5 minutes.
3. Shape onto flat metal skewers.
4. Refrigerate 30 minutes to firm.
5. Grill over high heat 3-4 minutes per side.
6. Serve with pita, tzatziki, and salad.
7. Garnish with sumac and fresh parsley.',
    'Middle Eastern',
    'meal',
    'easy',
    20,
    10,
    4,
    350,
    28,
    4,
    24,
    1,
    2,
    620,
    95,
    true,
    'library'
);

-- Recipe 79: Shakshuka
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Shakshuka',
    'shakshuka',
    'Eggs poached in spiced tomato and pepper sauce',
    'https://images.unsplash.com/photo-1590412200988-a436970781fa?w=800',
    '1. Sauté onions and peppers until soft.
2. Add garlic, cook 1 minute.
3. Add tomatoes, cumin, paprika, cayenne.
4. Simmer 10 minutes until thickened.
5. Make wells, crack eggs into sauce.
6. Cover, cook 5-8 minutes until whites set.
7. Garnish with feta and cilantro.
8. Serve with crusty bread for dipping.',
    'Middle Eastern',
    'meal',
    'easy',
    10,
    25,
    4,
    280,
    14,
    18,
    18,
    4,
    10,
    580,
    285,
    true,
    'library'
);

-- Recipe 80: Iced Caramel Latte
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Iced Caramel Latte',
    'iced-caramel-latte',
    'Creamy espresso with caramel syrup over ice',
    'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=800',
    '1. Brew 2 shots of espresso.
2. Add caramel syrup to glass.
3. Fill glass with ice.
4. Pour espresso over ice.
5. Add cold milk.
6. Drizzle more caramel on top.
7. Stir and enjoy.',
    'American',
    'drink',
    'easy',
    5,
    NULL,
    1,
    180,
    6,
    28,
    5,
    NULL,
    24,
    95,
    20,
    true,
    'library'
);

-- Recipe 81: Tropical Smoothie
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Tropical Smoothie',
    'tropical-smoothie',
    'Refreshing blend of mango, pineapple, and coconut milk',
    'https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=800',
    '1. Add frozen mango and pineapple to blender.
2. Pour in coconut milk.
3. Add honey if desired.
4. Blend until smooth.
5. Pour into glass.
6. Garnish with pineapple wedge.',
    'American',
    'drink',
    'easy',
    5,
    NULL,
    2,
    220,
    2,
    42,
    8,
    3,
    34,
    25,
    NULL,
    true,
    'library'
);

-- Recipe 82: Chai Tea Latte
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chai Tea Latte',
    'chai-tea-latte',
    'Spiced black tea with steamed milk and warm spices',
    'https://images.unsplash.com/photo-1571934811356-5cc061b6821f?w=800',
    '1. Simmer water with chai spices 5 minutes.
2. Add black tea, steep 3 minutes.
3. Strain into mug.
4. Heat and froth milk.
5. Add honey or sugar.
6. Pour steamed milk over tea.
7. Dust with cinnamon.',
    'Indian',
    'drink',
    'easy',
    5,
    10,
    1,
    140,
    6,
    20,
    4,
    NULL,
    18,
    85,
    15,
    true,
    'library'
);

-- Recipe 83: Strawberry Banana Smoothie
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Strawberry Banana Smoothie',
    'strawberry-banana-smoothie',
    'Classic creamy smoothie with fresh strawberries and banana',
    'https://images.unsplash.com/photo-1505252585461-04db1eb84625?w=800',
    '1. Add frozen strawberries to blender.
2. Add banana and yogurt.
3. Pour in milk.
4. Add honey if desired.
5. Blend until smooth.
6. Serve immediately.',
    'American',
    'drink',
    'easy',
    5,
    NULL,
    2,
    180,
    8,
    35,
    2,
    4,
    26,
    65,
    8,
    true,
    'library'
);

-- Recipe 84: Pina Colada
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Pina Colada',
    'pina-colada',
    'Creamy tropical cocktail with rum, coconut, and pineapple',
    'https://images.unsplash.com/photo-1587223962930-cb7f31384c19?w=800',
    '1. Add pineapple chunks to blender.
2. Add coconut cream and rum.
3. Add ice cubes.
4. Blend until smooth and frosty.
5. Pour into hurricane glass.
6. Garnish with pineapple wedge and cherry.',
    'Caribbean',
    'drink',
    'easy',
    5,
    NULL,
    1,
    320,
    1,
    32,
    12,
    1,
    28,
    15,
    NULL,
    true,
    'library'
);

-- Recipe 85: Cold Brew Coffee
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Cold Brew Coffee',
    'cold-brew-coffee',
    'Smooth, less acidic coffee steeped overnight',
    'https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?w=800',
    '1. Coarsely grind coffee beans.
2. Combine with cold water in jar.
3. Stir to fully saturate grounds.
4. Cover and refrigerate 12-24 hours.
5. Strain through fine mesh and coffee filter.
6. Dilute concentrate 1:1 with water or milk.
7. Serve over ice.',
    'American',
    'drink',
    'easy',
    10,
    NULL,
    4,
    5,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    5,
    NULL,
    true,
    'library'
);

-- Recipe 86: Lemonade
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Lemonade',
    'lemonade',
    'Classic homemade lemonade with fresh lemons',
    'https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=800',
    '1. Make simple syrup: heat sugar and water until dissolved.
2. Cool syrup completely.
3. Juice lemons, strain out seeds.
4. Combine syrup, lemon juice, and cold water.
5. Taste and adjust sweetness.
6. Serve over ice with lemon slices.',
    'American',
    'drink',
    'easy',
    15,
    5,
    6,
    130,
    NULL,
    34,
    NULL,
    NULL,
    32,
    5,
    NULL,
    true,
    'library'
);

-- Recipe 87: Espresso Martini
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Espresso Martini',
    'espresso-martini',
    'Coffee cocktail with vodka and coffee liqueur',
    'https://images.unsplash.com/photo-1545438102-799c3991ffb2?w=800',
    '1. Brew fresh espresso, let cool slightly.
2. Add ice to cocktail shaker.
3. Pour in vodka, coffee liqueur, espresso.
4. Add simple syrup.
5. Shake vigorously 15 seconds.
6. Strain into chilled martini glass.
7. Garnish with three coffee beans.',
    'American',
    'drink',
    'medium',
    5,
    NULL,
    1,
    220,
    NULL,
    18,
    NULL,
    NULL,
    16,
    5,
    NULL,
    true,
    'library'
);

-- Recipe 88: Golden Milk
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Golden Milk',
    'golden-milk',
    'Anti-inflammatory turmeric latte with warm spices',
    'https://images.unsplash.com/photo-1578020190125-f4f7c18bc9cb?w=800',
    '1. Whisk turmeric, ginger, cinnamon, pepper in small bowl.
2. Heat milk in saucepan.
3. Add spice mixture, whisk constantly.
4. Simmer 5 minutes.
5. Add honey and vanilla.
6. Strain if desired.
7. Serve warm with cinnamon dust.',
    'Indian',
    'drink',
    'easy',
    5,
    10,
    1,
    180,
    8,
    24,
    6,
    NULL,
    20,
    110,
    20,
    true,
    'library'
);

-- Recipe 89: Watermelon Agua Fresca
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Watermelon Agua Fresca',
    'watermelon-agua-fresca',
    'Light Mexican fruit water with fresh watermelon and lime',
    'https://images.unsplash.com/photo-1525385133512-2f3bdd509b56?w=800',
    '1. Cut watermelon into chunks, remove seeds.
2. Blend watermelon until smooth.
3. Strain through fine mesh.
4. Add lime juice and sugar.
5. Stir in cold water.
6. Chill or serve over ice.
7. Garnish with mint leaves.',
    'Mexican',
    'drink',
    'easy',
    10,
    NULL,
    4,
    80,
    1,
    20,
    NULL,
    1,
    18,
    5,
    NULL,
    true,
    'library'
);

-- Recipe 90: Eggs Florentine
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Eggs Florentine',
    'eggs-florentine',
    'Poached eggs on English muffin with spinach and hollandaise',
    'https://images.unsplash.com/photo-1608039829572-9b0b8eb4fa1f?w=800',
    '1. Sauté spinach with garlic until wilted.
2. Make hollandaise: whisk yolks, lemon, slowly add melted butter.
3. Bring water to gentle simmer with vinegar.
4. Create whirlpool, drop in eggs, poach 3 minutes.
5. Toast and butter English muffins.
6. Layer: muffin, spinach, poached egg, hollandaise.
7. Season with paprika.',
    'American',
    'meal',
    'hard',
    15,
    20,
    2,
    520,
    22,
    28,
    36,
    3,
    3,
    580,
    485,
    true,
    'library'
);

-- Recipe 91: Breakfast Burrito
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Breakfast Burrito',
    'breakfast-burrito',
    'Flour tortilla filled with eggs, cheese, bacon, and potatoes',
    'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?w=800',
    '1. Cook bacon until crispy, crumble.
2. Cube and fry potatoes until golden.
3. Scramble eggs with cheese.
4. Warm large flour tortillas.
5. Layer: potatoes, eggs, bacon, salsa, avocado.
6. Fold sides in, roll tightly.
7. Optional: grill seam-side down for crispy tortilla.',
    'Mexican',
    'meal',
    'easy',
    15,
    20,
    4,
    580,
    24,
    42,
    36,
    5,
    3,
    920,
    295,
    true,
    'library'
);

-- Recipe 92: Granola
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Granola',
    'granola',
    'Crunchy homemade oat clusters with nuts and honey',
    'https://images.unsplash.com/photo-1517686469429-8bdb88b9f907?w=800',
    '1. Mix oats, nuts, coconut, cinnamon, salt.
2. Combine honey, oil, vanilla.
3. Pour wet over dry, mix thoroughly.
4. Spread on baking sheet in even layer.
5. Bake at 325°F for 40 minutes, stirring every 15.
6. Cool completely on pan.
7. Add dried fruit, store in airtight container.',
    'American',
    'snack',
    'easy',
    10,
    40,
    12,
    240,
    6,
    32,
    11,
    4,
    14,
    100,
    NULL,
    true,
    'library'
);

-- Recipe 93: Belgian Waffles
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Belgian Waffles',
    'belgian-waffles',
    'Light and crispy waffles with deep pockets for toppings',
    'https://images.unsplash.com/photo-1562376552-0d160a2f238d?w=800',
    '1. Separate eggs, beat whites to stiff peaks.
2. Mix flour, sugar, baking powder, salt.
3. Whisk yolks, milk, butter, vanilla.
4. Combine wet and dry ingredients.
5. Fold in egg whites gently.
6. Cook in preheated waffle iron until golden.
7. Serve with whipped cream and fresh berries.',
    'Belgian',
    'meal',
    'medium',
    15,
    20,
    6,
    320,
    8,
    38,
    15,
    1,
    8,
    380,
    95,
    true,
    'library'
);

-- Recipe 94: Shakshuka Green
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Shakshuka Green',
    'shakshuka-green',
    'Eggs in spiced green vegetable sauce with herbs',
    'https://images.unsplash.com/photo-1590412200988-a436970781fa?w=800',
    '1. Sauté onion and garlic until soft.
2. Add spinach, kale, cook until wilted.
3. Blend with green chili, herbs.
4. Return to pan, add cream.
5. Make wells, crack in eggs.
6. Cover, cook until whites set.
7. Top with feta and fresh herbs.',
    'Middle Eastern',
    'meal',
    'easy',
    15,
    20,
    4,
    260,
    16,
    10,
    18,
    3,
    3,
    420,
    290,
    true,
    'library'
);

-- Recipe 95: Churros
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Churros',
    'churros',
    'Crispy fried dough sticks coated in cinnamon sugar',
    'https://images.unsplash.com/photo-1624371475792-c7f4e4e6c8e9?w=800',
    '1. Boil water, butter, salt, sugar.
2. Add flour all at once, stir vigorously.
3. Beat in egg until smooth.
4. Pipe through star tip into hot oil.
5. Fry until golden brown.
6. Drain on paper towels.
7. Roll in cinnamon sugar while warm.
8. Serve with chocolate sauce.',
    'Spanish',
    'dessert',
    'medium',
    15,
    20,
    6,
    280,
    3,
    38,
    13,
    1,
    18,
    140,
    45,
    true,
    'library'
);

-- Recipe 96: Mochi Ice Cream
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Mochi Ice Cream',
    'mochi-ice-cream',
    'Japanese ice cream wrapped in chewy rice dough',
    'https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=800',
    '1. Scoop small ice cream balls, freeze solid.
2. Mix mochiko flour, sugar, water.
3. Microwave in intervals, stirring each time.
4. Dust surface with cornstarch.
5. Flatten dough, cut circles.
6. Wrap dough around frozen ice cream.
7. Pinch edges, freeze until firm.',
    'Japanese',
    'dessert',
    'medium',
    30,
    10,
    12,
    120,
    2,
    22,
    3,
    NULL,
    14,
    25,
    15,
    true,
    'library'
);

-- Recipe 97: Baklava
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Baklava',
    'baklava',
    'Layered phyllo pastry with nuts and honey syrup',
    'https://images.unsplash.com/photo-1598110750624-207050c4f28c?w=800',
    '1. Mix chopped nuts with cinnamon.
2. Brush phyllo sheets with butter, layer 8 sheets.
3. Add nut mixture, repeat layers.
4. End with 8 phyllo sheets on top.
5. Cut into diamonds before baking.
6. Bake at 350°F until golden.
7. Make honey syrup, pour over hot baklava.
8. Cool completely before serving.',
    'Middle Eastern',
    'dessert',
    'hard',
    45,
    50,
    24,
    260,
    4,
    28,
    16,
    2,
    18,
    95,
    25,
    true,
    'library'
);

-- Recipe 98: Panna Cotta
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Panna Cotta',
    'panna-cotta',
    'Silky Italian cream dessert with vanilla',
    'https://images.unsplash.com/photo-1488477181946-6428a0291777?w=800',
    '1. Bloom gelatin in cold water 5 minutes.
2. Heat cream, sugar, vanilla until simmering.
3. Remove from heat, stir in gelatin until dissolved.
4. Pour into ramekins.
5. Refrigerate 4 hours or overnight.
6. Unmold by dipping in hot water.
7. Top with berry compote.',
    'Italian',
    'dessert',
    'easy',
    15,
    10,
    6,
    320,
    4,
    22,
    24,
    1,
    18,
    45,
    90,
    true,
    'library'
);

-- Recipe 99: Guacamole
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Guacamole',
    'guacamole-2',
    'Fresh avocado dip with lime, cilantro, and jalapeño',
    'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?w=800',
    '1. Halve avocados, remove pit.
2. Scoop flesh into bowl.
3. Add lime juice immediately.
4. Mash to desired consistency.
5. Fold in onion, tomato, cilantro, jalapeño.
6. Season with salt and cumin.
7. Serve immediately with tortilla chips.',
    'Mexican',
    'snack',
    'easy',
    15,
    NULL,
    6,
    160,
    2,
    9,
    14,
    7,
    1,
    200,
    NULL,
    true,
    'library'
);

-- Recipe 100: Caprese Skewers
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Caprese Skewers',
    'caprese-skewers',
    'Cherry tomatoes, mozzarella, and basil on toothpicks',
    'https://images.unsplash.com/photo-1608897013039-887f21d8c804?w=800',
    '1. Thread on toothpick: basil leaf.
2. Add cherry tomato.
3. Add mozzarella ball.
4. Repeat pattern.
5. Arrange on platter.
6. Drizzle with balsamic glaze.
7. Season with salt and pepper.',
    'Italian',
    'snack',
    'easy',
    15,
    NULL,
    8,
    120,
    8,
    4,
    8,
    NULL,
    3,
    180,
    25,
    true,
    'library'
);

-- Recipe 101: Caesar Salad
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Caesar Salad',
    'caesar-salad',
    'Crisp romaine with creamy Caesar dressing and croutons',
    'https://images.unsplash.com/photo-1550304943-4f24f54ddde9?w=800',
    '1. Make dressing: blend anchovies, garlic, egg yolk, lemon, Parmesan.
2. Stream in olive oil while blending.
3. Toast bread cubes in olive oil for croutons.
4. Chop romaine into bite-size pieces.
5. Toss lettuce with dressing.
6. Top with croutons and shaved Parmesan.
7. Add grilled chicken if desired.',
    'Italian',
    'meal',
    'medium',
    20,
    10,
    4,
    320,
    12,
    18,
    24,
    4,
    3,
    580,
    65,
    true,
    'library'
);

-- Recipe 102: Quinoa Bowl
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Quinoa Bowl',
    'quinoa-bowl',
    'Protein-packed grain bowl with roasted vegetables and tahini',
    'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=800',
    '1. Cook quinoa in vegetable broth.
2. Roast sweet potato and chickpeas with cumin.
3. Steam or roast broccoli.
4. Make tahini dressing: tahini, lemon, garlic, water.
5. Assemble bowl: quinoa base, vegetables arranged.
6. Drizzle with tahini dressing.
7. Top with avocado and seeds.',
    'American',
    'meal',
    'easy',
    15,
    30,
    4,
    420,
    16,
    52,
    18,
    12,
    8,
    380,
    NULL,
    true,
    'library'
);

-- Recipe 103: Cobb Salad
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Cobb Salad',
    'cobb-salad',
    'Hearty salad with chicken, bacon, eggs, avocado, and blue cheese',
    'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800',
    '1. Cook and dice chicken breast.
2. Fry bacon until crispy, crumble.
3. Hard boil eggs, cool and quarter.
4. Dice avocado and tomatoes.
5. Arrange lettuce on large platter.
6. Arrange toppings in rows.
7. Drizzle with red wine vinaigrette.',
    'American',
    'meal',
    'easy',
    25,
    15,
    4,
    520,
    35,
    12,
    38,
    6,
    4,
    720,
    285,
    true,
    'library'
);

-- Recipe 104: Grilled Chicken Salad
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Grilled Chicken Salad',
    'grilled-chicken-salad',
    'Tender grilled chicken over mixed greens with honey mustard',
    'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=800',
    '1. Marinate chicken in olive oil, herbs, garlic.
2. Grill chicken 6-7 minutes per side.
3. Rest 5 minutes, slice.
4. Toss greens with cucumber, tomatoes, onion.
5. Make honey mustard: mix mustard, honey, vinegar, oil.
6. Arrange greens, top with sliced chicken.
7. Drizzle with dressing, add croutons.',
    'American',
    'meal',
    'easy',
    20,
    15,
    4,
    380,
    38,
    14,
    20,
    3,
    10,
    420,
    95,
    true,
    'library'
);

-- Recipe 105: Nicoise Salad
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Nicoise Salad',
    'nicoise-salad',
    'French composed salad with tuna, eggs, olives, and green beans',
    'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=800',
    '1. Blanch green beans, shock in ice water.
2. Boil potatoes until tender, quarter.
3. Hard boil eggs, cool and halve.
4. Arrange lettuce on platter.
5. Artfully place tuna, vegetables, eggs, olives.
6. Make vinaigrette with Dijon, shallots, herbs.
7. Drizzle dressing over salad.',
    'French',
    'meal',
    'medium',
    30,
    15,
    4,
    450,
    32,
    28,
    24,
    5,
    4,
    580,
    235,
    true,
    'library'
);

-- Recipe 106: Asian Chicken Salad
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Asian Chicken Salad',
    'asian-chicken-salad',
    'Crunchy cabbage salad with sesame ginger dressing',
    'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=800',
    '1. Shred cabbage and slice vegetables.
2. Cook and shred chicken.
3. Toast almonds and sesame seeds.
4. Make dressing: rice vinegar, sesame oil, ginger, soy.
5. Toss cabbage with dressing.
6. Top with chicken, crispy wontons.
7. Garnish with green onions and cilantro.',
    'Asian',
    'meal',
    'easy',
    25,
    15,
    4,
    340,
    32,
    18,
    16,
    5,
    8,
    620,
    85,
    true,
    'library'
);

-- Recipe 107: BLT Sandwich
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'BLT Sandwich',
    'blt-sandwich',
    'Classic bacon, lettuce, and tomato sandwich',
    'https://images.unsplash.com/photo-1619096252214-ef06c45683e3?w=800',
    '1. Cook bacon until crispy.
2. Toast bread slices.
3. Spread mayo on both slices.
4. Layer: lettuce, tomato slices, bacon.
5. Season tomatoes with salt and pepper.
6. Close sandwich, cut diagonally.
7. Serve with chips or salad.',
    'American',
    'meal',
    'easy',
    10,
    10,
    2,
    450,
    18,
    32,
    28,
    2,
    4,
    1100,
    45,
    true,
    'library'
);

-- Recipe 108: Grilled Cheese Sandwich
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Grilled Cheese Sandwich',
    'grilled-cheese-sandwich',
    'Buttery toasted bread with melted cheese',
    'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=800',
    '1. Butter one side of each bread slice.
2. Place cheese between bread, butter sides out.
3. Cook in skillet over medium heat.
4. Press down with spatula.
5. Flip when golden, about 3 minutes.
6. Cook other side until cheese melts.
7. Cut in half and serve with tomato soup.',
    'American',
    'meal',
    'easy',
    5,
    8,
    2,
    420,
    16,
    32,
    26,
    1,
    4,
    680,
    70,
    true,
    'library'
);

-- Recipe 109: Tuna Melt
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Tuna Melt',
    'tuna-melt',
    'Tuna salad on toast with melted cheese',
    'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=800',
    '1. Mix tuna with mayo, celery, onion, lemon.
2. Season with salt and pepper.
3. Toast bread slices.
4. Spread tuna mixture on toast.
5. Top with cheese slices.
6. Broil until cheese melts and bubbles.
7. Serve hot.',
    'American',
    'meal',
    'easy',
    10,
    5,
    2,
    480,
    38,
    30,
    24,
    2,
    4,
    780,
    75,
    true,
    'library'
);

-- Recipe 110: Club Sandwich
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Club Sandwich',
    'club-sandwich',
    'Triple-decker sandwich with turkey, bacon, and all the fixings',
    'https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=800',
    '1. Toast three slices of bread.
2. Cook bacon until crispy.
3. Spread mayo on all toast slices.
4. Layer 1: turkey, lettuce, tomato.
5. Add middle toast, mayo side up.
6. Layer 2: bacon, turkey, lettuce.
7. Top with final toast, secure with toothpicks, cut into triangles.',
    'American',
    'meal',
    'easy',
    15,
    10,
    2,
    580,
    38,
    42,
    30,
    3,
    6,
    1350,
    95,
    true,
    'library'
);

-- Recipe 111: Quesadilla
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Quesadilla',
    'quesadilla',
    'Crispy tortilla filled with melted cheese and your choice of fillings',
    'https://images.unsplash.com/photo-1618040996337-56904b7850b9?w=800',
    '1. Heat large skillet over medium heat.
2. Place tortilla in pan.
3. Spread cheese on half the tortilla.
4. Add optional fillings: chicken, peppers, onions.
5. Fold tortilla in half.
6. Cook 2-3 minutes per side until golden.
7. Cut into wedges, serve with salsa and sour cream.',
    'Mexican',
    'meal',
    'easy',
    10,
    10,
    4,
    420,
    22,
    36,
    22,
    2,
    3,
    720,
    65,
    true,
    'library'
);

-- Recipe 112: Stir Fry Vegetables
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Stir Fry Vegetables',
    'stir-fry-vegetables',
    'Quick-cooked mixed vegetables in savory sauce',
    'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800',
    '1. Prep all vegetables, cut uniform sizes.
2. Mix sauce: soy sauce, oyster sauce, sesame oil, cornstarch.
3. Heat wok until smoking.
4. Add oil, then garlic and ginger.
5. Add vegetables in order of cook time.
6. Pour sauce, toss until vegetables are coated.
7. Serve over rice.',
    'Chinese',
    'meal',
    'easy',
    15,
    10,
    4,
    180,
    6,
    22,
    8,
    5,
    10,
    820,
    NULL,
    true,
    'library'
);

-- Recipe 113: Chicken Wrap
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Wrap',
    'chicken-wrap',
    'Grilled chicken with vegetables wrapped in flour tortilla',
    'https://images.unsplash.com/photo-1626700051175-6818013e1d4f?w=800',
    '1. Grill or pan-fry seasoned chicken.
2. Slice chicken into strips.
3. Warm tortillas.
4. Spread sauce on tortilla.
5. Layer: lettuce, chicken, tomatoes, cheese.
6. Fold sides in, roll tightly.
7. Cut in half diagonally to serve.',
    'American',
    'meal',
    'easy',
    10,
    15,
    4,
    420,
    32,
    36,
    16,
    2,
    3,
    680,
    85,
    true,
    'library'
);

-- Recipe 114: Fettuccine Alfredo
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Fettuccine Alfredo',
    'fettuccine-alfredo',
    'Creamy pasta with Parmesan and butter sauce',
    'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?w=800',
    '1. Cook fettuccine until al dente, reserve pasta water.
2. Melt butter in large pan.
3. Add cream, simmer 2 minutes.
4. Add cooked pasta, toss well.
5. Remove from heat, add Parmesan.
6. Toss, adding pasta water for consistency.
7. Season with pepper, serve immediately.',
    'Italian',
    'meal',
    'easy',
    10,
    15,
    4,
    580,
    18,
    52,
    34,
    2,
    3,
    420,
    110,
    true,
    'library'
);

-- Recipe 115: Pasta Primavera
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Pasta Primavera',
    'pasta-primavera',
    'Pasta with fresh spring vegetables in light garlic sauce',
    'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=800',
    '1. Cook pasta according to package.
2. Sauté garlic in olive oil.
3. Add vegetables in order of cook time.
4. Add white wine, simmer 1 minute.
5. Toss with pasta and pasta water.
6. Add Parmesan and fresh basil.
7. Season with salt and pepper.',
    'Italian',
    'meal',
    'easy',
    20,
    15,
    4,
    420,
    14,
    58,
    14,
    5,
    6,
    320,
    15,
    true,
    'library'
);

-- Recipe 116: Pasta Puttanesca
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Pasta Puttanesca',
    'pasta-puttanesca',
    'Spicy tomato pasta with olives, capers, and anchovies',
    'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=800',
    '1. Cook spaghetti until al dente.
2. Sauté garlic and anchovies in olive oil until anchovies dissolve.
3. Add chili flakes, tomatoes.
4. Simmer 15 minutes.
5. Add olives and capers.
6. Toss with pasta.
7. Garnish with fresh parsley.',
    'Italian',
    'meal',
    'easy',
    10,
    20,
    4,
    420,
    14,
    62,
    14,
    4,
    8,
    920,
    10,
    true,
    'library'
);

-- Recipe 117: Gnocchi with Sage Butter
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Gnocchi with Sage Butter',
    'gnocchi-with-sage-butter',
    'Pillowy potato dumplings in brown butter and crispy sage',
    'https://images.unsplash.com/photo-1551183053-bf91a1d81141?w=800',
    '1. Cook gnocchi according to package.
2. Melt butter in large pan until golden brown.
3. Add sage leaves, fry until crispy.
4. Drain gnocchi, add to butter.
5. Toss gently to coat.
6. Add Parmesan, toss again.
7. Serve immediately with extra sage.',
    'Italian',
    'meal',
    'easy',
    5,
    10,
    4,
    420,
    12,
    48,
    22,
    2,
    2,
    580,
    60,
    true,
    'library'
);

-- Recipe 118: Grilled Salmon
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Grilled Salmon',
    'grilled-salmon',
    'Simple grilled salmon with lemon and herbs',
    'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=800',
    '1. Pat salmon dry, season with salt and pepper.
2. Drizzle with olive oil.
3. Preheat grill to high.
4. Grill skin-side down 4 minutes.
5. Flip, grill 3 more minutes.
6. Rest 2 minutes.
7. Serve with lemon wedges and fresh dill.',
    'American',
    'meal',
    'easy',
    10,
    10,
    4,
    320,
    34,
    1,
    20,
    NULL,
    NULL,
    620,
    95,
    true,
    'library'
);

-- Recipe 119: Shrimp Scampi
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Shrimp Scampi',
    'shrimp-scampi',
    'Garlicky shrimp in white wine butter sauce over pasta',
    'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?w=800',
    '1. Cook linguine until al dente.
2. Sauté shrimp in butter until pink, remove.
3. Add garlic, cook 30 seconds.
4. Add wine and lemon juice, simmer.
5. Whisk in cold butter pieces.
6. Return shrimp, add pasta.
7. Toss with parsley and red pepper flakes.',
    'Italian',
    'meal',
    'medium',
    15,
    20,
    4,
    520,
    32,
    48,
    22,
    2,
    2,
    580,
    245,
    true,
    'library'
);

-- Recipe 120: Fish Tacos
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Fish Tacos',
    'fish-tacos',
    'Crispy battered fish with cabbage slaw and crema',
    'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?w=800',
    '1. Make slaw: toss cabbage with lime, cilantro.
2. Make crema: mix sour cream, lime, chipotle.
3. Season fish, coat in batter.
4. Fry fish until golden and crispy.
5. Warm tortillas.
6. Assemble: fish, slaw, crema, lime wedge.
7. Serve immediately.',
    'Mexican',
    'meal',
    'medium',
    25,
    15,
    4,
    450,
    28,
    42,
    18,
    4,
    3,
    580,
    75,
    true,
    'library'
);

-- Recipe 121: Garlic Butter Shrimp
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Garlic Butter Shrimp',
    'garlic-butter-shrimp',
    'Quick pan-fried shrimp in garlic herb butter',
    'https://images.unsplash.com/photo-1599084993091-1cb5c0721cc6?w=800',
    '1. Season shrimp with salt, pepper, paprika.
2. Melt butter in large skillet.
3. Add garlic, cook 30 seconds.
4. Add shrimp in single layer.
5. Cook 2 minutes per side.
6. Add lemon juice and parsley.
7. Serve over rice or with crusty bread.',
    'American',
    'meal',
    'easy',
    10,
    8,
    4,
    220,
    26,
    3,
    12,
    NULL,
    NULL,
    520,
    215,
    true,
    'library'
);

-- Recipe 122: Shepherd's Pie
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Shepherd''s Pie',
    'shepherds-pie',
    'Savory lamb mince topped with creamy mashed potatoes',
    'https://images.unsplash.com/photo-1600891964092-4316c288032e?w=800',
    '1. Brown lamb mince with onion.
2. Add carrots, peas, tomato paste, Worcestershire.
3. Add stock, simmer 20 minutes.
4. Make mashed potatoes with butter and milk.
5. Transfer meat to baking dish.
6. Top with mashed potatoes, create peaks.
7. Bake at 400°F until golden, about 25 minutes.',
    'British',
    'meal',
    'medium',
    30,
    45,
    6,
    480,
    28,
    38,
    24,
    5,
    6,
    620,
    95,
    true,
    'library'
);

-- Recipe 123: Chicken Pot Pie
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Pot Pie',
    'chicken-pot-pie',
    'Creamy chicken and vegetables under flaky pastry crust',
    'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800',
    '1. Poach chicken, shred into pieces.
2. Sauté onion, carrots, celery in butter.
3. Add flour, cook 1 minute.
4. Gradually add stock and cream.
5. Add chicken, peas, thyme.
6. Pour into pie dish.
7. Top with puff pastry, brush with egg.
8. Bake at 400°F for 30 minutes until golden.',
    'American',
    'meal',
    'medium',
    30,
    45,
    6,
    520,
    28,
    34,
    30,
    3,
    5,
    680,
    125,
    true,
    'library'
);

-- Recipe 124: Meatloaf
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Meatloaf',
    'meatloaf',
    'Classic American meatloaf with tangy glaze',
    'https://images.unsplash.com/photo-1432139509613-5c4255815697?w=800',
    '1. Mix beef with breadcrumbs, egg, onion, seasonings.
2. Form into loaf shape on baking sheet.
3. Make glaze: ketchup, brown sugar, mustard.
4. Brush half the glaze on meatloaf.
5. Bake at 350°F for 45 minutes.
6. Brush remaining glaze, bake 15 more minutes.
7. Rest 10 minutes before slicing.',
    'American',
    'meal',
    'easy',
    20,
    60,
    8,
    380,
    28,
    18,
    22,
    1,
    10,
    680,
    115,
    true,
    'library'
);

-- Recipe 125: Beef Stroganoff
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Beef Stroganoff',
    'beef-stroganoff',
    'Tender beef strips in creamy mushroom sauce',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800',
    '1. Slice beef into thin strips.
2. Brown beef quickly over high heat, set aside.
3. Sauté mushrooms and onions.
4. Add garlic, cook 30 seconds.
5. Add stock, simmer until reduced.
6. Stir in sour cream and mustard.
7. Return beef, warm through.
8. Serve over egg noodles.',
    'Russian',
    'meal',
    'medium',
    20,
    25,
    4,
    580,
    38,
    48,
    26,
    3,
    5,
    580,
    145,
    true,
    'library'
);

-- Recipe 126: Chili Con Carne
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chili Con Carne',
    'chili-con-carne',
    'Hearty beef and bean chili with warm spices',
    'https://images.unsplash.com/photo-1594756202469-9ff9799b2e4e?w=800',
    '1. Brown beef in large pot.
2. Add onion, peppers, cook until soft.
3. Add garlic, spices, cook 1 minute.
4. Add tomatoes, beans, stock.
5. Simmer 45 minutes to 1 hour.
6. Adjust seasoning.
7. Serve with cornbread, sour cream, cheese.',
    'American',
    'meal',
    'easy',
    15,
    60,
    6,
    420,
    32,
    28,
    22,
    8,
    8,
    720,
    85,
    true,
    'library'
);

-- Recipe 127: Lemon Herb Roasted Chicken
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Lemon Herb Roasted Chicken',
    'lemon-herb-roasted-chicken',
    'Juicy whole roasted chicken with lemon and fresh herbs',
    'https://images.unsplash.com/photo-1598103442097-8b74394b95c6?w=800',
    '1. Pat chicken dry, season inside and out.
2. Stuff cavity with lemon and herbs.
3. Rub butter under and over skin.
4. Roast at 425°F for 1 hour 15 minutes.
5. Let rest 15 minutes.
6. Carve and serve with pan juices.',
    'American',
    'meal',
    'medium',
    15,
    75,
    6,
    380,
    42,
    2,
    22,
    NULL,
    NULL,
    520,
    145,
    true,
    'library'
);

-- Recipe 128: Honey Garlic Chicken
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Honey Garlic Chicken',
    'honey-garlic-chicken',
    'Sticky sweet chicken thighs with honey garlic glaze',
    'https://images.unsplash.com/photo-1527477396000-e27163b481c2?w=800',
    '1. Season chicken thighs with salt and pepper.
2. Pan fry skin-side down until crispy.
3. Flip, cook 5 more minutes.
4. Mix honey, soy sauce, garlic, ginger.
5. Pour sauce into pan, simmer until thick.
6. Baste chicken with glaze.
7. Garnish with sesame seeds and green onions.',
    'Asian',
    'meal',
    'easy',
    10,
    25,
    4,
    420,
    35,
    24,
    20,
    NULL,
    22,
    920,
    145,
    true,
    'library'
);

-- Recipe 129: Chicken Marsala
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Marsala',
    'chicken-marsala',
    'Pan-fried chicken cutlets in Marsala wine mushroom sauce',
    'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800',
    '1. Pound chicken breasts thin.
2. Dredge in seasoned flour.
3. Pan fry in butter until golden.
4. Remove chicken, add mushrooms.
5. Add Marsala wine, scrape up browned bits.
6. Add stock, simmer until reduced.
7. Return chicken, finish with butter and parsley.',
    'Italian',
    'meal',
    'medium',
    15,
    25,
    4,
    380,
    38,
    14,
    18,
    1,
    3,
    580,
    125,
    true,
    'library'
);

-- Recipe 130: Orange Chicken
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Orange Chicken',
    'orange-chicken',
    'Crispy chicken in sweet and tangy orange sauce',
    'https://images.unsplash.com/photo-1525755662778-989d0524087e?w=800',
    '1. Cut chicken into bite-size pieces.
2. Coat in cornstarch mixture.
3. Deep fry until golden and crispy.
4. Make sauce: orange juice, zest, soy, sugar, vinegar.
5. Simmer sauce until thick.
6. Toss fried chicken in sauce.
7. Garnish with orange zest and green onions.',
    'Chinese',
    'meal',
    'medium',
    20,
    20,
    4,
    480,
    32,
    48,
    18,
    1,
    32,
    820,
    125,
    true,
    'library'
);

-- Recipe 131: Chicken Noodle Soup
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Noodle Soup',
    'chicken-noodle-soup',
    'Classic comfort soup with tender chicken and egg noodles',
    'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=800',
    '1. Simmer chicken in water with aromatics 1 hour.
2. Remove chicken, shred meat.
3. Strain broth.
4. Sauté onion, celery, carrots.
5. Add broth, bring to boil.
6. Add noodles, cook until tender.
7. Return chicken, add fresh dill.
8. Season to taste.',
    'American',
    'meal',
    'easy',
    15,
    75,
    8,
    220,
    22,
    18,
    6,
    2,
    4,
    680,
    75,
    true,
    'library'
);

-- Recipe 132: Tomato Basil Soup
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Tomato Basil Soup',
    'tomato-basil-soup',
    'Creamy roasted tomato soup with fresh basil',
    'https://images.unsplash.com/photo-1476718406336-bb5a9690ee2a?w=800',
    '1. Roast tomatoes with garlic and onion at 400°F.
2. Transfer to pot, add stock.
3. Simmer 20 minutes.
4. Blend until smooth.
5. Return to pot, add cream.
6. Stir in fresh basil.
7. Serve with grilled cheese sandwich.',
    'Italian',
    'meal',
    'easy',
    10,
    45,
    6,
    180,
    4,
    16,
    12,
    3,
    10,
    580,
    25,
    true,
    'library'
);

-- Recipe 133: Minestrone Soup
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Minestrone Soup',
    'minestrone-soup',
    'Hearty Italian vegetable soup with pasta and beans',
    'https://images.unsplash.com/photo-1603105037880-880cd4edfb0d?w=800',
    '1. Sauté onion, celery, carrots in olive oil.
2. Add garlic, tomatoes, stock.
3. Add potatoes, zucchini, green beans.
4. Simmer 20 minutes.
5. Add cannellini beans and pasta.
6. Cook until pasta is tender.
7. Serve with Parmesan and crusty bread.',
    'Italian',
    'meal',
    'easy',
    20,
    35,
    8,
    220,
    10,
    34,
    6,
    8,
    6,
    620,
    5,
    true,
    'library'
);

-- Recipe 134: Butternut Squash Soup
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Butternut Squash Soup',
    'butternut-squash-soup',
    'Velvety smooth soup with roasted butternut squash',
    'https://images.unsplash.com/photo-1476718406336-bb5a9690ee2a?w=800',
    '1. Roast butternut squash at 400°F until tender.
2. Sauté onion and garlic.
3. Add squash and stock, simmer 15 minutes.
4. Blend until silky smooth.
5. Add cream and maple syrup.
6. Season with nutmeg.
7. Serve with pumpkin seeds and sage.',
    'American',
    'meal',
    'easy',
    15,
    45,
    6,
    180,
    4,
    26,
    8,
    4,
    10,
    480,
    20,
    true,
    'library'
);

-- Recipe 135: Vegetable Curry
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Vegetable Curry',
    'vegetable-curry',
    'Creamy coconut curry with mixed vegetables',
    'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=800',
    '1. Heat oil, fry curry paste 1 minute.
2. Add onion, cook until soft.
3. Add vegetables that take longer to cook first.
4. Pour in coconut milk.
5. Simmer until vegetables tender.
6. Add spinach at end.
7. Serve over basmati rice.',
    'Indian',
    'meal',
    'easy',
    15,
    25,
    4,
    380,
    12,
    42,
    20,
    8,
    8,
    520,
    NULL,
    true,
    'library'
);

-- Recipe 136: Stuffed Bell Peppers
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Stuffed Bell Peppers',
    'stuffed-bell-peppers',
    'Bell peppers filled with rice, beans, and cheese',
    'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=800',
    '1. Cut tops off peppers, remove seeds.
2. Mix cooked rice with beans, corn, tomatoes, spices.
3. Stuff peppers with mixture.
4. Top with cheese.
5. Bake at 375°F for 35 minutes.
6. Garnish with cilantro and sour cream.',
    'Mexican',
    'meal',
    'easy',
    20,
    35,
    6,
    320,
    14,
    44,
    10,
    8,
    6,
    580,
    25,
    true,
    'library'
);

-- Recipe 137: Eggplant Parmesan
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Eggplant Parmesan',
    'eggplant-parmesan',
    'Breaded eggplant slices layered with marinara and mozzarella',
    'https://images.unsplash.com/photo-1625944525533-473f1a3d54e7?w=800',
    '1. Slice eggplant, salt and drain 30 minutes.
2. Bread slices: flour, egg, breadcrumbs.
3. Fry until golden on both sides.
4. Layer in baking dish: sauce, eggplant, mozzarella.
5. Repeat layers.
6. Top with Parmesan.
7. Bake at 375°F for 30 minutes.',
    'Italian',
    'meal',
    'medium',
    45,
    45,
    6,
    420,
    20,
    36,
    24,
    6,
    10,
    720,
    95,
    true,
    'library'
);

-- Recipe 138: Black Bean Tacos
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Black Bean Tacos',
    'black-bean-tacos',
    'Crispy corn tacos with seasoned black beans and fresh toppings',
    'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?w=800',
    '1. Mash half the beans, leave half whole.
2. Cook beans with cumin, chili, garlic.
3. Warm corn tortillas.
4. Fill with bean mixture.
5. Top with cabbage, avocado, salsa.
6. Add lime crema.
7. Garnish with cilantro and lime wedge.',
    'Mexican',
    'meal',
    'easy',
    15,
    10,
    4,
    380,
    14,
    52,
    14,
    16,
    4,
    620,
    10,
    true,
    'library'
);

-- Recipe 139: Vegetable Fried Rice
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Vegetable Fried Rice',
    'vegetable-fried-rice',
    'Quick stir-fried rice with mixed vegetables and eggs',
    'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800',
    '1. Use day-old cold rice for best results.
2. Scramble eggs, set aside.
3. Stir-fry vegetables in hot wok.
4. Add rice, break up clumps.
5. Add soy sauce, cook until rice is slightly crispy.
6. Return eggs, add green onions.
7. Drizzle with sesame oil.',
    'Chinese',
    'meal',
    'easy',
    10,
    10,
    4,
    320,
    10,
    48,
    10,
    3,
    4,
    680,
    140,
    true,
    'library'
);

-- Recipe 140: Gyros
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Gyros',
    'gyros',
    'Greek spiced meat in warm pita with tzatziki',
    'https://images.unsplash.com/photo-1561651823-34feb02250e4?w=800',
    '1. Mix lamb with spices, form into loaf.
2. Roast at 350°F for 45 minutes.
3. Make tzatziki: yogurt, cucumber, garlic, dill.
4. Slice meat thinly.
5. Warm pita bread.
6. Fill with meat, tzatziki, tomatoes, onion.
7. Serve with lemon wedge.',
    'Greek',
    'meal',
    'medium',
    20,
    50,
    4,
    520,
    35,
    38,
    26,
    3,
    5,
    680,
    110,
    true,
    'library'
);

-- Recipe 141: Moussaka
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Moussaka',
    'moussaka',
    'Greek layered eggplant casserole with lamb and béchamel',
    'https://images.unsplash.com/photo-1574484284002-952d92456975?w=800',
    '1. Slice and salt eggplant, let drain.
2. Fry eggplant slices until golden.
3. Brown lamb with onion, add tomatoes, spices.
4. Make béchamel: butter, flour, milk, nutmeg.
5. Layer: eggplant, meat, eggplant, béchamel.
6. Top with cheese.
7. Bake at 375°F for 45 minutes.',
    'Greek',
    'meal',
    'hard',
    45,
    60,
    8,
    420,
    22,
    24,
    28,
    5,
    8,
    520,
    85,
    true,
    'library'
);

-- Recipe 142: Doner Kebab
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Doner Kebab',
    'doner-kebab',
    'Turkish spiced lamb with flatbread and vegetables',
    'https://images.unsplash.com/photo-1561651823-34feb02250e4?w=800',
    '1. Mix lamb with spices and onion.
2. Form around skewers or into patties.
3. Grill until cooked through.
4. Warm flatbread.
5. Slice meat thinly.
6. Serve with salad, pickles, garlic sauce.
7. Wrap or serve open-faced.',
    'Turkish',
    'meal',
    'medium',
    20,
    15,
    4,
    480,
    32,
    36,
    24,
    3,
    4,
    720,
    105,
    true,
    'library'
);

-- Recipe 143: Jerk Chicken
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Jerk Chicken',
    'jerk-chicken',
    'Spicy Caribbean grilled chicken with scotch bonnet marinade',
    'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=800',
    '1. Blend jerk marinade: scotch bonnets, allspice, thyme, garlic.
2. Marinate chicken overnight.
3. Grill over medium heat, turning often.
4. Baste with extra marinade.
5. Cook until internal temp reaches 165°F.
6. Rest 5 minutes.
7. Serve with rice and peas.',
    'Caribbean',
    'meal',
    'medium',
    20,
    35,
    6,
    380,
    38,
    8,
    22,
    1,
    5,
    620,
    145,
    true,
    'library'
);

-- Recipe 144: Chicken Schnitzel
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Schnitzel',
    'chicken-schnitzel',
    'Crispy breaded chicken cutlet, Austrian style',
    'https://images.unsplash.com/photo-1599921841143-819065a55cc6?w=800',
    '1. Pound chicken breasts very thin.
2. Season with salt and pepper.
3. Set up breading station: flour, egg, breadcrumbs.
4. Coat each cutlet.
5. Pan fry in butter and oil until golden.
6. Drain on paper towels.
7. Serve with lemon wedge and parsley.',
    'Austrian',
    'meal',
    'easy',
    20,
    15,
    4,
    420,
    38,
    28,
    18,
    1,
    2,
    580,
    180,
    true,
    'library'
);

-- Recipe 145: Pierogi
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Pierogi',
    'pierogi',
    'Polish dumplings filled with potato and cheese',
    'https://images.unsplash.com/photo-1534939561126-855b8675edd7?w=800',
    '1. Make dough: flour, egg, water, sour cream.
2. Make filling: mashed potatoes with cheese and onion.
3. Roll dough thin, cut circles.
4. Fill and seal edges with fork.
5. Boil until they float.
6. Pan fry in butter until golden.
7. Serve with sour cream and fried onions.',
    'Polish',
    'meal',
    'hard',
    60,
    20,
    6,
    380,
    12,
    48,
    16,
    3,
    3,
    520,
    65,
    true,
    'library'
);

-- Recipe 146: Chicken Satay
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Satay',
    'chicken-satay',
    'Grilled chicken skewers with peanut dipping sauce',
    'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?w=800',
    '1. Marinate chicken in coconut milk, turmeric, cumin.
2. Thread on bamboo skewers.
3. Make peanut sauce: peanut butter, coconut milk, soy, lime.
4. Grill skewers 3-4 minutes per side.
5. Baste with marinade while cooking.
6. Serve with warm peanut sauce.
7. Garnish with chopped peanuts and cilantro.',
    'Thai',
    'meal',
    'easy',
    25,
    12,
    4,
    420,
    35,
    14,
    26,
    2,
    8,
    680,
    125,
    true,
    'library'
);

-- Recipe 147: Beef Rendang
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Beef Rendang',
    'beef-rendang',
    'Indonesian dry curry with tender coconut beef',
    'https://images.unsplash.com/photo-1574653853027-5382a3d23a15?w=800',
    '1. Blend spice paste: shallots, ginger, galangal, chilies.
2. Brown beef cubes in oil.
3. Add spice paste, cook fragrant.
4. Add coconut milk, lemongrass, lime leaves.
5. Simmer 2-3 hours until dry and dark.
6. Stir frequently near end.
7. Serve with steamed rice.',
    'Indonesian',
    'meal',
    'hard',
    30,
    180,
    6,
    480,
    35,
    12,
    34,
    3,
    4,
    580,
    95,
    true,
    'library'
);

-- Recipe 148: Horchata
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Horchata',
    'horchata',
    'Mexican sweet rice and cinnamon drink',
    'https://images.unsplash.com/photo-1541658016709-82535e94bc69?w=800',
    '1. Soak rice and cinnamon in water overnight.
2. Blend rice mixture until smooth.
3. Strain through cheesecloth.
4. Add sugar and vanilla.
5. Stir until sugar dissolves.
6. Chill well.
7. Serve over ice with cinnamon stick.',
    'Mexican',
    'drink',
    'easy',
    15,
    NULL,
    6,
    150,
    2,
    34,
    NULL,
    NULL,
    26,
    10,
    NULL,
    true,
    'library'
);

-- Recipe 149: Mint Julep
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Mint Julep',
    'mint-julep',
    'Classic bourbon cocktail with fresh mint',
    'https://images.unsplash.com/photo-1551024709-8f23befc6f87?w=800',
    '1. Muddle mint with simple syrup in julep cup.
2. Fill cup with crushed ice.
3. Add bourbon.
4. Stir until cup frosts.
5. Add more crushed ice.
6. Garnish with mint sprig.
7. Serve with short straw.',
    'American',
    'drink',
    'easy',
    5,
    NULL,
    1,
    180,
    NULL,
    8,
    NULL,
    NULL,
    8,
    5,
    NULL,
    true,
    'library'
);

-- Recipe 150: Thai Iced Tea
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Thai Iced Tea',
    'thai-iced-tea',
    'Sweet creamy orange tea over ice',
    'https://images.unsplash.com/photo-1558857563-b371033873b8?w=800',
    '1. Brew Thai tea strongly with spices.
2. Strain tea.
3. Add sugar while hot, stir to dissolve.
4. Let cool.
5. Fill glass with ice.
6. Pour tea to 3/4 full.
7. Top with evaporated milk or cream.',
    'Thai',
    'drink',
    'easy',
    10,
    10,
    2,
    180,
    4,
    36,
    4,
    NULL,
    32,
    60,
    15,
    true,
    'library'
);

-- Recipe 151: Moscow Mule
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Moscow Mule',
    'moscow-mule',
    'Vodka cocktail with ginger beer and lime',
    'https://images.unsplash.com/photo-1551024709-8f23befc6f87?w=800',
    '1. Fill copper mug with ice.
2. Add vodka.
3. Squeeze lime juice over.
4. Top with ginger beer.
5. Gently stir.
6. Garnish with lime wheel and mint.
7. Serve immediately.',
    'American',
    'drink',
    'easy',
    5,
    NULL,
    1,
    180,
    NULL,
    16,
    NULL,
    NULL,
    14,
    10,
    NULL,
    true,
    'library'
);

-- Recipe 152: Hot Toddy
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Hot Toddy',
    'hot-toddy',
    'Warming whiskey drink with honey, lemon, and spices',
    'https://images.unsplash.com/photo-1544145945-f90425340c7e?w=800',
    '1. Heat water until hot but not boiling.
2. Add honey, stir to dissolve.
3. Add whiskey and lemon juice.
4. Add cinnamon stick and cloves.
5. Stir gently.
6. Garnish with lemon wheel.
7. Serve warm.',
    'American',
    'drink',
    'easy',
    5,
    5,
    1,
    150,
    NULL,
    14,
    NULL,
    NULL,
    12,
    5,
    NULL,
    true,
    'library'
);

-- Recipe 153: Spinach Artichoke Dip
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Spinach Artichoke Dip',
    'spinach-artichoke-dip',
    'Creamy baked dip with spinach, artichokes, and cheese',
    'https://images.unsplash.com/photo-1576506295286-5cda18df43e7?w=800',
    '1. Squeeze moisture from spinach and artichokes.
2. Mix cream cheese, sour cream, mayo.
3. Add spinach, artichokes, garlic.
4. Fold in Parmesan and mozzarella.
5. Transfer to baking dish.
6. Bake at 350°F for 25 minutes until bubbly.
7. Serve with tortilla chips or bread.',
    'American',
    'snack',
    'easy',
    15,
    25,
    10,
    220,
    8,
    8,
    18,
    3,
    2,
    420,
    45,
    true,
    'library'
);

-- Recipe 154: Bruschetta
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Bruschetta',
    'bruschetta',
    'Toasted bread topped with fresh tomato and basil',
    'https://images.unsplash.com/photo-1572695157366-5e585ab2b69f?w=800',
    '1. Dice tomatoes, remove excess juice.
2. Mix with garlic, basil, olive oil, balsamic.
3. Season with salt and pepper.
4. Let sit 15 minutes.
5. Toast baguette slices with olive oil.
6. Rub with garlic clove.
7. Top with tomato mixture, serve immediately.',
    'Italian',
    'snack',
    'easy',
    15,
    5,
    6,
    160,
    4,
    22,
    6,
    2,
    4,
    280,
    NULL,
    true,
    'library'
);

-- Recipe 155: Deviled Eggs
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Deviled Eggs',
    'deviled-eggs',
    'Classic stuffed eggs with creamy paprika filling',
    'https://images.unsplash.com/photo-1608039829572-9b0b8eb4fa1f?w=800',
    '1. Hard boil eggs 12 minutes, cool in ice bath.
2. Peel eggs, cut in half lengthwise.
3. Remove yolks to bowl.
4. Mash yolks with mayo, mustard, vinegar.
5. Season with salt and pepper.
6. Pipe or spoon filling into whites.
7. Dust with paprika and garnish with chives.',
    'American',
    'snack',
    'easy',
    20,
    12,
    12,
    80,
    5,
    1,
    6,
    NULL,
    NULL,
    120,
    165,
    true,
    'library'
);

-- Recipe 156: Stuffed Mushrooms
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Stuffed Mushrooms',
    'stuffed-mushrooms',
    'Baked mushroom caps with herb cream cheese filling',
    'https://images.unsplash.com/photo-1518977676601-b53f82ber6b?w=800',
    '1. Remove stems from mushrooms, chop stems.
2. Sauté stems with garlic and herbs.
3. Mix with cream cheese and Parmesan.
4. Fill mushroom caps.
5. Top with extra Parmesan.
6. Bake at 375°F for 20 minutes.
7. Broil 2 minutes to brown tops.',
    'American',
    'snack',
    'easy',
    20,
    22,
    8,
    110,
    5,
    4,
    9,
    1,
    2,
    180,
    25,
    true,
    'library'
);

-- Recipe 157: Nachos Supreme
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Nachos Supreme',
    'nachos-supreme',
    'Loaded tortilla chips with cheese, beans, and toppings',
    'https://images.unsplash.com/photo-1513456852971-30c0b8199d4d?w=800',
    '1. Spread chips on baking sheet.
2. Add layers of cheese and beans.
3. Add ground beef if using.
4. Bake at 400°F until cheese melts.
5. Top with pico de gallo.
6. Add sour cream, guacamole, jalapeños.
7. Serve immediately.',
    'Mexican',
    'snack',
    'easy',
    15,
    10,
    6,
    480,
    18,
    38,
    30,
    6,
    4,
    920,
    55,
    true,
    'library'
);

-- Recipe 158: Pork Chops with Apple
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Pork Chops with Apple',
    'pork-chops-with-apple',
    'Pan-seared pork chops with caramelized apple slices',
    'https://images.unsplash.com/photo-1432139555190-58524dae6a55?w=800',
    '1. Season pork chops with salt, pepper, sage.
2. Sear in hot pan 4 minutes per side.
3. Remove, add butter to pan.
4. Sauté apple slices until golden.
5. Add cider, scrape up browned bits.
6. Return pork, simmer until cooked.
7. Serve with apple sauce.',
    'American',
    'meal',
    'easy',
    10,
    20,
    4,
    380,
    32,
    16,
    22,
    2,
    12,
    520,
    95,
    true,
    'library'
);

-- Recipe 159: Lamb Chops
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Lamb Chops',
    'lamb-chops',
    'Herb-crusted lamb chops grilled to perfection',
    'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=800',
    '1. Mix herbs, garlic, and olive oil into paste.
2. Rub on lamb chops, marinate 1 hour.
3. Preheat grill to high.
4. Grill 3-4 minutes per side for medium-rare.
5. Rest 5 minutes.
6. Serve with mint sauce.
7. Garnish with fresh rosemary.',
    'French',
    'meal',
    'medium',
    15,
    10,
    4,
    420,
    35,
    2,
    30,
    NULL,
    NULL,
    580,
    120,
    true,
    'library'
);

-- Recipe 160: Chicken Adobo
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Adobo',
    'chicken-adobo',
    'Filipino braised chicken in soy and vinegar',
    'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=800',
    '1. Marinate chicken in soy sauce, vinegar, garlic, bay leaves.
2. Brown chicken pieces in oil.
3. Add marinade to pan.
4. Simmer covered 30 minutes.
5. Uncover, reduce sauce until thick.
6. Serve with steamed rice.
7. Garnish with green onions.',
    'Filipino',
    'meal',
    'easy',
    15,
    40,
    6,
    380,
    35,
    6,
    24,
    NULL,
    2,
    1200,
    145,
    true,
    'library'
);

-- Recipe 161: Spaghetti Aglio e Olio
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Spaghetti Aglio e Olio',
    'spaghetti-aglio-e-olio',
    'Simple pasta with garlic, olive oil, and chili',
    'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=800',
    '1. Cook spaghetti until al dente, reserve pasta water.
2. Slice garlic thinly.
3. Heat olive oil, add garlic and chili.
4. Cook until garlic is golden.
5. Add pasta and pasta water.
6. Toss to emulsify.
7. Finish with parsley and Parmesan.',
    'Italian',
    'meal',
    'easy',
    10,
    15,
    4,
    420,
    12,
    56,
    18,
    3,
    2,
    380,
    10,
    true,
    'library'
);

-- Recipe 162: Beef Tacos
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Beef Tacos',
    'beef-tacos',
    'Seasoned ground beef in crunchy taco shells',
    'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=800',
    '1. Brown beef, drain excess fat.
2. Add taco seasoning and water.
3. Simmer until sauce thickens.
4. Warm taco shells.
5. Fill with beef.
6. Top with lettuce, cheese, tomatoes, sour cream.
7. Add hot sauce if desired.',
    'Mexican',
    'meal',
    'easy',
    10,
    15,
    4,
    480,
    28,
    32,
    28,
    3,
    4,
    720,
    85,
    true,
    'library'
);

-- Recipe 163: Omelette
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Omelette',
    'omelette',
    'Classic French omelette with cheese and herbs',
    'https://images.unsplash.com/photo-1510693206972-df098062cb71?w=800',
    '1. Beat eggs with salt and pepper.
2. Heat butter in non-stick pan.
3. Pour in eggs, let set slightly.
4. Gently push edges toward center.
5. Add cheese and herbs when almost set.
6. Fold omelette in thirds.
7. Slide onto plate, serve immediately.',
    'French',
    'meal',
    'medium',
    5,
    3,
    1,
    380,
    22,
    2,
    32,
    NULL,
    1,
    480,
    580,
    true,
    'library'
);

-- Recipe 164: Baked Ziti
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Baked Ziti',
    'baked-ziti',
    'Baked pasta with meat sauce and ricotta',
    'https://images.unsplash.com/photo-1574894709920-11b28e7367e3?w=800',
    '1. Cook ziti until slightly undercooked.
2. Make meat sauce with beef, tomatoes, herbs.
3. Mix ricotta with egg and Parmesan.
4. Layer in baking dish: sauce, pasta, ricotta.
5. Repeat layers, top with mozzarella.
6. Bake at 375°F for 30 minutes.
7. Let rest 10 minutes before serving.',
    'Italian',
    'meal',
    'medium',
    25,
    45,
    8,
    520,
    28,
    48,
    24,
    3,
    8,
    720,
    95,
    true,
    'library'
);

-- Recipe 165: Chicken Fajitas
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Fajitas',
    'chicken-fajitas',
    'Sizzling chicken strips with peppers and onions',
    'https://images.unsplash.com/photo-1611250503393-c89093b4d64e?w=800',
    '1. Slice chicken and marinate in lime, cumin, chili.
2. Slice peppers and onions.
3. Cook chicken over high heat until charred.
4. Cook vegetables until crisp-tender.
5. Warm flour tortillas.
6. Serve with salsa, guacamole, sour cream.
7. Let everyone build their own.',
    'Mexican',
    'meal',
    'easy',
    20,
    15,
    4,
    450,
    32,
    42,
    18,
    4,
    6,
    680,
    85,
    true,
    'library'
);

-- Recipe 166: Sloppy Joes
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Sloppy Joes',
    'sloppy-joes',
    'Sweet and tangy ground beef on burger buns',
    'https://images.unsplash.com/photo-1626645738196-c2a72c7a1d1f?w=800',
    '1. Brown beef with onion and bell pepper.
2. Add tomato sauce, ketchup, Worcestershire.
3. Add brown sugar and mustard.
4. Simmer 20 minutes.
5. Toast burger buns.
6. Spoon mixture onto buns.
7. Serve with pickles on the side.',
    'American',
    'meal',
    'easy',
    10,
    25,
    6,
    420,
    24,
    42,
    18,
    2,
    16,
    780,
    70,
    true,
    'library'
);

-- Recipe 167: Chicken Piccata
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Piccata',
    'chicken-piccata',
    'Pan-fried chicken in lemon caper butter sauce',
    'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800',
    '1. Pound chicken breasts thin.
2. Season and dredge in flour.
3. Pan fry in olive oil until golden.
4. Remove chicken, add wine to deglaze.
5. Add lemon juice, capers, stock.
6. Simmer, whisk in cold butter.
7. Return chicken, spoon sauce over.',
    'Italian',
    'meal',
    'medium',
    15,
    20,
    4,
    380,
    38,
    10,
    20,
    1,
    1,
    520,
    125,
    true,
    'library'
);

-- Recipe 168: Pulled Pork Sliders
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Pulled Pork Sliders',
    'pulled-pork-sliders',
    'Mini sandwiches with slow-cooked pulled pork',
    'https://images.unsplash.com/photo-1513185158878-8d8c2a2a3da3?w=800',
    '1. Season pork shoulder with dry rub.
2. Slow cook 8 hours until falling apart.
3. Shred pork, mix with cooking liquid.
4. Add BBQ sauce to taste.
5. Toast slider buns.
6. Pile pork on buns.
7. Top with coleslaw if desired.',
    'American',
    'meal',
    'easy',
    20,
    480,
    12,
    350,
    22,
    28,
    16,
    1,
    14,
    620,
    75,
    true,
    'library'
);

-- Recipe 169: Shrimp Cocktail
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Shrimp Cocktail',
    'shrimp-cocktail',
    'Chilled poached shrimp with zesty cocktail sauce',
    'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=800',
    '1. Make court bouillon with aromatics.
2. Poach shrimp 2-3 minutes until pink.
3. Transfer to ice bath immediately.
4. Make cocktail sauce: ketchup, horseradish, lemon.
5. Arrange shrimp on ice.
6. Serve with cocktail sauce and lemon.
7. Garnish with parsley.',
    'American',
    'snack',
    'easy',
    15,
    5,
    6,
    120,
    18,
    10,
    1,
    NULL,
    8,
    480,
    145,
    true,
    'library'
);

-- Recipe 170: Crème Brûlée
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Crème Brûlée',
    'crme-brle',
    'Vanilla custard with caramelized sugar crust',
    'https://images.unsplash.com/photo-1470124182917-cc6e71b22ecc?w=800',
    '1. Heat cream with vanilla bean.
2. Whisk yolks with sugar until pale.
3. Temper yolks with hot cream.
4. Strain into ramekins.
5. Bake in water bath at 325°F for 45 minutes.
6. Chill thoroughly.
7. Sprinkle sugar, torch until caramelized.',
    'French',
    'dessert',
    'medium',
    20,
    50,
    6,
    380,
    5,
    28,
    28,
    NULL,
    26,
    45,
    280,
    true,
    'library'
);

-- Recipe 171: Lemon Bars
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Lemon Bars',
    'lemon-bars',
    'Buttery shortbread crust with tangy lemon curd',
    'https://images.unsplash.com/photo-1587314168485-3236d6710814?w=800',
    '1. Make crust: mix flour, butter, powdered sugar.
2. Press into pan, bake 20 minutes.
3. Whisk eggs, sugar, lemon juice, zest, flour.
4. Pour over hot crust.
5. Bake 20-25 more minutes until set.
6. Cool completely.
7. Dust with powdered sugar, cut into bars.',
    'American',
    'dessert',
    'medium',
    20,
    45,
    16,
    240,
    3,
    38,
    9,
    NULL,
    28,
    95,
    75,
    true,
    'library'
);

-- Recipe 172: Bread Pudding
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Bread Pudding',
    'bread-pudding',
    'Custardy baked dessert with day-old bread',
    'https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=800',
    '1. Cube bread, spread in baking dish.
2. Whisk eggs, milk, cream, sugar, vanilla, cinnamon.
3. Pour custard over bread.
4. Let soak 30 minutes.
5. Add raisins if using.
6. Bake at 350°F for 45 minutes.
7. Serve warm with vanilla sauce or whipped cream.',
    'American',
    'dessert',
    'easy',
    20,
    50,
    10,
    320,
    8,
    48,
    11,
    1,
    28,
    280,
    105,
    true,
    'library'
);

-- Recipe 173: Rice Pudding
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Rice Pudding',
    'rice-pudding',
    'Creamy stovetop rice dessert with cinnamon',
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=800',
    '1. Simmer rice in water until almost cooked.
2. Add milk, sugar, salt.
3. Cook over low heat, stirring often.
4. Continue until thick and creamy.
5. Remove from heat, add vanilla and butter.
6. Stir in raisins if using.
7. Serve warm or cold with cinnamon.',
    'American',
    'dessert',
    'easy',
    5,
    40,
    6,
    260,
    6,
    44,
    7,
    NULL,
    24,
    120,
    25,
    true,
    'library'
);

-- Recipe 174: Carrot Cake
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Carrot Cake',
    'carrot-cake',
    'Moist spiced cake with cream cheese frosting',
    'https://images.unsplash.com/photo-1621303837174-89787a7d4729?w=800',
    '1. Mix flour, baking soda, cinnamon, nutmeg, salt.
2. Whisk eggs, sugar, oil.
3. Combine wet and dry ingredients.
4. Fold in carrots, walnuts, raisins.
5. Bake at 350°F for 35-40 minutes.
6. Cool completely.
7. Frost with cream cheese frosting.',
    'American',
    'dessert',
    'medium',
    30,
    40,
    12,
    520,
    6,
    62,
    28,
    2,
    48,
    320,
    95,
    true,
    'library'
);

-- Recipe 175: Cheesecake
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Cheesecake',
    'cheesecake',
    'Rich and creamy New York style cheesecake',
    'https://images.unsplash.com/photo-1524351199678-941a58a3df50?w=800',
    '1. Make crust: mix graham crumbs, butter, sugar.
2. Press into springform pan.
3. Beat cream cheese until smooth.
4. Add sugar, eggs one at a time, sour cream, vanilla.
5. Pour over crust.
6. Bake at 325°F for 55 minutes.
7. Turn off oven, leave door cracked 1 hour.
8. Chill overnight before serving.',
    'American',
    'dessert',
    'medium',
    25,
    60,
    12,
    480,
    8,
    38,
    34,
    NULL,
    28,
    380,
    145,
    true,
    'library'
);

-- Recipe 176: Pecan Pie
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Pecan Pie',
    'pecan-pie',
    'Sweet Southern pie with caramelized pecans',
    'https://images.unsplash.com/photo-1574085733277-851d9d856a3a?w=800',
    '1. Roll out pie dough, fit into pan.
2. Whisk eggs, corn syrup, sugar, butter, vanilla.
3. Fold in pecans.
4. Pour into crust.
5. Arrange extra pecans on top.
6. Bake at 350°F for 50-55 minutes.
7. Cool completely before slicing.',
    'American',
    'dessert',
    'medium',
    20,
    55,
    10,
    480,
    5,
    58,
    26,
    2,
    42,
    220,
    85,
    true,
    'library'
);

-- Recipe 177: Banoffee Pie
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Banoffee Pie',
    'banoffee-pie',
    'British dessert with banana, toffee, and cream',
    'https://images.unsplash.com/photo-1574085733277-851d9d856a3a?w=800',
    '1. Make crust from crushed digestive biscuits and butter.
2. Make toffee by boiling condensed milk 3 hours.
3. Spread toffee over crust.
4. Layer sliced bananas on toffee.
5. Top with whipped cream.
6. Shave chocolate over top.
7. Chill before serving.',
    'British',
    'dessert',
    'easy',
    30,
    180,
    8,
    480,
    6,
    58,
    26,
    2,
    42,
    220,
    75,
    true,
    'library'
);

-- Recipe 178: Affogato
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Affogato',
    'affogato',
    'Vanilla ice cream drowned in hot espresso',
    'https://images.unsplash.com/photo-1551024709-8f23befc6f87?w=800',
    '1. Brew fresh espresso.
2. Scoop vanilla gelato into serving glass.
3. Pour hot espresso over gelato.
4. Serve immediately.
5. Optional: add amaretto or Kahlua.',
    'Italian',
    'dessert',
    'easy',
    2,
    NULL,
    1,
    240,
    4,
    28,
    12,
    NULL,
    24,
    60,
    45,
    true,
    'library'
);

-- Recipe 179: Hummus with Pita
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Hummus with Pita',
    'hummus-with-pita',
    'Creamy chickpea dip with warm pita bread',
    'https://images.unsplash.com/photo-1623428187969-5da2dcea5ebf?w=800',
    '1. Blend chickpeas, tahini, lemon juice, garlic.
2. Add olive oil while blending.
3. Add ice water for smooth texture.
4. Season with cumin and salt.
5. Transfer to serving bowl.
6. Drizzle with olive oil, sprinkle paprika.
7. Serve with warm pita triangles.',
    'Middle Eastern',
    'snack',
    'easy',
    10,
    NULL,
    6,
    220,
    8,
    28,
    10,
    5,
    2,
    420,
    NULL,
    true,
    'library'
);

-- Recipe 180: Baba Ganoush
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Baba Ganoush',
    'baba-ganoush',
    'Smoky roasted eggplant dip with tahini',
    'https://images.unsplash.com/photo-1604152135912-04a022e23696?w=800',
    '1. Char eggplant over flame until collapsed.
2. Scoop out flesh, drain excess liquid.
3. Blend with tahini, lemon juice, garlic.
4. Season with cumin and salt.
5. Let flavors meld 30 minutes.
6. Drizzle with olive oil.
7. Serve with pita or vegetables.',
    'Middle Eastern',
    'snack',
    'easy',
    10,
    30,
    6,
    120,
    3,
    10,
    8,
    4,
    4,
    200,
    NULL,
    true,
    'library'
);

-- Recipe 181: Tzatziki
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Tzatziki',
    'tzatziki',
    'Cool cucumber yogurt sauce with garlic and dill',
    'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=800',
    '1. Grate cucumber, salt and drain 30 minutes.
2. Squeeze out excess moisture.
3. Mix yogurt with garlic and olive oil.
4. Add cucumber and fresh dill.
5. Season with salt and white pepper.
6. Chill at least 1 hour.
7. Serve with pita or as gyros sauce.',
    'Greek',
    'snack',
    'easy',
    15,
    NULL,
    8,
    60,
    4,
    4,
    3,
    NULL,
    3,
    180,
    10,
    true,
    'library'
);

-- Recipe 182: Vietnamese Coffee
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Vietnamese Coffee',
    'vietnamese-coffee',
    'Strong drip coffee with sweetened condensed milk',
    'https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?w=800',
    '1. Add condensed milk to glass.
2. Place phin filter on glass.
3. Add coarse ground coffee to filter.
4. Add hot water, cover, let drip 5 minutes.
5. Stir coffee into condensed milk.
6. For iced: pour over ice.
7. Adjust sweetness to taste.',
    'Vietnamese',
    'drink',
    'easy',
    5,
    5,
    1,
    180,
    3,
    28,
    5,
    NULL,
    26,
    45,
    15,
    true,
    'library'
);

-- Recipe 183: Protein Shake
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Protein Shake',
    'protein-shake',
    'Quick post-workout shake with protein powder',
    'https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=800',
    '1. Add milk to blender.
2. Add protein powder.
3. Add banana for sweetness.
4. Add peanut butter for extra protein.
5. Blend until smooth.
6. Add ice if desired.
7. Drink immediately.',
    'American',
    'drink',
    'easy',
    5,
    NULL,
    1,
    380,
    32,
    38,
    12,
    3,
    24,
    280,
    25,
    true,
    'library'
);

-- Recipe 184: Chia Pudding
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chia Pudding',
    'chia-pudding',
    'Overnight chia seed pudding with fresh fruit',
    'https://images.unsplash.com/photo-1517686469429-8bdb88b9f907?w=800',
    '1. Mix chia seeds with milk.
2. Add maple syrup and vanilla.
3. Stir well to prevent clumping.
4. Refrigerate overnight.
5. Stir again in morning.
6. Top with fresh berries.
7. Add granola for crunch.',
    'American',
    'meal',
    'easy',
    5,
    NULL,
    2,
    220,
    8,
    28,
    10,
    12,
    14,
    80,
    5,
    true,
    'library'
);

-- Recipe 185: Acai Bowl
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Acai Bowl',
    'acai-bowl',
    'Thick smoothie bowl with acai and tropical toppings',
    'https://images.unsplash.com/photo-1590301157890-4810ed352733?w=800',
    '1. Blend frozen acai with banana.
2. Add just enough liquid to blend thick.
3. Pour into bowl.
4. Arrange toppings artfully.
5. Add granola for crunch.
6. Drizzle with honey.
7. Eat immediately with spoon.',
    'Brazilian',
    'meal',
    'easy',
    10,
    NULL,
    1,
    420,
    8,
    68,
    14,
    12,
    38,
    60,
    NULL,
    true,
    'library'
);

-- Recipe 186: Salmon Teriyaki
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Salmon Teriyaki',
    'salmon-teriyaki',
    'Glazed salmon with homemade teriyaki sauce',
    'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=800',
    '1. Make teriyaki: soy sauce, mirin, sake, sugar.
2. Simmer until slightly thickened.
3. Pat salmon dry, season with salt.
4. Pan sear skin-side down 4 minutes.
5. Flip, brush with teriyaki.
6. Cook 3 more minutes, basting.
7. Serve over rice with extra sauce.',
    'Japanese',
    'meal',
    'easy',
    10,
    15,
    4,
    380,
    34,
    16,
    18,
    NULL,
    12,
    920,
    85,
    true,
    'library'
);

-- Recipe 187: Mushroom Risotto
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Mushroom Risotto',
    'mushroom-risotto',
    'Creamy Italian rice with mixed mushrooms',
    'https://images.unsplash.com/photo-1476124369491-e7addf5db371?w=800',
    '1. Soak dried porcini, reserve liquid.
2. Sauté fresh mushrooms, set aside.
3. Toast rice in butter 2 minutes.
4. Add wine, stir until absorbed.
5. Add warm stock ladle by ladle, stirring.
6. Add mushrooms and porcini near end.
7. Finish with butter and Parmesan.',
    'Italian',
    'meal',
    'medium',
    15,
    30,
    4,
    480,
    14,
    62,
    18,
    3,
    3,
    580,
    45,
    true,
    'library'
);

-- Recipe 188: Beef Stir Fry
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Beef Stir Fry',
    'beef-stir-fry',
    'Quick beef and vegetable stir fry with oyster sauce',
    'https://images.unsplash.com/photo-1525755662778-989d0524087e?w=800',
    '1. Slice beef thin, marinate in soy and cornstarch.
2. Heat wok until smoking.
3. Sear beef quickly, remove.
4. Stir fry vegetables 2-3 minutes.
5. Return beef, add sauce.
6. Toss until coated.
7. Serve immediately over rice.',
    'Chinese',
    'meal',
    'easy',
    15,
    10,
    4,
    320,
    28,
    14,
    18,
    3,
    5,
    780,
    75,
    true,
    'library'
);

-- Recipe 189: Chicken Curry
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Curry',
    'chicken-curry',
    'Simple home-style curry with tender chicken',
    'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=800',
    '1. Sauté onions until golden.
2. Add ginger, garlic, cook 1 minute.
3. Add curry powder, cumin, turmeric.
4. Add chicken, brown lightly.
5. Add tomatoes and coconut milk.
6. Simmer 25 minutes until chicken cooked.
7. Garnish with cilantro, serve with naan.',
    'Indian',
    'meal',
    'easy',
    15,
    35,
    4,
    420,
    32,
    16,
    26,
    4,
    6,
    520,
    125,
    true,
    'library'
);

-- Recipe 190: Vegetable Lo Mein
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Vegetable Lo Mein',
    'vegetable-lo-mein',
    'Stir-fried noodles with vegetables in savory sauce',
    'https://images.unsplash.com/photo-1534939561126-855b8675edd7?w=800',
    '1. Cook noodles, drain and toss with oil.
2. Make sauce: soy, oyster sauce, sesame oil.
3. Heat wok, stir fry vegetables.
4. Add noodles and sauce.
5. Toss until well combined and hot.
6. Add bean sprouts at end.
7. Garnish with green onions.',
    'Chinese',
    'meal',
    'easy',
    15,
    10,
    4,
    380,
    12,
    56,
    12,
    4,
    6,
    920,
    NULL,
    true,
    'library'
);

-- Recipe 191: Shakshuka with Feta
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Shakshuka with Feta',
    'shakshuka-with-feta',
    'Eggs poached in spiced tomato sauce with crumbled feta',
    'https://images.unsplash.com/photo-1590412200988-a436970781fa?w=800',
    '1. Sauté onion and bell peppers.
2. Add garlic, cumin, paprika, cayenne.
3. Add tomatoes, simmer 10 minutes.
4. Make wells, crack in eggs.
5. Cover, cook until whites set.
6. Crumble feta over top.
7. Garnish with parsley, serve with bread.',
    'Middle Eastern',
    'meal',
    'easy',
    10,
    25,
    4,
    320,
    18,
    18,
    22,
    4,
    10,
    680,
    295,
    true,
    'library'
);

-- Recipe 192: Crispy Tofu Bowl
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Crispy Tofu Bowl',
    'crispy-tofu-bowl',
    'Crispy baked tofu with vegetables and peanut sauce',
    'https://images.unsplash.com/photo-1546793665-c74683f339c1?w=800',
    '1. Press tofu 30 minutes to remove water.
2. Cube and toss with cornstarch, soy sauce.
3. Bake at 400°F until crispy.
4. Prep vegetables and rice.
5. Make peanut sauce: peanut butter, soy, lime, sriracha.
6. Assemble bowls: rice, veggies, tofu.
7. Drizzle with peanut sauce.',
    'Asian',
    'meal',
    'easy',
    20,
    30,
    4,
    420,
    22,
    46,
    18,
    6,
    5,
    620,
    NULL,
    true,
    'library'
);

-- Recipe 193: BBQ Chicken Pizza
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'BBQ Chicken Pizza',
    'bbq-chicken-pizza',
    'Homemade pizza with BBQ sauce, chicken, and red onion',
    'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=800',
    '1. Roll out pizza dough.
2. Spread BBQ sauce as base.
3. Top with mozzarella.
4. Add shredded chicken and red onion.
5. Bake at 475°F for 12-15 minutes.
6. Drizzle with more BBQ sauce.
7. Top with fresh cilantro.',
    'American',
    'meal',
    'easy',
    15,
    15,
    4,
    480,
    28,
    52,
    18,
    2,
    12,
    780,
    75,
    true,
    'library'
);

-- Recipe 194: Shrimp Fried Rice
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Shrimp Fried Rice',
    'shrimp-fried-rice',
    'Classic Chinese fried rice with shrimp and vegetables',
    'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=800',
    '1. Use cold, day-old rice.
2. Cook shrimp, set aside.
3. Scramble eggs, set aside.
4. Stir fry vegetables quickly.
5. Add rice, break up clumps.
6. Season with soy sauce.
7. Return shrimp and eggs, toss well.',
    'Chinese',
    'meal',
    'easy',
    10,
    10,
    4,
    420,
    22,
    52,
    14,
    3,
    4,
    780,
    225,
    true,
    'library'
);

-- Recipe 195: Fish and Chips
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Fish and Chips',
    'fish-and-chips',
    'British classic - beer-battered fish with thick-cut fries',
    'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=800',
    '1. Cut potatoes into thick chips, soak in water.
2. Make batter: flour, beer, baking powder.
3. Double fry chips: 300°F then 375°F.
4. Dip fish in batter.
5. Fry fish until golden and crispy.
6. Season chips with salt.
7. Serve with malt vinegar and tartar sauce.',
    'British',
    'meal',
    'medium',
    20,
    30,
    4,
    620,
    32,
    58,
    28,
    4,
    2,
    620,
    75,
    true,
    'library'
);

-- Recipe 196: Chicken Souvlaki
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chicken Souvlaki',
    'chicken-souvlaki',
    'Greek grilled chicken skewers with tzatziki',
    'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?w=800',
    '1. Marinate chicken in olive oil, lemon, oregano, garlic.
2. Thread onto skewers.
3. Grill over high heat 4 minutes per side.
4. Warm pita bread.
5. Make tzatziki with yogurt, cucumber, dill.
6. Serve chicken in pita with tzatziki.
7. Add tomatoes, onions, lettuce.',
    'Greek',
    'meal',
    'easy',
    20,
    10,
    4,
    420,
    38,
    32,
    16,
    2,
    5,
    520,
    95,
    true,
    'library'
);

-- Recipe 197: Pasta alla Norma
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Pasta alla Norma',
    'pasta-alla-norma',
    'Sicilian pasta with eggplant, tomatoes, and ricotta salata',
    'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=800',
    '1. Cube and salt eggplant, let drain.
2. Fry eggplant until golden, drain.
3. Sauté garlic in olive oil.
4. Add tomatoes, basil, simmer 15 minutes.
5. Cook pasta al dente.
6. Toss pasta with sauce and eggplant.
7. Top with shaved ricotta salata.',
    'Italian',
    'meal',
    'medium',
    30,
    25,
    4,
    480,
    14,
    68,
    18,
    6,
    10,
    580,
    15,
    true,
    'library'
);

-- Recipe 198: Banh Xeo
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Banh Xeo',
    'banh-xeo',
    'Vietnamese crispy crepes with shrimp and pork',
    'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=800',
    '1. Make batter: rice flour, turmeric, coconut milk.
2. Let rest 30 minutes.
3. Cook pork and shrimp.
4. Pour thin layer of batter in hot pan.
5. Add fillings to one half.
6. Cook until crispy, fold over.
7. Serve with lettuce and nuoc cham.',
    'Vietnamese',
    'meal',
    'medium',
    20,
    25,
    4,
    380,
    22,
    36,
    18,
    2,
    4,
    720,
    145,
    true,
    'library'
);

-- Recipe 199: Mango Sticky Rice
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Mango Sticky Rice',
    'mango-sticky-rice',
    'Thai dessert with sweet coconut rice and fresh mango',
    'https://images.unsplash.com/photo-1596560548464-f010549b84d7?w=800',
    '1. Soak sticky rice overnight.
2. Steam rice 25 minutes.
3. Make coconut sauce: coconut milk, sugar, salt.
4. Mix half the sauce into warm rice.
5. Let rice absorb sauce 30 minutes.
6. Slice ripe mangoes.
7. Serve rice with mango, drizzle remaining sauce.',
    'Thai',
    'dessert',
    'medium',
    30,
    25,
    4,
    380,
    5,
    68,
    12,
    3,
    38,
    320,
    NULL,
    true,
    'library'
);

-- Recipe 200: Chocolate Mousse
INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    3,
    'Chocolate Mousse',
    'chocolate-mousse',
    'Light and airy French chocolate dessert',
    'https://images.unsplash.com/photo-1541783245831-57d6fb0926d3?w=800',
    '1. Melt chocolate with butter.
2. Whisk egg yolks with half the sugar.
3. Combine chocolate with yolk mixture.
4. Whip cream to soft peaks.
5. Whip egg whites with remaining sugar.
6. Fold cream then whites into chocolate.
7. Chill at least 4 hours before serving.',
    'French',
    'dessert',
    'medium',
    30,
    10,
    6,
    380,
    6,
    28,
    28,
    3,
    22,
    65,
    175,
    true,
    'library'
);

-- Insert ingredients (global, unique constraint on name)
INSERT INTO ingredients (name) VALUES ('Achiote paste') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Aged kimchi') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('All-purpose flour') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Allspice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Almond butter') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Almond milk') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Amaretto') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('American cheese') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Anchovy fillets') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Anchovy stock') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Apple cider') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Apple cider vinegar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Apples') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Arborio rice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Artichoke hearts') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Asian pear') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Asparagus') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Avocado') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Avocados') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('BBQ sauce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Baby potatoes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bacon') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bacon lardons') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Baguette') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Baking powder') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Baking soda') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Balsamic glaze') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Balsamic vinegar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bamboo shoots') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Banana') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bananas') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Basmati rice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bay leaf') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bay leaves') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bean sprouts') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Beef bones') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Beef broth') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Beef chuck') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Beef ribeye') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Beef sirloin') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Beef stock') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Beer') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bell pepper') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bell peppers') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Black beans') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Black pepper') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Black peppercorns') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Black tea') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Blue cheese') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Blue cheese dressing') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bomba rice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bone-in pork chops') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bourbon') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bread') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Breadcrumbs') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Brioche bread') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Brioche buns') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Broccoli') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Brown rice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Brown sugar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Bulgur wheat') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Burger buns') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Butter') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Butternut squash') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cabbage') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Canadian bacon') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Canned tomatoes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Canned tuna') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cannellini beans') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Capers') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Caramel syrup') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cardamom') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cardamom pods') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Carom seeds') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Carrot') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Carrots') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cayenne') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cayenne pepper') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Celery') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cheddar cheese') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cherry tomatoes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chia seeds') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chicken') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chicken breast') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chicken breasts') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chicken broth') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chicken pieces') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chicken stock') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chicken thigh') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chicken thighs') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chicken wings') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chickpeas') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chili oil') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chili powder') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chipotle in adobo') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Chocolate chips') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cinnamon') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cinnamon stick') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cinnamon sticks') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cloves') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Coarse salt') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cocoa powder') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Coconut cream') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Coconut flakes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Coconut milk') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Coconut oil') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Coconut water') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cod fillets') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Coffee beans') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Coffee liqueur') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cold water') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Coleslaw') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Condensed milk') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cooked chicken') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cooked rice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Coriander') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Corn') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Corn syrup') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Corn tortillas') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cornstarch') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cream cheese') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cremini mushrooms') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Croutons') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Crushed ice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Crushed peanuts') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Crushed tomatoes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Crusty bread') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cucumber') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cumin') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Cumin seeds') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Curry paste') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Curry powder') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Daikon radish') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Dark chocolate') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Dashi stock') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Day-old bread') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Diced tomatoes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Digestive biscuits') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Dijon mustard') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ditalini pasta') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Doubanjiang') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Dried chickpeas') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Dried chilies') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Dried cranberries') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Dried oregano') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Dried porcini') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Dried red chilies') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Dried wakame') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Dry white wine') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Edamame') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Egg') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Egg noodles') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Egg yolk') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Egg yolks') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Eggplant') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Eggs') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Elbow macaroni') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Enchilada sauce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('English muffins') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Espresso') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Evaporated milk') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Extra-firm tofu') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fermented black beans') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Feta cheese') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fettuccine') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Firm tofu') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fish sauce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Flaky sea salt') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Flatbread') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Flax seeds') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Flour tortillas') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('French bread') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh basil') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh basil leaves') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh berries') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh chives') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh cilantro') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh dill') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh ginger') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh herbs') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh lime juice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh mint') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh mint leaves') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh mozzarella') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh mozzarella balls') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh parsley') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh rosemary') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh sage') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh spinach') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Fresh thyme') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Frozen acai') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Frozen banana') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Frozen mango') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Frozen mixed berries') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Frozen peas') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Frozen pineapple') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Frozen spinach') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Frozen strawberries') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Galangal') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Garam masala') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Garlic') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Garlic chives') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Garlic powder') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Garlic sauce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Gelatin') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ghee') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ginger') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ginger beer') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ginger-garlic paste') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Gochugaru') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Gochujang') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Graham crackers') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Granny Smith apples') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Granola') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Greek yogurt') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Green apple') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Green beans') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Green bell pepper') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Green chili') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Green chilies') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Green curry paste') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Green onions') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Green peas') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ground beef') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ground lamb') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ground pork') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Gruyere') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Gruyère cheese') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Guacamole') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Guajillo chilies') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Guanciale') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Gyoza wrappers') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Hamburger buns') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Heavy cream') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Hoisin sauce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Honey') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Horseradish') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Hot sauce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Hot water') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ice cream') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ice cubes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ice water') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Imitation crab') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Italian seasoning') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Jalapeño') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Jalapeños') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Kaffir lime leaves') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Kalamata olives') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Kale') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Kasuri methi') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ketchup') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Kidney beans') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ladyfingers') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lamb chops') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Large flour tortillas') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Large shrimp') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lasagna sheets') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lemon') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lemon juice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lemon wheel') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lemon zest') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lemongrass') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lemons') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lettuce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lettuce leaves') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lime') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lime juice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lime wedge') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lime wheel') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Linguine') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Lo mein noodles') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Long grain rice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Malt vinegar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mango') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Maple syrup') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Marinara sauce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Marsala wine') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mascarpone cheese') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Matcha powder') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mayonnaise') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mexican cheese blend') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Milk') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mini chocolate chips') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mini marshmallows') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mirin') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Miso paste') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mixed berries') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mixed greens') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mixed mushrooms') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mixed nuts') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mixed vegetables') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mochiko flour') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Monterey Jack') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mozzarella') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mushrooms') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mustard') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Mustard powder') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Napa cabbage') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Nicoise olives') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Nori') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Nori sheets') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Nuoc cham') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Nutmeg') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Olive oil') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Onion') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Onion powder') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Orange juice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Orange zest') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Oyster mushrooms') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Oyster sauce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Palm sugar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Paneer') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Paprika') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Parmesan') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Parmesan cheese') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Peanut butter') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pearl onions') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Peas') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pecans') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pecorino Romano') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Penne pasta') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Phyllo dough') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pickled ginger') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pickled jalapeños') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pickled turnips') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pickles') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pico de gallo') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pie crust') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pie dough') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pineapple') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pineapple chunks') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pineapple juice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pita bread') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pizza dough') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Plain yogurt') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pork belly') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pork broth') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pork shoulder') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pork tenderloin') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Potato') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Potato gnocchi') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Potatoes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Powdered sugar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Protein powder') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Puff pastry') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pumpkin seeds') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Pâté') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Quinoa') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Rabbit') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Raisins') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ramen noodles') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ranch dressing') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Red bell pepper') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Red cabbage') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Red chili') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Red chili flakes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Red chili powder') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Red onion') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Red pepper flakes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Red wine') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Red wine vinegar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Refried beans') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Rice flour') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Rice noodles') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Rice paper wrappers') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Rice vermicelli') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Rice vinegar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ricotta cheese') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ricotta salata') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Rigatoni') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ripe avocados') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ripe bananas') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ripe mangoes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ripe tomatoes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Roasted peanuts') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Rolled oats') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Roma tomato') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Roma tomatoes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Romaine lettuce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Rosemary') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Saffron') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Saffron threads') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sake') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Salmon fillets') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Salsa') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Salt') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('San Marzano tomatoes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Scotch bonnet peppers') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sea salt') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sesame oil') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sesame seeds') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Shallot') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Shallots') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sharp cheddar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sherry vinegar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Shiitake mushrooms') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Short-grain rice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Shredded cheese') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Shredded coconut') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Shredded lettuce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Shrimp') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sichuan peppercorn') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sichuan peppercorns') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Silken tofu') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Simple syrup') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sliced almonds') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Slider buns') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Small corn tortillas') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Smoked paprika') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Snap peas') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Soda water') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sour cream') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sourdough bread') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Soy sauce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Spaghetti') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Spinach') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sriracha') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Star anise') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sticky rice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sugar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sumac') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sushi rice') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sweet potato') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Sweet potato noodles') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Taco seasoning') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Taco shells') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Tahini') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Tamarind paste') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Tequila') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Thai basil') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Thai chili') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Thai chili paste') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Thai tea mix') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Toasted coconut') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Tomato') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Tomato passata') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Tomato paste') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Tomato puree') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Tomato sauce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Tomatoes') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Tortilla chips') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Triple sec') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Turkey breast') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Turmeric') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Vanilla bean') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Vanilla extract') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Vanilla gelato') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Veal shanks') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Vegetable oil') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Vegetable stock') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Vietnamese baguette') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Vietnamese coffee') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Vodka') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Walnuts') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Wasabi') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Water') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Watermelon') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Whipped cream') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Whiskey') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('White bread') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('White fish fillets') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('White onion') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('White pepper') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('White rum') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('White sugar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('White vinegar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('White wine') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('White wine vinegar') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Whole chicken') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Whole cloves') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Whole milk') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Worcestershire') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Worcestershire sauce') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Yellow onions') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Yellow squash') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Yogurt') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Ziti pasta') ON CONFLICT (name) DO NOTHING;
INSERT INTO ingredients (name) VALUES ('Zucchini') ON CONFLICT (name) DO NOTHING;

-- Link ingredients to recipes
-- Note: column is 'note' not 'notes'
-- Ingredients for: Classic Spaghetti Carbonara
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-spaghetti-carbonara'),
    (SELECT id FROM ingredients WHERE name = 'Spaghetti'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-spaghetti-carbonara'),
    (SELECT id FROM ingredients WHERE name = 'Guanciale'),
    200,
    'g',
    'or pancetta'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-spaghetti-carbonara'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    3,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-spaghetti-carbonara'),
    (SELECT id FROM ingredients WHERE name = 'Egg yolks'),
    2,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-spaghetti-carbonara'),
    (SELECT id FROM ingredients WHERE name = 'Pecorino Romano'),
    100,
    'g',
    'finely grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-spaghetti-carbonara'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    2,
    'tsp',
    'freshly ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-spaghetti-carbonara'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    'for pasta water'
);

-- Ingredients for: Margherita Pizza
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'margherita-pizza'),
    (SELECT id FROM ingredients WHERE name = 'Pizza dough'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'margherita-pizza'),
    (SELECT id FROM ingredients WHERE name = 'San Marzano tomatoes'),
    200,
    'g',
    'canned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'margherita-pizza'),
    (SELECT id FROM ingredients WHERE name = 'Fresh mozzarella'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'margherita-pizza'),
    (SELECT id FROM ingredients WHERE name = 'Fresh basil'),
    10,
    'leaves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'margherita-pizza'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    2,
    'tbsp',
    'extra virgin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'margherita-pizza'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Chicken Parmesan
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breasts'),
    600,
    'g',
    'boneless, skinless'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Breadcrumbs'),
    150,
    'g',
    'Italian seasoned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan cheese'),
    60,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Marinara sauce'),
    300,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Mozzarella'),
    200,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    2,
    'whole',
    'beaten'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Fresh basil'),
    6,
    'leaves',
    NULL
);

-- Ingredients for: Risotto alla Milanese
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'risotto-alla-milanese'),
    (SELECT id FROM ingredients WHERE name = 'Arborio rice'),
    320,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'risotto-alla-milanese'),
    (SELECT id FROM ingredients WHERE name = 'Chicken broth'),
    1000,
    'ml',
    'warm'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'risotto-alla-milanese'),
    (SELECT id FROM ingredients WHERE name = 'Saffron threads'),
    0.5,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'risotto-alla-milanese'),
    (SELECT id FROM ingredients WHERE name = 'White onion'),
    1,
    'medium',
    'finely diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'risotto-alla-milanese'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    80,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'risotto-alla-milanese'),
    (SELECT id FROM ingredients WHERE name = 'Dry white wine'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'risotto-alla-milanese'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan cheese'),
    80,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'risotto-alla-milanese'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Lasagna Bolognese
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM ingredients WHERE name = 'Lasagna sheets'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM ingredients WHERE name = 'Ground beef'),
    500,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM ingredients WHERE name = 'Ground pork'),
    250,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM ingredients WHERE name = 'Crushed tomatoes'),
    800,
    'g',
    'canned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    750,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    75,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    75,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan cheese'),
    150,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM ingredients WHERE name = 'Carrot'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM ingredients WHERE name = 'Celery'),
    2,
    'stalks',
    'diced'
);

-- Ingredients for: Caprese Salad
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-salad'),
    (SELECT id FROM ingredients WHERE name = 'Tomatoes'),
    400,
    'g',
    'ripe, heirloom preferred'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-salad'),
    (SELECT id FROM ingredients WHERE name = 'Fresh mozzarella'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-salad'),
    (SELECT id FROM ingredients WHERE name = 'Fresh basil'),
    20,
    'leaves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-salad'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    3,
    'tbsp',
    'extra virgin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-salad'),
    (SELECT id FROM ingredients WHERE name = 'Sea salt'),
    1,
    'tsp',
    'flaky'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-salad'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Penne Arrabbiata
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'penne-arrabbiata'),
    (SELECT id FROM ingredients WHERE name = 'Penne pasta'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'penne-arrabbiata'),
    (SELECT id FROM ingredients WHERE name = 'Crushed tomatoes'),
    400,
    'g',
    'canned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'penne-arrabbiata'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'penne-arrabbiata'),
    (SELECT id FROM ingredients WHERE name = 'Red chili flakes'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'penne-arrabbiata'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'penne-arrabbiata'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    3,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'penne-arrabbiata'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan cheese'),
    60,
    'g',
    'grated'
);

-- Ingredients for: Osso Buco
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'osso-buco'),
    (SELECT id FROM ingredients WHERE name = 'Veal shanks'),
    1200,
    'g',
    '4 pieces'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'osso-buco'),
    (SELECT id FROM ingredients WHERE name = 'White wine'),
    250,
    'ml',
    'dry'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'osso-buco'),
    (SELECT id FROM ingredients WHERE name = 'Chicken broth'),
    500,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'osso-buco'),
    (SELECT id FROM ingredients WHERE name = 'Diced tomatoes'),
    400,
    'g',
    'canned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'osso-buco'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'large',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'osso-buco'),
    (SELECT id FROM ingredients WHERE name = 'Carrot'),
    2,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'osso-buco'),
    (SELECT id FROM ingredients WHERE name = 'Celery'),
    2,
    'stalks',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'osso-buco'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    4,
    'tbsp',
    'for gremolata'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'osso-buco'),
    (SELECT id FROM ingredients WHERE name = 'Lemon zest'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'osso-buco'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    6,
    'cloves',
    NULL
);

-- Ingredients for: Tiramisu
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tiramisu'),
    (SELECT id FROM ingredients WHERE name = 'Mascarpone cheese'),
    500,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tiramisu'),
    (SELECT id FROM ingredients WHERE name = 'Ladyfingers'),
    300,
    'g',
    'savoiardi'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tiramisu'),
    (SELECT id FROM ingredients WHERE name = 'Espresso'),
    300,
    'ml',
    'cooled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tiramisu'),
    (SELECT id FROM ingredients WHERE name = 'Egg yolks'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tiramisu'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tiramisu'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    250,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tiramisu'),
    (SELECT id FROM ingredients WHERE name = 'Marsala wine'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tiramisu'),
    (SELECT id FROM ingredients WHERE name = 'Cocoa powder'),
    2,
    'tbsp',
    'for dusting'
);

-- Ingredients for: Bruschetta al Pomodoro
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta-al-pomodoro'),
    (SELECT id FROM ingredients WHERE name = 'Tomatoes'),
    400,
    'g',
    'ripe, diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta-al-pomodoro'),
    (SELECT id FROM ingredients WHERE name = 'Crusty bread'),
    8,
    'slices',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta-al-pomodoro'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta-al-pomodoro'),
    (SELECT id FROM ingredients WHERE name = 'Fresh basil'),
    15,
    'leaves',
    'torn'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta-al-pomodoro'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    4,
    'tbsp',
    'extra virgin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta-al-pomodoro'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta-al-pomodoro'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: Kung Pao Chicken
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    500,
    'g',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Dried red chilies'),
    12,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Roasted peanuts'),
    80,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Rice vinegar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    1,
    'tbsp',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    3,
    'stalks',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Sichuan peppercorns'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Sesame oil'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    3,
    'tbsp',
    NULL
);

-- Ingredients for: Beef and Broccoli
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-and-broccoli'),
    (SELECT id FROM ingredients WHERE name = 'Beef sirloin'),
    500,
    'g',
    'thinly sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-and-broccoli'),
    (SELECT id FROM ingredients WHERE name = 'Broccoli'),
    400,
    'g',
    'florets'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-and-broccoli'),
    (SELECT id FROM ingredients WHERE name = 'Oyster sauce'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-and-broccoli'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-and-broccoli'),
    (SELECT id FROM ingredients WHERE name = 'Beef broth'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-and-broccoli'),
    (SELECT id FROM ingredients WHERE name = 'Cornstarch'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-and-broccoli'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-and-broccoli'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    1,
    'tbsp',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-and-broccoli'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    3,
    'tbsp',
    NULL
);

-- Ingredients for: Sweet and Sour Pork
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM ingredients WHERE name = 'Pork shoulder'),
    500,
    'g',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM ingredients WHERE name = 'Pineapple chunks'),
    250,
    'g',
    'with juice'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM ingredients WHERE name = 'Bell peppers'),
    2,
    'medium',
    'mixed colors, cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'medium',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM ingredients WHERE name = 'Ketchup'),
    80,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM ingredients WHERE name = 'Rice vinegar'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM ingredients WHERE name = 'Cornstarch'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    2,
    'whole',
    'beaten'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    500,
    'ml',
    'for frying'
);

-- Ingredients for: Fried Rice
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Cooked rice'),
    600,
    'g',
    'day-old, cold'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    3,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Peas'),
    100,
    'g',
    'frozen'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    1,
    'medium',
    'diced small'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    4,
    'stalks',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Sesame oil'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'White pepper'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Mapo Tofu
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM ingredients WHERE name = 'Silken tofu'),
    400,
    'g',
    'firm'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM ingredients WHERE name = 'Ground pork'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM ingredients WHERE name = 'Doubanjiang'),
    2,
    'tbsp',
    'chili bean paste'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM ingredients WHERE name = 'Fermented black beans'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM ingredients WHERE name = 'Chicken broth'),
    250,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    1,
    'tbsp',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    3,
    'stalks',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM ingredients WHERE name = 'Sichuan peppercorn'),
    1,
    'tsp',
    'ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM ingredients WHERE name = 'Chili oil'),
    2,
    'tbsp',
    NULL
);

-- Ingredients for: Chicken Teriyaki
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Chicken thighs'),
    600,
    'g',
    'bone-in, skin-on'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    80,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Mirin'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Sake'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Sesame seeds'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    2,
    'stalks',
    'sliced'
);

-- Ingredients for: Tonkotsu Ramen
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM ingredients WHERE name = 'Ramen noodles'),
    400,
    'g',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM ingredients WHERE name = 'Pork broth'),
    1500,
    'ml',
    'tonkotsu'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM ingredients WHERE name = 'Pork belly'),
    400,
    'g',
    'for chashu'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'whole',
    'soft-boiled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    4,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM ingredients WHERE name = 'Mirin'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM ingredients WHERE name = 'Nori'),
    4,
    'sheets',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    3,
    'stalks',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM ingredients WHERE name = 'Corn'),
    100,
    'g',
    'canned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM ingredients WHERE name = 'Sesame oil'),
    2,
    'tsp',
    NULL
);

-- Ingredients for: Sushi Roll - California Roll
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM ingredients WHERE name = 'Sushi rice'),
    300,
    'g',
    'cooked'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM ingredients WHERE name = 'Nori sheets'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM ingredients WHERE name = 'Imitation crab'),
    200,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM ingredients WHERE name = 'Avocado'),
    2,
    'whole',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM ingredients WHERE name = 'Cucumber'),
    1,
    'whole',
    'julienned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM ingredients WHERE name = 'Rice vinegar'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM ingredients WHERE name = 'Sesame seeds'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM ingredients WHERE name = 'Wasabi'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM ingredients WHERE name = 'Pickled ginger'),
    50,
    'g',
    NULL
);

-- Ingredients for: Miso Soup
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'miso-soup'),
    (SELECT id FROM ingredients WHERE name = 'Dashi stock'),
    800,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'miso-soup'),
    (SELECT id FROM ingredients WHERE name = 'Miso paste'),
    4,
    'tbsp',
    'white or mixed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'miso-soup'),
    (SELECT id FROM ingredients WHERE name = 'Silken tofu'),
    200,
    'g',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'miso-soup'),
    (SELECT id FROM ingredients WHERE name = 'Dried wakame'),
    10,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'miso-soup'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    2,
    'stalks',
    'thinly sliced'
);

-- Ingredients for: Gyoza (Japanese Dumplings)
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyoza-japanese-dumplings'),
    (SELECT id FROM ingredients WHERE name = 'Ground pork'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyoza-japanese-dumplings'),
    (SELECT id FROM ingredients WHERE name = 'Napa cabbage'),
    200,
    'g',
    'minced, squeezed dry'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyoza-japanese-dumplings'),
    (SELECT id FROM ingredients WHERE name = 'Gyoza wrappers'),
    40,
    'pieces',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyoza-japanese-dumplings'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    2,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyoza-japanese-dumplings'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    1,
    'tbsp',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyoza-japanese-dumplings'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyoza-japanese-dumplings'),
    (SELECT id FROM ingredients WHERE name = 'Sesame oil'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyoza-japanese-dumplings'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    2,
    'stalks',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyoza-japanese-dumplings'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    2,
    'tbsp',
    NULL
);

-- Ingredients for: Tacos al Pastor
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM ingredients WHERE name = 'Pork shoulder'),
    600,
    'g',
    'thinly sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM ingredients WHERE name = 'Corn tortillas'),
    12,
    'small',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM ingredients WHERE name = 'Pineapple'),
    200,
    'g',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM ingredients WHERE name = 'White onion'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    0.5,
    'cup',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM ingredients WHERE name = 'Guajillo chilies'),
    4,
    'dried',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM ingredients WHERE name = 'Achiote paste'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM ingredients WHERE name = 'Pineapple juice'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM ingredients WHERE name = 'White vinegar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM ingredients WHERE name = 'Lime'),
    2,
    'whole',
    'wedges'
);

-- Ingredients for: Chicken Enchiladas
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-enchiladas'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breasts'),
    500,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-enchiladas'),
    (SELECT id FROM ingredients WHERE name = 'Corn tortillas'),
    12,
    'medium',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-enchiladas'),
    (SELECT id FROM ingredients WHERE name = 'Enchilada sauce'),
    500,
    'ml',
    'red'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-enchiladas'),
    (SELECT id FROM ingredients WHERE name = 'Cheddar cheese'),
    200,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-enchiladas'),
    (SELECT id FROM ingredients WHERE name = 'Monterey Jack'),
    100,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-enchiladas'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-enchiladas'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    0.25,
    'cup',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-enchiladas'),
    (SELECT id FROM ingredients WHERE name = 'Jalapeños'),
    2,
    'whole',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-enchiladas'),
    (SELECT id FROM ingredients WHERE name = 'White onion'),
    1,
    'small',
    'diced'
);

-- Ingredients for: Guacamole
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole'),
    (SELECT id FROM ingredients WHERE name = 'Avocados'),
    3,
    'ripe',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole'),
    (SELECT id FROM ingredients WHERE name = 'Lime juice'),
    2,
    'tbsp',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole'),
    (SELECT id FROM ingredients WHERE name = 'White onion'),
    0.25,
    'cup',
    'finely diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole'),
    (SELECT id FROM ingredients WHERE name = 'Tomato'),
    1,
    'medium',
    'seeded, diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole'),
    (SELECT id FROM ingredients WHERE name = 'Jalapeño'),
    1,
    'small',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    3,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    0.25,
    'tsp',
    'ground'
);

-- Ingredients for: Carnitas
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carnitas'),
    (SELECT id FROM ingredients WHERE name = 'Pork shoulder'),
    1500,
    'g',
    'bone-in'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carnitas'),
    (SELECT id FROM ingredients WHERE name = 'Orange juice'),
    250,
    'ml',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carnitas'),
    (SELECT id FROM ingredients WHERE name = 'Lime juice'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carnitas'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    6,
    'cloves',
    'smashed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carnitas'),
    (SELECT id FROM ingredients WHERE name = 'Bay leaves'),
    3,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carnitas'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    2,
    'tsp',
    'ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carnitas'),
    (SELECT id FROM ingredients WHERE name = 'Dried oregano'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carnitas'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carnitas'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Quesadillas
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadillas'),
    (SELECT id FROM ingredients WHERE name = 'Flour tortillas'),
    4,
    'large',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadillas'),
    (SELECT id FROM ingredients WHERE name = 'Mexican cheese blend'),
    300,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadillas'),
    (SELECT id FROM ingredients WHERE name = 'Cooked chicken'),
    200,
    'g',
    'shredded, optional'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadillas'),
    (SELECT id FROM ingredients WHERE name = 'Bell pepper'),
    1,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadillas'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    0.5,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadillas'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    100,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadillas'),
    (SELECT id FROM ingredients WHERE name = 'Salsa'),
    100,
    'ml',
    NULL
);

-- Ingredients for: Classic Cheeseburger
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM ingredients WHERE name = 'Ground beef'),
    600,
    'g',
    '80/20'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM ingredients WHERE name = 'American cheese'),
    4,
    'slices',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM ingredients WHERE name = 'Burger buns'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM ingredients WHERE name = 'Lettuce'),
    4,
    'leaves',
    'iceberg'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM ingredients WHERE name = 'Tomato'),
    1,
    'large',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM ingredients WHERE name = 'Red onion'),
    0.5,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM ingredients WHERE name = 'Pickles'),
    8,
    'slices',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM ingredients WHERE name = 'Ketchup'),
    4,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM ingredients WHERE name = 'Mayonnaise'),
    4,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM ingredients WHERE name = 'Mustard'),
    2,
    'tbsp',
    NULL
);

-- Ingredients for: BBQ Pulled Pork Sandwich
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Pork shoulder'),
    2000,
    'g',
    'bone-in'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'BBQ sauce'),
    350,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Brioche buns'),
    8,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Coleslaw'),
    300,
    'g',
    'prepared'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Brown sugar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Garlic powder'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Buffalo Chicken Wings
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'buffalo-chicken-wings'),
    (SELECT id FROM ingredients WHERE name = 'Chicken wings'),
    1000,
    'g',
    'split at joint'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'buffalo-chicken-wings'),
    (SELECT id FROM ingredients WHERE name = 'Hot sauce'),
    120,
    'ml',
    'Frank''s RedHot'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'buffalo-chicken-wings'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    'melted'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'buffalo-chicken-wings'),
    (SELECT id FROM ingredients WHERE name = 'Baking powder'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'buffalo-chicken-wings'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'buffalo-chicken-wings'),
    (SELECT id FROM ingredients WHERE name = 'Blue cheese dressing'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'buffalo-chicken-wings'),
    (SELECT id FROM ingredients WHERE name = 'Celery'),
    4,
    'stalks',
    'cut into sticks'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'buffalo-chicken-wings'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    2,
    'medium',
    'cut into sticks'
);

-- Ingredients for: New York Style Cheesecake
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'new-york-style-cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Cream cheese'),
    900,
    'g',
    'room temperature'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'new-york-style-cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'new-york-style-cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'large',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'new-york-style-cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    240,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'new-york-style-cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'new-york-style-cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Graham crackers'),
    200,
    'g',
    'crushed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'new-york-style-cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    80,
    'g',
    'melted'
);

-- Ingredients for: Mac and Cheese
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mac-and-cheese'),
    (SELECT id FROM ingredients WHERE name = 'Elbow macaroni'),
    450,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mac-and-cheese'),
    (SELECT id FROM ingredients WHERE name = 'Sharp cheddar'),
    250,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mac-and-cheese'),
    (SELECT id FROM ingredients WHERE name = 'Gruyere'),
    120,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mac-and-cheese'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan'),
    60,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mac-and-cheese'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    720,
    'ml',
    'whole'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mac-and-cheese'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mac-and-cheese'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    45,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mac-and-cheese'),
    (SELECT id FROM ingredients WHERE name = 'Breadcrumbs'),
    60,
    'g',
    'panko'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mac-and-cheese'),
    (SELECT id FROM ingredients WHERE name = 'Mustard powder'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Pad Thai
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM ingredients WHERE name = 'Rice noodles'),
    250,
    'g',
    'flat'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM ingredients WHERE name = 'Shrimp'),
    200,
    'g',
    'peeled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM ingredients WHERE name = 'Firm tofu'),
    150,
    'g',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    2,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM ingredients WHERE name = 'Tamarind paste'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM ingredients WHERE name = 'Fish sauce'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    2,
    'tbsp',
    'palm sugar preferred'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM ingredients WHERE name = 'Bean sprouts'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM ingredients WHERE name = 'Crushed peanuts'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM ingredients WHERE name = 'Lime'),
    1,
    'whole',
    'wedges'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM ingredients WHERE name = 'Garlic chives'),
    50,
    'g',
    'cut into 2-inch pieces'
);

-- Ingredients for: Green Curry with Chicken
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Chicken thigh'),
    500,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Green curry paste'),
    4,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Coconut milk'),
    400,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Coconut cream'),
    100,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Bamboo shoots'),
    150,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Thai basil'),
    1,
    'cup',
    'leaves'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Kaffir lime leaves'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Fish sauce'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Palm sugar'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Red chili'),
    2,
    'whole',
    'sliced, for garnish'
);

-- Ingredients for: Tom Yum Soup
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM ingredients WHERE name = 'Shrimp'),
    300,
    'g',
    'shell-on for flavor'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM ingredients WHERE name = 'Chicken broth'),
    1000,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM ingredients WHERE name = 'Lemongrass'),
    3,
    'stalks',
    'bruised'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM ingredients WHERE name = 'Galangal'),
    8,
    'slices',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM ingredients WHERE name = 'Kaffir lime leaves'),
    6,
    'whole',
    'torn'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM ingredients WHERE name = 'Oyster mushrooms'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM ingredients WHERE name = 'Cherry tomatoes'),
    8,
    'whole',
    'halved'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM ingredients WHERE name = 'Fish sauce'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM ingredients WHERE name = 'Lime juice'),
    4,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM ingredients WHERE name = 'Thai chili paste'),
    2,
    'tbsp',
    'nam prik pao'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    0.25,
    'cup',
    NULL
);

-- Ingredients for: Butter Chicken
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Chicken thighs'),
    600,
    'g',
    'boneless, cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    200,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Tomato puree'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Yogurt'),
    100,
    'g',
    'for marinade'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Garam masala'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Kasuri methi'),
    2,
    'tbsp',
    'dried fenugreek leaves'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Ginger-garlic paste'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    2,
    'medium',
    'pureed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Red chili powder'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Turmeric'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Chicken Tikka Masala
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    600,
    'g',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM ingredients WHERE name = 'Yogurt'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    150,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM ingredients WHERE name = 'Tomatoes'),
    400,
    'g',
    'pureed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    2,
    'large',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    2,
    'tbsp',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM ingredients WHERE name = 'Garam masala'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM ingredients WHERE name = 'Coriander'),
    1,
    'tsp',
    'ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM ingredients WHERE name = 'Turmeric'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Palak Paneer
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM ingredients WHERE name = 'Paneer'),
    300,
    'g',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM ingredients WHERE name = 'Spinach'),
    500,
    'g',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'large',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM ingredients WHERE name = 'Tomatoes'),
    2,
    'medium',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM ingredients WHERE name = 'Ginger-garlic paste'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM ingredients WHERE name = 'Green chili'),
    2,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM ingredients WHERE name = 'Garam masala'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM ingredients WHERE name = 'Cumin seeds'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM ingredients WHERE name = 'Ghee'),
    3,
    'tbsp',
    NULL
);

-- Ingredients for: Samosas
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'samosas'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    250,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'samosas'),
    (SELECT id FROM ingredients WHERE name = 'Potatoes'),
    400,
    'g',
    'boiled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'samosas'),
    (SELECT id FROM ingredients WHERE name = 'Green peas'),
    100,
    'g',
    'cooked'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'samosas'),
    (SELECT id FROM ingredients WHERE name = 'Cumin seeds'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'samosas'),
    (SELECT id FROM ingredients WHERE name = 'Garam masala'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'samosas'),
    (SELECT id FROM ingredients WHERE name = 'Green chilies'),
    2,
    'whole',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'samosas'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    3,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'samosas'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    500,
    'ml',
    'for frying'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'samosas'),
    (SELECT id FROM ingredients WHERE name = 'Carom seeds'),
    0.5,
    'tsp',
    'ajwain'
);

-- Ingredients for: Greek Salad
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM ingredients WHERE name = 'Tomatoes'),
    400,
    'g',
    'ripe'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM ingredients WHERE name = 'Cucumber'),
    1,
    'large',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM ingredients WHERE name = 'Red onion'),
    0.5,
    'medium',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM ingredients WHERE name = 'Green bell pepper'),
    1,
    'medium',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM ingredients WHERE name = 'Feta cheese'),
    200,
    'g',
    'block'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM ingredients WHERE name = 'Kalamata olives'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    60,
    'ml',
    'extra virgin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM ingredients WHERE name = 'Dried oregano'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Hummus
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM ingredients WHERE name = 'Chickpeas'),
    400,
    'g',
    'canned, drained'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM ingredients WHERE name = 'Tahini'),
    80,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    60,
    'ml',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    2,
    'cloves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    3,
    'tbsp',
    'for drizzling'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    0.5,
    'tsp',
    'ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    0.5,
    'tsp',
    'for garnish'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM ingredients WHERE name = 'Ice water'),
    60,
    'ml',
    NULL
);

-- Ingredients for: Falafel
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM ingredients WHERE name = 'Dried chickpeas'),
    250,
    'g',
    'soaked overnight'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    1,
    'cup',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    0.5,
    'cup',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    0.5,
    'medium',
    'quartered'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    1,
    'tsp',
    'ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM ingredients WHERE name = 'Coriander'),
    1,
    'tsp',
    'ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM ingredients WHERE name = 'Baking powder'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    500,
    'ml',
    'for frying'
);

-- Ingredients for: Classic Pancakes
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-pancakes'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-pancakes'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    240,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-pancakes'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    2,
    'large',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-pancakes'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    45,
    'g',
    'melted, plus extra for cooking'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-pancakes'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-pancakes'),
    (SELECT id FROM ingredients WHERE name = 'Baking powder'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-pancakes'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-pancakes'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-pancakes'),
    (SELECT id FROM ingredients WHERE name = 'Maple syrup'),
    120,
    'ml',
    'for serving'
);

-- Ingredients for: Eggs Benedict
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-benedict'),
    (SELECT id FROM ingredients WHERE name = 'English muffins'),
    4,
    'whole',
    'split'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-benedict'),
    (SELECT id FROM ingredients WHERE name = 'Canadian bacon'),
    8,
    'slices',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-benedict'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    8,
    'large',
    '4 for poaching, 4 yolks for hollandaise'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-benedict'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    200,
    'g',
    'melted'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-benedict'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-benedict'),
    (SELECT id FROM ingredients WHERE name = 'White vinegar'),
    2,
    'tbsp',
    'for poaching'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-benedict'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    0.25,
    'tsp',
    'for garnish'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-benedict'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Avocado Toast
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'avocado-toast'),
    (SELECT id FROM ingredients WHERE name = 'Sourdough bread'),
    4,
    'slices',
    'thick'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'avocado-toast'),
    (SELECT id FROM ingredients WHERE name = 'Avocados'),
    2,
    'ripe',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'avocado-toast'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'large',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'avocado-toast'),
    (SELECT id FROM ingredients WHERE name = 'Cherry tomatoes'),
    100,
    'g',
    'halved'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'avocado-toast'),
    (SELECT id FROM ingredients WHERE name = 'Lime juice'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'avocado-toast'),
    (SELECT id FROM ingredients WHERE name = 'Red pepper flakes'),
    0.25,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'avocado-toast'),
    (SELECT id FROM ingredients WHERE name = 'Flaky sea salt'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'avocado-toast'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: French Toast
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-toast'),
    (SELECT id FROM ingredients WHERE name = 'Brioche bread'),
    8,
    'slices',
    'thick'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-toast'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'large',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-toast'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    180,
    'ml',
    'whole'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-toast'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-toast'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-toast'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-toast'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    4,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-toast'),
    (SELECT id FROM ingredients WHERE name = 'Mixed berries'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-toast'),
    (SELECT id FROM ingredients WHERE name = 'Powdered sugar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-toast'),
    (SELECT id FROM ingredients WHERE name = 'Maple syrup'),
    120,
    'ml',
    NULL
);

-- Ingredients for: Overnight Oats
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'overnight-oats'),
    (SELECT id FROM ingredients WHERE name = 'Rolled oats'),
    160,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'overnight-oats'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    480,
    'ml',
    'any kind'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'overnight-oats'),
    (SELECT id FROM ingredients WHERE name = 'Greek yogurt'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'overnight-oats'),
    (SELECT id FROM ingredients WHERE name = 'Chia seeds'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'overnight-oats'),
    (SELECT id FROM ingredients WHERE name = 'Maple syrup'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'overnight-oats'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'overnight-oats'),
    (SELECT id FROM ingredients WHERE name = 'Mixed berries'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'overnight-oats'),
    (SELECT id FROM ingredients WHERE name = 'Banana'),
    1,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'overnight-oats'),
    (SELECT id FROM ingredients WHERE name = 'Almond butter'),
    2,
    'tbsp',
    NULL
);

-- Ingredients for: Classic Margarita
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-margarita'),
    (SELECT id FROM ingredients WHERE name = 'Tequila'),
    60,
    'ml',
    'blanco'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-margarita'),
    (SELECT id FROM ingredients WHERE name = 'Fresh lime juice'),
    30,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-margarita'),
    (SELECT id FROM ingredients WHERE name = 'Triple sec'),
    30,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-margarita'),
    (SELECT id FROM ingredients WHERE name = 'Ice'),
    1,
    'cup',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-margarita'),
    (SELECT id FROM ingredients WHERE name = 'Lime wedge'),
    1,
    'whole',
    'for garnish'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-margarita'),
    (SELECT id FROM ingredients WHERE name = 'Coarse salt'),
    1,
    'tbsp',
    'for rim'
);

-- Ingredients for: Mango Lassi
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-lassi'),
    (SELECT id FROM ingredients WHERE name = 'Mango'),
    300,
    'g',
    'fresh or frozen chunks'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-lassi'),
    (SELECT id FROM ingredients WHERE name = 'Plain yogurt'),
    240,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-lassi'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    120,
    'ml',
    'cold'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-lassi'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    2,
    'tbsp',
    'or to taste'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-lassi'),
    (SELECT id FROM ingredients WHERE name = 'Cardamom'),
    0.25,
    'tsp',
    'ground'
);

-- Ingredients for: Iced Matcha Latte
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-matcha-latte'),
    (SELECT id FROM ingredients WHERE name = 'Matcha powder'),
    2,
    'tsp',
    'ceremonial grade'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-matcha-latte'),
    (SELECT id FROM ingredients WHERE name = 'Hot water'),
    60,
    'ml',
    '175°F'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-matcha-latte'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    240,
    'ml',
    'oat or regular'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-matcha-latte'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    1,
    'tbsp',
    'or maple syrup'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-matcha-latte'),
    (SELECT id FROM ingredients WHERE name = 'Ice'),
    1,
    'cup',
    NULL
);

-- Ingredients for: Berry Smoothie Bowl
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'berry-smoothie-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Frozen mixed berries'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'berry-smoothie-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Frozen banana'),
    1,
    'medium',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'berry-smoothie-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    60,
    'ml',
    'any kind'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'berry-smoothie-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Granola'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'berry-smoothie-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Fresh berries'),
    50,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'berry-smoothie-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Banana'),
    0.5,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'berry-smoothie-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Chia seeds'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'berry-smoothie-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    1,
    'tbsp',
    NULL
);

-- Ingredients for: Mojito
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mojito'),
    (SELECT id FROM ingredients WHERE name = 'White rum'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mojito'),
    (SELECT id FROM ingredients WHERE name = 'Fresh mint leaves'),
    10,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mojito'),
    (SELECT id FROM ingredients WHERE name = 'Fresh lime juice'),
    30,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mojito'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    2,
    'tsp',
    'or simple syrup'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mojito'),
    (SELECT id FROM ingredients WHERE name = 'Soda water'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mojito'),
    (SELECT id FROM ingredients WHERE name = 'Ice'),
    1,
    'cup',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mojito'),
    (SELECT id FROM ingredients WHERE name = 'Lime wheel'),
    1,
    'whole',
    'for garnish'
);

-- Ingredients for: Hot Chocolate
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-chocolate'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    480,
    'ml',
    'whole'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-chocolate'),
    (SELECT id FROM ingredients WHERE name = 'Cocoa powder'),
    3,
    'tbsp',
    'unsweetened'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-chocolate'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-chocolate'),
    (SELECT id FROM ingredients WHERE name = 'Chocolate chips'),
    60,
    'g',
    'dark'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-chocolate'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-chocolate'),
    (SELECT id FROM ingredients WHERE name = 'Whipped cream'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-chocolate'),
    (SELECT id FROM ingredients WHERE name = 'Mini marshmallows'),
    30,
    'g',
    NULL
);

-- Ingredients for: Green Detox Smoothie
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-detox-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Spinach'),
    60,
    'g',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-detox-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Banana'),
    1,
    'medium',
    'frozen'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-detox-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Green apple'),
    1,
    'small',
    'cored'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-detox-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Fresh ginger'),
    1,
    'tsp',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-detox-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-detox-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Coconut water'),
    240,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-detox-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    1,
    'tsp',
    'optional'
);

-- Ingredients for: Chocolate Chip Cookies
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-chip-cookies'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    230,
    'g',
    'softened'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-chip-cookies'),
    (SELECT id FROM ingredients WHERE name = 'Brown sugar'),
    200,
    'g',
    'packed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-chip-cookies'),
    (SELECT id FROM ingredients WHERE name = 'White sugar'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-chip-cookies'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    2,
    'large',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-chip-cookies'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-chip-cookies'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    280,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-chip-cookies'),
    (SELECT id FROM ingredients WHERE name = 'Baking soda'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-chip-cookies'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-chip-cookies'),
    (SELECT id FROM ingredients WHERE name = 'Chocolate chips'),
    340,
    'g',
    NULL
);

-- Ingredients for: Brownies
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'brownies'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    230,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'brownies'),
    (SELECT id FROM ingredients WHERE name = 'Dark chocolate'),
    200,
    'g',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'brownies'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'brownies'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'large',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'brownies'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'brownies'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    130,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'brownies'),
    (SELECT id FROM ingredients WHERE name = 'Cocoa powder'),
    30,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'brownies'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Banana Bread
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banana-bread'),
    (SELECT id FROM ingredients WHERE name = 'Ripe bananas'),
    4,
    'medium',
    'very ripe'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banana-bread'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    115,
    'g',
    'melted'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banana-bread'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banana-bread'),
    (SELECT id FROM ingredients WHERE name = 'Egg'),
    1,
    'large',
    'beaten'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banana-bread'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banana-bread'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    190,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banana-bread'),
    (SELECT id FROM ingredients WHERE name = 'Baking soda'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banana-bread'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.25,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banana-bread'),
    (SELECT id FROM ingredients WHERE name = 'Walnuts'),
    80,
    'g',
    'chopped, optional'
);

-- Ingredients for: Apple Pie
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'apple-pie'),
    (SELECT id FROM ingredients WHERE name = 'Granny Smith apples'),
    1000,
    'g',
    'about 6'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'apple-pie'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'apple-pie'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon'),
    1,
    'tsp',
    'ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'apple-pie'),
    (SELECT id FROM ingredients WHERE name = 'Nutmeg'),
    0.25,
    'tsp',
    'ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'apple-pie'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'apple-pie'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    30,
    'g',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'apple-pie'),
    (SELECT id FROM ingredients WHERE name = 'Pie dough'),
    2,
    'crusts',
    'homemade or store-bought'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'apple-pie'),
    (SELECT id FROM ingredients WHERE name = 'Egg'),
    1,
    'whole',
    'for egg wash'
);

-- Ingredients for: Energy Balls
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'energy-balls'),
    (SELECT id FROM ingredients WHERE name = 'Rolled oats'),
    160,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'energy-balls'),
    (SELECT id FROM ingredients WHERE name = 'Peanut butter'),
    180,
    'g',
    'creamy'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'energy-balls'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    80,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'energy-balls'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'energy-balls'),
    (SELECT id FROM ingredients WHERE name = 'Mini chocolate chips'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'energy-balls'),
    (SELECT id FROM ingredients WHERE name = 'Chia seeds'),
    2,
    'tbsp',
    'optional'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'energy-balls'),
    (SELECT id FROM ingredients WHERE name = 'Flax seeds'),
    2,
    'tbsp',
    'ground, optional'
);

-- Ingredients for: Coq au Vin
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM ingredients WHERE name = 'Chicken pieces'),
    1500,
    'g',
    'bone-in'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM ingredients WHERE name = 'Red wine'),
    750,
    'ml',
    'Burgundy'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM ingredients WHERE name = 'Bacon lardons'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM ingredients WHERE name = 'Pearl onions'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM ingredients WHERE name = 'Cremini mushrooms'),
    250,
    'g',
    'quartered'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM ingredients WHERE name = 'Chicken stock'),
    250,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    45,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM ingredients WHERE name = 'Fresh thyme'),
    4,
    'sprigs',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM ingredients WHERE name = 'Bay leaves'),
    2,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);

-- Ingredients for: French Onion Soup
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-onion-soup'),
    (SELECT id FROM ingredients WHERE name = 'Yellow onions'),
    1000,
    'g',
    'thinly sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-onion-soup'),
    (SELECT id FROM ingredients WHERE name = 'Beef broth'),
    1500,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-onion-soup'),
    (SELECT id FROM ingredients WHERE name = 'Gruyère cheese'),
    200,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-onion-soup'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-onion-soup'),
    (SELECT id FROM ingredients WHERE name = 'White wine'),
    120,
    'ml',
    'dry'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-onion-soup'),
    (SELECT id FROM ingredients WHERE name = 'Baguette'),
    6,
    'slices',
    'toasted'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-onion-soup'),
    (SELECT id FROM ingredients WHERE name = 'Fresh thyme'),
    3,
    'sprigs',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-onion-soup'),
    (SELECT id FROM ingredients WHERE name = 'Bay leaf'),
    1,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-onion-soup'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);

-- Ingredients for: Beef Bourguignon
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM ingredients WHERE name = 'Beef chuck'),
    1000,
    'g',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM ingredients WHERE name = 'Red wine'),
    500,
    'ml',
    'Burgundy'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM ingredients WHERE name = 'Beef stock'),
    500,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM ingredients WHERE name = 'Bacon'),
    150,
    'g',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM ingredients WHERE name = 'Pearl onions'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    3,
    'medium',
    'chunked'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM ingredients WHERE name = 'Mushrooms'),
    250,
    'g',
    'quartered'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM ingredients WHERE name = 'Tomato paste'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM ingredients WHERE name = 'Fresh thyme'),
    4,
    'sprigs',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM ingredients WHERE name = 'Bay leaves'),
    2,
    'whole',
    NULL
);

-- Ingredients for: Crêpes
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crpes'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crpes'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    3,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crpes'),
    (SELECT id FROM ingredients WHERE name = 'Whole milk'),
    350,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crpes'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    30,
    'g',
    'melted, plus more for pan'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crpes'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crpes'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.25,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crpes'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tsp',
    'for sweet crêpes'
);

-- Ingredients for: Ratatouille
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM ingredients WHERE name = 'Eggplant'),
    1,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM ingredients WHERE name = 'Zucchini'),
    2,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM ingredients WHERE name = 'Yellow squash'),
    1,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM ingredients WHERE name = 'Roma tomatoes'),
    4,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM ingredients WHERE name = 'Bell pepper'),
    1,
    'red',
    'diced for sauce'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM ingredients WHERE name = 'Crushed tomatoes'),
    400,
    'g',
    'for sauce'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM ingredients WHERE name = 'Fresh thyme'),
    1,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM ingredients WHERE name = 'Fresh basil'),
    0.25,
    'cup',
    'chopped'
);

-- Ingredients for: Bibimbap
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM ingredients WHERE name = 'Short-grain rice'),
    400,
    'g',
    'cooked'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM ingredients WHERE name = 'Beef sirloin'),
    200,
    'g',
    'thinly sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM ingredients WHERE name = 'Spinach'),
    150,
    'g',
    'blanched'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM ingredients WHERE name = 'Bean sprouts'),
    100,
    'g',
    'blanched'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    1,
    'medium',
    'julienned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM ingredients WHERE name = 'Shiitake mushrooms'),
    100,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM ingredients WHERE name = 'Zucchini'),
    1,
    'small',
    'julienned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM ingredients WHERE name = 'Gochujang'),
    4,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM ingredients WHERE name = 'Sesame oil'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM ingredients WHERE name = 'Sesame seeds'),
    1,
    'tbsp',
    NULL
);

-- Ingredients for: Korean Fried Chicken
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Chicken wings'),
    1000,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Cornstarch'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    50,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Gochujang'),
    4,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Rice vinegar'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    1,
    'tbsp',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    1,
    'L',
    'for frying'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Sesame seeds'),
    2,
    'tbsp',
    NULL
);

-- Ingredients for: Japchae
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM ingredients WHERE name = 'Sweet potato noodles'),
    250,
    'g',
    'dangmyeon'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM ingredients WHERE name = 'Beef sirloin'),
    150,
    'g',
    'sliced thin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM ingredients WHERE name = 'Spinach'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    1,
    'medium',
    'julienned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM ingredients WHERE name = 'Shiitake mushrooms'),
    100,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    4,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM ingredients WHERE name = 'Sesame oil'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM ingredients WHERE name = 'Sesame seeds'),
    1,
    'tbsp',
    NULL
);

-- Ingredients for: Kimchi Jjigae
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kimchi-jjigae'),
    (SELECT id FROM ingredients WHERE name = 'Aged kimchi'),
    400,
    'g',
    'well-fermented'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kimchi-jjigae'),
    (SELECT id FROM ingredients WHERE name = 'Pork belly'),
    200,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kimchi-jjigae'),
    (SELECT id FROM ingredients WHERE name = 'Firm tofu'),
    300,
    'g',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kimchi-jjigae'),
    (SELECT id FROM ingredients WHERE name = 'Anchovy stock'),
    500,
    'ml',
    'or water'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kimchi-jjigae'),
    (SELECT id FROM ingredients WHERE name = 'Gochugaru'),
    1,
    'tbsp',
    'Korean red pepper flakes'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kimchi-jjigae'),
    (SELECT id FROM ingredients WHERE name = 'Gochujang'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kimchi-jjigae'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kimchi-jjigae'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kimchi-jjigae'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    2,
    'stalks',
    'chopped'
);

-- Ingredients for: Bulgogi
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM ingredients WHERE name = 'Beef ribeye'),
    600,
    'g',
    'thinly sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM ingredients WHERE name = 'Asian pear'),
    0.5,
    'whole',
    'pureed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM ingredients WHERE name = 'Sesame oil'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    1,
    'tbsp',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    3,
    'stalks',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM ingredients WHERE name = 'Sesame seeds'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Pho Bo
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM ingredients WHERE name = 'Beef bones'),
    1500,
    'g',
    'marrow and knuckle'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM ingredients WHERE name = 'Beef sirloin'),
    300,
    'g',
    'thinly sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM ingredients WHERE name = 'Rice noodles'),
    400,
    'g',
    'banh pho'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    2,
    'large',
    'halved'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    100,
    'g',
    'halved'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM ingredients WHERE name = 'Star anise'),
    5,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon stick'),
    1,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM ingredients WHERE name = 'Fish sauce'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM ingredients WHERE name = 'Bean sprouts'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM ingredients WHERE name = 'Thai basil'),
    1,
    'cup',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM ingredients WHERE name = 'Lime'),
    2,
    'whole',
    'wedges'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    4,
    'stalks',
    'sliced'
);

-- Ingredients for: Banh Mi
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM ingredients WHERE name = 'Vietnamese baguette'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM ingredients WHERE name = 'Pork tenderloin'),
    400,
    'g',
    'grilled, sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM ingredients WHERE name = 'Pâté'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    2,
    'medium',
    'julienned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM ingredients WHERE name = 'Daikon radish'),
    150,
    'g',
    'julienned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM ingredients WHERE name = 'Cucumber'),
    1,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM ingredients WHERE name = 'Jalapeño'),
    2,
    'whole',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    1,
    'cup',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM ingredients WHERE name = 'Mayonnaise'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM ingredients WHERE name = 'Rice vinegar'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    3,
    'tbsp',
    NULL
);

-- Ingredients for: Fresh Spring Rolls
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM ingredients WHERE name = 'Rice paper wrappers'),
    12,
    'sheets',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM ingredients WHERE name = 'Shrimp'),
    300,
    'g',
    'cooked, halved'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM ingredients WHERE name = 'Rice vermicelli'),
    150,
    'g',
    'cooked'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM ingredients WHERE name = 'Lettuce leaves'),
    12,
    'whole',
    'butter lettuce'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM ingredients WHERE name = 'Fresh mint'),
    0.5,
    'cup',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    0.5,
    'cup',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM ingredients WHERE name = 'Cucumber'),
    1,
    'medium',
    'julienned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM ingredients WHERE name = 'Peanut butter'),
    60,
    'g',
    'for sauce'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM ingredients WHERE name = 'Hoisin sauce'),
    3,
    'tbsp',
    'for sauce'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM ingredients WHERE name = 'Sriracha'),
    1,
    'tsp',
    'for sauce'
);

-- Ingredients for: Bun Cha
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM ingredients WHERE name = 'Ground pork'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM ingredients WHERE name = 'Pork belly'),
    300,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM ingredients WHERE name = 'Rice vermicelli'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM ingredients WHERE name = 'Fish sauce'),
    80,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM ingredients WHERE name = 'Lime juice'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    4,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    6,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM ingredients WHERE name = 'Thai chili'),
    3,
    'whole',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM ingredients WHERE name = 'Fresh herbs'),
    2,
    'cups',
    'mint, perilla, cilantro'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM ingredients WHERE name = 'Lettuce'),
    1,
    'head',
    'leaves separated'
);

-- Ingredients for: Paella Valenciana
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM ingredients WHERE name = 'Bomba rice'),
    400,
    'g',
    'or Calasparra'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM ingredients WHERE name = 'Chicken thighs'),
    500,
    'g',
    'bone-in, cut'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM ingredients WHERE name = 'Rabbit'),
    400,
    'g',
    'cut into pieces'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM ingredients WHERE name = 'Green beans'),
    200,
    'g',
    'trimmed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM ingredients WHERE name = 'Chicken stock'),
    1200,
    'ml',
    'hot'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM ingredients WHERE name = 'Saffron'),
    0.5,
    'g',
    'threads'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM ingredients WHERE name = 'Smoked paprika'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM ingredients WHERE name = 'Tomato'),
    2,
    'medium',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    80,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM ingredients WHERE name = 'Rosemary'),
    2,
    'sprigs',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM ingredients WHERE name = 'Lemon'),
    1,
    'whole',
    'wedges'
);

-- Ingredients for: Gazpacho
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM ingredients WHERE name = 'Ripe tomatoes'),
    1000,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM ingredients WHERE name = 'Cucumber'),
    1,
    'medium',
    'peeled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM ingredients WHERE name = 'Red bell pepper'),
    1,
    'medium',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM ingredients WHERE name = 'Red onion'),
    0.5,
    'small',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    2,
    'cloves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM ingredients WHERE name = 'Day-old bread'),
    100,
    'g',
    'crust removed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM ingredients WHERE name = 'Sherry vinegar'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    80,
    'ml',
    'extra virgin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Patatas Bravas
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'patatas-bravas'),
    (SELECT id FROM ingredients WHERE name = 'Potatoes'),
    800,
    'g',
    'Yukon Gold'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'patatas-bravas'),
    (SELECT id FROM ingredients WHERE name = 'Tomato passata'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'patatas-bravas'),
    (SELECT id FROM ingredients WHERE name = 'Smoked paprika'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'patatas-bravas'),
    (SELECT id FROM ingredients WHERE name = 'Cayenne pepper'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'patatas-bravas'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'patatas-bravas'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    400,
    'ml',
    'for frying and aioli'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'patatas-bravas'),
    (SELECT id FROM ingredients WHERE name = 'Egg yolk'),
    1,
    'whole',
    'for aioli'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'patatas-bravas'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'patatas-bravas'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'small',
    'minced'
);

-- Ingredients for: Spanish Tortilla
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spanish-tortilla'),
    (SELECT id FROM ingredients WHERE name = 'Potatoes'),
    600,
    'g',
    'thinly sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spanish-tortilla'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'large',
    'thinly sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spanish-tortilla'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    6,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spanish-tortilla'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    200,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spanish-tortilla'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Shawarma
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM ingredients WHERE name = 'Chicken thighs'),
    600,
    'g',
    'boneless, sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM ingredients WHERE name = 'Pita bread'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM ingredients WHERE name = 'Greek yogurt'),
    100,
    'g',
    'for marinade'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    8,
    'cloves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM ingredients WHERE name = 'Turmeric'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM ingredients WHERE name = 'Pickled turnips'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM ingredients WHERE name = 'Tomatoes'),
    2,
    'medium',
    'sliced'
);

-- Ingredients for: Tabbouleh
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    4,
    'cups',
    'finely chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM ingredients WHERE name = 'Fresh mint'),
    0.5,
    'cup',
    'finely chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM ingredients WHERE name = 'Bulgur wheat'),
    60,
    'g',
    'fine'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM ingredients WHERE name = 'Tomatoes'),
    3,
    'medium',
    'diced small'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    4,
    'stalks',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    80,
    'ml',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    60,
    'ml',
    'extra virgin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM ingredients WHERE name = 'Allspice'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Lamb Kofta
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM ingredients WHERE name = 'Ground lamb'),
    600,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'medium',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    0.5,
    'cup',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM ingredients WHERE name = 'Coriander'),
    1,
    'tsp',
    'ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM ingredients WHERE name = 'Sumac'),
    1,
    'tsp',
    'for garnish'
);

-- Ingredients for: Shakshuka
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    6,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM ingredients WHERE name = 'Crushed tomatoes'),
    800,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM ingredients WHERE name = 'Red bell pepper'),
    2,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'large',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM ingredients WHERE name = 'Cayenne'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM ingredients WHERE name = 'Feta cheese'),
    60,
    'g',
    'crumbled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    0.25,
    'cup',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    3,
    'tbsp',
    NULL
);

-- Ingredients for: Iced Caramel Latte
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-caramel-latte'),
    (SELECT id FROM ingredients WHERE name = 'Espresso'),
    60,
    'ml',
    '2 shots'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-caramel-latte'),
    (SELECT id FROM ingredients WHERE name = 'Caramel syrup'),
    30,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-caramel-latte'),
    (SELECT id FROM ingredients WHERE name = 'Whole milk'),
    200,
    'ml',
    'cold'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-caramel-latte'),
    (SELECT id FROM ingredients WHERE name = 'Ice cubes'),
    1,
    'cup',
    NULL
);

-- Ingredients for: Tropical Smoothie
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tropical-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Frozen mango'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tropical-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Frozen pineapple'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tropical-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Coconut milk'),
    250,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tropical-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    1,
    'tbsp',
    'optional'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tropical-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Banana'),
    0.5,
    'whole',
    'frozen'
);

-- Ingredients for: Chai Tea Latte
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chai-tea-latte'),
    (SELECT id FROM ingredients WHERE name = 'Black tea'),
    2,
    'bags',
    'or loose leaf'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chai-tea-latte'),
    (SELECT id FROM ingredients WHERE name = 'Whole milk'),
    200,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chai-tea-latte'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon stick'),
    1,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chai-tea-latte'),
    (SELECT id FROM ingredients WHERE name = 'Cardamom pods'),
    4,
    'whole',
    'crushed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chai-tea-latte'),
    (SELECT id FROM ingredients WHERE name = 'Fresh ginger'),
    1,
    'tsp',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chai-tea-latte'),
    (SELECT id FROM ingredients WHERE name = 'Cloves'),
    3,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chai-tea-latte'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chai-tea-latte'),
    (SELECT id FROM ingredients WHERE name = 'Water'),
    150,
    'ml',
    NULL
);

-- Ingredients for: Strawberry Banana Smoothie
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'strawberry-banana-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Frozen strawberries'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'strawberry-banana-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Banana'),
    1,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'strawberry-banana-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Greek yogurt'),
    100,
    'g',
    'vanilla'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'strawberry-banana-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    150,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'strawberry-banana-smoothie'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    1,
    'tbsp',
    'optional'
);

-- Ingredients for: Pina Colada
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pina-colada'),
    (SELECT id FROM ingredients WHERE name = 'White rum'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pina-colada'),
    (SELECT id FROM ingredients WHERE name = 'Coconut cream'),
    90,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pina-colada'),
    (SELECT id FROM ingredients WHERE name = 'Pineapple juice'),
    90,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pina-colada'),
    (SELECT id FROM ingredients WHERE name = 'Pineapple chunks'),
    100,
    'g',
    'fresh or frozen'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pina-colada'),
    (SELECT id FROM ingredients WHERE name = 'Ice'),
    1,
    'cup',
    NULL
);

-- Ingredients for: Cold Brew Coffee
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cold-brew-coffee'),
    (SELECT id FROM ingredients WHERE name = 'Coffee beans'),
    100,
    'g',
    'coarsely ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cold-brew-coffee'),
    (SELECT id FROM ingredients WHERE name = 'Cold water'),
    700,
    'ml',
    'filtered'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cold-brew-coffee'),
    (SELECT id FROM ingredients WHERE name = 'Ice'),
    1,
    'cup',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cold-brew-coffee'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    100,
    'ml',
    'optional'
);

-- Ingredients for: Lemonade
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemonade'),
    (SELECT id FROM ingredients WHERE name = 'Lemons'),
    6,
    'whole',
    'juiced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemonade'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemonade'),
    (SELECT id FROM ingredients WHERE name = 'Water'),
    1000,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemonade'),
    (SELECT id FROM ingredients WHERE name = 'Ice'),
    2,
    'cups',
    NULL
);

-- Ingredients for: Espresso Martini
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'espresso-martini'),
    (SELECT id FROM ingredients WHERE name = 'Vodka'),
    45,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'espresso-martini'),
    (SELECT id FROM ingredients WHERE name = 'Coffee liqueur'),
    30,
    'ml',
    'Kahlua'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'espresso-martini'),
    (SELECT id FROM ingredients WHERE name = 'Espresso'),
    30,
    'ml',
    'fresh, cooled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'espresso-martini'),
    (SELECT id FROM ingredients WHERE name = 'Simple syrup'),
    15,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'espresso-martini'),
    (SELECT id FROM ingredients WHERE name = 'Coffee beans'),
    3,
    'whole',
    'for garnish'
);

-- Ingredients for: Golden Milk
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'golden-milk'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    350,
    'ml',
    'or plant-based'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'golden-milk'),
    (SELECT id FROM ingredients WHERE name = 'Turmeric'),
    1,
    'tsp',
    'ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'golden-milk'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    0.5,
    'tsp',
    'ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'golden-milk'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'golden-milk'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    1,
    'pinch',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'golden-milk'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'golden-milk'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Watermelon Agua Fresca
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'watermelon-agua-fresca'),
    (SELECT id FROM ingredients WHERE name = 'Watermelon'),
    800,
    'g',
    'seedless'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'watermelon-agua-fresca'),
    (SELECT id FROM ingredients WHERE name = 'Water'),
    500,
    'ml',
    'cold'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'watermelon-agua-fresca'),
    (SELECT id FROM ingredients WHERE name = 'Lime juice'),
    60,
    'ml',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'watermelon-agua-fresca'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    3,
    'tbsp',
    'to taste'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'watermelon-agua-fresca'),
    (SELECT id FROM ingredients WHERE name = 'Fresh mint'),
    4,
    'leaves',
    'for garnish'
);

-- Ingredients for: Eggs Florentine
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-florentine'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'whole',
    'for poaching'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-florentine'),
    (SELECT id FROM ingredients WHERE name = 'English muffins'),
    2,
    'whole',
    'split'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-florentine'),
    (SELECT id FROM ingredients WHERE name = 'Fresh spinach'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-florentine'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    115,
    'g',
    'for hollandaise'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-florentine'),
    (SELECT id FROM ingredients WHERE name = 'Egg yolks'),
    3,
    'whole',
    'for hollandaise'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-florentine'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-florentine'),
    (SELECT id FROM ingredients WHERE name = 'White vinegar'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-florentine'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    2,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-florentine'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    0.25,
    'tsp',
    'for garnish'
);

-- Ingredients for: Breakfast Burrito
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'breakfast-burrito'),
    (SELECT id FROM ingredients WHERE name = 'Large flour tortillas'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'breakfast-burrito'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    6,
    'whole',
    'scrambled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'breakfast-burrito'),
    (SELECT id FROM ingredients WHERE name = 'Bacon'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'breakfast-burrito'),
    (SELECT id FROM ingredients WHERE name = 'Potatoes'),
    300,
    'g',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'breakfast-burrito'),
    (SELECT id FROM ingredients WHERE name = 'Cheddar cheese'),
    100,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'breakfast-burrito'),
    (SELECT id FROM ingredients WHERE name = 'Salsa'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'breakfast-burrito'),
    (SELECT id FROM ingredients WHERE name = 'Avocado'),
    1,
    'whole',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'breakfast-burrito'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    60,
    'g',
    NULL
);

-- Ingredients for: Granola
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'granola'),
    (SELECT id FROM ingredients WHERE name = 'Rolled oats'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'granola'),
    (SELECT id FROM ingredients WHERE name = 'Mixed nuts'),
    150,
    'g',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'granola'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'granola'),
    (SELECT id FROM ingredients WHERE name = 'Coconut oil'),
    60,
    'ml',
    'melted'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'granola'),
    (SELECT id FROM ingredients WHERE name = 'Shredded coconut'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'granola'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'granola'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'granola'),
    (SELECT id FROM ingredients WHERE name = 'Dried cranberries'),
    80,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'granola'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Belgian Waffles
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'belgian-waffles'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    250,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'belgian-waffles'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    2,
    'whole',
    'separated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'belgian-waffles'),
    (SELECT id FROM ingredients WHERE name = 'Whole milk'),
    350,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'belgian-waffles'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    85,
    'g',
    'melted'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'belgian-waffles'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'belgian-waffles'),
    (SELECT id FROM ingredients WHERE name = 'Baking powder'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'belgian-waffles'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'belgian-waffles'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Shakshuka Green
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    6,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM ingredients WHERE name = 'Spinach'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM ingredients WHERE name = 'Kale'),
    150,
    'g',
    'stems removed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM ingredients WHERE name = 'Green chili'),
    2,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM ingredients WHERE name = 'Feta cheese'),
    60,
    'g',
    'crumbled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM ingredients WHERE name = 'Fresh dill'),
    2,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    3,
    'tbsp',
    NULL
);

-- Ingredients for: Churros
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'churros'),
    (SELECT id FROM ingredients WHERE name = 'Water'),
    250,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'churros'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'churros'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'churros'),
    (SELECT id FROM ingredients WHERE name = 'Egg'),
    1,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'churros'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'churros'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'churros'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    1,
    'L',
    'for frying'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'churros'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: Mochi Ice Cream
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mochi-ice-cream'),
    (SELECT id FROM ingredients WHERE name = 'Mochiko flour'),
    150,
    'g',
    'sweet rice flour'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mochi-ice-cream'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    75,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mochi-ice-cream'),
    (SELECT id FROM ingredients WHERE name = 'Water'),
    180,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mochi-ice-cream'),
    (SELECT id FROM ingredients WHERE name = 'Ice cream'),
    350,
    'g',
    'any flavor'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mochi-ice-cream'),
    (SELECT id FROM ingredients WHERE name = 'Cornstarch'),
    50,
    'g',
    'for dusting'
);

-- Ingredients for: Baklava
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baklava'),
    (SELECT id FROM ingredients WHERE name = 'Phyllo dough'),
    450,
    'g',
    '1 package'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baklava'),
    (SELECT id FROM ingredients WHERE name = 'Mixed nuts'),
    450,
    'g',
    'walnuts, pistachios'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baklava'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    230,
    'g',
    'melted'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baklava'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    250,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baklava'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baklava'),
    (SELECT id FROM ingredients WHERE name = 'Water'),
    180,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baklava'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baklava'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    1,
    'tbsp',
    NULL
);

-- Ingredients for: Panna Cotta
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'panna-cotta'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    500,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'panna-cotta'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    75,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'panna-cotta'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla bean'),
    1,
    'whole',
    'seeds scraped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'panna-cotta'),
    (SELECT id FROM ingredients WHERE name = 'Gelatin'),
    7,
    'g',
    '1 packet'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'panna-cotta'),
    (SELECT id FROM ingredients WHERE name = 'Cold water'),
    45,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'panna-cotta'),
    (SELECT id FROM ingredients WHERE name = 'Fresh berries'),
    200,
    'g',
    'for topping'
);

-- Ingredients for: Guacamole
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole-2'),
    (SELECT id FROM ingredients WHERE name = 'Ripe avocados'),
    3,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole-2'),
    (SELECT id FROM ingredients WHERE name = 'Lime juice'),
    2,
    'tbsp',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole-2'),
    (SELECT id FROM ingredients WHERE name = 'Red onion'),
    0.25,
    'cup',
    'finely diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole-2'),
    (SELECT id FROM ingredients WHERE name = 'Roma tomato'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole-2'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    3,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole-2'),
    (SELECT id FROM ingredients WHERE name = 'Jalapeño'),
    1,
    'whole',
    'seeded, minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole-2'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole-2'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    1,
    'clove',
    'minced'
);

-- Ingredients for: Caprese Skewers
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-skewers'),
    (SELECT id FROM ingredients WHERE name = 'Cherry tomatoes'),
    24,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-skewers'),
    (SELECT id FROM ingredients WHERE name = 'Fresh mozzarella balls'),
    24,
    'small',
    'bocconcini'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-skewers'),
    (SELECT id FROM ingredients WHERE name = 'Fresh basil leaves'),
    24,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-skewers'),
    (SELECT id FROM ingredients WHERE name = 'Balsamic glaze'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-skewers'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-skewers'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.25,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-skewers'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: Caesar Salad
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caesar-salad'),
    (SELECT id FROM ingredients WHERE name = 'Romaine lettuce'),
    2,
    'heads',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caesar-salad'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan cheese'),
    100,
    'g',
    'shaved'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caesar-salad'),
    (SELECT id FROM ingredients WHERE name = 'Croutons'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caesar-salad'),
    (SELECT id FROM ingredients WHERE name = 'Anchovy fillets'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caesar-salad'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    2,
    'cloves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caesar-salad'),
    (SELECT id FROM ingredients WHERE name = 'Egg yolk'),
    1,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caesar-salad'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caesar-salad'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caesar-salad'),
    (SELECT id FROM ingredients WHERE name = 'Dijon mustard'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Quinoa Bowl
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Quinoa'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Sweet potato'),
    2,
    'medium',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Chickpeas'),
    400,
    'g',
    'canned, drained'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Broccoli'),
    200,
    'g',
    'florets'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Avocado'),
    1,
    'whole',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Tahini'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    2,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Pumpkin seeds'),
    30,
    'g',
    NULL
);

-- Ingredients for: Cobb Salad
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM ingredients WHERE name = 'Mixed greens'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    300,
    'g',
    'grilled, diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM ingredients WHERE name = 'Bacon'),
    150,
    'g',
    'crispy'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'whole',
    'hard-boiled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM ingredients WHERE name = 'Avocado'),
    2,
    'whole',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM ingredients WHERE name = 'Cherry tomatoes'),
    200,
    'g',
    'halved'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM ingredients WHERE name = 'Blue cheese'),
    100,
    'g',
    'crumbled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM ingredients WHERE name = 'Red onion'),
    0.5,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM ingredients WHERE name = 'Red wine vinegar'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    120,
    'ml',
    NULL
);

-- Ingredients for: Grilled Chicken Salad
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    500,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Mixed greens'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Cucumber'),
    1,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Cherry tomatoes'),
    200,
    'g',
    'halved'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Red onion'),
    0.5,
    'small',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Dijon mustard'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Apple cider vinegar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    60,
    'ml',
    NULL
);

-- Ingredients for: Nicoise Salad
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM ingredients WHERE name = 'Canned tuna'),
    400,
    'g',
    'oil-packed, drained'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM ingredients WHERE name = 'Green beans'),
    250,
    'g',
    'trimmed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM ingredients WHERE name = 'Baby potatoes'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'whole',
    'hard-boiled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM ingredients WHERE name = 'Nicoise olives'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM ingredients WHERE name = 'Cherry tomatoes'),
    200,
    'g',
    'halved'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM ingredients WHERE name = 'Mixed greens'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM ingredients WHERE name = 'Dijon mustard'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM ingredients WHERE name = 'Red wine vinegar'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    90,
    'ml',
    NULL
);

-- Ingredients for: Asian Chicken Salad
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Napa cabbage'),
    400,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    400,
    'g',
    'cooked, shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    2,
    'medium',
    'julienned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Edamame'),
    100,
    'g',
    'shelled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Sliced almonds'),
    60,
    'g',
    'toasted'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Rice vinegar'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Sesame oil'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Fresh ginger'),
    1,
    'tbsp',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    1,
    'tbsp',
    NULL
);

-- Ingredients for: BLT Sandwich
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'blt-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Bacon'),
    8,
    'slices',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'blt-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Sourdough bread'),
    4,
    'slices',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'blt-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Lettuce'),
    4,
    'leaves',
    'iceberg or romaine'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'blt-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Tomato'),
    1,
    'large',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'blt-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Mayonnaise'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'blt-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.25,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'blt-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: Grilled Cheese Sandwich
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-cheese-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'White bread'),
    4,
    'slices',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-cheese-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Cheddar cheese'),
    120,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-cheese-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    30,
    'g',
    'softened'
);

-- Ingredients for: Tuna Melt
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tuna-melt'),
    (SELECT id FROM ingredients WHERE name = 'Canned tuna'),
    300,
    'g',
    'drained'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tuna-melt'),
    (SELECT id FROM ingredients WHERE name = 'Mayonnaise'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tuna-melt'),
    (SELECT id FROM ingredients WHERE name = 'Celery'),
    1,
    'stalk',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tuna-melt'),
    (SELECT id FROM ingredients WHERE name = 'Red onion'),
    2,
    'tbsp',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tuna-melt'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tuna-melt'),
    (SELECT id FROM ingredients WHERE name = 'Bread'),
    4,
    'slices',
    'sourdough'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tuna-melt'),
    (SELECT id FROM ingredients WHERE name = 'Cheddar cheese'),
    100,
    'g',
    'sliced'
);

-- Ingredients for: Club Sandwich
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'club-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'White bread'),
    6,
    'slices',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'club-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Turkey breast'),
    200,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'club-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Bacon'),
    6,
    'slices',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'club-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Lettuce'),
    6,
    'leaves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'club-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Tomato'),
    1,
    'large',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'club-sandwich'),
    (SELECT id FROM ingredients WHERE name = 'Mayonnaise'),
    3,
    'tbsp',
    NULL
);

-- Ingredients for: Quesadilla
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadilla'),
    (SELECT id FROM ingredients WHERE name = 'Large flour tortillas'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadilla'),
    (SELECT id FROM ingredients WHERE name = 'Shredded cheese'),
    300,
    'g',
    'Mexican blend'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadilla'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    200,
    'g',
    'cooked, shredded, optional'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadilla'),
    (SELECT id FROM ingredients WHERE name = 'Bell peppers'),
    1,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadilla'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    0.5,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadilla'),
    (SELECT id FROM ingredients WHERE name = 'Salsa'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadilla'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    60,
    'g',
    NULL
);

-- Ingredients for: Stir Fry Vegetables
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM ingredients WHERE name = 'Broccoli'),
    200,
    'g',
    'florets'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM ingredients WHERE name = 'Bell peppers'),
    2,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM ingredients WHERE name = 'Snap peas'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    2,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM ingredients WHERE name = 'Mushrooms'),
    150,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM ingredients WHERE name = 'Oyster sauce'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM ingredients WHERE name = 'Sesame oil'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    1,
    'tbsp',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    2,
    'tbsp',
    NULL
);

-- Ingredients for: Chicken Wrap
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-wrap'),
    (SELECT id FROM ingredients WHERE name = 'Large flour tortillas'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-wrap'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-wrap'),
    (SELECT id FROM ingredients WHERE name = 'Lettuce'),
    2,
    'cups',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-wrap'),
    (SELECT id FROM ingredients WHERE name = 'Tomatoes'),
    2,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-wrap'),
    (SELECT id FROM ingredients WHERE name = 'Shredded cheese'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-wrap'),
    (SELECT id FROM ingredients WHERE name = 'Ranch dressing'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-wrap'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-wrap'),
    (SELECT id FROM ingredients WHERE name = 'Garlic powder'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Fettuccine Alfredo
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fettuccine-alfredo'),
    (SELECT id FROM ingredients WHERE name = 'Fettuccine'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fettuccine-alfredo'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    300,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fettuccine-alfredo'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fettuccine-alfredo'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan cheese'),
    150,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fettuccine-alfredo'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fettuccine-alfredo'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fettuccine-alfredo'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    2,
    'tbsp',
    'chopped'
);

-- Ingredients for: Pasta Primavera
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM ingredients WHERE name = 'Penne pasta'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM ingredients WHERE name = 'Zucchini'),
    1,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM ingredients WHERE name = 'Yellow squash'),
    1,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM ingredients WHERE name = 'Cherry tomatoes'),
    200,
    'g',
    'halved'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM ingredients WHERE name = 'Asparagus'),
    150,
    'g',
    'cut into 2-inch pieces'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM ingredients WHERE name = 'Bell pepper'),
    1,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM ingredients WHERE name = 'White wine'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan cheese'),
    80,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM ingredients WHERE name = 'Fresh basil'),
    0.25,
    'cup',
    'chopped'
);

-- Ingredients for: Pasta Puttanesca
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-puttanesca'),
    (SELECT id FROM ingredients WHERE name = 'Spaghetti'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-puttanesca'),
    (SELECT id FROM ingredients WHERE name = 'Canned tomatoes'),
    800,
    'g',
    'crushed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-puttanesca'),
    (SELECT id FROM ingredients WHERE name = 'Kalamata olives'),
    100,
    'g',
    'pitted'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-puttanesca'),
    (SELECT id FROM ingredients WHERE name = 'Capers'),
    3,
    'tbsp',
    'drained'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-puttanesca'),
    (SELECT id FROM ingredients WHERE name = 'Anchovy fillets'),
    6,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-puttanesca'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-puttanesca'),
    (SELECT id FROM ingredients WHERE name = 'Red chili flakes'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-puttanesca'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-puttanesca'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    3,
    'tbsp',
    'chopped'
);

-- Ingredients for: Gnocchi with Sage Butter
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gnocchi-with-sage-butter'),
    (SELECT id FROM ingredients WHERE name = 'Potato gnocchi'),
    500,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gnocchi-with-sage-butter'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gnocchi-with-sage-butter'),
    (SELECT id FROM ingredients WHERE name = 'Fresh sage'),
    20,
    'leaves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gnocchi-with-sage-butter'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan cheese'),
    60,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gnocchi-with-sage-butter'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gnocchi-with-sage-butter'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: Grilled Salmon
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-salmon'),
    (SELECT id FROM ingredients WHERE name = 'Salmon fillets'),
    600,
    'g',
    '4 pieces'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-salmon'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-salmon'),
    (SELECT id FROM ingredients WHERE name = 'Lemon'),
    1,
    'whole',
    'cut into wedges'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-salmon'),
    (SELECT id FROM ingredients WHERE name = 'Fresh dill'),
    2,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-salmon'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-salmon'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-salmon'),
    (SELECT id FROM ingredients WHERE name = 'Garlic powder'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Shrimp Scampi
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-scampi'),
    (SELECT id FROM ingredients WHERE name = 'Large shrimp'),
    500,
    'g',
    'peeled, deveined'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-scampi'),
    (SELECT id FROM ingredients WHERE name = 'Linguine'),
    350,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-scampi'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    115,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-scampi'),
    (SELECT id FROM ingredients WHERE name = 'White wine'),
    120,
    'ml',
    'dry'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-scampi'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    6,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-scampi'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-scampi'),
    (SELECT id FROM ingredients WHERE name = 'Red pepper flakes'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-scampi'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    0.25,
    'cup',
    'chopped'
);

-- Ingredients for: Fish Tacos
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM ingredients WHERE name = 'White fish fillets'),
    500,
    'g',
    'cod or mahi-mahi'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Small corn tortillas'),
    12,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Cabbage'),
    300,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    120,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Lime'),
    3,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    0.5,
    'cup',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Chipotle in adobo'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Beer'),
    180,
    'ml',
    'light'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    500,
    'ml',
    'for frying'
);

-- Ingredients for: Garlic Butter Shrimp
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'garlic-butter-shrimp'),
    (SELECT id FROM ingredients WHERE name = 'Large shrimp'),
    500,
    'g',
    'peeled, deveined'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'garlic-butter-shrimp'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'garlic-butter-shrimp'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    6,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'garlic-butter-shrimp'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'garlic-butter-shrimp'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    3,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'garlic-butter-shrimp'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'garlic-butter-shrimp'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'garlic-butter-shrimp'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: Shepherd's Pie
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM ingredients WHERE name = 'Ground lamb'),
    600,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM ingredients WHERE name = 'Potatoes'),
    800,
    'g',
    'peeled, cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    2,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM ingredients WHERE name = 'Frozen peas'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'large',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM ingredients WHERE name = 'Tomato paste'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM ingredients WHERE name = 'Worcestershire sauce'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM ingredients WHERE name = 'Beef stock'),
    250,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    100,
    'ml',
    NULL
);

-- Ingredients for: Chicken Pot Pie
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    500,
    'g',
    'cooked, shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM ingredients WHERE name = 'Puff pastry'),
    250,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    2,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM ingredients WHERE name = 'Celery'),
    2,
    'stalks',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM ingredients WHERE name = 'Frozen peas'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM ingredients WHERE name = 'Chicken stock'),
    350,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    100,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    45,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    45,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM ingredients WHERE name = 'Fresh thyme'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM ingredients WHERE name = 'Egg'),
    1,
    'whole',
    'for wash'
);

-- Ingredients for: Meatloaf
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM ingredients WHERE name = 'Ground beef'),
    900,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM ingredients WHERE name = 'Breadcrumbs'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM ingredients WHERE name = 'Egg'),
    2,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM ingredients WHERE name = 'Ketchup'),
    120,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM ingredients WHERE name = 'Brown sugar'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM ingredients WHERE name = 'Dijon mustard'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM ingredients WHERE name = 'Worcestershire sauce'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Beef Stroganoff
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM ingredients WHERE name = 'Beef sirloin'),
    600,
    'g',
    'sliced thin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM ingredients WHERE name = 'Mushrooms'),
    300,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'large',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM ingredients WHERE name = 'Beef stock'),
    250,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM ingredients WHERE name = 'Dijon mustard'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    45,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM ingredients WHERE name = 'Egg noodles'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    2,
    'tbsp',
    'chopped'
);

-- Ingredients for: Chili Con Carne
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM ingredients WHERE name = 'Ground beef'),
    600,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM ingredients WHERE name = 'Kidney beans'),
    400,
    'g',
    'canned, drained'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM ingredients WHERE name = 'Crushed tomatoes'),
    800,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'large',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM ingredients WHERE name = 'Bell pepper'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM ingredients WHERE name = 'Chili powder'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM ingredients WHERE name = 'Cayenne pepper'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM ingredients WHERE name = 'Beef stock'),
    250,
    'ml',
    NULL
);

-- Ingredients for: Lemon Herb Roasted Chicken
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-herb-roasted-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Whole chicken'),
    1800,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-herb-roasted-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    'softened'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-herb-roasted-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Lemon'),
    2,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-herb-roasted-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Fresh rosemary'),
    4,
    'sprigs',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-herb-roasted-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Fresh thyme'),
    6,
    'sprigs',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-herb-roasted-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    6,
    'cloves',
    'whole'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-herb-roasted-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-herb-roasted-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Honey Garlic Chicken
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'honey-garlic-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Chicken thighs'),
    800,
    'g',
    'bone-in, skin-on'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'honey-garlic-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    80,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'honey-garlic-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'honey-garlic-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    6,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'honey-garlic-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Fresh ginger'),
    1,
    'tbsp',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'honey-garlic-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Rice vinegar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'honey-garlic-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Sesame seeds'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'honey-garlic-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    2,
    'stalks',
    'sliced'
);

-- Ingredients for: Chicken Marsala
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    600,
    'g',
    'pounded thin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM ingredients WHERE name = 'Cremini mushrooms'),
    250,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM ingredients WHERE name = 'Marsala wine'),
    180,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM ingredients WHERE name = 'Chicken stock'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    2,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Orange Chicken
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Chicken thighs'),
    600,
    'g',
    'boneless, cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Orange juice'),
    180,
    'ml',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Orange zest'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Rice vinegar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Cornstarch'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    1,
    'tbsp',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    500,
    'ml',
    'for frying'
);

-- Ingredients for: Chicken Noodle Soup
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM ingredients WHERE name = 'Chicken'),
    1000,
    'g',
    'whole, or pieces'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM ingredients WHERE name = 'Egg noodles'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    3,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM ingredients WHERE name = 'Celery'),
    3,
    'stalks',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'large',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM ingredients WHERE name = 'Chicken stock'),
    2000,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM ingredients WHERE name = 'Fresh dill'),
    3,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM ingredients WHERE name = 'Bay leaves'),
    2,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Tomato Basil Soup
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM ingredients WHERE name = 'Roma tomatoes'),
    1000,
    'g',
    'halved'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable stock'),
    500,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'large',
    'quartered'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    6,
    'cloves',
    'whole'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM ingredients WHERE name = 'Fresh basil'),
    0.5,
    'cup',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Minestrone Soup
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable stock'),
    1500,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM ingredients WHERE name = 'Diced tomatoes'),
    400,
    'g',
    'canned'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM ingredients WHERE name = 'Cannellini beans'),
    400,
    'g',
    'canned, drained'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM ingredients WHERE name = 'Ditalini pasta'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM ingredients WHERE name = 'Zucchini'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    2,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM ingredients WHERE name = 'Celery'),
    2,
    'stalks',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM ingredients WHERE name = 'Green beans'),
    100,
    'g',
    'cut'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM ingredients WHERE name = 'Potato'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan'),
    60,
    'g',
    'for serving'
);

-- Ingredients for: Butternut Squash Soup
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM ingredients WHERE name = 'Butternut squash'),
    1000,
    'g',
    'peeled, cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable stock'),
    750,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    100,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM ingredients WHERE name = 'Maple syrup'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    30,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM ingredients WHERE name = 'Nutmeg'),
    0.25,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM ingredients WHERE name = 'Pumpkin seeds'),
    30,
    'g',
    'for garnish'
);

-- Ingredients for: Vegetable Curry
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM ingredients WHERE name = 'Coconut milk'),
    400,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM ingredients WHERE name = 'Curry paste'),
    3,
    'tbsp',
    'red or yellow'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM ingredients WHERE name = 'Chickpeas'),
    400,
    'g',
    'canned, drained'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM ingredients WHERE name = 'Sweet potato'),
    1,
    'large',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM ingredients WHERE name = 'Bell pepper'),
    1,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM ingredients WHERE name = 'Spinach'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM ingredients WHERE name = 'Basmati rice'),
    300,
    'g',
    'for serving'
);

-- Ingredients for: Stuffed Bell Peppers
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM ingredients WHERE name = 'Bell peppers'),
    6,
    'large',
    'any color'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM ingredients WHERE name = 'Cooked rice'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM ingredients WHERE name = 'Black beans'),
    400,
    'g',
    'canned, drained'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM ingredients WHERE name = 'Corn'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM ingredients WHERE name = 'Diced tomatoes'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM ingredients WHERE name = 'Shredded cheese'),
    150,
    'g',
    'Mexican blend'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM ingredients WHERE name = 'Chili powder'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    3,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Eggplant Parmesan
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggplant-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Eggplant'),
    2,
    'large',
    'sliced 1/2 inch'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggplant-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Marinara sauce'),
    600,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggplant-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Mozzarella'),
    300,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggplant-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan'),
    100,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggplant-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    3,
    'whole',
    'beaten'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggplant-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Breadcrumbs'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggplant-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggplant-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Fresh basil'),
    0.25,
    'cup',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggplant-parmesan'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    120,
    'ml',
    'for frying'
);

-- Ingredients for: Black Bean Tacos
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Black beans'),
    800,
    'g',
    'canned, drained'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Corn tortillas'),
    12,
    'small',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Red cabbage'),
    200,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Avocado'),
    2,
    'whole',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Salsa'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Lime'),
    2,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Chili powder'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    2,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    0.25,
    'cup',
    NULL
);

-- Ingredients for: Vegetable Fried Rice
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Cooked rice'),
    600,
    'g',
    'cold, day-old'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    3,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Mixed vegetables'),
    300,
    'g',
    'peas, carrots, corn'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Sesame oil'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    4,
    'stalks',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    1,
    'tsp',
    'minced'
);

-- Ingredients for: Gyros
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM ingredients WHERE name = 'Ground lamb'),
    600,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM ingredients WHERE name = 'Pita bread'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM ingredients WHERE name = 'Greek yogurt'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM ingredients WHERE name = 'Cucumber'),
    1,
    'medium',
    'grated for tzatziki'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM ingredients WHERE name = 'Tomatoes'),
    2,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM ingredients WHERE name = 'Red onion'),
    0.5,
    'medium',
    'sliced thin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM ingredients WHERE name = 'Fresh dill'),
    2,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM ingredients WHERE name = 'Dried oregano'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Moussaka
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM ingredients WHERE name = 'Eggplant'),
    2,
    'large',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM ingredients WHERE name = 'Ground lamb'),
    500,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM ingredients WHERE name = 'Crushed tomatoes'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'large',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    500,
    'ml',
    'for béchamel'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan'),
    80,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM ingredients WHERE name = 'Nutmeg'),
    0.25,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    80,
    'ml',
    NULL
);

-- Ingredients for: Doner Kebab
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM ingredients WHERE name = 'Ground lamb'),
    600,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM ingredients WHERE name = 'Flatbread'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'medium',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM ingredients WHERE name = 'Red cabbage'),
    150,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM ingredients WHERE name = 'Tomatoes'),
    2,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM ingredients WHERE name = 'Garlic sauce'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM ingredients WHERE name = 'Sumac'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Jerk Chicken
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Chicken pieces'),
    1200,
    'g',
    'legs and thighs'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Scotch bonnet peppers'),
    3,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    6,
    'stalks',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Fresh thyme'),
    6,
    'sprigs',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Allspice'),
    2,
    'tbsp',
    'ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    6,
    'cloves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Lime juice'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Brown sugar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    3,
    'tbsp',
    NULL
);

-- Ingredients for: Chicken Schnitzel
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-schnitzel'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    600,
    'g',
    'pounded thin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-schnitzel'),
    (SELECT id FROM ingredients WHERE name = 'Breadcrumbs'),
    200,
    'g',
    'fine'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-schnitzel'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-schnitzel'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    3,
    'whole',
    'beaten'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-schnitzel'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-schnitzel'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-schnitzel'),
    (SELECT id FROM ingredients WHERE name = 'Lemon'),
    1,
    'whole',
    'wedges'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-schnitzel'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    2,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-schnitzel'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Pierogi
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pierogi'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pierogi'),
    (SELECT id FROM ingredients WHERE name = 'Potatoes'),
    500,
    'g',
    'mashed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pierogi'),
    (SELECT id FROM ingredients WHERE name = 'Cheddar cheese'),
    150,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pierogi'),
    (SELECT id FROM ingredients WHERE name = 'Egg'),
    1,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pierogi'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    60,
    'g',
    'plus more for serving'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pierogi'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    2,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pierogi'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pierogi'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pierogi'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Chicken Satay
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM ingredients WHERE name = 'Chicken thighs'),
    600,
    'g',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM ingredients WHERE name = 'Peanut butter'),
    120,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM ingredients WHERE name = 'Coconut milk'),
    200,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM ingredients WHERE name = 'Lime juice'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM ingredients WHERE name = 'Turmeric'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM ingredients WHERE name = 'Brown sugar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM ingredients WHERE name = 'Red chili flakes'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Beef Rendang
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM ingredients WHERE name = 'Beef chuck'),
    800,
    'g',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM ingredients WHERE name = 'Coconut milk'),
    800,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM ingredients WHERE name = 'Shallots'),
    10,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM ingredients WHERE name = 'Galangal'),
    50,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM ingredients WHERE name = 'Lemongrass'),
    3,
    'stalks',
    'bruised'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM ingredients WHERE name = 'Dried chilies'),
    15,
    'whole',
    'soaked'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM ingredients WHERE name = 'Kaffir lime leaves'),
    6,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM ingredients WHERE name = 'Turmeric'),
    1,
    'tsp',
    'fresh or ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM ingredients WHERE name = 'Toasted coconut'),
    100,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Horchata
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'horchata'),
    (SELECT id FROM ingredients WHERE name = 'Long grain rice'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'horchata'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon sticks'),
    2,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'horchata'),
    (SELECT id FROM ingredients WHERE name = 'Water'),
    1500,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'horchata'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'horchata'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'horchata'),
    (SELECT id FROM ingredients WHERE name = 'Ice'),
    2,
    'cups',
    NULL
);

-- Ingredients for: Mint Julep
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mint-julep'),
    (SELECT id FROM ingredients WHERE name = 'Bourbon'),
    75,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mint-julep'),
    (SELECT id FROM ingredients WHERE name = 'Fresh mint'),
    8,
    'leaves',
    'plus sprig'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mint-julep'),
    (SELECT id FROM ingredients WHERE name = 'Simple syrup'),
    15,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mint-julep'),
    (SELECT id FROM ingredients WHERE name = 'Crushed ice'),
    2,
    'cups',
    NULL
);

-- Ingredients for: Thai Iced Tea
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'thai-iced-tea'),
    (SELECT id FROM ingredients WHERE name = 'Thai tea mix'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'thai-iced-tea'),
    (SELECT id FROM ingredients WHERE name = 'Water'),
    500,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'thai-iced-tea'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    80,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'thai-iced-tea'),
    (SELECT id FROM ingredients WHERE name = 'Evaporated milk'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'thai-iced-tea'),
    (SELECT id FROM ingredients WHERE name = 'Ice'),
    2,
    'cups',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'thai-iced-tea'),
    (SELECT id FROM ingredients WHERE name = 'Star anise'),
    1,
    'whole',
    'optional'
);

-- Ingredients for: Moscow Mule
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moscow-mule'),
    (SELECT id FROM ingredients WHERE name = 'Vodka'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moscow-mule'),
    (SELECT id FROM ingredients WHERE name = 'Ginger beer'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moscow-mule'),
    (SELECT id FROM ingredients WHERE name = 'Lime juice'),
    15,
    'ml',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moscow-mule'),
    (SELECT id FROM ingredients WHERE name = 'Ice'),
    1,
    'cup',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moscow-mule'),
    (SELECT id FROM ingredients WHERE name = 'Lime wheel'),
    1,
    'whole',
    'for garnish'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moscow-mule'),
    (SELECT id FROM ingredients WHERE name = 'Fresh mint'),
    2,
    'sprigs',
    'optional'
);

-- Ingredients for: Hot Toddy
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-toddy'),
    (SELECT id FROM ingredients WHERE name = 'Whiskey'),
    45,
    'ml',
    'bourbon or rye'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-toddy'),
    (SELECT id FROM ingredients WHERE name = 'Hot water'),
    180,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-toddy'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-toddy'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    15,
    'ml',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-toddy'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon stick'),
    1,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-toddy'),
    (SELECT id FROM ingredients WHERE name = 'Whole cloves'),
    3,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-toddy'),
    (SELECT id FROM ingredients WHERE name = 'Lemon wheel'),
    1,
    'whole',
    'for garnish'
);

-- Ingredients for: Spinach Artichoke Dip
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spinach-artichoke-dip'),
    (SELECT id FROM ingredients WHERE name = 'Frozen spinach'),
    300,
    'g',
    'thawed, drained'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spinach-artichoke-dip'),
    (SELECT id FROM ingredients WHERE name = 'Artichoke hearts'),
    400,
    'g',
    'canned, chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spinach-artichoke-dip'),
    (SELECT id FROM ingredients WHERE name = 'Cream cheese'),
    225,
    'g',
    'softened'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spinach-artichoke-dip'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    120,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spinach-artichoke-dip'),
    (SELECT id FROM ingredients WHERE name = 'Mayonnaise'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spinach-artichoke-dip'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan'),
    80,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spinach-artichoke-dip'),
    (SELECT id FROM ingredients WHERE name = 'Mozzarella'),
    100,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spinach-artichoke-dip'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);

-- Ingredients for: Bruschetta
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta'),
    (SELECT id FROM ingredients WHERE name = 'Roma tomatoes'),
    500,
    'g',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta'),
    (SELECT id FROM ingredients WHERE name = 'Fresh basil'),
    0.5,
    'cup',
    'chiffonade'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta'),
    (SELECT id FROM ingredients WHERE name = 'Baguette'),
    1,
    'whole',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta'),
    (SELECT id FROM ingredients WHERE name = 'Balsamic vinegar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: Deviled Eggs
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'deviled-eggs'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    12,
    'whole',
    'hard-boiled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'deviled-eggs'),
    (SELECT id FROM ingredients WHERE name = 'Mayonnaise'),
    80,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'deviled-eggs'),
    (SELECT id FROM ingredients WHERE name = 'Dijon mustard'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'deviled-eggs'),
    (SELECT id FROM ingredients WHERE name = 'White wine vinegar'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'deviled-eggs'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    0.5,
    'tsp',
    'for garnish'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'deviled-eggs'),
    (SELECT id FROM ingredients WHERE name = 'Fresh chives'),
    2,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'deviled-eggs'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'deviled-eggs'),
    (SELECT id FROM ingredients WHERE name = 'White pepper'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: Stuffed Mushrooms
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-mushrooms'),
    (SELECT id FROM ingredients WHERE name = 'Cremini mushrooms'),
    450,
    'g',
    'large'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-mushrooms'),
    (SELECT id FROM ingredients WHERE name = 'Cream cheese'),
    115,
    'g',
    'softened'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-mushrooms'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan'),
    60,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-mushrooms'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-mushrooms'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    3,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-mushrooms'),
    (SELECT id FROM ingredients WHERE name = 'Fresh thyme'),
    1,
    'tsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-mushrooms'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-mushrooms'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Nachos Supreme
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nachos-supreme'),
    (SELECT id FROM ingredients WHERE name = 'Tortilla chips'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nachos-supreme'),
    (SELECT id FROM ingredients WHERE name = 'Shredded cheese'),
    300,
    'g',
    'Mexican blend'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nachos-supreme'),
    (SELECT id FROM ingredients WHERE name = 'Refried beans'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nachos-supreme'),
    (SELECT id FROM ingredients WHERE name = 'Ground beef'),
    200,
    'g',
    'seasoned, optional'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nachos-supreme'),
    (SELECT id FROM ingredients WHERE name = 'Pico de gallo'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nachos-supreme'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nachos-supreme'),
    (SELECT id FROM ingredients WHERE name = 'Guacamole'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nachos-supreme'),
    (SELECT id FROM ingredients WHERE name = 'Pickled jalapeños'),
    60,
    'g',
    'sliced'
);

-- Ingredients for: Pork Chops with Apple
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pork-chops-with-apple'),
    (SELECT id FROM ingredients WHERE name = 'Bone-in pork chops'),
    4,
    'whole',
    'thick-cut'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pork-chops-with-apple'),
    (SELECT id FROM ingredients WHERE name = 'Apples'),
    2,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pork-chops-with-apple'),
    (SELECT id FROM ingredients WHERE name = 'Apple cider'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pork-chops-with-apple'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    45,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pork-chops-with-apple'),
    (SELECT id FROM ingredients WHERE name = 'Fresh sage'),
    6,
    'leaves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pork-chops-with-apple'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pork-chops-with-apple'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Lamb Chops
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-chops'),
    (SELECT id FROM ingredients WHERE name = 'Lamb chops'),
    8,
    'whole',
    'French-trimmed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-chops'),
    (SELECT id FROM ingredients WHERE name = 'Fresh rosemary'),
    2,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-chops'),
    (SELECT id FROM ingredients WHERE name = 'Fresh thyme'),
    1,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-chops'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-chops'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-chops'),
    (SELECT id FROM ingredients WHERE name = 'Dijon mustard'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-chops'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-chops'),
    (SELECT id FROM ingredients WHERE name = 'Black pepper'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Chicken Adobo
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-adobo'),
    (SELECT id FROM ingredients WHERE name = 'Chicken pieces'),
    1200,
    'g',
    'thighs and drumsticks'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-adobo'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-adobo'),
    (SELECT id FROM ingredients WHERE name = 'White vinegar'),
    80,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-adobo'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    8,
    'cloves',
    'crushed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-adobo'),
    (SELECT id FROM ingredients WHERE name = 'Bay leaves'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-adobo'),
    (SELECT id FROM ingredients WHERE name = 'Black peppercorns'),
    1,
    'tsp',
    'whole'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-adobo'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-adobo'),
    (SELECT id FROM ingredients WHERE name = 'Water'),
    120,
    'ml',
    NULL
);

-- Ingredients for: Spaghetti Aglio e Olio
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spaghetti-aglio-e-olio'),
    (SELECT id FROM ingredients WHERE name = 'Spaghetti'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spaghetti-aglio-e-olio'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    8,
    'cloves',
    'thinly sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spaghetti-aglio-e-olio'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    120,
    'ml',
    'extra virgin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spaghetti-aglio-e-olio'),
    (SELECT id FROM ingredients WHERE name = 'Red chili flakes'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spaghetti-aglio-e-olio'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    0.25,
    'cup',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spaghetti-aglio-e-olio'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan'),
    60,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spaghetti-aglio-e-olio'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Beef Tacos
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Ground beef'),
    500,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Taco shells'),
    12,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Taco seasoning'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Shredded lettuce'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Shredded cheese'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Tomatoes'),
    2,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-tacos'),
    (SELECT id FROM ingredients WHERE name = 'Water'),
    120,
    'ml',
    NULL
);

-- Ingredients for: Omelette
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'omelette'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    3,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'omelette'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    15,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'omelette'),
    (SELECT id FROM ingredients WHERE name = 'Gruyère cheese'),
    30,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'omelette'),
    (SELECT id FROM ingredients WHERE name = 'Fresh chives'),
    1,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'omelette'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.25,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'omelette'),
    (SELECT id FROM ingredients WHERE name = 'White pepper'),
    1,
    'pinch',
    NULL
);

-- Ingredients for: Baked Ziti
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baked-ziti'),
    (SELECT id FROM ingredients WHERE name = 'Ziti pasta'),
    450,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baked-ziti'),
    (SELECT id FROM ingredients WHERE name = 'Ground beef'),
    450,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baked-ziti'),
    (SELECT id FROM ingredients WHERE name = 'Ricotta cheese'),
    425,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baked-ziti'),
    (SELECT id FROM ingredients WHERE name = 'Mozzarella'),
    300,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baked-ziti'),
    (SELECT id FROM ingredients WHERE name = 'Marinara sauce'),
    700,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baked-ziti'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan'),
    60,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baked-ziti'),
    (SELECT id FROM ingredients WHERE name = 'Egg'),
    1,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baked-ziti'),
    (SELECT id FROM ingredients WHERE name = 'Italian seasoning'),
    1,
    'tbsp',
    NULL
);

-- Ingredients for: Chicken Fajitas
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    500,
    'g',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM ingredients WHERE name = 'Bell peppers'),
    3,
    'medium',
    'mixed colors, sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'large',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM ingredients WHERE name = 'Flour tortillas'),
    8,
    'large',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM ingredients WHERE name = 'Lime juice'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM ingredients WHERE name = 'Chili powder'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM ingredients WHERE name = 'Salsa'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    100,
    'g',
    NULL
);

-- Ingredients for: Sloppy Joes
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sloppy-joes'),
    (SELECT id FROM ingredients WHERE name = 'Ground beef'),
    500,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sloppy-joes'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sloppy-joes'),
    (SELECT id FROM ingredients WHERE name = 'Bell pepper'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sloppy-joes'),
    (SELECT id FROM ingredients WHERE name = 'Tomato sauce'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sloppy-joes'),
    (SELECT id FROM ingredients WHERE name = 'Ketchup'),
    80,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sloppy-joes'),
    (SELECT id FROM ingredients WHERE name = 'Worcestershire sauce'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sloppy-joes'),
    (SELECT id FROM ingredients WHERE name = 'Brown sugar'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sloppy-joes'),
    (SELECT id FROM ingredients WHERE name = 'Mustard'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sloppy-joes'),
    (SELECT id FROM ingredients WHERE name = 'Hamburger buns'),
    6,
    'whole',
    NULL
);

-- Ingredients for: Chicken Piccata
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-piccata'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    600,
    'g',
    'pounded thin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-piccata'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-piccata'),
    (SELECT id FROM ingredients WHERE name = 'White wine'),
    120,
    'ml',
    'dry'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-piccata'),
    (SELECT id FROM ingredients WHERE name = 'Chicken stock'),
    120,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-piccata'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    60,
    'ml',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-piccata'),
    (SELECT id FROM ingredients WHERE name = 'Capers'),
    3,
    'tbsp',
    'drained'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-piccata'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-piccata'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-piccata'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    2,
    'tbsp',
    'chopped'
);

-- Ingredients for: Pulled Pork Sliders
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pulled-pork-sliders'),
    (SELECT id FROM ingredients WHERE name = 'Pork shoulder'),
    1500,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pulled-pork-sliders'),
    (SELECT id FROM ingredients WHERE name = 'Slider buns'),
    12,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pulled-pork-sliders'),
    (SELECT id FROM ingredients WHERE name = 'BBQ sauce'),
    250,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pulled-pork-sliders'),
    (SELECT id FROM ingredients WHERE name = 'Brown sugar'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pulled-pork-sliders'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pulled-pork-sliders'),
    (SELECT id FROM ingredients WHERE name = 'Garlic powder'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pulled-pork-sliders'),
    (SELECT id FROM ingredients WHERE name = 'Onion powder'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pulled-pork-sliders'),
    (SELECT id FROM ingredients WHERE name = 'Apple cider vinegar'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pulled-pork-sliders'),
    (SELECT id FROM ingredients WHERE name = 'Coleslaw'),
    200,
    'g',
    'optional'
);

-- Ingredients for: Shrimp Cocktail
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-cocktail'),
    (SELECT id FROM ingredients WHERE name = 'Large shrimp'),
    500,
    'g',
    'shell-on'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-cocktail'),
    (SELECT id FROM ingredients WHERE name = 'Ketchup'),
    120,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-cocktail'),
    (SELECT id FROM ingredients WHERE name = 'Horseradish'),
    2,
    'tbsp',
    'prepared'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-cocktail'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-cocktail'),
    (SELECT id FROM ingredients WHERE name = 'Worcestershire'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-cocktail'),
    (SELECT id FROM ingredients WHERE name = 'Hot sauce'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-cocktail'),
    (SELECT id FROM ingredients WHERE name = 'Bay leaves'),
    2,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-cocktail'),
    (SELECT id FROM ingredients WHERE name = 'Lemon'),
    1,
    'whole',
    'sliced'
);

-- Ingredients for: Crème Brûlée
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crme-brle'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    480,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crme-brle'),
    (SELECT id FROM ingredients WHERE name = 'Egg yolks'),
    6,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crme-brle'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    100,
    'g',
    'plus more for topping'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crme-brle'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla bean'),
    1,
    'whole',
    'or 1 tsp extract'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crme-brle'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'pinch',
    NULL
);

-- Ingredients for: Lemon Bars
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-bars'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    300,
    'g',
    'divided'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-bars'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    170,
    'g',
    'cold, cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-bars'),
    (SELECT id FROM ingredients WHERE name = 'Powdered sugar'),
    180,
    'g',
    'plus more for dusting'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-bars'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-bars'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-bars'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    120,
    'ml',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-bars'),
    (SELECT id FROM ingredients WHERE name = 'Lemon zest'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-bars'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: Bread Pudding
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bread-pudding'),
    (SELECT id FROM ingredients WHERE name = 'French bread'),
    450,
    'g',
    'cubed, day-old'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bread-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bread-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Whole milk'),
    350,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bread-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    180,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bread-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bread-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bread-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bread-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Raisins'),
    100,
    'g',
    'optional'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bread-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    30,
    'g',
    'for greasing'
);

-- Ingredients for: Rice Pudding
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'rice-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Short-grain rice'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'rice-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Whole milk'),
    700,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'rice-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'rice-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'rice-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    30,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'rice-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon'),
    1,
    'tsp',
    'for topping'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'rice-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Raisins'),
    60,
    'g',
    'optional'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'rice-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: Carrot Cake
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    400,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    300,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    240,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM ingredients WHERE name = 'Cream cheese'),
    450,
    'g',
    'for frosting'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    115,
    'g',
    'for frosting'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM ingredients WHERE name = 'Powdered sugar'),
    300,
    'g',
    'for frosting'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM ingredients WHERE name = 'Walnuts'),
    100,
    'g',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM ingredients WHERE name = 'Cinnamon'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM ingredients WHERE name = 'Baking soda'),
    2,
    'tsp',
    NULL
);

-- Ingredients for: Cheesecake
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Cream cheese'),
    900,
    'g',
    'room temperature'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Sour cream'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Graham crackers'),
    200,
    'g',
    'crushed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    100,
    'g',
    'melted'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cheesecake'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: Pecan Pie
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pecan-pie'),
    (SELECT id FROM ingredients WHERE name = 'Pie crust'),
    1,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pecan-pie'),
    (SELECT id FROM ingredients WHERE name = 'Pecans'),
    300,
    'g',
    'halves and pieces'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pecan-pie'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    3,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pecan-pie'),
    (SELECT id FROM ingredients WHERE name = 'Corn syrup'),
    240,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pecan-pie'),
    (SELECT id FROM ingredients WHERE name = 'Brown sugar'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pecan-pie'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    'melted'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pecan-pie'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pecan-pie'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: Banoffee Pie
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banoffee-pie'),
    (SELECT id FROM ingredients WHERE name = 'Digestive biscuits'),
    250,
    'g',
    'crushed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banoffee-pie'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    115,
    'g',
    'melted'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banoffee-pie'),
    (SELECT id FROM ingredients WHERE name = 'Condensed milk'),
    400,
    'g',
    '1 can'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banoffee-pie'),
    (SELECT id FROM ingredients WHERE name = 'Bananas'),
    3,
    'whole',
    'ripe, sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banoffee-pie'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    300,
    'ml',
    'whipped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banoffee-pie'),
    (SELECT id FROM ingredients WHERE name = 'Dark chocolate'),
    30,
    'g',
    'shaved'
);

-- Ingredients for: Affogato
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'affogato'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla gelato'),
    150,
    'g',
    '2 scoops'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'affogato'),
    (SELECT id FROM ingredients WHERE name = 'Espresso'),
    60,
    'ml',
    '1 double shot'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'affogato'),
    (SELECT id FROM ingredients WHERE name = 'Amaretto'),
    15,
    'ml',
    'optional'
);

-- Ingredients for: Hummus with Pita
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus-with-pita'),
    (SELECT id FROM ingredients WHERE name = 'Chickpeas'),
    400,
    'g',
    'canned, drained'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus-with-pita'),
    (SELECT id FROM ingredients WHERE name = 'Tahini'),
    80,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus-with-pita'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    60,
    'ml',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus-with-pita'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    2,
    'cloves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus-with-pita'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus-with-pita'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus-with-pita'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    0.5,
    'tsp',
    'for garnish'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus-with-pita'),
    (SELECT id FROM ingredients WHERE name = 'Pita bread'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus-with-pita'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Baba Ganoush
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baba-ganoush'),
    (SELECT id FROM ingredients WHERE name = 'Eggplant'),
    2,
    'large',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baba-ganoush'),
    (SELECT id FROM ingredients WHERE name = 'Tahini'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baba-ganoush'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    45,
    'ml',
    'fresh'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baba-ganoush'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    2,
    'cloves',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baba-ganoush'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baba-ganoush'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baba-ganoush'),
    (SELECT id FROM ingredients WHERE name = 'Smoked paprika'),
    0.25,
    'tsp',
    'for garnish'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baba-ganoush'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    2,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baba-ganoush'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);

-- Ingredients for: Tzatziki
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tzatziki'),
    (SELECT id FROM ingredients WHERE name = 'Greek yogurt'),
    450,
    'g',
    'full-fat'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tzatziki'),
    (SELECT id FROM ingredients WHERE name = 'Cucumber'),
    1,
    'medium',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tzatziki'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tzatziki'),
    (SELECT id FROM ingredients WHERE name = 'Fresh dill'),
    3,
    'tbsp',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tzatziki'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tzatziki'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tzatziki'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tzatziki'),
    (SELECT id FROM ingredients WHERE name = 'White pepper'),
    0.25,
    'tsp',
    NULL
);

-- Ingredients for: Vietnamese Coffee
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vietnamese-coffee'),
    (SELECT id FROM ingredients WHERE name = 'Vietnamese coffee'),
    20,
    'g',
    'coarse ground'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vietnamese-coffee'),
    (SELECT id FROM ingredients WHERE name = 'Condensed milk'),
    45,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vietnamese-coffee'),
    (SELECT id FROM ingredients WHERE name = 'Hot water'),
    100,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vietnamese-coffee'),
    (SELECT id FROM ingredients WHERE name = 'Ice'),
    1,
    'cup',
    'for iced version'
);

-- Ingredients for: Protein Shake
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'protein-shake'),
    (SELECT id FROM ingredients WHERE name = 'Protein powder'),
    30,
    'g',
    'vanilla or chocolate'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'protein-shake'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    300,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'protein-shake'),
    (SELECT id FROM ingredients WHERE name = 'Banana'),
    1,
    'whole',
    'frozen works best'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'protein-shake'),
    (SELECT id FROM ingredients WHERE name = 'Peanut butter'),
    2,
    'tbsp',
    'optional'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'protein-shake'),
    (SELECT id FROM ingredients WHERE name = 'Ice'),
    0.5,
    'cup',
    'optional'
);

-- Ingredients for: Chia Pudding
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chia-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Chia seeds'),
    45,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chia-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Milk'),
    250,
    'ml',
    'or plant-based'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chia-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Maple syrup'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chia-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chia-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Fresh berries'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chia-pudding'),
    (SELECT id FROM ingredients WHERE name = 'Granola'),
    30,
    'g',
    'optional'
);

-- Ingredients for: Acai Bowl
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'acai-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Frozen acai'),
    200,
    'g',
    'packs'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'acai-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Banana'),
    1,
    'whole',
    'frozen'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'acai-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Almond milk'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'acai-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Granola'),
    45,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'acai-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Fresh berries'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'acai-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Coconut flakes'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'acai-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Honey'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'acai-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Chia seeds'),
    1,
    'tbsp',
    NULL
);

-- Ingredients for: Salmon Teriyaki
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'salmon-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Salmon fillets'),
    600,
    'g',
    '4 pieces'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'salmon-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    80,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'salmon-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Mirin'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'salmon-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Sake'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'salmon-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'salmon-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    1,
    'tbsp',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'salmon-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Sesame seeds'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'salmon-teriyaki'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    2,
    'stalks',
    'sliced'
);

-- Ingredients for: Mushroom Risotto
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mushroom-risotto'),
    (SELECT id FROM ingredients WHERE name = 'Arborio rice'),
    350,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mushroom-risotto'),
    (SELECT id FROM ingredients WHERE name = 'Mixed mushrooms'),
    400,
    'g',
    'cremini, shiitake'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mushroom-risotto'),
    (SELECT id FROM ingredients WHERE name = 'Dried porcini'),
    30,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mushroom-risotto'),
    (SELECT id FROM ingredients WHERE name = 'Chicken stock'),
    1200,
    'ml',
    'warm'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mushroom-risotto'),
    (SELECT id FROM ingredients WHERE name = 'White wine'),
    120,
    'ml',
    'dry'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mushroom-risotto'),
    (SELECT id FROM ingredients WHERE name = 'Parmesan'),
    100,
    'g',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mushroom-risotto'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mushroom-risotto'),
    (SELECT id FROM ingredients WHERE name = 'Shallot'),
    2,
    'medium',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mushroom-risotto'),
    (SELECT id FROM ingredients WHERE name = 'Fresh thyme'),
    2,
    'tsp',
    'chopped'
);

-- Ingredients for: Beef Stir Fry
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stir-fry'),
    (SELECT id FROM ingredients WHERE name = 'Beef sirloin'),
    400,
    'g',
    'thinly sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stir-fry'),
    (SELECT id FROM ingredients WHERE name = 'Broccoli'),
    200,
    'g',
    'florets'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stir-fry'),
    (SELECT id FROM ingredients WHERE name = 'Bell peppers'),
    2,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stir-fry'),
    (SELECT id FROM ingredients WHERE name = 'Oyster sauce'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stir-fry'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stir-fry'),
    (SELECT id FROM ingredients WHERE name = 'Cornstarch'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stir-fry'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stir-fry'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    1,
    'tbsp',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stir-fry'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    3,
    'tbsp',
    NULL
);

-- Ingredients for: Chicken Curry
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-curry'),
    (SELECT id FROM ingredients WHERE name = 'Chicken thighs'),
    600,
    'g',
    'boneless, cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-curry'),
    (SELECT id FROM ingredients WHERE name = 'Coconut milk'),
    400,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-curry'),
    (SELECT id FROM ingredients WHERE name = 'Diced tomatoes'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-curry'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'large',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-curry'),
    (SELECT id FROM ingredients WHERE name = 'Curry powder'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-curry'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-curry'),
    (SELECT id FROM ingredients WHERE name = 'Ginger'),
    1,
    'tbsp',
    'grated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-curry'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    0.25,
    'cup',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-curry'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    2,
    'tbsp',
    NULL
);

-- Ingredients for: Vegetable Lo Mein
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-lo-mein'),
    (SELECT id FROM ingredients WHERE name = 'Lo mein noodles'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-lo-mein'),
    (SELECT id FROM ingredients WHERE name = 'Mixed vegetables'),
    400,
    'g',
    'cabbage, carrots, bok choy'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-lo-mein'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    4,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-lo-mein'),
    (SELECT id FROM ingredients WHERE name = 'Oyster sauce'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-lo-mein'),
    (SELECT id FROM ingredients WHERE name = 'Sesame oil'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-lo-mein'),
    (SELECT id FROM ingredients WHERE name = 'Bean sprouts'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-lo-mein'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    3,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-lo-mein'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    4,
    'stalks',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-lo-mein'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    3,
    'tbsp',
    NULL
);

-- Ingredients for: Shakshuka with Feta
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    6,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM ingredients WHERE name = 'Crushed tomatoes'),
    800,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM ingredients WHERE name = 'Red bell pepper'),
    2,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM ingredients WHERE name = 'Onion'),
    1,
    'medium',
    'diced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM ingredients WHERE name = 'Feta cheese'),
    100,
    'g',
    'crumbled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM ingredients WHERE name = 'Cumin'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM ingredients WHERE name = 'Paprika'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM ingredients WHERE name = 'Fresh parsley'),
    0.25,
    'cup',
    'chopped'
);

-- Ingredients for: Crispy Tofu Bowl
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Extra-firm tofu'),
    400,
    'g',
    'pressed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Brown rice'),
    300,
    'g',
    'cooked'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Edamame'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Cucumber'),
    1,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    2,
    'medium',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Peanut butter'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Cornstarch'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Lime juice'),
    2,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM ingredients WHERE name = 'Sriracha'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: BBQ Chicken Pizza
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-chicken-pizza'),
    (SELECT id FROM ingredients WHERE name = 'Pizza dough'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-chicken-pizza'),
    (SELECT id FROM ingredients WHERE name = 'BBQ sauce'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-chicken-pizza'),
    (SELECT id FROM ingredients WHERE name = 'Mozzarella'),
    250,
    'g',
    'shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-chicken-pizza'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    300,
    'g',
    'cooked, shredded'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-chicken-pizza'),
    (SELECT id FROM ingredients WHERE name = 'Red onion'),
    1,
    'small',
    'thinly sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-chicken-pizza'),
    (SELECT id FROM ingredients WHERE name = 'Fresh cilantro'),
    0.25,
    'cup',
    'chopped'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-chicken-pizza'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    1,
    'tbsp',
    NULL
);

-- Ingredients for: Shrimp Fried Rice
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Cooked rice'),
    600,
    'g',
    'cold, day-old'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Shrimp'),
    300,
    'g',
    'peeled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    3,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Green peas'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Carrots'),
    1,
    'medium',
    'diced small'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Soy sauce'),
    3,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Sesame oil'),
    1,
    'tbsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    4,
    'stalks',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-fried-rice'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    3,
    'tbsp',
    NULL
);

-- Ingredients for: Fish and Chips
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-and-chips'),
    (SELECT id FROM ingredients WHERE name = 'Cod fillets'),
    600,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-and-chips'),
    (SELECT id FROM ingredients WHERE name = 'Potatoes'),
    800,
    'g',
    'russet'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-and-chips'),
    (SELECT id FROM ingredients WHERE name = 'All-purpose flour'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-and-chips'),
    (SELECT id FROM ingredients WHERE name = 'Beer'),
    250,
    'ml',
    'lager'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-and-chips'),
    (SELECT id FROM ingredients WHERE name = 'Baking powder'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-and-chips'),
    (SELECT id FROM ingredients WHERE name = 'Vegetable oil'),
    1,
    'L',
    'for frying'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-and-chips'),
    (SELECT id FROM ingredients WHERE name = 'Malt vinegar'),
    60,
    'ml',
    'for serving'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-and-chips'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Chicken Souvlaki
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM ingredients WHERE name = 'Chicken breast'),
    600,
    'g',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM ingredients WHERE name = 'Pita bread'),
    4,
    'whole',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM ingredients WHERE name = 'Greek yogurt'),
    200,
    'g',
    'for tzatziki'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM ingredients WHERE name = 'Cucumber'),
    1,
    'medium',
    'for tzatziki'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM ingredients WHERE name = 'Lemon juice'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    60,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM ingredients WHERE name = 'Dried oregano'),
    2,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'minced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM ingredients WHERE name = 'Tomatoes'),
    2,
    'medium',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM ingredients WHERE name = 'Red onion'),
    0.5,
    'medium',
    'sliced'
);

-- Ingredients for: Pasta alla Norma
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-alla-norma'),
    (SELECT id FROM ingredients WHERE name = 'Rigatoni'),
    400,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-alla-norma'),
    (SELECT id FROM ingredients WHERE name = 'Eggplant'),
    500,
    'g',
    'cubed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-alla-norma'),
    (SELECT id FROM ingredients WHERE name = 'San Marzano tomatoes'),
    800,
    'g',
    'crushed'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-alla-norma'),
    (SELECT id FROM ingredients WHERE name = 'Ricotta salata'),
    100,
    'g',
    'shaved'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-alla-norma'),
    (SELECT id FROM ingredients WHERE name = 'Fresh basil'),
    0.5,
    'cup',
    'torn'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-alla-norma'),
    (SELECT id FROM ingredients WHERE name = 'Garlic'),
    4,
    'cloves',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-alla-norma'),
    (SELECT id FROM ingredients WHERE name = 'Olive oil'),
    80,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-alla-norma'),
    (SELECT id FROM ingredients WHERE name = 'Red chili flakes'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-alla-norma'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'tsp',
    NULL
);

-- Ingredients for: Banh Xeo
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-xeo'),
    (SELECT id FROM ingredients WHERE name = 'Rice flour'),
    200,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-xeo'),
    (SELECT id FROM ingredients WHERE name = 'Coconut milk'),
    200,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-xeo'),
    (SELECT id FROM ingredients WHERE name = 'Shrimp'),
    200,
    'g',
    'peeled'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-xeo'),
    (SELECT id FROM ingredients WHERE name = 'Pork belly'),
    150,
    'g',
    'sliced thin'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-xeo'),
    (SELECT id FROM ingredients WHERE name = 'Bean sprouts'),
    150,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-xeo'),
    (SELECT id FROM ingredients WHERE name = 'Turmeric'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-xeo'),
    (SELECT id FROM ingredients WHERE name = 'Green onions'),
    4,
    'stalks',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-xeo'),
    (SELECT id FROM ingredients WHERE name = 'Lettuce'),
    1,
    'head',
    'for wrapping'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-xeo'),
    (SELECT id FROM ingredients WHERE name = 'Nuoc cham'),
    100,
    'ml',
    'dipping sauce'
);

-- Ingredients for: Mango Sticky Rice
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-sticky-rice'),
    (SELECT id FROM ingredients WHERE name = 'Sticky rice'),
    300,
    'g',
    'glutinous'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-sticky-rice'),
    (SELECT id FROM ingredients WHERE name = 'Coconut milk'),
    400,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-sticky-rice'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    100,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-sticky-rice'),
    (SELECT id FROM ingredients WHERE name = 'Ripe mangoes'),
    2,
    'whole',
    'sliced'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-sticky-rice'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    0.5,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-sticky-rice'),
    (SELECT id FROM ingredients WHERE name = 'Sesame seeds'),
    1,
    'tbsp',
    'toasted, optional'
);

-- Ingredients for: Chocolate Mousse
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-mousse'),
    (SELECT id FROM ingredients WHERE name = 'Dark chocolate'),
    200,
    'g',
    '70% cocoa'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-mousse'),
    (SELECT id FROM ingredients WHERE name = 'Eggs'),
    4,
    'whole',
    'separated'
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-mousse'),
    (SELECT id FROM ingredients WHERE name = 'Heavy cream'),
    200,
    'ml',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-mousse'),
    (SELECT id FROM ingredients WHERE name = 'Sugar'),
    60,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-mousse'),
    (SELECT id FROM ingredients WHERE name = 'Butter'),
    30,
    'g',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-mousse'),
    (SELECT id FROM ingredients WHERE name = 'Vanilla extract'),
    1,
    'tsp',
    NULL
);
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-mousse'),
    (SELECT id FROM ingredients WHERE name = 'Salt'),
    1,
    'pinch',
    NULL
);

-- Link tags to recipes
-- Using tags owned by library user (id=3)
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-spaghetti-carbonara'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-spaghetti-carbonara'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pasta')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-spaghetti-carbonara'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-spaghetti-carbonara'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'margherita-pizza'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'margherita-pizza'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pizza')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'margherita-pizza'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'margherita-pizza'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-parmesan'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-parmesan'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-parmesan'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'risotto-alla-milanese'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'risotto-alla-milanese'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Risotto')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'risotto-alla-milanese'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'risotto-alla-milanese'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pasta')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lasagna-bolognese'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Salad')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'penne-arrabbiata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'penne-arrabbiata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pasta')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'penne-arrabbiata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spicy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'penne-arrabbiata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'penne-arrabbiata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'osso-buco'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'osso-buco'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'osso-buco'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Special Occasion')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tiramisu'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tiramisu'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tiramisu'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Coffee')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta-al-pomodoro'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta-al-pomodoro'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta-al-pomodoro'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta-al-pomodoro'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chinese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spicy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kung-pao-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-and-broccoli'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chinese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-and-broccoli'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Beef')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-and-broccoli'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-and-broccoli'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chinese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pork')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sweet-and-sour-pork'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fried-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chinese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fried-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Rice')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fried-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fried-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chinese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spicy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Tofu')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mapo-tofu'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-teriyaki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Japanese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-teriyaki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-teriyaki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-teriyaki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Japanese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Ramen')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tonkotsu-ramen'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Japanese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sushi')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sushi-roll-california-roll'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'miso-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Japanese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'miso-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Soup')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'miso-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'miso-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'miso-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyoza-japanese-dumplings'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Japanese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyoza-japanese-dumplings'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyoza-japanese-dumplings'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pork')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyoza-japanese-dumplings'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Tacos')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pork')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tacos-al-pastor'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-enchiladas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-enchiladas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-enchiladas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-enchiladas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dip')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carnitas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carnitas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pork')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carnitas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carnitas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Slow Cooked')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadillas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadillas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadillas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Lunch')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadillas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Burger')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-cheeseburger'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'BBQ')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pork')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-pulled-pork-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'buffalo-chicken-wings'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'buffalo-chicken-wings'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'buffalo-chicken-wings'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'buffalo-chicken-wings'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spicy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'new-york-style-cheesecake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'new-york-style-cheesecake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'new-york-style-cheesecake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cheesecake')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mac-and-cheese'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mac-and-cheese'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pasta')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mac-and-cheese'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mac-and-cheese'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Thai')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Noodles')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pad-thai'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Thai')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Curry')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-curry-with-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spicy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Thai')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Soup')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spicy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tom-yum-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Indian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Curry')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butter-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Indian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Curry')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-tikka-masala'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Indian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'palak-paneer'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'samosas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Indian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'samosas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'samosas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'samosas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Snack')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Greek')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Salad')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'greek-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mediterranean')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dip')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mediterranean')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'falafel'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-pancakes'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-pancakes'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-pancakes'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-benedict'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-benedict'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-benedict'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Eggs')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-benedict'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Brunch')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'avocado-toast'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'avocado-toast'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'avocado-toast'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'avocado-toast'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-toast'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-toast'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Brunch')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-toast'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'overnight-oats'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'overnight-oats'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'overnight-oats'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'overnight-oats'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-margarita'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cocktail')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-margarita'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'classic-margarita'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-lassi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Indian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-lassi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Smoothie')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-lassi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-lassi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-matcha-latte'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Japanese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-matcha-latte'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Tea')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-matcha-latte'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-matcha-latte'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'berry-smoothie-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'berry-smoothie-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Smoothie')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'berry-smoothie-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'berry-smoothie-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mojito'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cocktail')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mojito'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cuban')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mojito'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-chocolate'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-chocolate'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-chocolate'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-detox-smoothie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Smoothie')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-detox-smoothie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-detox-smoothie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'green-detox-smoothie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-chip-cookies'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-chip-cookies'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cookies')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-chip-cookies'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-chip-cookies'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'brownies'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'brownies'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chocolate')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'brownies'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'brownies'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banana-bread'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banana-bread'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Snack')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banana-bread'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banana-bread'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Baking')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'apple-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'apple-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pie')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'apple-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'apple-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'energy-balls'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Snack')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'energy-balls'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'energy-balls'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'No-Bake')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'energy-balls'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'French')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'coq-au-vin'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-onion-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'French')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-onion-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Soup')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-onion-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'french-onion-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'French')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Beef')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-bourguignon'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crpes'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'French')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crpes'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crpes'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crpes'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'French')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'ratatouille'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Korean')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Rice Bowl')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bibimbap'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Korean')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'korean-fried-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spicy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Korean')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Noodles')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'japchae'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kimchi-jjigae'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Korean')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kimchi-jjigae'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Soup')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kimchi-jjigae'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spicy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'kimchi-jjigae'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Korean')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Beef')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Grill')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bulgogi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vietnamese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Soup')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Beef')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pho-bo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vietnamese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sandwich')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Lunch')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-mi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pork')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vietnamese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fresh-spring-rolls'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vietnamese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pork')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Noodles')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bun-cha'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spanish')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Rice')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'paella-valenciana'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spanish')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Soup')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gazpacho'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cold')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'patatas-bravas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spanish')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'patatas-bravas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'patatas-bravas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'patatas-bravas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Tapas')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spanish-tortilla'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spanish')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spanish-tortilla'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Eggs')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spanish-tortilla'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spanish-tortilla'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Tapas')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Middle Eastern')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Wrap')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shawarma'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Middle Eastern')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Salad')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tabbouleh'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Middle Eastern')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Lamb')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Grill')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-kofta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Middle Eastern')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Eggs')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-caramel-latte'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Coffee')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-caramel-latte'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-caramel-latte'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cold')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'iced-caramel-latte'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tropical-smoothie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Smoothie')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tropical-smoothie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tropical-smoothie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tropical-smoothie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Tropical')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tropical-smoothie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chai-tea-latte'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Tea')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chai-tea-latte'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chai-tea-latte'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Hot')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chai-tea-latte'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spiced')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'strawberry-banana-smoothie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Smoothie')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'strawberry-banana-smoothie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'strawberry-banana-smoothie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'strawberry-banana-smoothie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pina-colada'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cocktail')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pina-colada'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pina-colada'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Tropical')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pina-colada'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Rum')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cold-brew-coffee'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Coffee')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cold-brew-coffee'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cold-brew-coffee'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cold')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cold-brew-coffee'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Caffeinated')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemonade'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemonade'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cold')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemonade'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Summer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemonade'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Refreshing')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'espresso-martini'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cocktail')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'espresso-martini'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Coffee')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'espresso-martini'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'golden-milk'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'golden-milk'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Hot')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'golden-milk'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'golden-milk'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Anti-inflammatory')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'watermelon-agua-fresca'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'watermelon-agua-fresca'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cold')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'watermelon-agua-fresca'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'watermelon-agua-fresca'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Refreshing')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'watermelon-agua-fresca'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-florentine'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-florentine'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Eggs')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-florentine'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Brunch')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggs-florentine'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'breakfast-burrito'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'breakfast-burrito'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'breakfast-burrito'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Eggs')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'granola'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'granola'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'granola'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Snack')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'granola'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'belgian-waffles'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'belgian-waffles'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Brunch')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'belgian-waffles'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'belgian-waffles'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Eggs')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-green'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'churros'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'churros'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spanish')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'churros'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'churros'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Fried')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mochi-ice-cream'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mochi-ice-cream'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Japanese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mochi-ice-cream'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Ice Cream')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mochi-ice-cream'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baklava'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baklava'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Middle Eastern')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baklava'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baklava'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Nuts')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'panna-cotta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'panna-cotta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'panna-cotta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'No-Bake')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'panna-cotta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Elegant')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole-2'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole-2'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole-2'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dip')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole-2'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'guacamole-2'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-skewers'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-skewers'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-skewers'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caprese-skewers'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caesar-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Salad')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caesar-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caesar-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'caesar-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Bowl')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quinoa-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'High Protein')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Salad')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'High Protein')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cobb-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Keto')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-chicken-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Salad')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-chicken-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-chicken-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-chicken-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'High Protein')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'French')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Salad')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nicoise-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Salad')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Asian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'asian-chicken-salad'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'blt-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sandwich')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'blt-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'blt-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'blt-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Lunch')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-cheese-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sandwich')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-cheese-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-cheese-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-cheese-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-cheese-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tuna-melt'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sandwich')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tuna-melt'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tuna-melt'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tuna-melt'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Lunch')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'club-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sandwich')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'club-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'club-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'club-sandwich'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Lunch')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadilla'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadilla'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadilla'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cheese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'quesadilla'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Asian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stir-fry-vegetables'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-wrap'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Wrap')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-wrap'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-wrap'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-wrap'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Lunch')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fettuccine-alfredo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fettuccine-alfredo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pasta')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fettuccine-alfredo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Creamy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fettuccine-alfredo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pasta')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-primavera'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-puttanesca'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-puttanesca'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pasta')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-puttanesca'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spicy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-puttanesca'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gnocchi-with-sage-butter'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gnocchi-with-sage-butter'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pasta')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gnocchi-with-sage-butter'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gnocchi-with-sage-butter'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-salmon'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-salmon'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-salmon'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Keto')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'grilled-salmon'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-scampi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-scampi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-scampi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pasta')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-scampi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Tacos')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-tacos'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'garlic-butter-shrimp'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'garlic-butter-shrimp'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'garlic-butter-shrimp'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Keto')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'garlic-butter-shrimp'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'British')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Beef')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shepherds-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-pot-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Beef')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'meatloaf'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Russian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Beef')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stroganoff'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Beef')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spicy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chili-con-carne'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-herb-roasted-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-herb-roasted-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Roasted')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-herb-roasted-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-herb-roasted-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'honey-garlic-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'honey-garlic-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Asian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'honey-garlic-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'honey-garlic-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-marsala'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Elegant')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chinese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'orange-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Soup')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-noodle-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Soup')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tomato-basil-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Soup')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'minestrone-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Soup')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Fall')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'butternut-squash-soup'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Indian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-curry'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Curry')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-bell-peppers'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggplant-parmesan'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggplant-parmesan'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggplant-parmesan'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'eggplant-parmesan'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'black-bean-tacos'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-fried-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chinese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-fried-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-fried-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Rice')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-fried-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Greek')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Lamb')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Wrap')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'gyros'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Greek')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Lamb')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Casserole')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moussaka'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Turkish')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Lamb')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Street Food')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'doner-kebab'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Caribbean')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spicy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'jerk-chicken'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Grill')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-schnitzel'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Austrian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-schnitzel'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-schnitzel'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Fried')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-schnitzel'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pierogi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Polish')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pierogi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dumplings')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pierogi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pierogi'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Thai')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Grilled')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-satay'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Indonesian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Beef')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Curry')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-rendang'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Spicy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'horchata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'horchata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'horchata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'horchata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cold')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'horchata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mint-julep'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cocktail')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mint-julep'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Bourbon')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mint-julep'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mint-julep'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'thai-iced-tea'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Thai')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'thai-iced-tea'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'thai-iced-tea'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Tea')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'thai-iced-tea'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'thai-iced-tea'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cold')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moscow-mule'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cocktail')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moscow-mule'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vodka')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'moscow-mule'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-toddy'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cocktail')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-toddy'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Whiskey')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-toddy'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-toddy'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Hot')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hot-toddy'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Winter')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spinach-artichoke-dip'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spinach-artichoke-dip'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dip')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spinach-artichoke-dip'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spinach-artichoke-dip'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Party')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bruschetta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Fresh')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'deviled-eggs'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'deviled-eggs'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Eggs')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'deviled-eggs'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'deviled-eggs'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Party')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-mushrooms'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-mushrooms'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-mushrooms'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Party')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'stuffed-mushrooms'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Baked')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nachos-supreme'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nachos-supreme'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nachos-supreme'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Party')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'nachos-supreme'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pork-chops-with-apple'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pork')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pork-chops-with-apple'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Fall')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pork-chops-with-apple'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pork-chops-with-apple'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-chops'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Lamb')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-chops'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Grill')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-chops'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Elegant')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lamb-chops'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-adobo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Filipino')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-adobo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-adobo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Braised')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-adobo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spaghetti-aglio-e-olio'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spaghetti-aglio-e-olio'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pasta')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spaghetti-aglio-e-olio'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'spaghetti-aglio-e-olio'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-tacos'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-tacos'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Beef')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-tacos'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-tacos'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'omelette'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'French')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'omelette'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Eggs')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'omelette'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'omelette'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baked-ziti'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baked-ziti'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pasta')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baked-ziti'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Baked')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baked-ziti'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mexican')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-fajitas'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dinner')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sloppy-joes'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sloppy-joes'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Beef')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sloppy-joes'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'sloppy-joes'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-piccata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-piccata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-piccata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-piccata'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Elegant')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pulled-pork-sliders'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pulled-pork-sliders'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pork')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pulled-pork-sliders'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'BBQ')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pulled-pork-sliders'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Party')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-cocktail'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Appetizer')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-cocktail'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-cocktail'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cold')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-cocktail'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crme-brle'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'French')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crme-brle'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crme-brle'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Elegant')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crme-brle'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Custard')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-bars'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-bars'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Lemon')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-bars'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Bars')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'lemon-bars'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Baked')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bread-pudding'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bread-pudding'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bread-pudding'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Baked')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bread-pudding'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'rice-pudding'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'rice-pudding'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'rice-pudding'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'rice-pudding'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cake')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Baked')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'carrot-cake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cheesecake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cheesecake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Cheesecake')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cheesecake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Elegant')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'cheesecake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pecan-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pecan-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pie')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pecan-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Southern')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pecan-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Thanksgiving')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banoffee-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'British')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banoffee-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banoffee-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'No-Bake')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banoffee-pie'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'affogato'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'affogato'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'affogato'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Coffee')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'affogato'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus-with-pita'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Middle Eastern')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus-with-pita'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dip')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus-with-pita'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'hummus-with-pita'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baba-ganoush'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Middle Eastern')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baba-ganoush'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dip')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baba-ganoush'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'baba-ganoush'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Smoky')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tzatziki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Greek')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tzatziki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sauce')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tzatziki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dip')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'tzatziki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vietnamese-coffee'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vietnamese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vietnamese-coffee'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Coffee')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vietnamese-coffee'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vietnamese-coffee'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'protein-shake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Drink')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'protein-shake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'protein-shake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'High Protein')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'protein-shake'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chia-pudding'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chia-pudding'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chia-pudding'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chia-pudding'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'No-Cook')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'acai-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'acai-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'acai-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'acai-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Superfood')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'salmon-teriyaki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Japanese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'salmon-teriyaki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'salmon-teriyaki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'salmon-teriyaki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mushroom-risotto'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mushroom-risotto'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Rice')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mushroom-risotto'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mushroom-risotto'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stir-fry'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chinese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stir-fry'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Beef')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stir-fry'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'beef-stir-fry'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Stir Fry')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-curry'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Indian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-curry'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-curry'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Curry')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-curry'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Comfort Food')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-lo-mein'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chinese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-lo-mein'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Noodles')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-lo-mein'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'vegetable-lo-mein'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Middle Eastern')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Eggs')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Breakfast')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shakshuka-with-feta'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegan')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Bowl')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Healthy')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'crispy-tofu-bowl'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'High Protein')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-chicken-pizza'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pizza')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-chicken-pizza'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-chicken-pizza'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'BBQ')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'bbq-chicken-pizza'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'American')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-fried-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chinese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-fried-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-fried-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Rice')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'shrimp-fried-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Quick')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-and-chips'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'British')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-and-chips'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-and-chips'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Fried')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'fish-and-chips'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Classic')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Greek')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chicken')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Grilled')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chicken-souvlaki'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mediterranean')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-alla-norma'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Italian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-alla-norma'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Pasta')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-alla-norma'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vegetarian')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'pasta-alla-norma'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sicilian')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-xeo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Vietnamese')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-xeo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Crepe')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-xeo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Seafood')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'banh-xeo'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Crispy')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-sticky-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Thai')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-sticky-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-sticky-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Sweet')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'mango-sticky-rice'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Mango')
) ON CONFLICT DO NOTHING;

INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-mousse'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'French')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-mousse'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Dessert')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-mousse'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Chocolate')
) ON CONFLICT DO NOTHING;
INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = 'chocolate-mousse'),
    (SELECT id FROM tags WHERE user_id = 3 AND name = 'Elegant')
) ON CONFLICT DO NOTHING;

COMMIT;

-- Verification queries:
-- SELECT COUNT(*) FROM recipes WHERE is_public = true;
-- SELECT COUNT(*) FROM tags WHERE user_id = 3;
-- SELECT COUNT(*) FROM recipe_ingredients;
-- SELECT COUNT(*) FROM recipe_tags;