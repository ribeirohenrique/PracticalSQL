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

---listing 3-1:
create table char_data_types (
    varchar_column varchar(10),
    char_column char(10),
    text_column text
);

insert into char_data_types
values ('abc', 'abc', 'abc'),
       ('defghi', 'defghi', 'defghi');

copy char_data_types to '/home/pi/typetest.txt'
with (format csv, header, delimiter '|');

select * from char_data_types;

---listing 3-2:
create table number_data_types (
    numeric_column numeric(20,5),
    real_column real,
    double_column double precision
);

insert into number_data_types
values (.7, .7, .7),
       (2.13579, 2.13579, 2.13579),
       (2.1357987654, 2.1357987654, 2.1357987654);

select * from number_data_types;

---listing 3-3:
select numeric_column * 10000000 as "Fixed",
       real_column * 10000000 as "Float" from number_data_types where numeric_column = .7;

---listing 3-4:
create table date_time_types (
    timestamp_column timestamp with time zone,
    interval_column interval
);

insert into date_time_types
values ('2018-12-31  01:00 EST', '2 days'),
       ('2018-12-31  01:00 -8', '1 month'),
       ('2018-12-31  01:00 Australia/Melbourne', '1 century'),
       (now(), '1 week');

select * from date_time_types;

---listing 3-5:
select timestamp_column, interval_column,
       timestamp_column - date_time_types.interval_column as new_date from date_time_types;

---listing 3-6:
select timestamp_column, cast(timestamp_column as varchar(10))
from  date_time_types;

select numeric_column,
       cast(numeric_column as integer),
       cast(numeric_column as varchar(6))
from number_data_types;

select cast(char_column as integer) from char_data_types;

---listing 4-1:
---Esse comando copy não funciona se for de uma máquina diferente do host, usei a importação através do Datagrip mesmo
COPY table_name
FROM 'C:\YourDirectory\your_file.csv'
WITH (FORMAT CSV, HEADER);

---listing 4-3:
---Esse comando copy não funciona se for de uma máquina diferente do host, usei a importação através do Datagrip mesmo
COPY us_counties_2010
FROM 'C:\YourDirectory\us_counties_2010.csv'
WITH (FORMAT CSV, HEADER);

SELECT * from us_counties_2010;

SELECT geo_name, state_us_abbreviation, area_land
FROM us_counties_2010
ORDER BY area_land DESC
LIMIT 3;

SELECT geo_name, state_us_abbreviation, internal_point_lon
FROM us_counties_2010
ORDER BY internal_point_lon DESC
LIMIT 5;

---listing 4-4:
CREATE TABLE supervisor_salaries (
town varchar(30),
county varchar(30),
supervisor varchar(30),
start_date date,
salary money,
benefits money
);

---listing 4-5:
---Esse comando copy não funciona se for de uma máquina diferente do host, usei a importação através do Datagrip mesmo
COPY supervisor_salaries (town, supervisor, salary)
FROM 'C:\YourDirectory\supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);

select * from supervisor_salaries;

DELETE FROM supervisor_salaries;

---listing 4-6:
---Esse comando copy não funciona se for de uma máquina diferente do host, usei a importação através do Datagrip mesmo
CREATE TEMPORARY TABLE supervisor_salaries_temp (LIKE supervisor_salaries);

COPY supervisor_salaries_temp (town, supervisor, salary)
FROM 'D:\Desenvolvimento\practical-sql\Chapter_04\supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);

INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, 'Some County', supervisor, salary FROM supervisor_salaries_temp;

drop table supervisor_salaries_temp;

---listing 4-7:
---Esse comando copy não funciona se for de uma máquina diferente do host, usei a importação através do Datagrip mesmo
COPY us_counties_2010
TO 'D:\Desenvolvimento\supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER, DELIMITER '|');