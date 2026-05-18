#!/usr/bin/env python3
"""
Seed production database with library recipes + demo users.

What it does:
  1. Insert library user with explicit id=3 (random unguessable password).
  2. Insert 10 demo users with predictable passwords (enter111..enter1010).
  3. setval('users_id_seq') so future signups don't collide.
  4. Execute seed_recipes.sql (200 recipes / 479 ingredients / 125 tags / joins).
  5. Print verification counts.

Idempotent: aborts if user_id=3 already owns recipes.

Usage:
    cd backend
    DATABASE_URL='postgresql://...' uv run python scripts/seed_production.py
"""
import os
import sys
import secrets
from pathlib import Path

import psycopg
from passlib.context import CryptContext

pwd_context = CryptContext(schemes=["pbkdf2_sha256"], deprecated="auto")

LIBRARY_USER_ID = 3
LIBRARY_EMAIL = "library@foood.it"
LIBRARY_NAME = "Foood Library"

DEMO_USERS = [
    ("Emma Wilson",       "emma.wilson@demo.foood.it",       "enter111"),
    ("Olivia Brown",      "olivia.brown@demo.foood.it",      "enter222"),
    ("Noah Davis",        "noah.davis@demo.foood.it",        "enter333"),
    ("Liam Miller",       "liam.miller@demo.foood.it",       "enter444"),
    ("Ava Garcia",        "ava.garcia@demo.foood.it",        "enter555"),
    ("William Lee",       "william.lee@demo.foood.it",       "enter666"),
    ("Sophia Martinez",   "sophia.martinez@demo.foood.it",   "enter777"),
    ("James Anderson",    "james.anderson@demo.foood.it",    "enter888"),
    ("Isabella Taylor",   "isabella.taylor@demo.foood.it",   "enter999"),
    ("Benjamin Thomas",   "benjamin.thomas@demo.foood.it",   "enter1010"),
]


def main() -> None:
    db_url = os.environ.get("DATABASE_URL")
    if not db_url:
        sys.exit("Set DATABASE_URL env var (use the External Database URL from Render)")

    seed_sql_path = Path(__file__).parent / "seed_recipes.sql"
    seed_sql = seed_sql_path.read_text()

    if f"Library user ID: {LIBRARY_USER_ID}" not in seed_sql:
        sys.exit(
            f"seed_recipes.sql doesn't target user {LIBRARY_USER_ID}. "
            f"Regenerate via: python3 scripts/generate_sql.py"
        )

    # The seed SQL wraps itself in BEGIN/COMMIT; we manage the transaction here.
    seed_sql = seed_sql.replace("BEGIN;\n", "", 1).replace("COMMIT;\n", "", 1)

    library_hash = pwd_context.hash(secrets.token_urlsafe(32))

    with psycopg.connect(db_url) as conn:
        with conn.cursor() as cur:
            # Idempotency: bail if already seeded.
            cur.execute(
                "SELECT COUNT(*) FROM recipes WHERE user_id = %s",
                (LIBRARY_USER_ID,),
            )
            existing = cur.fetchone()[0]
            if existing > 0:
                sys.exit(
                    f"User {LIBRARY_USER_ID} already owns {existing} recipes. "
                    f"Aborting to avoid duplicates."
                )

            # Safety: don't overwrite a real user that happens to have id=3.
            cur.execute("SELECT email FROM users WHERE id = %s", (LIBRARY_USER_ID,))
            row = cur.fetchone()
            if row and row[0] != LIBRARY_EMAIL:
                sys.exit(
                    f"User id={LIBRARY_USER_ID} already exists with email {row[0]!r} "
                    f"(expected new library email {LIBRARY_EMAIL!r}). Aborting."
                )

            # 1. Library user with explicit id=3
            cur.execute(
                """
                INSERT INTO users (id, name, email, password_hash, email_verified, onboarding_completed)
                VALUES (%s, %s, %s, %s, true, true)
                ON CONFLICT (id) DO NOTHING
                """,
                (LIBRARY_USER_ID, LIBRARY_NAME, LIBRARY_EMAIL, library_hash),
            )
            print(f"library user (id={LIBRARY_USER_ID}, {LIBRARY_EMAIL}) inserted")

            # 2. Bump sequence past any explicit ids before demo inserts.
            cur.execute(
                "SELECT setval('users_id_seq', GREATEST((SELECT MAX(id) FROM users), 10))"
            )

            # 3. Demo users (auto-incremented ids)
            for name, email, plain in DEMO_USERS:
                cur.execute(
                    """
                    INSERT INTO users (name, email, password_hash, email_verified, onboarding_completed)
                    VALUES (%s, %s, %s, true, true)
                    ON CONFLICT (email) DO NOTHING
                    """,
                    (name, email, pwd_context.hash(plain)),
                )
            print(f"{len(DEMO_USERS)} demo users inserted (or already existed)")

            # 4. Final sequence bump so future signups continue cleanly.
            cur.execute(
                "SELECT setval('users_id_seq', GREATEST((SELECT MAX(id) FROM users), 100))"
            )
            print("users_id_seq updated")

            # 4. Run the seed SQL (3,297 INSERTs — takes 1-3 min over the network)
            print("loading 200 recipes + ingredients + tags + joins...")
            cur.execute(seed_sql)
            print("seed SQL executed")

        conn.commit()

    # 5. Verification
    with psycopg.connect(db_url) as conn:
        with conn.cursor() as cur:
            def count(query: str, params: tuple = ()) -> int:
                cur.execute(query, params)
                return cur.fetchone()[0]

            users = count("SELECT COUNT(*) FROM users")
            recipes = count(
                "SELECT COUNT(*) FROM recipes WHERE user_id = %s",
                (LIBRARY_USER_ID,),
            )
            public = count("SELECT COUNT(*) FROM recipes WHERE is_public = true")
            ingredients = count("SELECT COUNT(*) FROM ingredients")
            tags = count("SELECT COUNT(*) FROM tags WHERE user_id = %s", (LIBRARY_USER_ID,))
            recipe_ingredients = count("SELECT COUNT(*) FROM recipe_ingredients")
            recipe_tags = count("SELECT COUNT(*) FROM recipe_tags")

    print()
    print("verification counts:")
    print(f"  users:                {users}")
    print(f"  library recipes:      {recipes}    (expected 200)")
    print(f"  public recipes:       {public}     (expected >= 200)")
    print(f"  ingredients:          {ingredients}    (expected 479)")
    print(f"  library tags:         {tags}    (expected 125)")
    print(f"  recipe_ingredients:   {recipe_ingredients}   (expected 1688)")
    print(f"  recipe_tags:          {recipe_tags}    (expected 805)")


if __name__ == "__main__":
    main()
