CREATE TABLE teachers (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(25) NOT NULL,
    last_name varchar(50),
    school varchar(50) NOT NULL,
    hire_date date,
    salary numeric
    );

INSERT INTO teachers (id,first_name, last_name, school, hire_date, salary)
    VALUES (1,'Janet', 'Smith', 'MIT', '2011-10-30', 36200),
           (2,'Lee', 'Reynolds', 'MIT', '1993-05-22', 65000),
           (3,'Samuel', 'Cole', 'Cambridge University', '2005-08-01', 43500),
           (4,'Samantha', 'Bush', 'Cambridge University', '2011-10-30', 36200),
           (5,'Betty', 'Diaz', 'Cambridge University', '2005-08-30', 43500),
           (6,'Kathleen', 'Roush', 'MIT', '2010-10-22', 38500),
           (7,'James', 'Diaz', 'Harvard University', '2003-07-18', 61000),
           (8,'Zack', 'Smith', 'Harvard University', '2000-12-29', 55500),
           (9,'Luis', 'Gonzales', 'Standford University', '2002-12-01', 50000),
           (10,'Frank', 'Abbers', 'Standford University', '1999-01-30', 66000);

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
    VALUES ('Samuel', 'Abbers', 'Standford University', '2006-01-30', 32000),
           ('Jessica', 'Abbers', 'Standford University', '2005-01-30', 33000),
           ('Tom', 'Massi', 'Harvard University', '1999-09-09', 39500),
           ('Esteban', 'Brown', 'MIT', '2007-01-30', 36000),
           ('Carlos', 'Alonso', 'Standford University', '2001-01-30', 44000);

CREATE TABLE courses (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(20),
    teachers_id INT,
    total_students INT
    );
           
 INSERT INTO courses (name, teachers_id, total_students)
    VALUES  ('Calculus', 2, 20),
            ('Physics', 2, 10),
            ('Calculus', 1, 30),
            ('Computer Science', 1, 20),
            ('Politic', 13, 15),
            ('Algebra', 2, 10),
            ('Algebra', 13, 30),
            ('Computer Science', 10, 35),
            ('Life Science', 11, 20),
            ('Chemistry', 9, 22),
            ('Chemistry', 8, 16),
            ('Calculus', 5, 19),
            ('Politic', 4, 17),
            ('Biology', 6, 22),
            ('Physics', 3, 29),
            ('Biology', 8, 28),
            ('Calculus', 12, 34),
            ('Physics', 13, 34),
            ('Biology', 14, 25),
            ('Calculus', 15, 20);
            
SELECT COUNT(*) as 'jumlah teachers'
from teachers;

SELECT count(*) as 'jumlah courses'
FROM courses;

select *
from teachers




-- melihat dosen yang salarynya >50000 
select *
from teachers 
where salary > 50000

-- menghitung dosen yang salarynya >50000 
select count(*) as 'Jumlah dosen dengan gaji >50000'
from teachers 
where salary > 50000


-- melihat dosen dengan first name berawalan sam 
SELECT * 
FROM teachers
WHERE first_name like "sam%";

-- melihat dosen dengan first name berakhiran sam 
SELECT * 
FROM teachers
WHERE first_name like "%sam";

-- melihat dosen yang first_name mengandung 'sam':
SELECT *
from teachers
WHERE first_name like '%sam%' 

-- melihat gaji dosen tertinggi
SELECT MAX(salary)
from teachers


-- melihat gaji dosen rata-rata, bulat keatas, bulat kebawah
SELECT AVG(salary), ceil(Avg(salary)), floor(avg(salary))
from teachers


-- melihat dosen yang memiliki gaji tertinggi
-- cara salah #1: max gabisa di gabung sama klausa where
SELECT first_name, last_name
FROM teachers
where salary = max(salary)
-- cara benar, pake subquery, tinggal dari logika awal max nya dibuat select lagi
SELECT first_name, last_name
FROM teachers
WHERE salary = (
  SELECT MAX(salary)
  from teachers
)
-- cara salah #2: salah karena first name dan last name nya yang ditampilin adalah yang muncul pertama, nama tidak sesuai
SELECT first_name, last_name, max(salary)
from teachers


-- melihat gaji tertinggi di setiap universitas
SELECT school as universitas, max(salary) as 'gaji tertinggi'
FROM teachers
group by school

-- melihat dosen yang memiliki gaji tertinggi di setiap universitas 
SELECT first_name, last_name, school as universitas,  salary as gaji
FROM teachers
WHERE salary in (
  SELECT max(salary)
  FROM teachers
  group by school
  )
-- diatas itu yang gua buat, dibawah ini yang dikasitau instruktur, dapetnya sama, tapi caranya beda, gua gangerti kenapa 
SELECT first_name, last_name, school as universitas,  salary as gaji
FROM teachers
WHERE (school, salary) in (
  SELECT school, max(salary)
  FROM teachers
  group by school
  )

-- menggabungkan table teachers dengan table courses
-- ingat join itu ada inner join, left join, right join, dan outer join 
-- kalo kita tulis join defaultnya adalah inner join
SELECT *
from teachers
join courses on teachers.id = courses.teachers_id

SELECT *
from courses

-- melihat dosen yang mengajar calculus 
SELECT *
from teachers
join courses on teachers.id = courses.teachers_id
where courses.name = 'calculus'


-- melihat jumlah mata kuliah di setiap universitas
SELECT teachers.school as universitas, COUNT(courses.name) as 'total matkul'
from teachers
join courses on teachers.id = courses.teachers_id
group by teachers.school

-- melihat universitas apa saja yang total mata kuliahnya lebih dari 3
SELECT teachers.school as universitas, COUNT(courses.name) as 'total matkul'
from teachers
join courses on teachers.id = courses.teachers_id
group by teachers.school
having COUNT(courses.name) >3
-- karena where gabisa dikasih fungsi statistika dibelakangnya makanya pake having
-- bisa juga courses name nya diganti sama nama di 'as' nya kyk dibawah ini: 
SELECT teachers.school as universitas, COUNT(courses.name) as total_matkul
from teachers
join courses on teachers.id = courses.teachers_id
group by universitas
having total_matkul >3
-- ato sebenernya kalo mau pake where bisa juga kalo di subquery--> gabisa deng
SELECT teachers.school as universitas, COUNT(courses.name) as 'total matkul'
from teachers
join courses on teachers.id = courses.teachers_id
where (teachers.school, courses.name) in (
  SELECT COUNT(courses.name) >3
  FROM courses
  group by teachers.school
  )
-- program diatas ini gabisa jalan


-- melihat first_name beserta jumlah mata kuliah yang diajarkan dan diurutkan secara ascending berdasarkan jumlahnya
SELECT teachers.first_name, COUNT(courses.name)
from teachers
join courses on teachers.id = courses.teachers_id
group by teachers.first_name
order by COUNT(courses.name) ASC


PART BIG QUERY GOOGLE CLOUD

-- Melihat tindak kejahatan di chicago yang terjadi di street
SELECT * 
FROM `bigquery-public-data.chicago_crime.crime` 
where location_description = 'STREET'
LIMIT 1000

-- melihat jenis tindakan kejahatan di chicago yang unique beserta jumlahnya dan diurutkan dari kejahatan terbanyak hingga terkecil
select primary_type, count(primary_type) as jumlah_crime
from `bigquery-public-data.chicago_crime.crime` 
group by primary_type
order by count(primary_type) desc
-- berarti ketika kita group by, masing-masing grup masih menyimpan seluruh datanya, hanya penampilannya aja satu-satu, dan kalo kita count apa pun akan ditampilin per group nya





