/*===================================================
 SUBQUERIES
====================================================*/

/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */


-- Subquery
SELECT tracks.TrackId, tracks.name, tracks.AlbumId
FROM tracks
WHERE tracks.AlbumId =
(SELECT albums.AlbumId
FROM albums
WHERE albums.Title = 'Faceless'); -- this is dynamic method

-- marka_id'si ayni olan kayıtların ipucu (INNER JOIN)
  SELECT 	markalar.marka_id, markalar.marka_adi, 
		siparisler.siparis_adedi, siparisler.siparis_tarihi
  FROM markalar
  INNER JOIN siparisler
  ON markalar.marka_id = siparisler.marka_id;