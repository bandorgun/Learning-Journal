-- membuat table teachers
CREATE TABLE teachers (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(25) NOT NULL,
    last_name varchar(50),
    school varchar(50) NOT NULL,
    hire_date date,
    salary numeric
    );
    
-- menambah column age
ALTER table teachers add age int;

-- menghapus column age
alter table teachers drop column age;

-- mengganti tipe data column salary
alter table teachers modify column salary int;

-- mengubah nama teacher menjadi guru
ALTER table teachers rename to guru;

-- ganti lagi
alter table guru rename to teachers;

-- mengisi data ke table teachers
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

-- melihat isi data table teachers
select * from teachers;


-- menghapus semua isi dari table teachers 
truncate table teachers;
select * from teachers;

-- menghapus table teachers
drop table teachers;

-- mengubah salary dari id-3
update teachers
set salary = 50000
where id = 3;


-- menghapus data id 6
delete from teachers
where id=6

SELECT* from teachers;


-- menambah data baru
INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
    VALUES ('Samuel', 'Abbers', 'Standford University', '2006-01-30', 32000),
           ('Jessica', 'Abbers', 'Standford University', '2005-01-30', 33000),
           ('Tom', 'Massi', 'Harvard University', '1999-09-09', 39500),
           ('Esteban', 'Brown', 'MIT', '2007-01-30', 36000),
           ('Carlos', 'Alonso', 'Standford University', '2001-01-30', 44000);

SELECT * from teachers

-- memanggil data keseluruhan berbahaya di perusahaan besar karena bisa abis cpu nya, karenanya kita pilihdemo

-- memanggil isi kolom tertentu
select first_name, last_name, school from teachers

-- melihat dosen yang mengajar di MIT
select * from teachers 
where school= 'mit'

-- melihat dosen yang memiliki gaji diatas 60000
SELECT * 
from teachers
where salary>60000

-- melihat yang mengajar di MIT dan memiliki gaji diatas 60000 
-- pake binary biar case sensitive, kalo diilangin binarynya nggak case sensitive
SELECT *
from teachers
where binary school = 'MIT' and salary >60000


-- mencari dosen yang nama belakangnya abbers atau smith
-- Cara #1: dengan menggunakan or (ingat disini '=' itu sama kyk '==' di python)
select *
from teachers
where last_name= 'abbers' or last_name = 'smith'

-- Cara #2: dengan menggunakan in
SELECT *
from teachers
where last_name in ('abbers', 'smith')

-- melihat jumlah data (disini maksudnya baris) di table teachers
SELECT COUNT(*) 
from teachers;
-- kalo mau presentasinya bagus
SELECT COUNT(*) as jumlah
FROM teachers;
-- kalo mau dikasi spasi 
SELECT COUNT(*) as 'Jumlah Guru'
FROM teachers;


SELECT * 
from teachers

-- Melihat unique value di column schooldemo
SELECT UNIQUE(school) 
FROM teachers
-- cara lain 
SELECT DISTINCT school
FROM teachers;

-- menghitung jumlah unique values di column school 
SELECT count(DISTINCT(school)) as "jumlah unique values"
FROM teachers
-- gabisa pake unique 

-- mengurutkan dosen berdasarkan last_name secara Z-A (descending) dan school secara A-Z (ascending)
SELECT *
from teachers
order by last_name desc, school ASC
























