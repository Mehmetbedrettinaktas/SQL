-- SELECT - SIMILAR TO -REGEX(REgular Expressions)--
/*
SIMILAR TO: Daha karmasik pattern(kalip)ile sorgulama islemi icin SIMILAR TO kullanilabilir.
sadece PostgreSQL de kullanilir. Buyuk Kucuk harf onemlidir

REGEX: Herhangi bir kod, medin icerisinde istenen yazi veya kod parcasinin aranip bulunmasini saglayan
kendine ait bir soz dizimi olan bir yapidir.  MySQL de (REGEXP_LIKE) olarak kullanilir
PostgreSQL'de "~" karekteri ile kullanilir.
*/
CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
   select * from kelimeler;
 --  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
 -- Veya islemi icin | karekteri kullanilir
 
 --SIMILAR TO 			ile eger tablodaki kelimeleri biz biliyorsak
  select * from kelimeler where kelime SIMILAR TO '%(at|ot|Ot|oT|At|aT|OT)%';
  -- LIKE ile 
  select * from kelimeler WHERE kelime ILIKE '%at%' or kelime ILIKE '%ot%';
  select * from kelimeler WHERE kelime ~~* '%at%' or kelime ~~* '%ot%'; 
   
  -- REGEX ile
  select * from kelimeler WHERE kelime ~* 'ot' or kelime ~* 'at';
  
  
  -- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
  select * from kelimeler Where kelime similar to 'ho%|hi%';
  
  select * from kelimeler where kelime ~~* 'ho%' or kelime ~~* 'hi%';
  
  -- REGEX ile 
  select * from kelimeler where kelime ~* 'h[oi](.*)' -- Regex'te ".(nokta) bir kareteri temsil eder" -- 'h[oi] ilk harfi h ikinci harfi o veya i '
  /*
  LIKE : ~~ --> sadece kucuk harfler 
ILIKE : ~~* --> hem kucuk hemde buyuk harfleri 
NOT LIKE : !~~
NOT ILIKE :!~~*
  */
 -- Regex'de ikinci karekter icin koseli parantez[] kullanilir.  * hepsi anlaminda kullanilir
 
 -- Sonu 't' veya 'm' ile bitenleri listeleyeniz
 select * from kelimeler where kelime ~~* '%t' or kelime ~~*'%m';
  -- similar to ile 
 select * from kelimeler where kelime similar to '%t|%m'; 
 -- REGEX ile 
 select * from kelimeler where kelime ~* '(.*)[tm]$';   -- $ karekteri basinda ne olursa olsun burada bitir. bitisi gosteriyor
 
 -- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
 -- like ile 
 select * from kelimeler where kelime ~~*'h_t';
 -- similir to ile 
 select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t';   -- burasi [a-z,A-Z,0-9] iklinci karekteri temsil ediyor.
-- REGEX ile 
 select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t'; --  h[a-z,A-Z,0-9]t  bas harfi kucuk h oldugu icin HOT gelmedi
 
 --İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan “kelime" değerlerini çağırın.
 select * from kelimeler where kelime similar to 'h[a-e,A-E](.*)%t';  -- [a-e,A-E](.*) ikinci karekter a dan e ve sonrasi herhangi bir karekter ve son harf t
-- REGEX ile 
select * from kelimeler where kelime ~* 'h[a-e](.*)t';
-- like ile 
 select * from kelimeler where kelime ~~*'h[a-e]%t';
 
 
 --İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
 select * from kelimeler where kelime ~'^[say](.*)';  -- ^baslangic'i temsil eder 
 
 --Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
 select * from kelimeler where kelime similar to '%[maf]';
 
 select * from kelimeler where kelime ~ '(.*)[maf]$'  -- (.*) nokta bir karekter * hepsi demek
 
 --İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
 select * from kelimeler where kelime ~ 'h[a|i]t';
 -- Similar to ile 
 select * from kelimeler where kelime similar to 'h[a|i]t'; 
 
 select * from kelimeler where kelime ~ '^h[a|i]t$';
  
 --İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi 
 --bir karakter olup üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
 select * from kelimeler where kelime similar to '[b-s]_l%';
 select * from kelimeler where kelime ~ '^[b-s].l(.*)'; 
 
 --içerisinde en az 2 adet o barıdıran kelimelerin tüm bilgilerini listeleyiniz.
 select * from kelimeler where kelime similar to '%[o][o]%';
 select * from kelimeler where kelime similar to '%[o]{2}%';  -- Süslü parantez içinde belirttiğimiz rakam bir önceki
                                                           	  --köşeli parantez içinde kaçtane olduğunu belirtir
															  
 
 --içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
 select * from kelimeler where kelime similar to '%[o]{4}%';
 select * from kelimeler where kelime similar to '%[o][o][o][o]%';

 
 --'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
 select * from kelimeler where kelime SIMILAR TO '%[a|s|y](.*)[m|f]$';