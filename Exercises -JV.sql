show databases;
use mydb;
show tables;
select * from employees, company, distributor;
select * from employees;
select * from company;
select * from company_address;
select * from distributor;


-- rename client table into clients table
RENAME TABLE client to clients;

-- update the age of client into 60 with the client ID of 1
UPDATE clients
SET client_age = 60
WHERE client_id = 1;

-- add 2 clients with info in clients table
INSERT INTO clients (client_id, client_name, client_age, client_address)
			VALUES 	( 5, 'Jess', 18 , 'Argao'),
					( 6, 'Ann', 21 , 'Toledo'),
                    ( 7, 'Shane', 28 , 'Consolacion');
            
-- delete client info of which client ID is last ID-numbercompany_name
DELETE FROM clients WHERE client_id = 7;



-- add new column in company table named company_address
ALTER TABLE mydb.company
ADD COLUMN company_address VARCHAR(100);

-- add address value to company named ripeconcepts in company table
UPDATE mydb.company
SET company_address = 'Ayala Tower, Cebu City'
WHERE company_name = 'ripeconcepts';

-- update company location value to country 
UPDATE mydb.company
SET company_location = 'India'
WHERE company_id = 3;

-- add new company with values to company table
INSERT INTO mydb.company (company_name , company_id, company_location, company_address)
	VALUES ('Amazon', last_insert_id(), 'USA', 'California');
    
ALTER TABLE employees CHANGE client_id employee_id INT(50);
ALTER TABLE employees CHANGE client_name employee_name varchar(100);
ALTER TABLE employees CHANGE client_age employee_age varchar(100);
ALTER TABLE employees CHANGE client_address employee_address varchar(200);

RENAME TABLE employees TO employee;
ALTER TABLE customers CHANGE dis_name customer_name varchar(100);
ALTER TABLE customers CHANGE dis_location customer_location varchar(200);

-- join all tables
SELECT * 
FROM employee, company, customers;


select * 
from employee
join company USING (company_id)
order by employee_id; 

SELECT e.employee_name AS name, e.employee_id AS ID
FROM employee e
WHERE employee_id = 1
UNION
SELECT c.customer_name, c.customer_ID 
FROM customers c
WHERE customer_id = 1;


UPDATE customers 
SET customer_name = 'Lady Gaga'
where customer_id = 3;

INSERT INTO mydb.customers (customer_id, customer_name, customer_location, employee_id)
	values (8, 'Jeff Bezos', 'USA', 2), (9, 'Jerry Lim', 'Canada', 1);

ALTER TABLE employee DROP phone;
ALTER TABLE employee ADD phone INT;
---------------------------------------------------------------
SELECT * FROM company, customers, employee;
SELECT * FROM company;
SELECT * FROM employee;
SELECT * FROM customers;

SELECT e.employee_id, employee_name, employee_phone,
		company_id, company_name, company_address, 
		customer_id, customer_name, customer_location
FROM employee e
JOIN company c using (company_id)
LEFT JOIN customers r ON (r.employee_id = e.employee_id)
WHERE r.employee_id IS NOT NULL;


select * from company 
-- where company_address is not null
union 
select * from customers ;
