/*===========================
    SQL Workshop (05 Apr 22)
=============================*/

-- WRITE A QUERY THAT RETURNS TRACK NAME AND ITS COMPOSER FROM TRACKS TABLE

SELECT name, Composer
FROM tracks ;

-- WRITE A QUERY THAT RETURNS ALL COLUMNS FROM TRACKS TABLE

SELECT *
FROM tracks ;

-- WRITE A QUERY THAT RETURNS THE NAME OF COMPOSERS OF EACH TRACK

SELECT Composer
FROM tracks;

-- WRITE A QUERY THAT RETURNS UNIQUE ALBUMID, MEDIATYPEID FROM TRACKS TABLE

SELECT DISTINCT AlbumId, MediaTypeId 
FROM tracks ;

-- WRITE A QUERY THAT RETURNS TRACK NAME AND TRACKID OF ‘Jorge Ben’

SELECT name, TrackId 
FROM tracks
WHERE Composer = 'Jorge Ben';

-- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH TOTAL AMOUNT IS GREATER THAN $25

SELECT *
FROM invoices
WHERE total > 25;

-- WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH TOTAL AMOUNT IS LESS THAN $15. JUST RETURN 5 ROWS

SELECT *
FROM invoices
WHERE total < 15
LIMIT 5;

/* WRITE A QUERY THAT RETURNS ALL INFO OF THE INVOICES OF WHICH TOTAL AMOUNT IS GREATER THAN $10. 
THEN SORT THE TOTAL AMOUNTS IN DESCENDING ORDER, LASTLY DISPLAY TOP 2 ROWS */

SELECT *
FROM invoices
WHERE total > 10
ORDER BY total DESC
LIMIT 2;
