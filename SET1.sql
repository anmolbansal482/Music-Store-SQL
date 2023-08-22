--Questions set 1

--Q1. Who is the senior most employee based on the job title?

select first_name, last_name, levels
from employee
order by levels desc
limit 1;

--Q2. Which countries have the most invoices?

select count(total) as invoice, billing_country
from invoice
group by billing_country
order by invoice desc;

--Q3. What are the top 3 values of the total invoice?

select * from invoice
select billing_country, total
from invoice
order by total desc
limit 3;

/* Q4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money.
		Write a query that returns one city that has the highest sum of invoice totals.
		Return both the city name & sum of all invoice totals */
		
select sum(total)as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc
limit 1;

/* Q5. Who is the best customer? The customer who has spent the most money will be declared the best customer.
		Write a query that returns the person who has spent the most money. */
		
select cus.customer_id, cus.first_name, cus.last_name, sum(total) as inv_total
from customer as cus
join invoice as inv
on cus.customer_id = inv.customer_id
group by cus.customer_id
order by inv_total desc
limit 1;
