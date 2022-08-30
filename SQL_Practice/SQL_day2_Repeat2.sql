CREATE TABLE workers1
(
  id int,
  name varchar(20),
  title varchar(60),
  manager_id int
);
INSERT INTO workers1 VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers1 VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers1 VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers1 VALUES(4, 'Amy Sky', 'CEO', 5);
select * from workers1;

-- 1) Tabloya company_industry isminde sütun ekleyiniz
-- ekelemelerde alter ile basliyoruz
Alter table workers1 add company_industry varchar(20);

-- 2) TABLOYA worker_address sütunu ve defaullt olarakta 'Miami, FL, USA' adresini ekleyiniz.
alter table workers1 add worker_address varchar(100) default 'Maimi, FL, USA';

-- 3) tablodaki worker_address sütununu siliniz
alter table workers1 drop column worker_address;

-- 4)Tablodaki company_industry sütununu, company_profession olarak değiştiriniz. 
alter table workers1 rename column company_industry to company_profession;

-- 5) Tablonun ismini employees1 olarak değişitiriniz.
alter table workers1 rename to employees1;

--6) Tablodaki title sütununa data tipini VARCHAR(50) olarak değiştiriniz.
alter table employees1 alter column title type varchar(50);

-- 7) Tablodaki title sütununa "UNIQUE" kıstlaması ekleyiniz.
alter table employees1  add constraint title_new unique(title); 

-- hangi degeri unique yapmak istiyorsak onu ()icine yazmak gerekiyor
select * from employees1;













































