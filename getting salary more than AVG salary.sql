CREATE TABLE emp_ (
    name VARCHAR(50),
    salary INT,
    dept_id INT
);

INSERT INTO emp_ (name, salary, dept_id) VALUES
('A', 3000, 1),
('B', 4000, 1),
('C', 2500, 1),
('D', 5000, 2),
('E', 3500, 2),
('F', 2000, 2),
('G', 7000, 3),
('H', 6000, 3);


SELECT name, salary, dept_id
FROM (
    SELECT 
        name, 
        salary, 
        dept_id, 
        AVG(salary) OVER (PARTITION BY dept_id) AS avg_salary
    FROM emp_
) AS sub_table
WHERE salary > avg_salary;
