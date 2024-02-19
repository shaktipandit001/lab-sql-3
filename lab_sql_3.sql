use sakila;

##1How many distinct (different) actors' last names are there?
select * from actor;
select distinct last_name from actor;

##2In how many different languages where the films originally produced? (Use the column language_id from the film table)
 select * from film;
 select distinct count( language_id) from film;
 
  ##3How many movies were released with "PG-13" rating?
  select * from film;
  select count(distinct rating) from film where rating = "PG-13";

  
   ##4Get 10 the longest movies from 2006.
  select * from film;
select * from film where release_year = 2006 order by length desc limit 10;


##5How many days has been the company operating (check DATEDIFF() function)?
select *from rental;
alter table rental
add column days_result int generated always as (DATEDIFF(return_date, rental_date)) stored;
select distinct count(days_result)from rental; 


##6Show rental info with additional columns month and weekday. Get 20.
select *from rental;
select *, date_format(rental_date, '%b') as month, date_format(rental_date,'%a') as weekday from rental limit 20;


##7Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT rental_date, return_date,
case when dayofweek(rental_date) in (1,7) then 'Weekend' else 'Weekday' end as day_type
from rental;

##8How many rentals were in the last month of activity?
select *from rental;
select count(*) as 'Rental in last Month'
from rental
where(last_update, rental_date) > date_sub(curdate(), interval 30 day);








