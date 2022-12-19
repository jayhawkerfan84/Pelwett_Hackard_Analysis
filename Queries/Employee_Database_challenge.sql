drop table if exists mentor
drop table if exists retire
drop table if exists unique_titles


--deliverable 1
select e.emp_no, e.first_name, e.last_name, t.title, t.from_date,t.to_date
into retire
from employees e inner join titles t on t.emp_no = e.emp_no
where e.birth_date between '1952-01-01' and '1955-12-31'
order by e.emp_no asc

select distinct emp_no, first_name,last_name, title 
into unique_titles
from retire
where to_date = '9999-01-01'
order by emp_no asc


select count(*), title from unique_titles
group by title 
order by count desc

select distinct on (e.emp_no) e.emp_no, e.first_name ,e.last_name,e.birth_date,dp.from_date,dp.to_date,t.title
into mentor
from employees e inner join dept_emp dp on dp.emp_no = e.emp_no
inner join titles t on t.emp_no = e.emp_no
where dp.to_date = '9999-01-01'
and e.birth_date between '1965-01-01' and '1965-12-31'
order by e.emp_no asc

select * from employees