--
-- Set Up the Database using /copy
--

CREATE DATABASE acution;

\c auction

CREATE TABLE bidders (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  initial_price DECIMAL(6,2) NOT NULL CHECK(initial_price BETWEEN 0.01 AND 1000.00),
  sales_price DECIMAL(6,2) CHECK(sales_price BETWEEN 0.01 AND 1000.00)
);

CREATE TABLE bids (
  id SERIAL PRIMARY KEY,
  bidder_id integer NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
  item_id integer NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  amount DECIMAL(6,2) NOT NULL CHECK(amount BETWEEN 0.01 AND 1000.00)
);

CREATE INDEX ON bids (bidder_id, item_id);

\copy bidders FROM 'bidders.csv' WITH HEADER CSV;

\copy items FROM 'items.csv' WITH HEADER CSV;

\copy bids FROM 'bids.csv' WITH HEADER CSV;

--
-- Conditional Subqueries: IN
--

SELECT DISTINCT name AS "Bid on Items" FROM items
  WHERE id IN (
      SELECT item_id FROM bids
    );

--
-- Conditional Subqueries: NOT IN
--

SELECT DISTINCT name AS "Not Bid On" FROM items
  WHERE id NOT IN (SELECT item_id FROM bids);

--
-- Conditional Subqueries: EXISTS
--

SELECT name FROM bidders
  WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

--
-- Conditional Subqueries: ANY, SOME, ALL
--

SELECT name AS "Highest Bid Less Than 100 Dollars" FROM items
  WHERE 100.0 > ANY (SELECT amount FROM bids WHERE bids.item_id = items.id);

--
-- Query From a Virtual Table
--
