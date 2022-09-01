
-- AGGREGATE METHOD KULLANIMI --
/*
Aggregate Methodlari (SUM(toplama), Count(sayma), Min, Max, Avg(ortalama))
- Subquery icinde de kullanilir
- Ancak, sorgu tek bir deger donduruyor olmalidir
SYNTAX : sum() seklinde olmali sum () arasinda bosluk olmamali

*/

select * from calisanlar2;
select * from markalar;

-- Calisanlar2 tablosundaki en yuksek maas degerini listeleyiniz
select max(maas) from calisanlar2;

-- calisanlar tablosundaki maaslarin toplamini listeleyiniz
select sum(maas) from calisanlar2;

-- calisanlar tablosundaki maas ortalamalarini listeleyiniz
select avg(maas) from calisanlar2;
select round(avg(maas)) from calisanlar2; -- round sonuctaki kusuratli kismi siliyor
select round(avg(maas),2) from calisanlar2;  --round(avg(),2)--> , den sonra ilk iki rakami istiyorsak.
											-- round aynizamnda sayiyi yuvarliyor
-- Calisanlar tablosundaki en dusuk maasi listeleyiniz
select min(maas) from calisanlar2;

-- calisanlar tablosundaki kac kisinin maas aldigini listeleyiniz
 select count(maas) from calisanlar2;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim, calisan_sayisi ,(select sum(maas) from calisanlar2 where marka_isim=isyeri)
as toplam_maas from markalar; -- as ile geci olarak olusturulan stuna isim veriyoruz.  as ile toplam_maas  stununu olusturduk

--ALIAS (AS) toplada geçici isim vermek istersek koşuldan sonra AS sutun_isim olarak kullanılır

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
select marka_isim, calisan_sayisi ,(select max(maas) from calisanlar2 where  marka_isim=isyeri) as max_maas,
									(select min(maas) from calisanlar2 where marka_isim=isyeri) as min_maas
from markalar;


-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id,marka_isim,( select count(sehir) from calisanlar2 where marka_isim=isyeri)
as sehir_sayisi from markalar;

--Interview Question: En yüksek ikinci maas değerini çağırın.
select max(maas) as enyuksek_ikinci_maas from calisanlar2
where maas <(select max(maas) from calisanlar2); -- sart olusturduk en yuksek maastan kucuk ise ikincii enkucuk maas olur

----Interview Question: En düşük ikinci maas değerini çağırın.
select min(maas) as endusuk_ikinci_maas from calisanlar2
where maas >(select min(maas) from calisanlar2); 

-- En yuksek ucuncu maas degerini bulunuz
select max(maas) as enyuksek_ucuncu_maas from calisanlar2
where maas< (select max(maas) from calisanlar2 where maas <(select max(maas) from calisanlar2));

-- En dusuk ucuncu maas degerini bulunuz
select min(maas) as endusuk_ucuncu_maas from calisanlar2
where maas> (select min(maas) from calisanlar2 where maas >(select min(maas) from calisanlar2));

select * from calisanlar2;
select * from markalar;























