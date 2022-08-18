SELECT em.emp_no, em.first_name, em.last_name,
ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as em
LEFT JOIN titles as ti

ON em.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.emp_no) DESC;

SELECT * FROM retiring_titles;


SELECT DISTINCT ON (emp_no)
et.emp_no, et.first_name, et.last_name, et.birth_date,
de.from_date, de.to_date, ti.title
INTO mentorship_eligibility_inital
FROM employees as et
LEFT JOIN dept_emp as de
ON (et.emp_no = de.emp_no)
LEFT JOIN titles as ti
ON (et.emp_no = ti.emp_no)
ORDER BY emp_no;

SELECT *
INTO mentorship_eligibility
FROM mentorship_eligibility_inital
WHERE (to_date = '9999-01-01') AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibility;

