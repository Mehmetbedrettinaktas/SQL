/*
SELECT - LIKE kosulu 
LIKE: Sorgulama yaparken belirli kalip ifadeleri kullanabilmemizi saglar
ILIKE: Sorgulama yaparken buyuk/ kucuk harfe duyarsiz olarak eslestirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*

% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir

bunlarin genel adina patern diye geciyor
*/


create table personel
(
id char(4),
isim varchar(50),
maas int
);


insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);


-- Isim A harfi ile baslayan personeli lestele 
select * from personel Where isim like 'A%'; -- sonu ne ile biterse bitsin A ile baslayan

-- isim t harfi ile biten personeli listele 
select * from personel where isim like '%t'; -- basi ne olursa olsun sonu t ile bitsin 

-- Isiminin 2. harfi e olan personeli listeleyniz
select * from personel where isim like '_e%';  --  '-e%' bu ifadenin aciklamasi  ikinci harf e olsun sonu ne olursa olsun

-- 'a' ile baslayip 'n' ile biten personel isimlerini listeleyiniz
select * from personel where isim ~~* 'a%n';

-- ikinci karekter 'a' ve dorduncu karekteri 'u' olan personel isimlerini listeleyiniz
select isim from personel where isim ilike '_a_u%';

-- icinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select isim from personel where isim ~~* '%e%' and isim ~~'%r%';
select isim from personel where isim ~~* '%e%' or isim ~~'%r%';

-- 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
select * from personel where isim like '_e%y%';

-- a harfi lmayan personeli listeleyin
select * from personel where isim not like '%a%'; 
select * from personel where isim not ilike '%a%';  -- not ilike  --> not is like bunun gibi olmayan

-- 1. harfi A ve 7. harfi a olan personeli listeleyin
select * from personel where isim ~~*'A_____a%';

-- sondan ikinci karekteri 'r' olan "isim" degerlerini listeleyin
select isim from personel where isim like '%r_';















