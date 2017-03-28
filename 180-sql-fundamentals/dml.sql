--
-- Set Up Database
--

CREATE TABLE devices (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE parts (
  id SERIAL PRIMARY KEY,
  part_number INTEGER UNIQUE NOT NULL,
  device_id INTEGER REFERENCES devices (id)
);

--
-- Insert Data for Parts and Devices
--

INSERT INTO devices (name)
  VALUES ('Accelerometer');
INSERT INTO devices (name)
  VALUES ('Gyroscope');

INSERT INTO parts (part_number, device_id)
  VALUES (1, 1);
INSERT INTO parts (part_number, device_id)
  VALUES (2, 1);
INSERT INTO parts (part_number, device_id)
  VALUES (3, 1);
INSERT INTO parts (part_number, device_id)
  VALUES (4, 2);
INSERT INTO parts (part_number, device_id)
  VALUES (5, 2);
INSERT INTO parts (part_number, device_id)
  VALUES (6, 2);
INSERT INTO parts (part_number, device_id)
  VALUES (7, 2);
INSERT INTO parts (part_number, device_id)
  VALUES (8, 2);
INSERT INTO parts (part_number)
  VALUES (9);
INSERT INTO parts (part_number)
  VALUES (10);
INSERT INTO parts (part_number)
  VALUES (11);

--
-- INNER JOIN
--

SELECT d.name, p.part_number FROM devices AS d
  INNER JOIN parts AS p ON d.id = p.device_id;

--
-- SELECT part_number
--

SELECT * FROM parts
  WHERE part_number::TEXT LIKE '3%';

--
-- Aggregate Functions
--

SELECT d.name AS device_name, COUNT(*) AS number_of_parts
  FROM devices AS d
    INNER JOIN parts AS p ON d.id = p.device_id
  GROUP BY d.id;

--
-- ORDER BY
--

SELECT d.name AS device_name, COUNT(*) AS number_of_parts
  FROM devices AS d
    INNER JOIN parts AS p ON d.id = p.device_id
  GROUP BY d.id
  ORDER BY d.name ASC;

--
-- IS NULL and IS NOT NULL
--

SELECT part_number, device_id FROM parts
  WHERE device_id IS NOT NULL;

  SELECT part_number, device_id FROM parts
    WHERE device_id IS NULL;

--
-- Oldest Device
--

INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (42, 3);

SELECT name FROM devices
  ORDER BY created_at ASC
  LIMIT 1;

--
-- UPDATE device_id
--

UPDATE parts SET device_id = 1
  WHERE part_number IN (7, 8);

-- Further Exploration

UPDATE parts SET device_id = 1
  WHERE part_number = (SELECT MIN(part_number) FROM parts WHERE device_id = 2);

--
-- Delete Accelerometer
--

DELETE FROM parts WHERE device_id = 1;
DELETE FROM devices WHERE id = 1;
