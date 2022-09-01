-- SELECT - SIMILAR TO - REGEX(Regular Expressions)--
 /*
 SIMILAR TO : Daha karmasik patter(kalip) ile sorgulama islemi icin SIMILAR To kullanilabilir.
 sedece POSRGRESQL de kullanilir. Buyuk kucuk harf onemlidir.
 
 REGEX : Herhabgi bir kod, metin icerisinde istenen yazi veya kod parcasinin aranip bulunmasini saglayan
 kendine ait bir soz dizimi olan bir yapidir. MySQL de (REGEXP_LIKE) olarak kullanilir
 PostgreSQL'de "~" karekteri ile kullanilir
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
   
   -- icerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
   -- veya islemi icin  | karekteri kullanilir
   
   select * from kelimeler where kelime SIMILAR TO '%(at|ot|Ot|oT|At|at|OT)%';
   select * from kelimeler where kelime SIMILAR TO '%at%' or kelime ilike '%ot%';
   select * from kelimeler where kelime  ~~* '%at%' or kelime ~~* '%ot%';
   
   -- REGEX 
   select * from kelimeler where kelime ~* 'ot' or kelime ~*'at'; -- ~~ tek olunca sadece kucuk kelimeler getirir
   																-- ~* olunca hem kucuk hemde buyuk harfb getirir
	
	-- like olursa  ~~* seklinde kullaniyoruz
	-- REGEX olursa  ~*  seklinde kullanilir
	
	-- 'ho' veya 'hi' ile baslayan kelimeleri listeleyiniz
	-- Similar to ile
	select * from kelimeler where kelime similar to 'ho%|hi%';
	-- like ile 
	select * from kelimeler where kelime ~~* 'ho%' or kelime ~~*'hi';
	-- REGEX ile --> ~*
	select * from kelimeler where kelime ~* 'h[oi](.*)';  -- Regex'te ".(nokts) bir karekteri temsil eder"
   										-- ilk harf h ikinci harf o veya i sonu ne olursa olsun 
   -- Regex'de ikinci karekter icin koseli parentez [] kullanilir. * --> hepsi anlaminda kullanilir
   
   -- sonu 't' veya 'm' ile bitenleri listeleyiniz
   select * from kelimeler where kelime similar to '%t|%m'; 
   -- REGEX ile
   select * from kelimeler where kelime ~* '(.*)[tm]$';  --> $ basinda ne olursa olsun burada bitir
   
   -- h ile baslayip t ile biten 3 harfli kelimeleri listeleyiniz
   select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t';
   select * from kelimeler where kelime ~~* 'h_t'; -- > like 
   -- REGEX ile
   select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t';
   
   -- ilk karekteri 'h',  son karekteri 't' ve ikinci karekteri 'a' dan
   --'e'ye herhangi bir karekter olan "kelie" degerini cagirin.
   
   --similar to ile
   select kelime from kelimeler where kelime similar to 'h[a-e]%t';
   
   select kelime from kelimeler where kelime ~* 'h[a-e](.*)t';
   
   -- ilk karekteri 's', 'a' veya 'y' olan "kelime" degerlerini cagirin
   select * from kelimeler where kelime ~ '^[^say](.*)' -- ^ baslangici temsil eder
   
   -- son karekteri 'm', 'a' veya 'f' olan "kelime" degerini cagirin.
   select * from kelimeler where kelime ~'(.*)[maf]$';  -- . tek karekter * hepsi demek
   
   -- ilk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini sorgulayalim
   select * from kelimeler where kelime similar to 'h[a|i]t';
   
   select * from kelimeler where kelime ~ '^h[a|i]t$';
   
   -- ilk harfi 'A' dan 'M' ye bir karekter olan ve ikinci harfi herhangi bir karekter olup 
   -- ucuncu harfi 'l' olan "kelime" degerlerini cagirin.
   select kelime from kelimeler where kelime ~ '^[b-s].l(.*)';
   
   -- Icinde en az iki o barindiran kelimelerin tum bilgilerini listeleyiniz
   select * from kelimeler where kelime similar to '%[o][o]%';
   select * from kelimeler where kelime similar to '%[o]{2}%'; -- suslu parentez icinde belirtigimiz rakam bir onceki
   															-- koseli parantez icinde kactane oldugunu belirtir
															
   
   -- icerisinde en az 4 adet o(oooo) barindiran kelimelerin tum bilgilerini listeleyiniz
   select kelime from kelimeler where kelime similar to '%[o]{4}%';  --[o]{4}--> o dan 4 adet olan kelimeleri bana getir
   
   -- 'a', 's' yada 'y' ile baslayan ve 'm' yada 'f' ile biten  "kelime" degerlerini cagirin.
   select kelime from kelimeler where kelime ~ '^[â|s|y](.*)[m|f|]$';
   
  
   
   
   
   
   
   
   
   
   
   
   
 
 