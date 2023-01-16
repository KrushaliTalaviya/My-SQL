-- Create an “employee” database and 4 tables (hobby, employee, employee_salary, employee_hobby).
CREATE TABLE hobby(
	id INT NOT NULL AUTO_InCREMENT PRIMARY KEY,
    	name VARCHAR(255) NOT NULL
);

CREATE TABLE employee (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR ( 30 ),
	last_name VARCHAR ( 30 ),
    	age INT,
    	mobile_number VARCHAR(12),
    	address VARCHAR(100)
);

CREATE TABLE employee_salary (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    	salary DOUBLE NOT NULL,
    	date DATE NOT NULL,
    	fk_employee_id INT NOT NULL,
    	FOREIGN KEY ( fk_employee_id ) REFERENCES employee(id)
);

CREATE TABLE employee_hobby ( 
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fk_employee_id INT,
	fk_hobby_id INT,
	FOREIGN KEY ( fk_employee_id ) REFERENCES employee(id),
	FOREIGN KEY ( fk_hobby_id ) REFERENCES hobby(id)
);
    