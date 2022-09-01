-- 3. GUN ----
CREATE TABLE calisanlar11(
id CHAR(5) PRIMARY KEY, 
isim VARCHAR(50) UNIQUE,
maas int NOT NULL, 
ise_baslama DATE
);
INSERT INTO calisanlar11 VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar11 VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --Unique
INSERT INTO calisanlar11 VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar11 VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL
INSERT INTO calisanlar11 VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calisanlar11 VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY
select * from calisanlar11

-- FOREIGN KEY--
CREATE TABLE adresler11
(
adres_id char(5),
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
FOREIGN KEY (adres_id) REFERENCES calisanlar11(id)   
);
-- eger biz bir tabloda constraints(kisitlama) belirlersek 

INSERT INTO adresler11 VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler11 VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler11 VALUES('10002','Ağa Sok', '30.Cad.','Antep');
select * from adresler11;

INSERT INTO adresler11 VALUES('100012','Ağa Sok', '30.Cad.','Antep');
--Parent tabloda olmayan id ile child tabloya ekleme yapamayiz

INSERT INTO adresler11 VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
-- child klaslardaki FOREIGN KEY'e null eklenebiliyor

-- Calisanlar id ile adresler tablosundaki adres_id ile eslesenlere bakmak icin
SELECT * FROM calisanlar11 ,adresler11 WHERE calisanlar11.id= adresler11.adres_id;
--										    primary key		FOREIGN KEY  sadece eslesenleri getirdi

-- pranet table tamamen ortadan kaldirmaya calisacagim
DROP table calisanlar11;
-- Parent tabloyu yani primary key olan tabloyu silmek istedigimizde tabloyu silmez
-- once child tabloyu silmemiz gerekiyor

DELETE FROM calisanlar11 WHERE id='10002'; -- parent  --> varchar olarak tanimladigimiz icin '' arasinda cagirmamiz lazim.
delete from adresler11 where adres_id='10002'; -- child 

drop TABLE calisanlar11;

-- ON DELETE CASCADE--
-- Her defasinda once child tablodaki verileri silmek yerine 
-- ON DELETE CASCADE silme ozelligini aktif hale getirebiliriz 
-- boylece hem Parent hemde childe istedigimiz veriyi silebiliriz.  

-- Bunun icin FK olan satirin en sonuna ON DELETE CASCADE komutunu yazmamiz yeterli

CREATE TABLE talebeler11
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebeler11 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler11 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler11 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler11 VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler11 VALUES(127, 'Mustafa Bak', 'Can',99);

select * from talebeler11;

CREATE TABLE notlar11(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler11(id)
on delete cascade
);

INSERT INTO notlar11 VALUES ('123','kimya',75);
INSERT INTO notlar11 VALUES ('124', 'fizik',65);
INSERT INTO notlar11 VALUES ('125', 'tarih',90);
INSERT INTO notlar11 VALUES ('126', 'Matematik',90);

select * from talebeler11;
SELECT * FROM notlar11;
delete from notlar11 where talebe_id='123';

delete from talebeler11 where id='126'; -- ON DELETE CASCADE kullanidigimiz icin PARENT tabele'dan direk silebildik
-- Parent tabel'dan sildigimiz icin child tabele'dan silinmis olur.

Delete from talebeler11;

Drop table talebeler11;

drop table talebeler CASCADE ;
-- Parent tabloyu istersek Drop table tablo_adi'ndan sonra CASCADE komutunu kullaniriz

-- Talebeler11 tablosundaki isim sutununa NOTT NULL kisitlamasi ekleyiniz ve 
-- veri tipini VARCHAR(30) olarak degistiriniz
ALTER table talebeler11
alter column isim TYPE VARCHAR(30),
alter column isim set not NULL;

select * from talebeler11;
SELECT * FROM notlar11;

-- Talebeler tablosundaki  yazili_notu sutununa 60 dan buyuk rakam girebilirsin
ALTER table talebeler11
Add constraint sinir CHECK (yazili_notu>60);
-- CHECK kisitlamasi ile tablodaki itedigimiz sutunu sinirlandirabiliriz
-- Açiklama : yukarda 60'i sinir olarak belirledigimiz icin bunu eklemedi

INSERT INTO talebeler11 VALUES(128,'Mustafa Can','Hasan',45);

create table ogrenciler11(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);

Create table ogrenci_adres
AS
SELECT id, adres from ogrenciler11;

select * from ogrenciler11;
select * from ogrenci_adres;

-- Tablodaki bir stuna PRIMARY KEY ekleme
ALTER TABLE ogrenciler11
Add primary key(id);

-- PRIMARY KEY olusturmada 2.yol -- calistiramayiz cünkü daha once olusturdugumuz icin calistirirsak hata verir
alter table ogrenciler11
add constraint pk_id primary key(id);

-- PK'den sonra FK atamasi
ALTER table ogrenci_adres
add foreign key(id) REFERENCES ogrenciler11;
-- Child tabloyu parent tablodan olusturdugumuz icin sutun adi verilmedi

-- PK' yi  CONSTRAINT silme 
alter table ogrenciler11 DROP CONSTRAINT pk_id;

-- FK'yi silme CONSTRAINT silme 
alter table ogrenci_adres DROP CONSTRAINT ogrenci_adres_id_fkey;

-- yazili notu 85 den buyuyuk talebe bilgilerini getirin
SELECT * from talebeler11 WHERE yazili_notu>85;

-- isim MUstefa Bak olan talebenin tum bilgilerini getirin
select * from talebeler11 where isim='Mustafa Bak';



-- Select komutunda -- BETWEEN kosulu 
-- BETWEEN belirtiginiz 2 veri arasindaki bilgileri listeler
-- Between de belirtigimiz(yani sinir verleri de) degerlerde listelemeyi dahildir

create table personel11
(
id char(4),
isim varchar(50),
maas int
);


insert into personel11 values('1001', 'Ali Can', 70000);
insert into personel11 values('1002', 'Veli Mert', 85000);
insert into personel11 values('1003', 'Ayşe Tan', 65000);
insert into personel11 values('1004', 'Derya Soylu', 95000);
insert into personel11 values('1005', 'Yavuz Bal', 80000);
insert into personel11 values('1006', 'Sena Beyaz', 100000);

/*
 AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir
Bir tanesi gerçekleşmezse listelemez
    Select * from matematik sinav1 > 50 AND sınav2 > 50
Hem sınav1 hemde sınav2 alanı, 50'den büyük olan kayıtları listeler
    OR (VEYA): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir
    select * From matematik sınav>50 OR sınav2>50 
Hem sınav1 veya sınav2 alanı, 50 den büyük olan kayıtları listeler   
*/


SELECT * from personel11;

--id'si 1003 ile 1005 arasında olan personel bilgisini listeleyiniz
select * from personel11 WHERE id BETWEEN '1003' and '1005';

-- 2. Yol
select * from personel11 where id>='1003' and id<='1005';

-- Derya Soylu ile Yavuz Bal arasindaki personel bilgisini listeleyiniz
select * from personel11 where isim between 'Derya Soylu' and 'Yavuz Bal';

-- Maasi 70000 ve isim Sena olan personeli listele
select * from personel11 where maas=70000 or isim='Sena Beyaz';

-- IN : Birden fazla mantiksal ifade tanimlayabilecegimiz durumlari tek komutta yazabilme imkani verir
-- Farkli sutunlar icin  IN kullanilmaz. Yalnizca ayni stun icin bu ozellik kullanilir

--id'si 1001,1002 ve 1004 olan personelin bilgilerini listele
SELECT * from personel11 where id ='1001' or id='1002'or id='1004';

--2. Yol 
select * from personel11 where id in ('1001','1002','1004');
 
 -- maasi sadece 70000, 100000 olan personeli listele
 select * from personel11 where maas in(70000,100000);

/*
SELECT - LIKE kosulu 
LIKE: Sorgulama yaparken belirli kalip ifadeleri kullanabilmemizi saglar
ILIKE: Sorgulama yaparken buyuk/ kucuk harfe duyarsiz olarak eslestirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~ gibi degil 
NOT ILIKE :!~~* gibi degil

% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir

bunlarin genel adina patern diye geciyor
*/

-- Isim A harfi ile baslayan personeli lestele 
select * from personel11 Where isim like 'A%'; 
-- Personel11 tablosun dan ismi A ile baslayan ve sonu ne ile biterse bitsin isimleri getir

-- isim t harfi ile biten personeli listele 
select * from personel11 where isim like '%t'; -- basi ne olursa olsun sonu t ile bitsin 

-- Isiminin 2. harfi e olan personeli listeleyniz
select * from personel where isim like '_e%'; 
--  '-e%' bu ifadenin aciklamasi  ikinci harf e olsun sonu ne olursa olsun

