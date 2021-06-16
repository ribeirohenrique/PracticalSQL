---listing 1-1:
CREATE DATABASE analysis;

---listing 1-2:
CREATE TABLE teachers (
id bigserial,
first_name varchar(25),
last_name varchar(50),
school varchar(50),
hire_date date,
salary numeric
);

---listing 1-3:
INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);

---listing 2-1:
select * from teachers;

---listing 2-2:
select last_name, first_name, salary from teachers;

---listing 2-3:
select distinct school from teachers;

---listing 2-4:
select distinct school, salary from teachers;

---listing 2-5:
---Este pode ter o parâmetro DESC ou ASC de descendente ou ascendente.
select first_name, last_name, salary from teachers order by salary desc;

---listing 2-6:
---É possível ordernar por mais de uma coluna, mas atenção pois várias colunas podem gerar confusão no entendimento
select last_name, school, hire_date from teachers order by school asc, hire_date desc;

---listing 2-7:
select last_name, school, hire_date from teachers where school = 'Myers Middle School';

select first_name, last_name, school from teachers where first_name = 'Janet';

select school from teachers where school != 'F.D. Roosevelt HS';

select first_name, last_name, hire_date from teachers where hire_date < '2000-01-01';

select first_name, last_name, salary from teachers where salary >= 43500;

select first_name, last_name, school, salary from teachers where salary between 40000 and 65000;

---listing 2-8:
select first_name from teachers where first_name like 'sam%';

select first_name from teachers where first_name ilike 'sam%';

---listing 2-9:
select * from teachers where school = 'Myers Middle School' and salary < 40000;

select * from teachers where last_name = 'Cole' or last_name = 'Bush';

select * from teachers where school = 'F.D. Roosevelt HS' and (salary < 38000 or salary > 40000);

---listing 2.10:
select first_name, last_name, school, hire_date, salary from teachers where school like '%Roos%' order by hire_date desc;

---Try it Yourself - Chapter 2
select first_name, last_name, school from teachers order by school asc, last_name asc;

select first_name, last_name, salary from teachers where first_name like '%S%' and salary > 40000;

select first_name, last_name, salary, hire_date from teachers where hire_date > '2010-01-01' order by salary desc;