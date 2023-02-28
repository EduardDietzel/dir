SELECT * FROM hr.employees WHERE department_id = 90;
SELECT employee_id, first_name, last_name, department_id FROM hr.employees WHERE department_id = 90;

SELECT * FROM hr.employees WHERE salary > 5000;
SELECT employee_id, first_name, last_name, salary, department_id FROM hr.employees WHERE salary > 5000;

SELECT * FROM hr.employees WHERE job_id like 'FI_ACCOUNT' && salary < 8000;
SELECT * FROM hr.employees WHERE job_id IN ('FI_ACCOUNT') && salary < 8000;

SELECT * FROM hr.employees WHERE last_name LIKE '%ll%' OR last_name LIKE '%kk%';

SELECT * FROM hr.employees WHERE commission_pct is NULL;

SELECT * FROM hr.employees WHERE department_id <> 80 && department_id <> 110;

SELECT * FROM hr.employees WHERE 5000 <= salary && salary <= 7000;