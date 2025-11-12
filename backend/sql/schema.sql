-- schema.sql
-- Enable PostGIS
CREATE EXTENSION IF NOT EXISTS postgis;

-- Places table
CREATE TABLE IF NOT EXISTS places (
  id SERIAL PRIMARY KEY,
  name_vi TEXT NOT NULL,
  period TEXT,
  summary TEXT,
  address TEXT,
  wikipedia_url TEXT,
  geom geometry(Point, 4326) NOT NULL
);
CREATE INDEX IF NOT EXISTS places_geom_idx ON places USING GIST (geom);

-- Events table
CREATE TABLE IF NOT EXISTS events (
  id SERIAL PRIMARY KEY,
  title_vi TEXT NOT NULL,
  title_en TEXT,
  year_from INT,
  year_to INT,
  description TEXT
);

-- Place-Event link table
CREATE TABLE IF NOT EXISTS place_events (
  place_id INT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  event_id INT NOT NULL REFERENCES events(id) ON DELETE CASCADE,
  PRIMARY KEY (place_id, event_id)
);

-- Media table
CREATE TABLE IF NOT EXISTS media (
  id SERIAL PRIMARY KEY,
  place_id INT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  kind TEXT NOT NULL CHECK (kind IN ('image', 'video', 'audio', 'link')),
  url TEXT NOT NULL,
  caption TEXT
);
