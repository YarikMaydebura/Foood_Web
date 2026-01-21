-- Migration 003: Add nutritional data and metadata fields to recipes
-- Run this migration on Railway PostgreSQL

-- Nutritional information per serving
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS calories INTEGER;
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS protein_g NUMERIC(6,2);
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS carbs_g NUMERIC(6,2);
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS fat_g NUMERIC(6,2);
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS fiber_g NUMERIC(6,2);
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS sugar_g NUMERIC(6,2);
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS sodium_mg NUMERIC(6,2);
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS cholesterol_mg NUMERIC(6,2);
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS servings INTEGER DEFAULT 4;

-- Recipe metadata
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS slug VARCHAR(255);
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS is_public BOOLEAN DEFAULT FALSE;
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS source VARCHAR(50) DEFAULT 'user';
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS prep_time_minutes INTEGER;
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS cook_time_minutes INTEGER;
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS difficulty VARCHAR(20);
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS cuisine VARCHAR(100);
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS category VARCHAR(50) DEFAULT 'meal';

-- Create unique index on slug (only for non-null values)
CREATE UNIQUE INDEX IF NOT EXISTS ix_recipes_slug ON recipes(slug) WHERE slug IS NOT NULL;

-- Create index for public recipes (library browsing)
CREATE INDEX IF NOT EXISTS ix_recipes_is_public ON recipes(is_public) WHERE is_public = TRUE;

-- Create index for filtering by cuisine and category
CREATE INDEX IF NOT EXISTS ix_recipes_cuisine ON recipes(cuisine) WHERE cuisine IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_recipes_category ON recipes(category) WHERE category IS NOT NULL;

-- Generate slugs for existing recipes (optional - can be run separately)
-- This updates existing recipes to have slugs based on their titles
UPDATE recipes
SET slug = LOWER(REGEXP_REPLACE(REGEXP_REPLACE(title, '[^a-zA-Z0-9\s]', '', 'g'), '\s+', '-', 'g')) || '-' || id::text
WHERE slug IS NULL;
