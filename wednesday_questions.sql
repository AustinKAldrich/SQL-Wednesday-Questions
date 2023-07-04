-- List all customers who are from Texas
select first_name, last_name, district
from customer
left join address
on customer.address_id = address.address_id
where district = 'Texas';

--Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, amount
from customer
left join payment
on customer.customer_id = payment.customer_id
where amount > 6.99
order by last_name asc;

--Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) desc
);

--List all customers that live in Nepal (use the city table)
select first_name, last_name, city, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Nepal';

--Which staff member had the most transactions?
select first_name, last_name, count(payment_id)
from staff
full join payment
on staff.staff_id = payment.staff_id
group by staff.staff_id;
-- Jon Stephens had the most transactions

--How many movies of each rating are there?
select rating, count(rating)
from film
group by film.rating;
--NC-17 has 209, R has 196, PG-13 has 223, PG has 194, and G has 178

--Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT *
FROM customer
WHERE customer_id IN (
  SELECT customer_id
  FROM payment
  WHERE amount > 6.99
  GROUP BY customer_id
  HAVING COUNT(*) = 1
);

--How many free rentals did our stores give away?
select count(amount)
from payment
where amount < 0;
--I wasn't entirely sure what this question was asking
--There isn't any information in the rentals table about things being free
--So I just assumed it was any rental where the customer paid a non-positive amount




