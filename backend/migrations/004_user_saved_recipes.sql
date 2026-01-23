-- Migration 004: Add user_saved_recipes table for reference model
-- Users can save/bookmark library recipes without copying them

-- Create the junction table for saved recipes
CREATE TABLE IF NOT EXISTS user_saved_recipes (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    recipe_id INTEGER NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
    saved_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    notes TEXT,  -- Optional personal notes about the recipe
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),  -- Personal rating
    UNIQUE(user_id, recipe_id)  -- Each user can save a recipe only once
);

-- Create indexes for fast lookups
CREATE INDEX IF NOT EXISTS ix_user_saved_recipes_user_id ON user_saved_recipes(user_id);
CREATE INDEX IF NOT EXISTS ix_user_saved_recipes_recipe_id ON user_saved_recipes(recipe_id);

-- Add source field to recipes to track origin
-- 'library' = public library recipe (is_public=true)
-- 'user' = user created recipe
-- 'copied' = copied from library (user wanted to customize)
-- This field already exists from migration 003, but ensure it's there
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'recipes' AND column_name = 'source') THEN
        ALTER TABLE recipes ADD COLUMN source VARCHAR(50) DEFAULT 'user';
    END IF;
END $$;

-- Add copied_from_id to track which library recipe a copy came from
ALTER TABLE recipes ADD COLUMN IF NOT EXISTS copied_from_id INTEGER REFERENCES recipes(id) ON DELETE SET NULL;
CREATE INDEX IF NOT EXISTS ix_recipes_copied_from_id ON recipes(copied_from_id) WHERE copied_from_id IS NOT NULL;
