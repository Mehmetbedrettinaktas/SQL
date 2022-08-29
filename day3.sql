--Personel isminde bir tablo oluşturalım
create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)    
);
--Varolan personel tablosundan pers_id,sehir,adres fieldlarına sahip personel_adres adında yeni tablo olusturalım
create table personel_adres
as -- asagidaki gibi olsun
select pers_id, sehir, adres from personel;
select * from personel -- personel adindaki tablomun tamamini bana getiriyor
-- DML --> Data Manupulation Lang.
-- INSERT - UPDATE - DELETE
--Tabloya veri ekleme, tablodan veri güncelleme ve silme işlemlerinde kullanılan komutlar
--INSERT
create table student
(
id varchar(4),
st_name varchar(30),
age int
);
INSERT into student VALUES ('1001','Ali Can',25);
INSERT into student VALUES ('1002','Veli Can',35);
INSERT into student VALUES ('1003','Ayse Can',45);
INSERT into student VALUES ('1004','Derya Can',55);
--Tabloya parçalı veri ekleme
insert into student(st_name,age) values ('Murat Can',65);
--DQL --> Data Query Lang.
--SELECT
select * from student;
select st_name from student;
--SELECT KOMUTU WHERE KOŞULU
select * from student WHERE age>35;
--TCL - Transaction Control Lang.
--Begin - Savepoint - rollback - commit
--Transaction veritabanı sistemlerinde bir işlem başladığında başlar ve işlem bitince sona erer
--Bu işlemler veri tabanı oluşturma, veri silme, veri güncelleme, veriyi geri getirme gibi işlemler olabilir
CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);
Begin;
insert into ogrenciler2 VALUES (default,'Ali Can','Hasan Can',75.5);
insert into ogrenciler2 VALUES (default,'Canan Gül','Ayşe Şen',90.5);
savepoint x; -- 
insert into ogrenciler2 VALUES (default,'Kemal Can','Ahmet Can',85.5);
insert into ogrenciler2 VALUES (default,'Ahmet Şen','Ayşe Can',65.5);
ROLLBACK TO x; -- geri donus yapmak icin kullanilir
select * from ogrenciler2;
commit;
--Transaction kullanımında SERIAL data türü kullanımı tavsiye edilmez.
--savepointten sonra eklediğimiz veride sayaç mantığı ile çalıştığı için
--sayacta en son hangi sayıda kaldıysa ordan devam eder
-- NOT : PostgreSQL de transaction kullanımı için 'Begin' komutuyla başlarız sonrasında tekrar yanlış bir veriyi
-- düzeltmek veya bizim için önemli olan verilerden sonra ekleme yapabilmek için 'SAVEPOINT savepointadi'
-- kullanırız ve bu savepointe dönebilmek için 'ROLLBACK TO savepointismi' 
-- komutunu kullanırız ve rollback çalıştırıldığında savepoint yazdığımız satırın üstündeki verileri tabloda bize 
-- verir ve son olarak Transaction'ı sonlandırmak için mutlaka 'COMMIT' komutu kullanırız. MySQL de 
-- transaction olmadanda kullanılır
-- DML - DELETE -
--DELETE FROM tablo_adi --> Tablo'nun tüm içeriğini siler
-- Veriyi seçerek silmek için WHERE koşulu kullanılır
-- DELETE FROM tablo_adı WHERE sutun_adi = veri --> Tablodaki istediğimiz veriyi siler
CREATE TABLE ogrenciler
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);
INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);
select * from ogrenciler;
-- Soru : id'si 124 olan öğrenciyi siliniz
DELETE FROM ogrenciler WHERE id = 124; -- Delete ile tablonun icini siliyoruz
-- Soru : ismi Kemal Yasa olan satırı siliniz
DELETE FROM ogrenciler WHERE isim = 'Kemal Yasa';
-- Soru : ismi Nesibe Yılmaz veya Mustafa Bak olan kayıtları silelim
DELETE FROM ogrenciler WHERE isim ='Nesibe Yilmaz' or isim = 'Mustafa Bak';
-- soru : ismi Ali Can ve id'si 123 olan kaydı siliniz
delete from ogrenciler WHERE isim='Ali Can' or id=123;
-- Tablodaki tüm verileri silelim
Delete from ogrenciler
-- DELETE - TRUNCATE --
-- TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamını siler.
-- Ancak, seçmeli silme yapamaz
select * from ogrenciler;
TRUNCATE TABLE ogrenciler
-- DDL - Data Definition Lang. 
-- CREATE - ALTER - DROP
-- ALTER TABLE --
-- ALTER TABLE tabloda ADD, TYPE, SET, RENAME veya DROP COLUMNS işlemleri için kullanılır
--Personel isminde bir tablo oluşturalım
create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)    
);
select * from personel;
-- Personel tablosuna cinsiyet Varchar(20) ve yas int seklinde yeni sutunlar ekleyiniz
alter table personel add cinsiyet varchar(20), add yas int;
--Personel tablosundan sirket field'ini siliniz
alter table personel drop column sirket; -- alter ile tablonun adini degistiriyoruz
-- Personel tablosundaki sehir sutununun adını ulke olarak değiştirelim
alter table personel RENAME column sehir to ulke; -- stunun adini degistiriyoruz
-- Personel tablosunun adını isciler olarak değiştiriniz
alter table personel rename to isciler;
-- DDL - DROP komutu
DROP table isciler; -- Tabloyu yok eder
-- CONSTRANINT -- Kısıtlamalar
-- Primary Key --> Bir sutunun NULL içermemesini ve sutundaki verilerin BENZERSİZ olmasını sağlar (NOT NULL - UNIQUE)
-- FOREGIN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır. Böylelikle, tablolar arasında ilişki kurmuş oluruz.
-- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
-- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
-- NOT NULL kısıtlaması için CONSTRAINT ismi tanımlanmaz. Bu kısıtlama veri türünden hemen sonra yerleştirilir
-- CHECK --> Bir sutuna yerleştirilebilecek değer aralığını sınırlamak için kullanılır.
CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --Unique
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY
select * from calisanlar

-- 3. GUN ----

-- FOREIGN KEY--
CREATE TABLE adresler
(
adres_id char(5),
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT id_fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)   
);
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
select * from adresler;

INSERT INTO adresler VALUES('100012','Ağa Sok', '30.Cad.','Antep');
--Parent tabloda olmayan id ile child tabloya ekleme yapamayiz

INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');

-- Calisanlar id ile adresler tablosundaki adres_id ile eslesenlere bakmak icin
SELECT * FROM calisanlar,adresler WHERE calisanlar.id= adresler.adres_id;
--										primary key		tray key

-- pranet table tamamen ortadan kaldirmaya calisacagim
DROP table calisanlar;
-- Parent tabloyu yani primary key olan tabloyu silmek istedigimizde tabloyu silmez
-- once child tabloyu silmemiz gerekiyor

DELETE FROM calisanlar WHERE id='10002'; -- parent
delete from adresler where adres_id='10002'; -- child 

drop TABLE calisanlar;

-- ON DELETE CASCADE--
-- Her defasinda once child tablodaki verileri silmek yerine 
-- ON DELETE CASCADE silme ozelligini aktif hale getirebiliriz 
-- boylece hem Parent hemde childe siler

-- Bunun icin FK olan satirin en sonuna ON DELETE CASCADE komutunu yazmamiz yeterli

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

select * from talebeler;

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler;
SELECT * FROM notlar;
delete from notlar where talebe_id='123';

delete from talebeler where id='126'; -- ON DELETE CASCADE kullanidigimiz icin PARENT tabele'dan direk silebildik
-- Parent tabel'dan sildigimiz icin child tabele'dan silinmis olur.

Delete from talebeler;

Drop table talebeler;

drop table talebeler CASCADE ;
-- Parent tabloyu istersek Drop table tablo_adi'ndan sonra CASCADE komutunu kullaniriz

-- Talebelr tablosundaki isim sutununa NOTT NULL kisitlamasi ekleyiniz ve veri tipini VARCHAR(30) olarak degistiriniz
ALTER table talebeler
alter column isim TYPE VARCHAR(30),
alter column isim set not NULL;

-- Talebeler tablosundaki  yazili_notu sutununa 60 dan buyuk rakam girebilirsin
ALTER table talebeler
Add constraint sinir CHECK (yazili_notu>60);
-- CHECK kisitlamasi ile tablodaki itedigimiz sutunu sinirlandirabiliriz
-- Açiklama : -- yukarda 60'i sinir olarak belirledigimiz icin bunu eklemedi
INSERT INTO talebeler VALUES(128,'Mustafa Can','Hasan',45);

create table ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);

Create table ogrenci_adres
AS
SELECT id, adres from ogrenciler;

select * from ogrenciler;
select * from ogrenci_adres;

-- Tablodaki bir stuna PRIMARY KEY ekleme
ALTER TABLE ogrenciler
Add primary key(id);

-- PRIMARY KEY olusturmada 2.yol
alter table ogrenciler
add constraint pk_id primary key(id);

-- PK'den sonra FK atamasi
ALTER table ogrenci_adres
add foreign key(id) REFERENCES ogrenciler;
-- Child tabloyu parent tablodan olusturdugumuz icin sutun adi verilmedi

-- PK' yi  CONSTRAINT silme 
alter table ogrenciler DROP CONSTRAINT pk_id;
-- FK'yi silme CONSTRAINT silme 
alter table ogrenci_adres DROP CONSTRAINT ogrenci_adres_id_fkey;

-- yazili notu 85 den buyuyuk talebe bilgilerini getirin
SELECT * from talebeler WHERE yazili_notu>85;

-- isim MUstefa Bak olan talebenin tum bilgilerini getirin
select * from talebeler where isim='Mustafa Bak';

-- Select komutunda -- BETWEEN kosulu 
-- BETWEEN belirtiginiz 2 veri arasindaki bilgileri listeler
-- Between de belirtigimiz degerlerde listelemeyi dahildir

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

-- Isim A harfi ile baslayan personeli lestele 
select * from personel Where isim like 'A%'; -- sonu ne ile biterse bitsin A ile baslayan

-- isim t harfi ile biten personeli listele 
select * from personel where isim like '%t'; -- basi ne olursa olsun sonu t ile bitsin 

-- Isiminin 2. harfi e olan personeli listeleyniz
select * from personel where isim like '_e%';  --  '-e%' bu ifadenin aciklamasi  ikinci harf e olsun sonu ne olursa olsun