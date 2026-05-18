#!/usr/bin/env python3
"""
Generate SQL INSERT statements from recipe data
Corrected for actual database schema
"""
import re

# Library user ID (already exists in database)
LIBRARY_USER_ID = 3

def escape_sql(s):
    """Escape single quotes for SQL"""
    if s is None:
        return 'NULL'
    return "'" + str(s).replace("'", "''") + "'"

def generate_slug(title):
    """Generate URL-friendly slug from title"""
    slug = title.lower()
    slug = re.sub(r'[^a-z0-9\s-]', '', slug)
    slug = re.sub(r'[\s_]+', '-', slug)
    slug = re.sub(r'-+', '-', slug)
    return slug.strip('-')

# Read the seed file
with open('scripts/seed_library.py', 'r') as f:
    content = f.read()

# Extract RECIPES list using regex to find the start
start = content.find('RECIPES = [')
if start == -1:
    print("Could not find RECIPES")
    exit(1)

# Find matching bracket
bracket_count = 0
end = start
for i, char in enumerate(content[start:]):
    if char == '[':
        bracket_count += 1
    elif char == ']':
        bracket_count -= 1
        if bracket_count == 0:
            end = start + i + 1
            break

recipes_str = content[start:end]
# Execute to get the data
exec(recipes_str)

print(f"Found {len(RECIPES)} recipes")

# Track used slugs to avoid duplicates
used_slugs = {}

def get_unique_slug(title):
    """Generate unique slug, appending number if duplicate"""
    base_slug = generate_slug(title)
    if base_slug not in used_slugs:
        used_slugs[base_slug] = 1
        return base_slug
    else:
        used_slugs[base_slug] += 1
        return f"{base_slug}-{used_slugs[base_slug]}"

# Generate SQL
sql_lines = []

# Header
sql_lines.append("-- Foood Recipe Library Seed Data")
sql_lines.append("-- Generated from seed_library.py")
sql_lines.append(f"-- Library user ID: {LIBRARY_USER_ID}")
sql_lines.append("-- Run via: psql DATABASE_URL -f seed_recipes.sql")
sql_lines.append("")
sql_lines.append("BEGIN;")
sql_lines.append("")

# Get all unique tags first
all_tags = set()
for recipe in RECIPES:
    all_tags.update(recipe.get('tags', []))

# Create tags for library user (tags are user-specific!)
sql_lines.append(f"-- Create tags for library user (id={LIBRARY_USER_ID})")
sql_lines.append("-- Tags are user-specific, unique constraint on (user_id, name)")
for tag in sorted(all_tags):
    sql_lines.append(f"INSERT INTO tags (user_id, name) VALUES ({LIBRARY_USER_ID}, {escape_sql(tag)}) ON CONFLICT (user_id, name) DO NOTHING;")
sql_lines.append("")

# Pre-generate unique slugs for all recipes
recipe_slugs = []
for recipe in RECIPES:
    slug = get_unique_slug(recipe['title'])
    recipe_slugs.append(slug)

# Insert recipes
sql_lines.append("-- Insert recipes owned by library user")
for i, recipe in enumerate(RECIPES):
    title = recipe['title']
    slug = recipe_slugs[i]

    sql_lines.append(f"-- Recipe {i+1}: {title}")
    sql_lines.append(f"""INSERT INTO recipes (
    user_id, title, slug, description, image_url, instructions,
    cuisine, category, difficulty, prep_time_minutes, cook_time_minutes,
    servings, calories, protein_g, carbs_g, fat_g, fiber_g, sugar_g,
    sodium_mg, cholesterol_mg, is_public, source
) VALUES (
    {LIBRARY_USER_ID},
    {escape_sql(title)},
    {escape_sql(slug)},
    {escape_sql(recipe.get('description'))},
    {escape_sql(recipe.get('image_url'))},
    {escape_sql(recipe.get('instructions'))},
    {escape_sql(recipe.get('cuisine'))},
    {escape_sql(recipe.get('category', 'meal'))},
    {escape_sql(recipe.get('difficulty'))},
    {recipe.get('prep_time_minutes') or 'NULL'},
    {recipe.get('cook_time_minutes') or 'NULL'},
    {recipe.get('servings', 4)},
    {recipe.get('calories') or 'NULL'},
    {recipe.get('protein_g') or 'NULL'},
    {recipe.get('carbs_g') or 'NULL'},
    {recipe.get('fat_g') or 'NULL'},
    {recipe.get('fiber_g') or 'NULL'},
    {recipe.get('sugar_g') or 'NULL'},
    {recipe.get('sodium_mg') or 'NULL'},
    {recipe.get('cholesterol_mg') or 'NULL'},
    true,
    'library'
);""")
    sql_lines.append("")

# Insert ingredients (global, unique on name)
sql_lines.append("-- Insert ingredients (global, unique constraint on name)")
all_ingredients = set()
for recipe in RECIPES:
    for ing in recipe.get('ingredients', []):
        all_ingredients.add(ing[0])

for ing_name in sorted(all_ingredients):
    sql_lines.append(f"INSERT INTO ingredients (name) VALUES ({escape_sql(ing_name)}) ON CONFLICT (name) DO NOTHING;")
sql_lines.append("")

# Link ingredients to recipes (column is 'note' not 'notes'!)
sql_lines.append("-- Link ingredients to recipes")
sql_lines.append("-- Note: column is 'note' not 'notes'")
for i, recipe in enumerate(RECIPES):
    title = recipe['title']
    slug = recipe_slugs[i]

    sql_lines.append(f"-- Ingredients for: {title}")
    for ing in recipe.get('ingredients', []):
        name = ing[0]
        qty = ing[1] if len(ing) > 1 else None
        unit = ing[2] if len(ing) > 2 else None
        note = ing[3] if len(ing) > 3 else None

        sql_lines.append(f"""INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit, note)
VALUES (
    (SELECT id FROM recipes WHERE slug = {escape_sql(slug)}),
    (SELECT id FROM ingredients WHERE name = {escape_sql(name)}),
    {qty if qty else 'NULL'},
    {escape_sql(unit)},
    {escape_sql(note)}
);""")
    sql_lines.append("")

# Link tags to recipes (using library user's tags)
sql_lines.append("-- Link tags to recipes")
sql_lines.append(f"-- Using tags owned by library user (id={LIBRARY_USER_ID})")
for i, recipe in enumerate(RECIPES):
    title = recipe['title']
    slug = recipe_slugs[i]

    for tag in recipe.get('tags', []):
        sql_lines.append(f"""INSERT INTO recipe_tags (recipe_id, tag_id)
VALUES (
    (SELECT id FROM recipes WHERE slug = {escape_sql(slug)}),
    (SELECT id FROM tags WHERE user_id = {LIBRARY_USER_ID} AND name = {escape_sql(tag)})
) ON CONFLICT DO NOTHING;""")
    sql_lines.append("")

sql_lines.append("COMMIT;")
sql_lines.append("")
sql_lines.append("-- Verification queries:")
sql_lines.append("-- SELECT COUNT(*) FROM recipes WHERE is_public = true;")
sql_lines.append(f"-- SELECT COUNT(*) FROM tags WHERE user_id = {LIBRARY_USER_ID};")
sql_lines.append("-- SELECT COUNT(*) FROM recipe_ingredients;")
sql_lines.append("-- SELECT COUNT(*) FROM recipe_tags;")

# Write to file
with open('scripts/seed_recipes.sql', 'w') as f:
    f.write('\n'.join(sql_lines))

print(f"Generated seed_recipes.sql with {len(sql_lines)} lines")
print(f"Tags to create: {len(all_tags)}")
print(f"Ingredients to create: {len(all_ingredients)}")
