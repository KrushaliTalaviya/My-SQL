-- Create an “employee” database and 4 tables (hobby, employee, employee_salary, employee_hobby).
CREATE TABLE hobby (
	id INT NOT NULL AUTO_InCREMENT PRIMARY KEY,
    	name VARCHAR(30) NOT NULL
);

CREATE TABLE employee (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR ( 30 ),
	last_name VARCHAR ( 30 ),
    	age INT,
    	mobile_number VARCHAR(17),
    	address VARCHAR(100)
);

CREATE TABLE employee_salary (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    	salary DOUBLE NOT NULL,
    	DATE DATE NOT NULL,
    	fk_employee_id INT NOT NULL,
    	FOREIGN KEY (fk_employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_hobby ( 
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fk_employee_id INT,
	fk_hobby_id INT,
	FOREIGN KEY (fk_employee_id) REFERENCES employee(id),
	FOREIGN KEY (fk_hobby_id) REFERENCES hobby(id)
);
    

-- Insert multiple data in all tables
INSERT INTO hobby (name)
VALUES ("Cricket");

INSERT INTO hobby (NAME)
VALUES ("Volly-ball");

INSERT INTO hobby (NAME)
VALUES ("Kho-Kho");

INSERT INTO employee (first_name, last_name, age, mobile_number, address)
VALUES ("Krushali", "Talaviya", 20, "7226050295", "Nikol,Ahmedabad");

INSERT INTO employee (first_name, last_name, age, mobile_number, address)
VALUES ("Nirali", "Talaviya", 24, "8238779057", "Bapunagar,Ahmedabad");

INSERT INTO employee (first_name, last_name, age, mobile_number, address)
VALUES ("Vraj", "Talaviya", 11, "9879934410", "Thakkarnagar,Ahmedabad");

INSERT INTO employee_salary (salary, DATE, fk_employee_id)
VALUES (15000, CURDATE(), 1);

INSERT INTO employee_salary (salary, DATE, fk_employee_id)
VALUES (50000, DATE_ADD(CURDATE(), INTERVAL 10 DAY), 2);

INSERT INTO employee_salary (salary, DATE, fk_employee_id)
VALUES (10000, "2022-02-12", 3);

INSERT INTO employee_salary (salary, DATE, fk_employee_id)
VALUES (40000, "2023-02-19", 1);

INSERT INTO employee_salary (salary, DATE, fk_employee_id)
VALUES (70000, "2023-02-28", 2);

INSERT INTO employee_salary (salary, DATE, fk_employee_id)
VALUES (20000, "2022-03-12", 3);

INSERT INTO employee_hobby (fk_employee_id, fk_hobby_id)
VALUES (1, 2);

INSERT INTO employee_hobby (fk_employee_id, fk_hobby_id)
VALUES (2, 3);

INSERT INTO employee_hobby (fk_employee_id, fk_hobby_id)
VALUES (3, 1);

INSERT INTO employee_hobby (fk_employee_id, fk_hobby_id)
VALUES (2, 2);

INSERT INTO employee_hobby (fk_employee_id, fk_hobby_id)
VALUES (3, 3);

INSERT INTO employee_hobby (fk_employee_id, fk_hobby_id)
VALUES (3, 2);

-- Update data of all tables

UPDATE hobby
SET NAME = "Chess"
WHERE id = 1;

UPDATE employee
SET first_name = "Apurva"
WHERE id = 1;

UPDATE employee_salary
SET salary = 17000 
WHERE id = 1;

UPDATE employee_hobby
SET fk_employee_id = 1
WHERE id = 3;	

-- Delete 2 records of all tables

DELETE FROM employee_hobby
WHERE id > 1;

DELETE FROM employee_salary
WHERE id > 1;

DELETE FROM employee
WHERE id > 1;

DELETE FROM hobby
WHERE id = 2;

-- Truncate all tables

TRUNCATE TABLE employee_hobby;

TRUNCATE TABLE employee_salary;

TRUNCATE TABLE employee;

TRUNCATE TABLE hobby;

-- Create a separate select queries to get a hobby, employee, employee_salary, employee_hobby

SELECT * FROM hobby;

SELECT * FROM employee;

SELECT * FROM employee_hobby;

SELECT * FROM employee_salary;

-- Create a select single query to get all employee name, all hobby_name in single column

SELECT name FROM hobby
UNION ALL
SELECT CONCAT (first_name, " ", last_name) AS employee_name FROM employee

-- Create a select query to get  employee name, his/her employee_salary

SELECT CONCAT (first_name, " ", last_name) AS employee_name, es.salary AS employee_salary
FROM employee e
INNER JOIN employee_salary es ON e.id = es.fk_employee_id;

-- Create a select query to get employee name, total salary of employee, hobby name(comma-separated - you need to use subquery for hobby name).

SELECT CONCAT(first_name," ",last_name) AS employee_name ,SUM(es.salary) AS total_salary,
(
SELECT h.name FROM  hobby h 
INNER JOIN employee_hobby eh 
ON eh.fk_hobby_id = h.id
 )
AS hobby_name FROM employee e
INNER JOIN employee_salary es ON es.fk_employee_id = e.id
GROUP BY e.id;
