-- GROUP BY --
 /*
 GROUP BY cumlecigi bir SELECT ifadesinde satirlari, sutunlari degerlerine gore
 ozet olarak gruplamak icin kullanilir.
 GROUP BY cumlecigi her grup basina satir dondurur
 GROUP BY genelde , AVG(), COUNT(), MAX(), MIN() ve SUM() gibi aggregate fonsyonları ile
birlikte kullanılır
 */

CREATE TABLE manav 
(
    isim varchar(50), 
    urun_adi varchar(50), 
    urun_miktari int 
);
    
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', null, 2);


create table personel1
(id int primary key,
ad varchar(20),
soyad varchar(20),
yas int,
cinsiyet char,
sehir varchar(20),
ulke varchar(20),
maas int
);
insert into personel1 values(100, 'Eymen',  'Bal', '25', 'E', 'Istanbul', 'Turkiye', '20000');
insert into personel1 values(101, 'Derya', 'Soylu', '35', 'K', 'Istanbul', 'Turkiye', '25000');
insert into personel1 values(102, 'Enes', 'Boz', '55', 'E', 'Istanbul', 'Turkiye', '22000');
insert into personel1 values(103, 'Nil', 'Naz', '45', 'K', 'Trabzon', 'Turkiye', '20000');
insert into personel1 values(104, 'Ali', 'Can', '28', 'E', 'Ankara', 'Turkiye', '15000');
insert into personel1 values(105, 'Yusuf', 'Cengiz', '46', 'E', 'Bolu', 'Turkiye', '30000');
insert into personel1 values(106, 'Ahmet', 'Aslan', '38', 'E', 'Adana', 'Turkiye', '28000');
insert into personel1 values(107, 'Mehmet', 'Aslan', '29', 'E', 'Gaziantep', 'Turkiye', '21000');
insert into personel1 values(108, 'Sena', 'Yavuz', '49', 'K', 'New York', 'USA', '40000');
insert into personel1 values(109, 'Zehra', 'Amber', '52', 'K', 'New York', 'USA', '45000');
insert into personel1 values(110, 'Fatma', 'Nur', '33', 'K', 'Berlin', 'Almanya', '35000');
insert into personel1 values(111, 'Mustafa', 'Bay', '44', 'E', 'Paris', 'Fransa', '34000');
insert into personel1 values(112, 'Murat', 'Kerem', '28', 'E', 'Istanbul', 'Turkiye', '29000');
insert into personel1 values(113, 'Sinan', 'Ay', '45', 'E', 'Izmir', 'Turkiye', '19000');
insert into personel1 values(114, 'Figen', 'Bal', '55', 'K', 'Istanbul', 'Turkiye', '25000');
insert into personel1 values(115, 'Serkan', 'Bayram', '36', 'E', 'Londra', 'Ingiltere', '50000');
insert into personel1 values(116, 'Hakan', 'Bacak', '29', 'E', 'Londra', 'Ingiltere', '55000');
insert into personel1 values(117, 'Zafer', 'Yanak', '47', 'E', 'Berlin', 'Almanya', '42000');
insert into personel1 values(118, 'Birol', 'Kara', '37', 'E', 'Paris', 'Fransa', '41000');
insert into personel1 values(119, 'Ayten', 'Tan', '32', 'K', 'Roma', 'Italya', '39000');


-- kisi ismine göre satılan toplam meyve miktarlarını gösteren sorguyu yazınız.
select isim , sum(urun_miktari) as toplam_urun from manav 
group by isim ;

-- satılan meyve türüne (urun_adi) göre urun alan kişi sayısını gösteren
-- sorguyu yazınız. NULL olarak girilen meyveyi listelemesin.
select urun_adi, count(isim) as kisi_sayisi from manav 
where urun_adi is not null
group by urun_adi;

-- satılan meyve türüne (urun_adi) göre satılan (urun_miktari )MIN ve 
-- MAX urun miktarlarini, MAX urun miktarina göre sıralayarak listeyen sorguyu yazınız.
select urun_adi ,min(urun_miktari) as min_meyve, max(urun_miktari)as max_meyve 
from manav
where urun_adi is not null -- null tabloda gormek istemesek
group by urun_adi -- once grupladik
order by max_meyve desc; -- sonra siraladik

-- kisi ismine ve urun adına göre satılan ürünlerin toplamını gruplandıran
-- ve isime göre ters sırasıda listeyen sorguyu yazınız.
select isim ,urun_adi, sum(urun_miktari) as toplam_urun from manav
group by isim, urun_adi -- selecte neyi secmissek grup by da onu seciyoruz
order by isim desc;

select * from personel1;
-- personelin calıştığı ülkeleri listeleyiniz
select  ulke from personel1 group by ulke;

-- Ülkelere göre ortalama maaşları listeleyiniz
select ulke, round(avg(maas)) as ortalama_maas  -- avg --> ortalam yi aliyor  as--> yeni isim atiyoruz
												-- round --> kusuratli sayilari yuvarliyor
from personel1 -- personel1 tablosundan getir
group by ulke; -- grupla

-- Maas ortalamasını bayanlar ve baylar olarak sorgulayınız
select cinsiyet , round(avg(maas)) as ortalama_maas -- round(avg(maas),2) --> ,'den sonra ilk iki rarkami getiriyor
from personel1
group by cinsiyet;

-- Personelin, ulkelere göre ve şehirlere göre gruplayarak sorgulayın
select ulke, sehir from personel1
group by ulke, sehir;  -- group by de gruplama rastgele olarak yapiyor.

-- Personelin, ulkelere göre ve şehirler göre calışan sayısını sorgulayın.
select ulke, sehir, count(sehir) as calisan_sayisi
from personel1
group by ulke, sehir;

-- Her ulke için bay ve bayan çalışan sayısı ve yaş ortalamasını sorgulayınız.
select ulke, cinsiyet, count(*)       -- count (*) dedigimizde ulke ve cinsiyet stunlarnda her ne varsa getirir
as calisan_sayisi,
round(avg(yas)) as yas_ortalamasi 
from personel1
group by ulke, cinsiyet;

-- Her ulke için bay ve bayan çalışan sayısı ve yaş ortalamasını  ve maası 30000 den büyük olanları sorgulayınız.
select ulke, cinsiyet, round(avg(yas)) as ortalama_yas, count(*) from personel1 -- (*) hem ulke hemde cinsit icin gruplandir demis
where maas>30000         -- sartimiz maas'i 30000'den buyuk olanlari aliyor
group by ulke, cinsiyet; -- group by dan sonra where ( sart yazilmaz)

-- Her ulke için; bay ve bayan çalışan sayısı, yaş ortalamasını, maaşı 30000 den büyük olanları
-- ve ortalama yaşı büyükten küçüğe doğru sıralayınız.
select ulke, cinsiyet, round(avg(yas))as ortalama_yas, count(*) from personel1
where maas> 30000
group by ulke, cinsiyet -- ulke ve cinsiyete gore siralar
order by ortalama_yas desc; -- ortalama yaşı büyükten küçüğe doğru sıralayınız.





