--1  SELECT * FROM countries WHERE name = ‘string’;
CREATE INDEX country_name_idx ON countries(name);

--2 SELECT * FROM employees WHERE name = ‘string’ AND surname = ‘string’;
CREATE INDEX country_name_surname_idx ON employees(first_name, last_name);

--3 SELECT * FROM employees WHERE salary < value1 AND salary > value2;
CREATE UNIQUE INDEX salary_idx ON employees(salary);

--4 SELECT * FROM employees WHERE substring(name from 1 for 4) = ‘abcd’;
CREATE INDEX employees_substr_name_idx ON employees(substring(first_name from 1 for 4));

--5 SELECT * FROM employees e JOIN departments d
--  ON d.department_id = e.department_id WHERE
--  d.budget > value2 AND e.salary < value2;
CREATE INDEX e_salary_d_id ON employees(department_id, salary);
CREATE INDEX d_budget_d_id ON departments(department_id,budget);