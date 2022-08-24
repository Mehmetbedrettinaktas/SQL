/*
DDL- DATA DEFINITION LANG.DATA
CREATE -ALTER-DROP
*/
-- CREATE -TABLO OLUSTURMA-
CREATE TABLE ogrenci(
ogr_no int,
ogr_isimsoyisim VARCHAR(30),
notlar REAL,
yas int,
adres VARCHAR(50),
Kayit_tarih date
);
-- Var olan bir tablodan yeni bir tablo olusturma
CREATE TABLE ogr_notlari
As 
select ogr_no, notlar From ogrenci;

-- ogrenci tablosundaki ocrenci notlari ve ocgreci no'yu sec bu tabloyu olustururken bunlar
--gibi olsun Parent bir tablonun altinda child bir tablo olusturuyoruz
-- ogr_ no ve notlarla ayni olsun istiyorum

-- Tablolari gormek icin  ve TAblodaki butun ozellikleri getirmek icn--> SELECT * FROM ogrenci;(ogrenci tablosundan herseyii getir)
SELECT * FROM ogrenci;
SELECT * FROM ogr_notlari;
