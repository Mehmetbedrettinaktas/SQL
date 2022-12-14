-- IS NULL, IS NOT NULL, COALESCE --
/*
IS NULL ve IS NOT NULL : boolean operatorleridir. Bir ifadenin null olup olmadigini kontrol eder.

COALESCE(Birlestirme) ise bir fonksiyondur ve icerisindeki parametrelerden NULL olmayan ilk ifadeyi dondurur

*/

CREATE TABLE insanlar (	ssn CHAR(9), -- Social Security Number	
isim VARCHAR(50), 	
adres VARCHAR(50) );
INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');

select * from insanlar;

-- ism'i null olanlari sorgula
select * from insanlar where isim is null;

-- isimi null olmayanlari listeleyin
select * from insanlar where isim is not null;

--  isim 'i NULL olan kişilerin isim'ine NO NAME atayınız.
update insanlar
set isim='NO NAME'
where isim is null;

-- Tabloyu bir önceki soruyu çözmeden önceki haline geri getirin
update insanlar 
set isim=null
where isim= 'NO NAME';

--alter tabloyu değiştirir update veriyi değiştirir

/* 
NOT: Coklu degisimde her degisim icin  SET ... WHERE isim IS NULL gibi 
ifade yazmamak icin ve bunun yerine COALESCE(Birlestirme) kullanilir.
*/

-- isim 'i NULL olanlara 'Henuz isim girilmedi' adres'i NULL olanlara 'Henuz adres girilmedi'
-- ssn'i NULL olanlara 'no ssn' atayalım.
update insanlar
set isim=coalesce(isim,' HENUZ ISIM GIRILMEDI'),
	adres= coalesce(adres, 'HENUZ ADRES GIRILMEDI'),
	ssn= coalesce(ssn,'NO SSN');

select * from insanlar;




























