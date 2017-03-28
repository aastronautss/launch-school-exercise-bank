-- Create an Extrasolar Planetary Database

CREATE DATABASE extrasolar;

\c extrasolar

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  distance INTEGER NOT NULL,
  spectral_type VARCHAR(1),
  companions INTEGER NOT NULL,
  UNIQUE (name),
  CHECK (distance > 0),
  CHECK (companions >= 0)
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  designation VARCHAR(1),
  mass INTEGER
);

--
-- Relating Stars and Planets
--

ALTER TABLE planets
  ADD COLUMN star_id INTEGER NOT NULL REFERENCES stars;

ALTER TABLE stars
  ALTER COLUMN name TYPE VARCHAR(50);

--
-- Stellar Distance Precision
--

ALTER TABLE stars
  ALTER COLUMN distance TYPE NUMERIC;

--
-- Check Values in List
--

ALTER TABLE stars
  ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
  ALTER COLUMN spectral_type SET NOT NULL;

--
-- Enumerated Types
--

-- `\d stars` yields the name of our constraint, which in this case
-- is "stars_spectral_type_check."

ALTER TABLE stars DROP CONSTRAINT stars_spectral_type_check;

CREATE TYPE spectral_type_enum AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars
  ALTER COLUMN spectral_type spectral_type_enum
  USING spectral_type::spectral_type_enum;

--
-- Planetary Mass Precision
--

ALTER TABLE planets
  ALTER COLUMN mass TYPE NUMERIC,
  ALTER COLUMN mass SET NOT NULL,
  ADD CHECK (mass > 0.0),
  ALTER COLUMN designation SET NOT NULL;

--
-- Add a semi-major axis column
--

ALTER TABLE planets
  ADD COLUMN semi_major_axis NUMERIC NOT NULL;

-- If we had data in our column already, we would need to create the column
-- without NOT NULL, change the values for those columns, and then add the
-- NOT NULL constraint.

--
-- Add a Moons Table
--

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  designation INTEGER NOT NULL CHECK (designation < 0),
  semi_major_axis NUMERIC CHECK (semi_major_axis < 0.0),
  mass NUMERIC CHECK (mass > 0.0),
  planet_id INTEGER NOT NULL REFERENCES planets (id)
);

--
-- Delete the Database
--

\c postgresql
DROP DATABASE extrasolar;
