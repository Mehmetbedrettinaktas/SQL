-- sql_practice 1                                                                             
create table personel                                                                         
(                                                                                             
id serial primary key,    --serial id'yi auto increment gibi otomatik olarak artirir.                                                                  
isim varchar(20),                                                                             
yas int,                                                                                      
maas int,                                                                                     
email varchar(30)                                                                             
);                                                                                            
																							  
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.   

insert into personel (isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');
insert into personel (isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel (isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel (isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel (isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel (isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel (isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel (isim, yas, maas, email) values ('Sena', 25, 11000, NULL);

select * from personel;

-- 1) Tablo bilgilerini listeleyiniz.
select * from personel;

-- 2) isim, yas ve maas bilgilerini listeleyiniz
select isim, yas, maas from personel;

-- 3) id'si 8 olan personel bilgilerini listeleyiniz
select * from personel -- tum bilgilerini getirmek icin * kullaniyoruz
where id=8; 

-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
select id, isim, yas, email from personel  -- bizden ne istemisse onlari select ve from arasina yaziyoruz
where id=5;

-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
select * from personel
where yas>30;

-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
select * from personel
where maas != 21000;
-- 2. yol 
select * from personel where maas <>21000;

-- 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.
select * from personel 
where isim ilike 'a%';  -- ilike yazinca buyuk kucuk harf farki olmuyor
						-- % isareti ne ile devam ederse etsin
						
-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz.
select * from personel where isim like '%n';
select * from personel where isim ~~* '%n'; -- 2. yol
select * from personel where isim ilike '%N'; -- ilike ile ilike= toLowerCasse

-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
select * from personel where email like '%gmail%';
select * from personel where email ilike '%gmail%';

-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
select * from personel where email not like '%gmail%'; -- %  kullandigimiz icin null getirmiyor
-- % ile arama yaptigimiz icin null gelmez cunku null bir deger olmadigi icin aranacak bir sey degil

-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
select * from personel 
where id in(3,5,7,9);  -- ayni stundaki 
-- or ile 
select * from personel where id= 3 or id=5 or id=7 or id=9;

-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
select * from personel where yas not in(39,48,54);

-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
select * from personel where yas between 30 and 40;

-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
select * from personel where yas not between 30 and 40;
SELECT * FROM personel WHERE YAS<30 OR YAS>40;

-- 15) emaili null olan personel bilgilerini listeleyiniz.
select * from personel where email is null; -- buyuk kucuk harf duyarsiz

-- 16) personel bilgilerini yaşa göre sıralayınız.
select * from  personel order by yas; -- dogal siralamasi kucukten buyuye dogru  asc --> default silamasi kucukten buyuye dogru

-- 17) personel bilgilerini maaşa göre sıralayınız.
select * from personel order by maas;

-- 18) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by yas desc;

-- 19) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by maas desc;

-- 20) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
select * from personel order by maas desc limit 3; -- bastan uc 
select * from personel order by maas limit 3; -- sondan  uc 







