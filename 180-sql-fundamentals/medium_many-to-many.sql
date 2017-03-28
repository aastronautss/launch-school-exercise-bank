--
-- Set Up Database
--

CREATE DATABASE billing;

\c billing

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  payment_token VARCHAR(8) UNIQUE NOT NULL CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services (
  id SERIAL PRIMARY KEY,
  description TEXT NOT NULL,
  price NUMERIC(10, 2) NOT NULL CHECK (price > 0.00)
);

INSERT INTO customers (name, payment_token)
  VALUES
    ('Pat Johnson', 'XHGOAHEQ'),
    ('Nancy Monreal', 'JKWQPJKL'),
    ('Lynn Blake', 'KLZXWEEE'),
    ('Chen Ke-Hua', 'KWETYCVX'),
    ('Scott Lakso', 'UUEAPQPS'),
    ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price)
  VALUES
    ('Unix Hosting', 5.95),
    ('DNS', 4.95),
    ('Whois Registration', 1.95),
    ('High Bandwidth', 15.00),
    ('Business Support', 250.00),
    ('Dedicated Hosting', 50.00),
    ('Bulk Email', 250.00),
    ('One-to-one Training', 999.00);

CREATE TABLE customers_services (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers (id) ON DELETE CASCADE,
  service_id INTEGER REFERENCES services(id),

  UNIQUE(customer_id, service_id)
);

INSERT INTO customers_services (customer_id, service_id)
  VALUES
    (1, 1), -- Pat Johnson/Unix Hosting
    (1, 2), --            /DNS
    (1, 3), --            /Whois Registration
    (3, 1), -- Lynn Blake/Unix Hosting
    (3, 2), --           /DNS
    (3, 3), --           /Whois Registration
    (3, 4), --           /High Bandwidth
    (3, 5), --           /Business Support
    (4, 1), -- Chen Ke-Hua/Unix Hosting
    (4, 4), --            /High Bandwidth
    (5, 1), -- Scott Lakso/Unix Hosting
    (5, 2), --            /DNS
    (5, 6), --            /Dedicated Hosting
    (6, 1), -- Jim Pornot/Unix Hosting
    (6, 6), --           /Dedicated Hosting
    (6, 7); --           /Bulk Email

--
-- Get Customer With Services
--

SELECT DISTINCT c.* FROM customers AS c
  INNER JOIN customers_services AS cs
    ON c.id = cs.customer_id;

--
-- Get Customers with No Services
--

SELECT c.*, s.* FROM customers AS c
  FULL OUTER JOIN customers_services AS cs
    ON c.id = cs.customer_id
  FULL OUTER JOIN services AS s
    ON s.id = cs.service_id
  WHERE cs.id IS NULL;

---
--- Get Services with No Customers
---

SELECT s.description FROM customers_services AS cs
  RIGHT OUTER JOIN services AS s
    ON s.id = cs.service_id
  WHERE cs.id IS NULL;

--
-- Services for Each Customer
--

SELECT c.name AS name, STRING_AGG(s.description, ', ') AS services
  FROM customers AS c
    LEFT OUTER JOIN customers_services AS cs
      ON c.id = cs.customer_id
    LEFT OUTER JOIN services AS s
      ON s.id = cs.service_id
  GROUP BY c.id;

--
-- Services with at least 3 customers
--

SELECT s.description, COUNT(*) FROM services AS s
  INNER JOIN customers_services AS cs
    ON s.id = cs.service_id
  GROUP BY description
    HAVING COUNT(cs.customer_id) >= 3;
  ORDER BY description;

--
-- Total Gross Incomd
--

SELECT SUM(s.price) AS gross FROM customers_services AS cs
  INNER JOIN services AS s
    ON s.id = cs.service_id;

--
-- Add New Customer
--

INSERT INTO customers (name, payment_token)
  VALUES ('John Doe', 'EYODHLCN');
INSERT INTO customers_services (customer_id, service_id)
  VALUES (
    (SELECT id FROM customers WHERE payment_token = 'EYODHLCN'),
    (SELECT id FROM services WHERE description = 'Unix Hosting')
  );
INSERT INTO customers_services (customer_id, service_id)
  VALUES (
    (SELECT id FROM customers WHERE payment_token = 'EYODHLCN'),
    (SELECT id FROM services WHERE description = 'Whois Registration')
  );
INSERT INTO customers_services (customer_id, service_id)
  VALUES (
    (SELECT id FROM customers WHERE payment_token = 'EYODHLCN'),
    (SELECT id FROM services WHERE description = 'DNS')
  );

--
-- Hypothetically
--

SELECT SUM(price) FROM customers AS c
  INNER JOIN customers_services AS cs
    ON c.id = cs.customer_id
  INNER JOIN services AS s
    ON s.id = cs.service_id
  WHERE price > 100;

SELECT SUM(price) FROM customers
  CROSS JOIN services
  WHERE price > 100;

--
-- Deleting Rows
--

-- Get the id so we know what it is

SELECT id FROM services
  WHERE description = 'Bulk Email';

-- 7

DELETE FROM customers_services
  WHERE service_id = 7;

DELETE FROM services
  WHERE description = 'Bulk Email';

DELETE FROM customers
  WHERE name = 'Chen Ke-Hua';
