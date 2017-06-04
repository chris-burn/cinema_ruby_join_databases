DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS tickets;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  funds INT8,
  purchases_value INT8
);

CREATE TABLE films (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  price INT8
);

CREATE TABLE tickets (
  id SERIAL8 PRIMARY KEY,
  customer_id INT8 REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT8 REFERENCES films(id) ON DELETE CASCADE
);

CREATE TABLE screenings (
  id SERIAL8 PRIMARY KEY,
  time_id INT8, 
  capacity INT8,
  film_id INT8 REFERENCES films(id) ON DELETE CASCADE
);
  
