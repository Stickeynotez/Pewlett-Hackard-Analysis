SELECT e.emp_no,
	e.first_name, 
	e.last_name, 
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name, 
	e.last_name, 
	t.title
INTO unique_titles
FROM employees AS e
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (to_date = '9999-01-01')
ORDER BY emp_no;

SELECT COUNT(title)
FROM unique_titles;

SELECT * FROM unique_titles;


SELECT COUNT(u.title), u.title
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT DESC;

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date,
	t.title
-- INTO mentorship_eligibility
FROM employees AS e
INNER JOIN department_employees AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
	
select* from employees;