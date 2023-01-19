CREATE TABLE job (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(30),	
	min_salary DOUBLE NOT NULL,
	max_salary DOUBLE NOT NULL
);

CREATE TABLE country (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	country VARCHAR(30)
);

CREATE TABLE department (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(30),
	fk_country_id INT,
	FOREIGN KEY (fk_country_id) REFERENCES country(id)
);

CREATE TABLE employee (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(30),
	lastname VARCHAR(30),
	email VARCHAR(50),
	salary DOUBLE,
	fk_department_id INT,
	fk_job_id INT
);

1. get name (firstname + lastname), department name, country name, job name

SELECT CONCAT(e.firstname, " ", e.lastname) AS getname, j.name AS jobname, c.country AS countryname, d.name AS departmentname
FROM employee e, job j,country c,department d
WHERE e.fk_job_id = j.id AND e.fk_department_id = d.id AND d.fk_country_id = c.id;

2. Get 2nd highest salary of the employee

SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee);

3. Get all job name and department name in single query

SELECT j.name FROM job j
UNION
SELECT d.name FROM department d;
