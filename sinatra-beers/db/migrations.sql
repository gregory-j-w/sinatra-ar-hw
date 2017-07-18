-- psql -a -f beerproject.sql

CREATE DATABASE beerproject;

\c beerproject;

CREATE TABLE stores (id SERIAL PRIMARY KEY, name VARCHAR(255), address VARCHAR(255),
city VARCHAR(255), state VARCHAR(255));

CREATE TABLE beers (id SERIAL PRIMARY KEY, name VARCHAR(255), style VARCHAR(255),
image_url VARCHAR(255), brewer VARCHAR(255), brewery_loc VARCHAR(255), price DECIMAL);

CREATE TABLE beer_stores (id SERIAL PRIMARY KEY, beer_id INY references beer(id),
store_id INT references store(id));

CREATE TABLE users (id SERIAL PRIMARY KEY,
username VARCHAR(255), password_digest VARCHAR(255), token BIGINT);
