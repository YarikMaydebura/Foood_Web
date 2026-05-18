#!/usr/bin/env python3
"""
Migration: add recipe_reviews table for star ratings + short reviews.

Schema:
- One review row per (recipe_id, user_id) — enforced by unique index.
- rating 1..5 enforced by CHECK constraint.
- comment optional (up to ~500 chars but stored as TEXT for flexibility).

Idempotent: every statement uses IF NOT EXISTS.

Usage:
    cd backend
    DATABASE_URL='postgresql://...' uv run python scripts/migration_reviews.py
"""
import os
import sys

import psycopg


STATEMENTS = [
    """
    CREATE TABLE IF NOT EXISTS recipe_reviews (
        id SERIAL PRIMARY KEY,
        recipe_id INTEGER NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
        user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
        rating SMALLINT NOT NULL CHECK (rating >= 1 AND rating <= 5),
        comment TEXT,
        created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    )
    """,
    """
    CREATE UNIQUE INDEX IF NOT EXISTS uq_recipe_reviews_recipe_user
        ON recipe_reviews (recipe_id, user_id)
    """,
    """
    CREATE INDEX IF NOT EXISTS ix_recipe_reviews_recipe
        ON recipe_reviews (recipe_id)
    """,
]


def main() -> None:
    db_url = os.environ.get("DATABASE_URL")
    if not db_url:
        sys.exit("Set DATABASE_URL env var")

    with psycopg.connect(db_url) as conn:
        with conn.cursor() as cur:
            for sql in STATEMENTS:
                cur.execute(sql)
                print(f"ok: {sql.strip().splitlines()[0]}")
        conn.commit()
    print("done")


if __name__ == "__main__":
    main()
