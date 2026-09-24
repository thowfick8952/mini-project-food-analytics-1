CREATE DATABASE FOOD_1;
USE FOOD_1;

CREATE TABLE customers (
customer_id int primary key ,
customer_name varchar(50),
city varchar(50));


insert into customers (customer_id, customer_name, city) values
(1, 'Arun Kumar', 'Chennai'),
(2, 'Rahul Raj', 'Chennai'),
(3, 'Karthik S', 'Madurai'),
(4, 'Vijay Kumar', 'Coimbatore'),
(5, 'Surya Prakash', 'Chennai'),
(6, 'Ajith Kumar', 'Trichy'),
(7, 'Praveen Raj', 'Salem'),
(8, 'Dinesh Kumar', 'Chennai'),
(9, 'Sanjay M', 'Madurai'),
(10, 'Rohit Sharma', 'Coimbatore'),
(11, 'Hari Prasad', 'Trichy'),
(12, 'Gokul Raj', 'Salem'),
(13, 'Vignesh S', 'Chennai'),
(14, 'Manoj Kumar', 'Tirunelveli'),
(15, 'Sathish R', 'Madurai'),
(16, 'Naveen Kumar', 'Coimbatore'),
(17, 'Ashwin Raj', 'Chennai'),
(18, 'Dharshan K', 'Salem'),
(19, 'Mohamed Ali', 'Trichy'),
(20, 'Ramesh Babu', 'Chennai');

SELECT * FROM CUSTOMERS;

create table restaurants (
restaurant_id int primary key,
restaurant_name varchar(100),
cuisine varchar(50),
location varchar(50));


insert into restaurants
(restaurant_id, restaurant_name, cuisine, location) values
(101, 'Anjappar', 'South Indian', 'Chennai'),
(102, 'BBQ Nation', 'BBQ', 'Chennai'),
(103, 'Dindigul Thalappakatti', 'Biryani', 'Madurai'),
(104, 'Junior Kuppanna', 'South Indian', 'Coimbatore'),
(105, 'Pizza Hub', 'Italian', 'Chennai'),
(106, 'Saravana Bhavan', 'South Indian', 'Chennai'),
(107, 'A2B', 'South Indian', 'Chennai'),
(108, 'Buhari Hotel', 'Biryani', 'Chennai'),
(109, 'Kumar Mess', 'Tamil Nadu', 'Madurai'),
(110, 'Hotel Aryaas', 'Vegetarian', 'Trichy'),
(111, 'Chicken Treat', 'Fast Food', 'Salem'),
(112, 'Domino Pizza', 'Pizza', 'Coimbatore'),
(113, 'Burger King', 'Fast Food', 'Chennai'),
(114, 'Royal Biryani', 'Biryani', 'Trichy'),
(115, 'Arabian Grill', 'Arabian', 'Salem'),
(116, 'Madras Coffee House', 'South Indian', 'Chennai'),
(117, 'Chettinad Restaurant', 'Chettinad', 'Madurai'),
(118, 'Tandoori Palace', 'North Indian', 'Coimbatore'),
(119, 'Food Corner', 'Multi Cuisine', 'Chennai'),
(120, 'Spice Garden', 'Chinese', 'Salem');

SELECT * FROM RESTAURANTS;

create table orders (
    order_id int primary key,
    customer_id int,
    restaurant_id int,
    order_date date,
    delivery_time int,
    foreign key (customer_id) references customers(customer_id),
    foreign key (restaurant_id) references restaurants(restaurant_id)
);

insert into orders
(order_id, customer_id, restaurant_id, order_date, delivery_time) values
(1001, 1, 101, '2026-09-01', 35),
(1002, 2, 102, '2026-09-01', 45),
(1003, 3, 103, '2026-09-02', 30),
(1004, 4, 104, '2026-09-02', 40),
(1005, 5, 105, '2026-09-03', 25),
(1006, 6, 106, '2026-09-03', 38),
(1007, 7, 107, '2026-09-04', 32),
(1008, 8, 108, '2026-09-04', 50),
(1009, 9, 109, '2026-09-05', 55),
(1010, 10, 110, '2026-09-05', 28),
(1011, 11, 111, '2026-09-06', 42),
(1012, 12, 112, '2026-09-06', 35),
(1013, 13, 113, '2026-09-07', 30),
(1014, 14, 114, '2026-09-07', 48),
(1015, 15, 115, '2026-09-08', 40),
(1016, 16, 116, '2026-09-08', 27),
(1017, 17, 117, '2026-09-09', 45),
(1018, 18, 118, '2026-09-09', 36),
(1019, 19, 119, '2026-09-10', 33),
(1020, 20, 120, '2026-09-20', 52),
(1021, 7, 107, '2026-07-18', 52),
(1022, 8, 108, '2026-03-10', 52),
(1023, 7, 107, '2026-06-16', 52),
(1024, 3, 103, '2026-08-12', 52);

SELECT * FROM ORDERS;

create table ratings (
rating_id int primary key ,
order_id int,
rating decimal(2,1),
foreign key (order_id) references orders(order_id)
);


insert into ratings
(rating_id, order_id, rating) values
(1, 1001, 4.5),
(2, 1002, 4.0),
(3, 1003, 4.8),
(4, 1004, 4.2),
(5, 1005, 3.5),
(6, 1006, 4.1),
(7, 1007, 4.7),
(8, 1008, 3.2),
(9, 1009, 4.6),
(10, 1010, 3.9),
(11, 1011, 4.3),
(12, 1012, 3.8),
(13, 1013, 4.9),
(14, 1014, 3.4),
(15, 1015, 4.0),
(16, 1016, 4.5),
(17, 1017, 3.7),
(18, 1018, 4.4),
(19, 1019, 3.1),
(20, 1020, 4.6),
(21, 1021, 4.6),
(22, 1022, 2.6),
(23, 1023, 3.6),
(24, 1024, 4.6);


SELECT * FROM RATINGS;

SELECT * FROM CUSTOMERS;
SELECT * FROM RESTAURANTS;
SELECT * FROM ORDERS;
SELECT * FROM RATINGS;


-- 1 Which restaurants receive the most orders?

select r.restaurant_id, r.restaurant_name, count(o.order_id) as total_orders from restaurants r 
left join orders o on r.restaurant_id = o.restaurant_id group by r.restaurant_id
having count(o.order_id)= (select max(total_orders) from (select count(order_id) as total_orders 
from orders group by restaurant_id) as high_orders);

-- 2 Which cuisine has the highest average rating?

with cuisine_ratings as (
select r.cuisine,
ROUND(avg(rt.rating), 2) as avg_rating from restaurants r
join orders o on r.restaurant_id = o.restaurant_id
join ratings rt on o.order_id = rt.order_id
group by r.cuisine ),ranked_cuisines as (
select cuisine,avg_rating,
rank() over (order by avg_rating desc) AS rnk from cuisine_ratings )
select cuisine,avg_rating from ranked_cuisines
where rnk = 1;

-- 3 Which city or area has the highest demand?

select city, total_orders from ( select c.city, count(o.order_id) as total_orders,
row_number() over (order by COUNT(o.order_id) desc) as rnk from customers c
join orders o on c.customer_id = o.customer_id
group by c.city ) as rnk
where rnk <= 1
order by total_orders desc;

-- 4 What is the average delivery time?

select round(avg(delivery_time),2) as avg_deliverytime from orders;

-- 5 Which restaurants have high orders but low ratings?

select r.restaurant_name,count(o.order_id) as total_orders, round(avg(rt.rating), 2) as avg_rating from restaurants r
join orders o on r.restaurant_id = o.restaurant_id join ratings rt on o.order_id = rt.order_id
group by r.restaurant_id, r.restaurant_name having count(o.order_id) = (select max(total_orders)
from (select count(o2.order_id) as total_orders from orders o2
group by o2.restaurant_id) as orders) order by avg_rating asc;


