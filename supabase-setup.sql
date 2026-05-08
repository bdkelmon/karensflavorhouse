-- ══════════════════════════════════════════════════════
-- Karen's Flavor House — Supabase Setup
-- Paste this entire file into Supabase → SQL Editor → Run
-- ══════════════════════════════════════════════════════

-- 1. Create the recipes table
CREATE TABLE IF NOT EXISTS recipes (
  id          UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  title       TEXT        NOT NULL,
  category    TEXT        NOT NULL,
  description TEXT,
  file_path   TEXT        NOT NULL,
  file_name   TEXT        NOT NULL,
  created_at  TIMESTAMPTZ DEFAULT now()
);

-- 2. Enable Row Level Security
ALTER TABLE recipes ENABLE ROW LEVEL SECURITY;

-- 3. Anyone can READ (browse & download)
CREATE POLICY "Public read"
  ON recipes FOR SELECT
  USING (true);

-- 4. Anyone can INSERT (the upload password in config.js
--    controls who can reach the upload form)
CREATE POLICY "Public insert"
  ON recipes FOR INSERT
  WITH CHECK (true);

-- ══════════════════════════════════════════════════════
-- Storage Bucket  (do this in the Supabase Dashboard)
-- ══════════════════════════════════════════════════════
-- 1. Go to Storage → New Bucket
-- 2. Name it:  recipe-files
-- 3. Toggle:   Public bucket → ON
-- 4. Click Save
--
-- Then inside that bucket → Policies → add:
--   SELECT policy  name: Public downloads   expression: true
--   INSERT policy  name: Public uploads     expression: true
-- ══════════════════════════════════════════════════════
