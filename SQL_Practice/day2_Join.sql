--		JOIN		---

CREATE TABLE sirketler
(
	sirket_id int,
	sirket_isim VARCHAR(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler
(
	siparis_id int,									-- sirket id'ler ortak oldugu icin bu field larda baglanti kuruldu
													-- sirketler 			siparisler
													--100 null				101 ++
	sirket_id int,									--101 ++				 102 ++
	siparis_tarihi DATE								-- 102 ++				 103 ++
);													--103 ++				104 null
													-- 						105 null	

INSERT INTO siparisler VALUES(11, 101, '2022-04-17');			-- left(sirket)		inner(ortak)		right(siparisler)
INSERT INTO siparisler VALUES(22, 102, '2022-04-18');			--	100		 		101					104
INSERT INTO siparisler VALUES(33, 103, '2022-04-19');			--					102					105	
INSERT INTO siparisler VALUES(44, 104, '2022-04-20');			--					103			
INSERT INTO siparisler VALUES(55, 105, '2022-04-21');

-- iki tablodaki ortak deger sirket_id 

-- SORU1: Iki Tabloda sirket_id’si ayni olanlarin; sirket_ismi, siparis_id, sirket_id ve
--siparis_tarihleri listeleyen bir sorgu yaziniz.
select A.sirket_id,A.sirket_isim, B.siparis_id,B.siparis_tarihi from siparisler as B
inner join sirketler as A 
on A.sirket_id = B.sirket_id;

-- SORU2: sirketler tablosundaki tum sirketleri(yani sirket isimleri) ve bu sirketlere ait olan
-- siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
-- left'e gore 
select A.sirket_id,A.sirket_isim, B.siparis_id, B.siparis_tarihi from sirketler as A
left join siparisler as B
on A.sirket_id = B.sirket_id; -- on --> ortak degerler uzerine 

-- right'a gore 
select A.sirket_id,A.sirket_isim, B.siparis_id, B.siparis_tarihi from siparisler as B
right join sirketler as A
on A.sirket_id = B.sirket_id; 

-- full join ile cozum -------
select A.sirket_id,A.sirket_isim, B.siparis_id, B.siparis_tarihi from sirketler as A
left join siparisler as B
on A.sirket_id = B.sirket_id 

union -- ikisini birlestirdik

select A.sirket_id,A.sirket_isim, B.siparis_id, B.siparis_tarihi from siparisler as B
right join sirketler as A
on A.sirket_id = B.sirket_id; 

-- SORU3: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile
--  bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
select B.sirket_id, B.sirket_isim, A.siparis_id, A.siparis_tarihi from siparisler as A
full join sirketler as B
on A.sirket_id = B.sirket_id; 


select * from sirketler;
select * from siparisler;












































