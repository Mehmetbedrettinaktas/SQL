-- GROUP BY -- HAVING --
/*
HAVING ifadesinin islevi where ifadesininkine cok benziyor. Ancak kumeleme fonksiyonlari ile 
WHERE ifadsi birlikte kullanilmadiginda HAVING ifadesine ihtiyac duyulmustur
GROUP BY ile kullenilir. Gruplamadan sonraki sart icin GROUP BY dan sonra HAVING kullanilir

*/

--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke, round(avg(maas)) as maas_ortelamasi from personel1  -- as ile gecici stun olusturduk
where cinsiyet='E' -- yalniz erkek olanlari getir
group by ulke  -- ulkeye gore grupla
having avg(maas)>3000; -- yalniz maas ortalamasi 3000'den fazla olanlari getir



-- odev sorulari 
--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu
select ulke, round(avg(maas)) as maas_ortalamasi from personel1
where cinsiyet ='E' 
group by ulke 
having count('E')>2;
 
 
 
 
 -- 30 .08
CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers;

--Toplam salary değeri 2500 üzeri olan her bir çalışan için salary toplamını bulun.

select name, sum(salary) as "Total Salary" 
from workers 
group by name
having sum(salary)>=2500; -- group by dan sonra where kullanilmaz bu yuzden onunla ayni fonksiyona sahip having kullanilir

--Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun.
select state, count(state) AS number_of_employess 
from workers 
GROUP BY state
HAVING COUNT(state) >1; -- HAVING, group by ardindan filtreleme icin kullanilir.

--Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.
select state, max(salary)
from workers
Group by state 
having max(salary)<3000;

--Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.
select company, min(salary) as min_salary
from workers 
group by company
having min(salary)>2000;

--Tekrarsız isimleri çağırın.
select distinct name -- distinct clause, cagrilan terimlerden tekrarlo olanlarin sadece brincisin alir
from workers;

--Name değerlerini company kelime uzunluklarına göre sıralayın.
select name, company 
from workers 
order by LENGTH(company); -- length company uzunluguna gore siralar

--Name değerlerini company kelime uzunluklarına göre buyukten kucuge dogru sıralayın.
select name, company 
from workers 
order by LENGTH(company)desc;

--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.
-- concat() birden fazla sutun veya string degerini birlestirmek icin kullanilir
SELECT CONCAt(name,' ', state) AS name_and_state
from workers
ORDER BY length(name) + length(state);

-- 2. yol 
SELECT CONCAT(name,' ', state) AS name_and_state
from workers
ORDER BY length(CONCAt(name,' ', state));
-- 3. yol
select name || ' ' || state || ' ' || LENGTH(name) +LENGTH(state) as "Name and States"
from workers
order by length(name) + length(state);
-- concat() ==> || ayni anlamda kullanilir
SELECT * FROM workers;

/*
 UNION Operator: 1) iki sorgu(query) sonucunu birlestirmek icin kullanilir
				 2) Tekrarsiz(uniqe) recordlari verir
				 3) Tek bir sutuna cok sutun koyabiliriz.
				 4) Tek bir sutuna cok sutun koyarkenmevcut data durumunua dikkat etmek gerekir

*/

--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den 
-- küçük olan name değerlerini tekrarsız olarak bulun.
select state as "Name and State ", salary 
from workers 
where salary>3000

union -- birlestirmek icin kullandik ve tekrarlilarida vermiyor  union-->iki farkli sonucu birlestirir

select name, salary 
from workers 
where salary<2000;

-- salary değeri 3000'den yüksek olan state değerlerini ve 
--2000'den küçük olan name değerlerini tekrarlı olarak bulun.

select state as "Name and State ", salary 
from workers 
where salary>3000

union  ALL -- UNION ile ayni isi yapar. Ancak, tekrarli degerleride verir.

select name, salary 
from workers 
where salary<2000;

--salary değeri 1000'den yüksek, 2000'den az olan "ortak" name değerlerini bulun.
select name from workers
where salary>1000
INTERSECT

select name from workers
where salary<2000;

--INTERSECT Operator: İki sorgu (query) sonucunun ortak(common) değerlerini verir. 
-- Unique(tekrarsız) recordları verir.

--salary değeri 2000'den az olan ve company değeri  IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.
select name
FROM workers 
where salary <2000

INTERSECT  -- ortak kesisim kümesi 

select name 
from workers 
where company in('IBM',' APPLE', ' MICROSOFT');




--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır. 
-- Unique(tekrarsız) recordları verir.


--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.
select name 
From workers
where salary <3000

except -- haric (bunlar sunlar ver demek) ikinci sorgudan ne varsa birincisinden cikarir.

select name 
from workers
where company='GOOGLE';

SELECT * FROM workers;


------------             JOINS: 			--


CREATE TABLE my_companies
(
  company_id CHAR(3),
  company_name VARCHAR(20)
);
INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');
SELECT * FROM my_companies;

CREATE TABLE orders
(
  company_id CHAR(3),
  order_id CHAR(3),
  order_date DATE 
);
INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');
SELECT * FROM orders;


/*
 JOINS:   
 		1) INNER JOIN : ortak (Common) datayi verir    kesisim demek
		2) LEFT JOIN : Birinc table'in tum datasini verir.  sol kismi 
		3) RIGHT JOIN :Ikinci table'in tum datasini verir. sag kismi verir
		4) FULL JOIN : iki table'in da tüm datasini verir.    tamamini verecek ortak kesisim kumesi dahil
		5) SELF JOIN : Tek table üzerinde çalışırken iki table varmış gibi çalışılır.
*/		

--1) INNER JOIN
-- ortak companyler icin company_name, order_id ve order_date degerlerini cagirin

select mc.company_name, o.order_id, o.order_date
from my_companies mc INNER JOIN orders o
on mc.company_id=o.company_id;


-- 2) LEFT JOIN -- > orta kesisenlerin de alir

--my_companies table'ındaki companyler için order_id ve order_date değerlerini çağırın.
select mc.company_name, o.order_id, o.order_date -- neyin gelmesini istiyorsak select onu yaziyoruz
from my_companies mc LEFT JOIN orders o
on mc.company_id=o.company_id;

--3) RIGHT JOIN
--Orders table'ındaki company'ler için company_name, company_id ve order_date değerlerini çağırın.
--1. Yol
select mc.company_name, o.company_id, o.order_date
from my_companies mc RIGHT JOIN orders o
on mc.company_id=o.company_id;


-- 4) FULL JOIN
--İki table'dan da company_name, order_id ve order_date değerlerini çağırın.
select mc.company_name, o.order_id, o.order_date 
from orders o FULL JOIN my_companies mc
on mc.company_id=o.company_id;




--SELF JOIN
CREATE TABLE workers1
(
  id CHAR(2),
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2)
);
INSERT INTO workers1 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers1 VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers1 VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers1 VALUES(4, 'Amy Sky', 'CEO', 5);
SELECT * FROM workers1;
--workers1 tablosunu kullanarak çalışanların yöneticilerini gösteren bir tablo hazırlayın.

select employee.name as Employee , manager.name As Manager
from workers1 employee FULL JOIN workers1 manager
on employee.manager_id=manager.id;








