-- GROUP BY -- HAVING --
/*
HAVING ifadesinin islevi where ifadesininkine cok benziyor. Ancak kumeleme fonksiyonlari ile 
WHERE ifadsi birlikte kullanilmadiginda HAVING ifadesine ihtiyac duyulmustur
GROUP BY ile kullenilir. Gruplamadan sonraki sart icin GROUP BY dan sonra HAVING kullanilir

*/

--Maaş ortalaması 3000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
select ulke, round(avg(maas)) as maas_ortelamasi from personel1  -- as ile gecici stun olusturduk
where cinsiyet='E' -- yalniz erkek olanlari getir
group by ulke  -- ulkeye gore grupla
having avg(maas)>3000; -- yalniz maas ortalamasi 3000'den fazla olanlari getir

-- odev sorulari 
--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu
select ulke, round(avg(maas)) as maas_ortalamasi from personel1
where cinsiyet ='E' 
group by ulke 
having count('E')>2;
 




























