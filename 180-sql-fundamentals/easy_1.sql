-- Create a database

CREATE DATABASE animals;

--
-- psql -d animals
--

-- Create a table

CREATE TABLE birds (
  id SERIAL PRIMARY KEY
  name VARCHAR(25),
  age INTEGER,
  species VARCHAR(25)
);

-- Insert Data

INSERT INTO birds (name, age, species)
  VALUES ('Charlie', 3, 'Finch');
INSERT INTO birds (name, age, species)
  VALUES ('Allie', 5, 'Owl');
INSERT INTO birds (name, age, species)
  VALUES ('Jennifer', 3, 'Magpie');
INSERT INTO birds (name, age, species)
  VALUES ('Jamie', 4, 'Owl');
INSERT INTO birds (name, age, species)
  VALUES ('Roy', 8, 'Crow');

-- Select data

SELECT * FROM birds;

-- WHERE clause

SELECT * FROM birds WHERE age < 5;

-- Update Data

UPDATE birds SET species = 'Raven'
  WHERE species = 'Crow';

-- Delete Data

DELETE FROM birds
  WHERE species = 'Finch' AND age = 3;

-- Add constraint

ALTER TABLE birds ADD CONSTRAINT positive_age CHECK age > 0;

-- Drop table

DROP TABLE birds;

-- Drop database

DROP DATABASE animals;
