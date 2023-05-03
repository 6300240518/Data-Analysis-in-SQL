 use vijay;
create database vijay;
-- Table created ---     
create table  Employee(
e_id int not null,
e_name varchar(20),
e_salary int,
e_age int,
e_genden varchar(20),
e_dept varchar(20),
primary key(e_id)
);
insert into Employee values(
1,'suresh',23000,23,'male','projects'
);
insert into Employee values(
2,'sowmya',19000,26,'female','maintainance'
);
insert into Employee values(
3,'ramesh',25000,27,'male','production'
);
insert into Employee values(
4,'rahul',14000,22,'male','production'
);
insert into Employee values(
5,'johny',21000,24,'male','maintainance'
);
insert into Employee values(
6,'ramya',19000,26,'female','inspection'
);
-- Basic Queries --
-- Question-1 --
select* from Employee;
-- Question-2 --            
select * from Employee Where e_genden='female';
-- Question-3 --
select* from Employee where e_age<25;
-- Question-4 --
select * from Employee where e_genden='female' AND e_age>25;
-- Question-5 --
select * from Employee where e_dept='maintainance' or e_dept='projects';
-- Question-6 --
select * from Employee where not e_age<25;
-- Question-7 --
select * from Employee where e_name like 's%';
-- Question-8 --
select * from Employee where e_age like '2_';
-- Question-9 --
select * from Employee where e_age between 23 and 25;
-- Question-10 --
select MIN (e_age) as 'Min_age'from Employee;
-- Question-11 --
select MAX (e_age) from Employee;
-- Question-12 --
select COUNT(*) from Employee where e_genden='female';
-- Question-13 --
select sum(e_salary) from Employee;
-- Question-14 --
select AVG(e_salary) from Employee;
-- Question-15 --
select'    vijay';
-- Question-16 --
select ltrim('    vijay');
-- Question-17 --
select 'THIS IS A VIJAY';
-- Question-18 --
SELECT LOWER('THIS IS A VIJAY');
-- Question-19 --
Select 'this is a vijay';
-- Question-20 --
select UPPER('this is a vijay');
-- Question-21 --
select 'i love icecream';
-- Question-22 --
select REVERSE('i love icecream');
-- Question-23 --
select 'this is a vijay';
-- Question-24 --
select SUBSTRING('this is a vijay',11,5);
-- Question-25 --
select avg(e_age) from Employee;
-- Question-26 --
select * from Employee order by e_salary;
-- Question-27 --
select * from Employee order by e_salary desc;
-- Question-28 --
select * from Employee limit 3;
-- Question-29 --
select * from Employee order by e_age desc limit 3;
-- Question-30 -- 
select avg (e_salary) as avg_salary,e_genden from Employee group by e_genden;/*average employee salary based on gender*/
-- Question-31 --
select avg (e_age)as avg_age,e_dept from Employee group by e_dept order by avg (e_age) desc;/*average age wrt e_dept in descending order*/
-- Question-32 --
select e_dept, avg(e_salary) as avg_salary
from Employee
group by e_dept
having avg(e_salary)>20000; /*e_department wise average salary,again average salary which is greater than 20000*/
-- Question-33 --
update Employee set e_age = 28 where e_name='sowmya';
-- Question-34 --
update Employee set e_dept='technical' where e_genden='female';
-- Question-35 --
update Employee set e_salary=45000 
where e_name='suresh';
-- Question-36 --
delete from Employee where e_name='ramya';

-- Table created --- 
create table  department(
d_id int not null,
d_name varchar(20),
d_location varchar(20),
primary key(d_id)
);
         
insert into department values(
1,'projects','newyork'
);
insert into department values(
2,'maintainance','london'
);
insert into department values(
3,'production','melbourne'
);
insert into department values(
4,'technical','australia'
);
insert into department values(
5,'sales','india'
);
insert into department values(
6,'projects','china'
);

-- Analysis on Movies Database using basic queries --

USE UDEMY

SELECT TOP 5 * FROM PAYMENT$
WHERE amount !=0.00
ORDER BY payment_date DESC;

/*QUES NO-1 Top 10 custumer id who have done payment first*/

SELECT * FROM PAYMENT$
select top 10  customer_id,payment_date FROM PAYMENT$
order by payment_date;

/*QUES NO-2 top 5 movies with the less run time length */

SELECT *FROM FILM$
SELECT TOP 5  title,length FROM FILM$
ORDER BY  length;

/*QUES NO-3 how many movies less than and equal to 50 min of lenth*/

select count(title) as no_of_movies from FILM$
where length <=50

/*BETWEEN OPERATOR-- Count the payments of amount between 8 & 9? */

SELECT * FROM PAYMENT$
SELECT count(*) AS NO_OF_PAYMENTS FROM PAYMENT$
WHERE amount between 8 and 9;

/*NOT BETWEEN OPERATOR-- Count the payments of amount not between 8 & 9? */

SELECT count(*)FROM PAYMENT$
WHERE amount not between 8 and 9;

/*What are the payments done in the first half of feb month? */

select * from PAYMENT$
where payment_date between '2007-02-01'and '2007 -02-15'

/* IN operator What are the payments of the amount having 0.99,1.98,1.99 ? */

SELECT * FROM PAYMENT$
WHERE AMOUNT IN(0.99,1.98,1.99);

/* IN operator What are the payments of the amount not having 0.99,1.98,1.99 ? */

SELECT * FROM PAYMENT$
WHERE AMOUNT NOT IN(0.99,1.98,1.99);

/*LIKE & ILIKE OPERATORS*/
/*QUES NO-4 How many number of customers are there whose name starts with J ? */

SELECT count(first_name) FROM CUSTOMER$
WHERE first_name like 'J%';

/*Ex:-*/
 
SELECT (first_name),(last_name )FROM CUSTOMER$
WHERE first_name like 'J%' and last_name LIKE 'S%'

/*GENERAL CHALLANGE*/

/*How many payment transactions were greater than $5.00*/
SELECT *FROM PAYMENT$
WHERE amount >5.00;

/*How many actors have a first name starts with the letter P? */
SELECT count(first_name) FROM ACTOR$
where first_name like 'P%';

/*How many unique districts are our customersfrom? */
SELECT  COUNT(DISTINCT(district)) FROM ADDRESS$;

/*What are the unique districts are our customersfrom? */
SELECT DISTINCT(district) FROM ADDRESS$;

/*How many films have a rating of R and replacement cost between $5 and $15? */
SELECT  count (*) FROM FILM$
WHERE rating='R'AND replacement_cost between 5.00 and 15;

/*How many films have the word Truman some where in the title?*/
SELECT count(*) FROM FILM$
WHERE title like'%Truman%'

/*GROUP BY STATEMENT*/

/*Ques-1 Find the staff member that handeled the most no.of payments*/

SELECT * FROM PAYMENT$
SELECT staff_id, count (payment_id) AS 'No.of.payments' FROM PAYMENT$
GROUP BY staff_id;

/*QUES-2 What is the avg replacement cost per MPPA rating?*/

select *FROM FILM$
SELECT rating,round(avg(replacement_cost),3) AS 'avg_replacement_cost' FROM FILM$
GROUP BY rating
order by avg(replacement_cost);

/*Ques-3 What are the customers ids of top 5 customers by total spend?*/

SELECT top 5(customer_id),sum(amount) AS'total_amount' FROM PAYMENT$
GROUP BY customer_id
ORDER BY sum(amount) desc;

/*HAVING*/

/*Ques-4 What Customer_id are eligible for Platinum status? */

SELECT *FROM PAYMENT$
 SELECT customer_id,count(*)AS'Platinum_status' from PAYMENT$
 GROUP BY customer_id
 HAVING count(*)>=40;

 /*Ques-5 What are the customer_id's of the customers having more than $100 in payment transactions with our staff id 2?*/
 
 SELECT customer_id,sum(amount) AS 'amount'from PAYMENT$
 where staff_id =2
 GROUP BY customer_id
 having sum(amount)>100
 ORDER BY customer_id;

 /*Ques-6 How many films begin with the letter j?*/
 
 SELECT count(*) FROM FILM$
 where title like'j%';

 /*Ques-7 What customer has the Highest customer_id whose name statrs with an 'E' and has an adress_id lower than 500?*/
 
 SELECT top 1 (customer_id),first_name,last_name,address_id FROM CUSTOMER$
 WHERE address_id <= 500 and first_name like 'E%'
 ORDER BY customer_id desc;

-- JOINS --

/*INNER_JOIN*/
select Employee.e_name,Employee.e_dept,department.d_name,department.d_location
from Employee
 inner join department on Employee.e_dept = department.d_name;
 
 /*LEFT_JOIN*/
 select Employee.e_name,Employee.e_dept,department.d_name,department.d_location
 from Employee
 Left join department on Employee.e_dept = department.d_name;
 
 /*RIGHT_JOIN*/
 select Employee.e_name,Employee.e_dept,Employee.e_id,department.d_name,department.d_location,department.d_id
 from Employee
 right join department on Employee.e_dept = department.d_name;
 
 /*FULL_JOIN*/
select Employee.e_name,Employee.e_dept,Employee.e_id,department.d_name,department.d_location,department.d_id
 from Employee
 full join department on Employee.e_dept = department.d_name;
 
-- Table created --- 
 create table  student_details1(
s_id int not null,
s_name varchar(20),
s_marks int not null,
primary key(s_id)
);                        
insert into student_details1 values(
101,'vijay',98
);
insert into student_details1 values(
102,'geetha',79
);
insert into student_details1 values(
103,'anu',88
);
insert into student_details1 values(
104,'ajay',97
);
insert into student_details1 values(
105,'ramesh',89
);
insert into student_details1 values(
106,'harika',68
);
select* from student_details1;

create table  student_details2(
s_id int not null,
s_name varchar(20),
s_marks int not null,
primary key(s_id)
);                        
insert into student_details2 values(
104,'ajay',97
);
insert into student_details2 values(
107,'raghava',89
);
insert into student_details2 values(
102,'geetha',79
);
/*union_operator*/
select *from student_details1
union
select *from student_details2;

/*union_all_operator*/
select *from student_details1
union all
select *from student_details2;                       

/*Except_operetor*/
select *from student_details1
except
select *from student_details2;

/*Intersect_operator*/
select *from student_details1
Intersect
select * from student_details2;

/*view_*/
Create view female_emp as
select *from Employee
where e_genden='female';

create view emp_name as
select *from Employee 
where e_name='suresh';

/*alter_table add_column*/
alter table employee
add e_dob date;

/*drop_a_column using_alter*/
alter table employee
drop column e_dob;


-- Sub Queries  using movies data set & zomato orders--

create database sub_query;
use sub_query;

-- SCALAR SUB-QUEIRIES --

-- 1) find the most profitable movie ? --
select * from movies
where (gross - budget) = (select max(gross-budget) from movies);

-- 2) Find how many movies have a rating > the avg of all the movie ratings and find the count of the above avg movies ? --
select count(*) from movies
where score>(select avg(score)from movies);

-- 3) Find the highest rated movie and  details in the 2000? --
select * from movies where year =2000 and score =(select max(score) from movies where year=2000);

-- 4) Find the highest rated movie among all movies whose no.of votes are > the dataset avg votes --
select * from movies where score = (select max(score) from movies where votes > (select avg (votes) from movies));

-- INDEPENDENT ROW SUB-QUERIES(ONE COLUMN MULTI ROWS) --

-- 1) Find the users who never placed orders ?
select * from users where user_id not in (select distinct(user_id) from orders);

-- 2) Find all the movies made by top 3 directors(in terms of total gross income)
select * from movies where director in (select director from movies
group by director order by sum(gross) desc limit 3);

-- 3) Find all movies of all those actors whose filmography's avg rating > 8.5(take 25000 votes as cuttoff)
 select * from movies where star in (select star from movies where votes >25000 group by star having avg(score)>8.5);
 

-- CORELATED SUB-QUERY --
-- 1) Find all the movies have a rating higher than the average rating of the movies in the same genere? --
select name from movies m1 where score >(select avg(score) from movies m2 where m2.genre =m1.genre);

-- 2) Find the favorite food of each customer? --

select t1.name,t4.f_name from sub_query.users t1
join sub_query.orders t2 on t1.user_id=t2.user_id
join sub_query.order_details t3 on t2.order_id=t3.order_id
join sub_query.food t4 on t3.f_id=t4.f_id
group by t2.user_id,t3.f_id;

-- SUB- QUERY USING WITH SELECT --
-- 3) Find the percentage of the votes for each movie compared to the total number of votes? --
SELECT name,round((round((votes/(select sum(votes) from movies))*100,2)*100),2) from movies;

-- 4) Display all movies name,genre,score and avg score of genre
select name,genre,score,round((select avg(score) from movies m2 where m2.genre = m1.genre),2) as 'avg_score_of genre'from movies m1;

-- SUB-QUERY USING WITH FROM --

-- 5) Display average ratings of all the restaurants --
select r_name, avg_rating from (select r_id, avg(restaurant_rating) as 'avg_rating' from orders group by r_id) t1
join restaurants t2 on t1.r_id=t2.r_id;

-- SUB QUERY USING WITH HAVING --
--  Find genres having avg score > avg score of all the movies ? --

select genre ,round(avg(score),2) from movies
group by genre
having avg(score)>(select avg(score) from movies);

-- SUB-QUERY USING  WITH ISERT --
-- Populate a already created loyal_customers with records of only those customers who have ordered food for more than 3 times --

INSERT INTO sub_query.loyal_customer
(user_id,name)
SELECT t1.user_id,ANY_VALUE(t2.name) AS "name" 
FROM sub_query.orders t1
JOIN sub_query.users t2 ON t1.user_id = t2.user_id
GROUP BY t1.user_id
HAVING count(*)>3;

-- SUB-QUERY USING WITH UPDATE --
update loyal_customer
set money= (select sum(amount) from orders where orders.user_id= loyal_customer.user_id);

-- SUB-QUERY USING WITH DELETE --
--  Delete all the customers records who never ordered ? --

delete from sub_query.users
where user_id in (select user_id from users where user_id not in (select distinct(user_id) from orders));

UPDATE sub_query.users
SET is_deleted = 1
WHERE user_id IN (SELECT user_id FROM users
                   WHERE user_id NOT IN (
                  SELECT DISTINCT(user_id) FROM orders));
DELETE u
FROM sub_query.users AS u
LEFT JOIN orders AS o ON u.user_id = o.user_id
WHERE o.user_id IS NULL;


























