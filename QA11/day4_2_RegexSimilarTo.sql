-- SELECT - SIMILAR TO -REGEX(REgular Expressions)--
/*
SIMILAR TO: Daha karmasik pattern(kalip)ile sorgulama islemi icin SIMILAR TO kullanilabilir.
sadece PostgreSQL de kullanilir. Buyuk Kucuk harf onemlidir

REGEX: Herhangi bir kod, metin icerisinde istenen yazi veya kod parcasinin aranip bulunmasini saglayan
kendine ait bir soz dizimi olan bir yapidir.  MySQL de (REGEXP_LIKE) olarak kullanilir
PostgreSQL'de "~" karekteri ile kullanilir.
*/
CREATE TABLE kelimeler11
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler11 VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler11 VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler11 VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler11 VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler11 VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler11 VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler11 VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler11 VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler11 VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler11 VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler11 VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler11 VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler11 VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler11 VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler11 VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler11 VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler11 VALUES (1017, 'bolooot', 5);
   
   select * from kelimeler11;
 -- 1) İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
 -- Veya islemi icin | karekteri kullanilir
 -- similar to ile
select * from kelimeler11 where kelime similar to '%(at|ot)%';

-- like ile
select * from kelimeler11 where kelime ilike '%at%' or kelime ilike '%ot%'; -- ilike
select * from kelimeler11 where kelime ~~* '%at%' or kelime ~~*'%ot%'; -- like

-- regex ile
select * from kelimeler11 where kelime ~* 'ot' or kelime ~*'at';  -- * ne varsa getir kucuk ve buyuk harfleri getiriyor

-- 2) 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
select * from kelimeler11 where kelime similar to 'ho%|hi%'; -- similar to ile
-- ilik ile 
select * from kelimeler11 where kelime ~~* 'ho%' or kelime ~~*'hi%';
-- Regex ile 
select * from kelimeler11 where kelime ~* 'h[oi](.*)'; -- Regex'te ".(nokta)" bir karekteri temsil ediyor. regex'te buyuk kucuk harf ayrimi yoktur
											-- h[oi] --> 'ho' ve 'hi' birlesiminden meydana geliyor. ortak paranteze aldik

-- Regex'de ikinci karekter icin koseli parantez[] kullanilir.  * hepsi anlaminda kullanilir
 
 --3) Sonu 't' veya 'm' ile bitenleri listeleyeniz
 -- like ile 
select * from kelimeler11 where kelime ~~*'%t' or kelime ~~*'%m';
-- similar to  ile 
select * from kelimeler11 where kelime similar to '%t|%m';
-- regex ile
select * from kelimeler11 where kelime ~*'(.*)[tm]$';   -- $ --> basinda ne olursa olsun burda bitir anlamina geliyor. Bitisi gosterir

 --4) h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
 -- like ile 
 select * from kelimeler11 where kelime ~~* 'h_t';
 -- similar to ile 
 select * from kelimeler11 where kelime similar to 'h[a-z,A-Z,0-9]t'; -- bas harfi kucuk h oldugu icin HOT getirmedi
 -- Regex ile 
 select * from kelimeler11 where kelime ~* 'h[a-z,A-Z,0-9]t';


 --5)İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye 
 --herhangi bir karakter olan “kelime" değerlerini çağırın.
 similar to ile
 select * from kelimeler11 where kelime similar to 'h[a-e]%t';
 -- regex ile 
 select * from kelimeler11 where kelime ~* 'h[a-e](.*)t';
 --  like ile  bunun cozumunu bulamadim
 select * from kelimeler11 where kelime like 'h[a-e]%t';
 
  --6) İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
 select * from kelimeler11 where kelime ~'^[say](.*)';  -- ^ baslangic'i temsil eder 
 
  --7) Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
 select * from kelimeler11 where kelime ~* '(.*)[maf]$';  -- regex ile  %=(.*)
 select * from kelimeler where kelime similar to '%[maf]';
 
  --8)İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
  -- similar to ile 
  select * from kelimeler11 where kelime similar to 'h[a|i]t';
 -- regex ile 
 select * from kelimeler11 where kelime ~ '^h[ai]t$';
 
  select * from kelimeler where kelime similar to 'h[a|i]t'; 
  
 -- 9)İlk harfi 'b' den ‘s' ye bir karakter olan ve ikinci harfi herhangi 
 --bir karakter olup üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
 
 select kelime from kelimeler11 where kelime ~ '^[b-s].l(.*)'; 
 select * from kelimeler11 where kelime similar to '[b-s]_l%';
 
 -- 10) içerisinde en az 2 adet o barıdıran kelimelerin tüm bilgilerini listeleyiniz.
 select * from kelimeler11 where kelime similar to '%[o][o]%'
 select * from kelimeler11 where kelime similar to '%[o]{2}%'
 
 -- 11) içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
 select * from kelimeler11 where kelime similar to '%[o]{4}%'; 
 select * from kelimeler11 where kelime similar to '%[o][o][o][o]%'
 
  
 --12) 'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
 select kelime from kelimeler11 where kelime ~ '^[a|s|y](.*)[m|f]$';
 
 
 
 