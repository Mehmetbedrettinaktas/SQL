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

/*
 AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir
Bir tanesi gerçekleşmezse listelemez
    Select * from matematik sinav1 > 50 AND sınav2 > 50
Hem sınav1 hemde sınav2 alanı, 50'den büyük olan kayıtları listeler
    OR (VEYA): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir
    select * From matematik sınav>50 OR sınav2>50 
Hem sınav1 veya sınav2 alanı, 50 den büyük olan kayıtları listeler   
*/


SELECT * from personel;

--id'si 1003 ile 1005 arasında olan personel bilgisini listeleyiniz
select * from personel WHERE id BETWEEN '1003' and '1005';

-- 2. Yol
select * from personel where id>='1003' and id<='1005';

-- Derya Soylu ile Yavuz Bal arasindaki personel bilgisini listeleyiniz
select * from personel where isim between 'Derya Soylu' and 'Yavuz Bal';

-- Maasi 70000 ve isim Sena olan personeli listele
select * from personel where maas=70000 or isim='Sena Beyaz';

-- IN : Birden fazla mantiksal ifade tanimlayabilecegimiz durumlari tek komutta yazabilme imkani verir
-- Farkli sutunlar icin  IN kullanilmaz

--id'si 1001,1002 ve 1004 olan personelin bilgilerini listele
SELECT * from personel where id ='1001' or id='1002'or id='1004';

--2. Yol 
select * from personel where id in ('1001','1002','1004');
 
 --- bundan sonrasini calistirmadim
/*
SELECT - LIKE kosulu 
LIKE: Sorgulama yaparken belirli kalip ifadeleri kullanabilmemizi saglar
LIKE: Sorgulama yaparken buyuk/ kucuk harfe duyarsiz olarak eslestirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*

% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir

bunlarin genel adina patern diye geciyor
*/

-- Isim A harfi ile baslayan personeli lestele 
select * from personel Where isim like 'A%'; -- sonu ne ile biterse bitsin A ile baslayan

-- isim t harfi ile biten personeli listele 
select * from personel where isim like '%t'; -- basi ne olursa olsun sonu t ile bitsin 

-- Isiminin 2. harfi e olan personeli listeleyniz
select * from personel where isim like '_e%';  --  '-e%' bu ifadenin aciklamasi  ikinci harf e olsun sonu ne olursa olsun

-- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
select isim from personel where isim ~~* '_a%';

-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
select isim from personel where isim like '_a_u%';
-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select isim from personel where isim ~~* '%e%' and isim ~~* '%r%'; 

-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
select * from personel where isim like '_e%y%';

-- a harfi olmayan personeli listeleyin
select * from personel where isim not like '%a%';

-- 1. harfi A ve 7. harfi a olan personeli listeleyin
select * from personel where isim ~~* 'A_____a%'; 

--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.
select * from personel where isim like '%r_';