create database techcorp;

create table Products (
	product_id int auto_increment primary key,
    product_name varchar(100) not null,
    category varchar(50),
    price decimal(10,2),
    stock_quantity int
    );
    
select * from Products;

create table Customers (
	customer_id int auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(50) unique,
    phone varchar(20),
    address varchar(200)
);

select * from Customers;

create table Orders (
	order_id int auto_increment primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2),
    foreign key (customer_id) references Customers(customer_id)
);

select * from Orders;

create table OrderDetails (
	order_detail_id int auto_increment primary key,
    order_id int,
    product_id int,
    quantity int,
    unit_price int,
    foreign key (order_id) references Orders(order_id),
    foreign key (product_id) references Products(product_id)
);

select * from OrderDetails;

create table Employees (
	employee_id int auto_increment primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(100),
    phone varchar(20),
    hire_date date,
    department varchar(50)
);

select * from Employees;

create table SupportTickets (
	ticket_id int auto_increment primary key,
    customer_id int,
    employee_id int,
    issue text,
    status varchar(20),
    created_at datetime,
    resolved_at datetime,
    foreign key (customer_id) references Customers(customer_id),
    foreign key (employee_id) references Employees(employee_id)
);

select * from SupportTickets;

select* from Products;
alter table Products add column discount decimal(5,2) default 0;



INSERT INTO Products (product_name, category, price, stock_quantity, discount)
VALUES
('Laptop Pro 15', 'Laptop', 1500.00, 100, 0),
('Smartphone X', 'Smartphone', 800.00, 200, 0),
('Wireless Mouse', 'Accessories', 25.00, 500, 0),
('USB-C Charger', 'Accessories', 20.00, 300, 0),
('Gaming Laptop', 'Laptop', 2000.00, 50, 10),
('Budget Smartphone', 'Smartphone', 300.00, 150, 5),
('Noise Cancelling Headphones', 'Accessories', 150.00, 120, 15),
('Wireless Earphones', 'Accessories', 100.00, 100, 10);

select * from Products;

INSERT INTO Customers (first_name, last_name, email, phone, address)
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm Street'),
('Jane', 'Smith', 'jane.smith@example.com', '123-456-7891', '456 Oak Street'),
('Emily', 'Johnson', 'emily.johnson@example.com', '123-456-7892', '789 Pine Street'),
('Michael', 'Brown', 'michael.brown@example.com', '123-456-7893', '101 Maple Street'),
('Sarah', 'Davis', 'sarah.davis@example.com', '123-456-7894', '202 Birch Street');

select * from Customers;

INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
(1, '2023-07-01', 1525.00),
(2, '2023-07-02', 820.00),
(3, '2023-07-03', 25.00),
(1, '2023-07-04', 2010.00),
(4, '2023-07-05', 300.00),
(2, '2023-07-06', 315.00),
(5, '2023-07-07', 165.00);

select * from Orders;

INSERT INTO OrderDetails (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 1500.00),
(1, 3, 1, 25.00),
(2, 2, 1, 800.00),
(2, 4, 1, 20.00),
(3, 3, 1, 25.00),
(4, 5, 1, 2000.00),
(4, 6, 1, 10.00),
(5, 6, 1, 300.00),
(6, 6, 1, 300.00),
(7, 7, 1, 150.00),
(7, 4, 1, 15.00);

select * from OrderDetails;

INSERT INTO Employees (first_name, last_name, email, phone, hire_date, department)
VALUES
('Alice', 'Williams', 'alice.williams@example.com', '123-456-7895', '2022-01-15', 'Support'),
('Bob', 'Miller', 'bob.miller@example.com', '123-456-7896', '2022-02-20', 'Sales'),
('Charlie', 'Wilson', 'charlie.wilson@example.com', '123-456-7897', '2022-03-25', 'Development'),
('David', 'Moore', 'david.moore@example.com', '123-456-7898', '2022-04-30', 'Support'),
('Eve', 'Taylor', 'eve.taylor@example.com', '123-456-7899', '2022-05-10', 'Sales');

select * from Employees;

INSERT INTO SupportTickets (customer_id, employee_id, issue, status, created_at, resolved_at)
VALUES
(1, 1, 'Cannot connect to Wi-Fi', 'resolved', '2023-07-01 10:00:00', '2023-07-01 11:00:00'),
(2, 1, 'Screen flickering', 'resolved', '2023-07-02 12:00:00', '2023-07-02 13:00:00'),
(3, 1, 'Battery drains quickly', 'open', '2023-07-03 14:00:00', NULL),
(4, 2, 'Late delivery', 'resolved', '2023-07-04 15:00:00', '2023-07-04 16:00:00'),
(5, 2, 'Damaged product', 'open', '2023-07-05 17:00:00', NULL),
(1, 3, 'Software issue', 'resolved', '2023-07-06 18:00:00', '2023-07-06 19:00:00'),
(2, 3, 'Bluetooth connectivity issue', 'resolved', '2023-07-07 20:00:00', '2023-07-07 21:00:00'),
(5, 4, 'Account issue', 'open', '2023-07-08 22:00:00', NULL),
(3, 4, 'Payment issue', 'resolved', '2023-07-09 23:00:00', '2023-07-09 23:30:00'),
(4, 5, 'Physical damage', 'open', '2023-07-10 08:00:00', NULL),
(4, 1, 'Laptop blue screen', 'resolved', '2024-01-05 10:00:00', '2024-02-05 12:00:00'),
(5, 1, 'Laptop lagging', 'resolved', '2024-01-06 10:00:00', '2024-01-25 12:00:00'),
(3, 1, 'Some part of laptop broken', 'resolved', '2024-02-05 10:00:00', '2024-03-05 12:00:00');

select * from SupportTickets;



-- 1.top 3 customers based on orders
select
c.first_name,
c.last_name,
sum(total_amount) as total_order_amount
from customers as c
join orders o on o.customer_id = c.customer_id
group by c.customer_id
order by total_order_amount desc
limit 3;

-- 2. average order value for each customer
select
c.first_name,
c.last_name,
avg(total_amount) as average_order
from customers c
join orders o on o.customer_id = c.customer_id
group by c.customer_id;

-- 3. employees with >4 resolved ticket support
select
e.first_name,
e.last_name,
count(s.ticket_id) as ticket_support
from employees e
join supporttickets s on e.employee_id = s.employee_id
where s.status = 'resolved'
group by e.employee_id
having count(s.ticket_id) >4;

-- 4. products that have never been ordered
select p.product_name
from products p
left join orderdetails od on od.product_id = p.product_id
where od.order_id is null;

-- 5. calculate total revenue generated from product sales
select
sum(quantity*unit_price)
from orderdetails;

-- 6. find the average price for each category and list categories with an average price higher than $500
with cte_avg_price as (
select 
category, avg(price) as rerata
from products
group by category
)
select * 
from cte_avg_price
where rerata > 500;

-- 7. find customers who have placed at least one order with a total amount greater than $1000
select *
from customers
where customer_id in
(select
customer_id
from orders
where total_amount >1000
);

SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
WHERE o.total_amount > 1000;