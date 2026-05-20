#!/usr/bin/env python3
"""
Migration: add recipe_comments table for Reddit-lite threads.

Schema:
- Each comment belongs to one recipe and one user.
- parent_id is NULL for top-level comments. For replies it points at a
  top-level comment. A trigger isn't required because the application
  enforces 'no replies to replies' at the route layer.
- text up to ~2000 chars stored as TEXT for flexibility.

Idempotent.

Usage:
    cd backend
    DATABASE_URL='postgresql://...' uv run python scripts/migration_comments.py
"""
import os
import sys

import psycopg


STATEMENTS = [
    """
    CREATE TABLE IF NOT EXISTS recipe_comments (
        id SERIAL PRIMARY KEY,
        recipe_id INTEGER NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
        user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
        parent_id INTEGER REFERENCES recipe_comments(id) ON DELETE CASCADE,
        text TEXT NOT NULL,
        created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
        updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
    )
    """,
    """
    CREATE INDEX IF NOT EXISTS ix_recipe_comments_recipe
        ON recipe_comments (recipe_id)
    """,
    """
    CREATE INDEX IF NOT EXISTS ix_recipe_comments_parent
        ON recipe_comments (parent_id)
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
