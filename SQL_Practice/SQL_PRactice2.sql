CREATE TABLE workers
(
  id int,
  name varchar(20),
  title varchar(60),
  manager_id int
);
INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);
select * from workers;

-- 1) Tabloya company_industry isminde sütun ekleyiniz
-- ekelemelerde alter ile basliyoruz
alter table workers add company_industry varchar(30);

-- 2) TABLOYA worker_address sütunu ve defaullt olarakta 'Miami, FL, USA' adresini ekleyiniz.
alter table workers add column worker_address varchar(100) default('Maimi','FL','USA');
alter table workers add worker_address varchar(100) default 'Maimi,FL,USA';

-- 3) tablodaki worker_address sütununu siliniz
alter table workers drop column worker_address;

-- 4)Tablodaki company_industry sütununu, company_profession olarak değiştiriniz.
alter table workers rename column company_industry to company_profession;

-- 5) Tablonun ismini employees olarak değişitiriniz.
alter table workers rename to employees;
select * from employees;

--6) Tablodaki title sütununa data tipini VARCHAR(50) olarak değiştiriniz.
alter table employees alter title type varchar(50);

-- 7) Tablodaki title sütununa "UNIQUE" kıstlaması ekleyiniz.
alter table employees add constraint title unique(title); 
