-- ORDER BY --
-- ORDER BY cumlecigi bir sorgu deyimi icerisinde belli bir SUTUN'a gore 
-- siralama yapmak icin kullanilir

CREATE TABLE kisiler 
(
id int PRIMARY KEY,
ssn CHAR(9) ,
isim VARCHAR(50), 
soyisim VARCHAR(50), 
maas int,
adres VARCHAR(50) 
);
    
INSERT INTO kisiler VALUES(1, 123456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(2, 234567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(3, 345678901, 'Mine','Bulut',4200,'Adiyaman');
INSERT INTO kisiler VALUES(4, 256789012, 'Mahmut','Bulut',3150,'Adana');
INSERT INTO kisiler VALUES (5, 344678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (6, 345458901, 'Veli','Yilmaz',7000,'Istanbul');
INSERT INTO kisiler VALUES(7,113456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(8,224567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(9,335678901, 'Mine','Bulut',4200,'Ankara');
INSERT INTO kisiler VALUES(10,446789012, 'Mahmut','Bulut',3150,'Istanbul');
INSERT INTO kisiler VALUES (11,554678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (12,665458901, 'Veli','Yilmaz',7000,'Istanbul');

select * from kisiler;

-- kisiler tablosunu adres'e göre sıralayarak sorgulayınız.

select * from kisiler order by adres;  -- order by alfabetik olarak siralar ve  
									   -- adres stununu alfabetik siraya gore siralariz
select * from kisiler order by adres asc;   -- ASCANDIG(ASC) yazmasakta sirali verir.

-- kisiler tablosunu adres'e gore tersten siralayarak sorgulayiniz.
select * from kisiler order by adres desc;  -- DESCENDING(DESC) alfabetik olarak tersten siralama islemini yapiyor
											-- veya kucukten buyuye dogru siralar
											
-- Kisiler maasi buyukten kucuge dogru siralayiniz
select * from kisiler order by maas desc;

-- ismi Mine olanları, maas a göre AZALAN sırada sorgulayınız
select * from kisiler where isim= 'Mine' order by maas desc; -- tersten yani büyükten kücüge dogru siralar
					-- sadece ismi mine olanlari siraladi
					
-- soyismi 'i Bulut olanları maas sıralı olarak sorgulayınız.
select * from kisiler where soyisim= 'Bulut' order by maas; -- burada normal olarak siralar
select * from kisiler where soyisim= 'Bulut' order by maas desc; -- burada desc kullandigimiz icin tersten siraladik






























