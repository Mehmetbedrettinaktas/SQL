-- DML --> UPDATE : Tablodaki verileri gunceller


CREATE TABLE tedarikciler11 -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler11 VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler11 VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler11 VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler11 VALUES (104, 'Apple', 'Adam Eve');


CREATE TABLE urunler11 -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler11(vergi_no)
on delete cascade
);

INSERT INTO urunler11 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler11 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler11 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler11 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler11 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler11 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler11 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from tedarikciler11;
select * from urunler11;

--  vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
update tedarikciler11 			-- update --> guncele  tedarikciler11'i
set firma_isim='Vestel'			-- set --> ayarla firma ismini 'Vestel' olarak
where  vergi_no=102				-- where yalniz vergi_no 102 olani 

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
UPDATE tedarikciler11 
set firma_ismi='casper',irtibat_ismi='Ali Veli'
where vergi_no=101;

--  urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
update urunler11
set urun_isim='TELEFON'
where urun_isim='Phone';

--  urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
update urunler11 				-- urunler tablosunu guncelle
set urun_id=urun_id+1  			-- set --> ayarla urun_id 1 artir
where urun_id>1004;				-- yalniz urun_id>1004 olanlari

--  urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino 
--sutun değerleri ile toplayarak güncelleyiniz.
update urunler11
set urun_id=ted_vergino+urun_id;

--urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
-- Bu soruda tedarikciler ve urunler tablosunu yeniden olusturduk
update urunler11
set urun_isim= (select firma_ismi from tedarikciler11 where irtibat_ismi='Adam Eve') -- burasi bize apple' getirdi
where musteri_isim='Ali Bak';

-- Urunler tablosunda laptop satin alan musterilerin ismini, 
-- firma_ismi Apple’in irtibat_isim'i ile degistirin.
update urunler11
set musteri_isim =(select irtibat_ismi from tedarikciler11 where firma_ismi='Apple')
where urun_isim ='Laptop';


select * from tedarikciler11;
select * from urunler11;

