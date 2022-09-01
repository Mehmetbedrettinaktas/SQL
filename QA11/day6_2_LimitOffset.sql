-- LIMIT --
select * from kisiler;

-- KIsiler tablosundan ilk 5 veriyi listeleyiniz
 select * from kisiler limit 5;  -- limit 5 yazdigimzda ilk 5 veriyi bize getirir
 
 -- ilk iki verileden sonra 5 veriyi listeleyiniz
select * from kisiler limit 5 offset 2; -- limit ... offset ...--> ... den veriden sonra ilk ...veriyi getir. 

-- id değeri 5 den büyük olan ilk iki veriyi listeleyiniz
select * from kisiler where id>5 limit 2;  -- id>5 ilk iki veriyi getir
-- eger sart varsa where kullaniyoruz

--  MAAŞ'ı en yüksek 3 kişinin bilgilerini listeleyiniz
select * from kisiler order by maas desc limit 3;

-- En yüksek maaşı alan 4. 5.  6. kişilerin bilgilerini listeleyiniz
select * from kisiler order by maas desc limit 3 offset 3;-- offset 3'--> ilik 3'ten sonrasini getir
-- order by ile dogal siralamayi yaptik, desc ile buyukten kucuge dogru tersten siraladik limit 3 ile 3 kisiyi getir
-- yalniz offset 3 ile yalniz ilik 3'ten sonrasini getirdik









