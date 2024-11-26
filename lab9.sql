CREATE DATABASE lab9;

CREATE OR REPLACE FUNCTION increase_value(input_value INTEGER)
RETURNS INTEGER AS $$
BEGIN
    RETURN input_value + 10;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION compare_numbers(num1 INTEGER, num2 INTEGER)
RETURNS TEXT AS $$
BEGIN
    IF num1 > num2 THEN
        RETURN 'Greater';
    ELSIF num1 = num2 THEN
        RETURN 'Equal';
    ELSE
        RETURN 'Lesser';
    END IF;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION number_series(n INTEGER)
RETURNS TEXT AS $$
DECLARE
    series TEXT := '';
    i INTEGER := 1;
BEGIN
    WHILE i <= n LOOP
        series := series || i || CASE WHEN i < n THEN ', ' ELSE '' END;
        i := i + 1;
    END LOOP;
    RETURN series;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION find_employee(emp_name VARCHAR)
RETURNS TABLE(emp_id INT, name VARCHAR, department VARCHAR, salary DECIMAL) AS $$
BEGIN
    RETURN QUERY SELECT * FROM employees WHERE name = emp_name;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION list_products(category_name VARCHAR)
RETURNS TABLE(product_id INT, product_name VARCHAR, category VARCHAR, price DECIMAL) AS $$
BEGIN
    RETURN QUERY SELECT * FROM products WHERE category = category_name;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION calculate_bonus(emp_id INTEGER)
RETURNS DECIMAL AS $$
DECLARE
    salary DECIMAL;
    bonus DECIMAL;
BEGIN
    SELECT emp_salary INTO salary FROM employees WHERE id = emp_id;
    bonus := salary * 0.10;
    RETURN bonus;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION update_salary(emp_id INTEGER)
RETURNS VOID AS $$
DECLARE
    bonus DECIMAL;
BEGIN
    bonus := calculate_bonus(emp_id);
    UPDATE employees SET emp_salary = emp_salary + bonus WHERE id = emp_id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION complex_calculation(num1 INTEGER, str1 VARCHAR)
RETURNS TEXT AS $$
DECLARE
    numeric_result INTEGER;
    string_result TEXT;
BEGIN
    -- Numeric calculation
    numeric_result := num1 * 2;

    -- String manipulation
    string_result := 'Hello, ' || str1;

    -- Combine results
    RETURN string_result || ' - Calculation Result: ' || numeric_result;
END;
$$ LANGUAGE plpgsql;