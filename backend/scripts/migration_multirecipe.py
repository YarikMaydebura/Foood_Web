#!/usr/bin/env python3
"""
Migration: enable multiple recipes per meal slot.

Changes:
  1. Drop unique constraint (user_id, week_start_date, day_of_week, meal_slot)
  2. Add `position` SMALLINT column (default 0) to order dishes within a slot
  3. Add helper index on (user_id, week_start_date, day_of_week, meal_slot)

Idempotent: each ALTER uses IF EXISTS / IF NOT EXISTS.

Usage:
    cd backend
    DATABASE_URL='postgresql://...' uv run python scripts/migration_multirecipe.py
"""
import os
import sys

import psycopg


STATEMENTS = [
    """
    ALTER TABLE meal_plan_entries
    DROP CONSTRAINT IF EXISTS uq_meal_plan_entries_user_week_day_slot
    """,
    """
    ALTER TABLE meal_plan_entries
    ADD COLUMN IF NOT EXISTS position SMALLINT NOT NULL DEFAULT 0
    """,
    """
    CREATE INDEX IF NOT EXISTS ix_meal_plan_entries_slot
    ON meal_plan_entries (user_id, week_start_date, day_of_week, meal_slot)
    """,
]


def main() -> None:
    db_url = os.environ.get("DATABASE_URL")
    if not db_url:
        sys.exit("Set DATABASE_URL env var (use the External Database URL from Render)")

    with psycopg.connect(db_url) as conn:
        with conn.cursor() as cur:
            for sql in STATEMENTS:
                cur.execute(sql)
                print(f"ok: {sql.strip().splitlines()[0]}")
        conn.commit()

    # Verification
    with psycopg.connect(db_url) as conn:
        with conn.cursor() as cur:
            cur.execute(
                """
                SELECT column_name, data_type, column_default, is_nullable
                FROM information_schema.columns
                WHERE table_name = 'meal_plan_entries'
                ORDER BY ordinal_position
                """
            )
            print()
            print("meal_plan_entries columns:")
            for name, dtype, default, nullable in cur.fetchall():
                print(f"  {name:24s} {dtype:24s} default={default}  nullable={nullable}")

            cur.execute(
                """
                SELECT conname
                FROM pg_constraint
                WHERE conrelid = 'meal_plan_entries'::regclass
                """
            )
            print()
            print("constraints:")
            for (conname,) in cur.fetchall():
                print(f"  {conname}")


if __name__ == "__main__":
    main()
