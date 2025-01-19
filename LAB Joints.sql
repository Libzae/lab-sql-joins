USE sakila; 
-- 1. List number of films per category
SELECT * FROM film;
SELECT * FROM film_category;

--  Seleccionar y agrupar
SELECT category_id, COUNT(film_id) AS number_of_films
FROM film_category
GROUP BY category_id
ORDER BY number_of_films DESC;

-- 2. Retrieve the store ID, city, and country for each store

SELECT 
    Store.store_id, 
    City.city AS city, 
    Country.country AS country
FROM 
    Store
JOIN Address ON Store.address_id = Address.address_id
JOIN City ON Address.city_id = City.city_id
JOIN Country ON City.country_id = Country.country_id;

-- 3.Calculate the total revenue generated by each store in dollars.
SELECT * FROM PAYMENT;
SELECT * from STORE;
SELECT * FROM PAYMENT;

SELECT 
    Store.store_id, 
    SUM(Payment.amount) AS total_revenue
FROM 
    Store
    JOIN Customer ON Customer.store_id = Store.store_id
    JOIN Rental ON Rental.customer_id = Customer.customer_id
    JOIN Payment ON Payment.rental_id = Rental.rental_id
GROUP BY 
    Store.store_id;
    
-- 4. Determine the average running time of films for each category.
SELECT * FROM film;
SELECT * FROM film_category;

SELECT 
    Category.name AS category_name,
    AVG(Film.length) AS average_length
FROM 
    film_category FilmCategory
    JOIN film Film ON FilmCategory.film_id = Film.film_id
    JOIN category Category ON FilmCategory.category_id = Category.category_id
GROUP BY 
    Category.category_id, Category.name;