-- sql_practice 1                                                                             
create table personel2                                                                         
(                                                                                             
id serial primary key,    --serial id'yi auto increment gibi otomatik olarak artirir.                                                                  
isim varchar(20),                                                                             
yas int,                                                                                      
maas int,                                                                                     
email varchar(30)                                                                             
);                                                                                            
																							  
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.   

insert into personel2 (isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');
insert into personel2 (isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel2 (isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel2 (isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel2 (isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel2 (isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel2 (isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel2 (isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel2 (isim, yas, maas, email) values ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel2 (isim, yas, maas, email) values ('Sena', 25, 11000, NULL);

select * from personel2;
-- 1) Tablo bilgilerini listeleyiniz.
select * from personel2;

select * from personel2;

-- 2) isim, yas ve maas bilgilerini listeleyiniz
select isim, yas, maas from personel2;

-- 3) id'si 8 olan personel bilgilerini listeleyiniz
select * from personel2
where id=8;

-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
select isim, yas, email from personel2
where id=5;

-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
select * from personel2
where yas>30;

-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
select * from personel2 where maas <> 21000;

-- 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.
select * from personel2 where isim ilike 'a%';

-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz.
select * from personel2 where isim ilike '%n'; -- ilike kucuk buyuk harf ayrimini ortadan kaldiriyor.

-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
select * from personel2 where email ilike '%gmail%';

-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
select * from personel2 where email not ilike '%gmail%';

-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
select * from personel2 where id in(3,5,7,9); 
-- istenen bilgi ayni degere sahip tipi ayni ise birden fazla deger icin in() kullanilir.

-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
select * from personel2 where yas not in (39,48,54);

-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
select * from personel2 where yas between 30 and 40;

-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
select * from personel2 where yas not between 30 and 40;

-- 15) emaili null olan personel bilgilerini listeleyiniz.
select * from personel2 where email is null;

-- 16) personel bilgilerini yaşa göre sıralayınız.
select * from personel2 order by yas;

-- 17) personel bilgilerini maaşa göre sıralayınız.
select * from personel2 order by maas; -- kucukten buyuye dogru siralayiniz

-- 18) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel2 order by yas desc; -- desc buyukten kucuge dogru siraliyor 

-- 19) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel2 order by maas desc;

-- 20) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
select * from personel2 order by maas  desc limit 3;









