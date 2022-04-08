/*===================================================
 DDL COMMANDS (CREATE TABLE, DROP TABLE,ALTER TABLE)
====================================================*/	
	
/*------------------------------------------------------------------------------------------
/*  CREATE TABLE
/*------------------------------------------------------------------------------------------
	
/*personnel adinda bir tablo oluşturunuz.  Tabloda first_name, last_name 
age(INT) ve hire_date (Date) sutunuları bulunmalıdır.	*/

CREATE TABLE personnel (
first_name TEXT,
last_name TEXT,
age INT,
hire_date DATE 
);

/* Aynı isimle yeniden bir veritabanı oluşturulmak istenirse hata verir. Bu hatayı
almamak için IF NOT EXISTS keywordu kullanılabilir */

CREATE TABLE IF NOT EXISTS personnel (
	first_name TEXT,
	last_name TEXT,
	age INT,
	hire_date DATE 
);


/*Veritabanında vacation_plan adında yeni bir tablo oluşturunuz.  Sutun isimleri
place_id, country, hotel_name, employee_id, vacation_length,budget 	*/


CREATE TABLE IF NOT EXISTS vacation_plan (
	place_id INTEGER,
	country NVARCHAR(50),
	hotel_name NVARCHAR(100),
	employee_id INTEGER,
	vacation_length INT,
	budget REAL
);

/*-------------------------------------
/*  DROP TABLE
/*-------------------------------------
/* personel tablosunu siliniz */

DROP TABLE personnel;

/* Bir tabloyu silerken tablo bulunamazsa hata verir.
 Bu hatayı görmemek için IF EXISTS keywordu kullanılabilir.*/
 
 DROP TABLE IF EXISTS personnel;
  
-- NOT: SQL'de TRUNCATE TABLE komutu bulunmasına karşın SQLite bu komutu desteklememektedir. 
-- Truncate komutu bir tabloyu değil içindeki tüm verileri silmek için kullanılır.
 
 INSERT INTO vacation_plan VALUES (34, "Turkey", "Hotel Pamuk", 1, 7, 4000);
 
-- NOT: Aynı komut tekrar çalıştırılırsa herhangi bir kısıt yoksa ise aynı veriler
-- tekrar tabloya girilmiş olur. 
	
  INSERT INTO vacation_plan VALUES (42, "Turkey", "Hotel Mevlana", 2, 4, 2000);
  
/*vacation_plan tablosuna vacation_lenght ve budget sutunlarını eksik olarak veri girişi 
yapınız*/
  
   INSERT INTO vacation_plan 	(place_id, country, hotel_name, employee_id) 
								VALUES (06, "Turkey", "Hotel Ankara", 3);
  
-- NOT : giriş yapılmayan sutunlara NULL atanır.

/*------------------------------------------------------------------------------------------
/*  CONSTRAINTS - KISITLAMALAR 
/*-----------------------------------------------------------------------------------------

NOT NULL - Bir Sütunun NULL içermemesini garanti eder. 

UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ olmasını garanti eder.  

PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
 BENZERSİZ olmasını garanti eder.(NOT NULL ve UNIQUE birleşimi gibi)

FOREIGN KEY - Başka bir tablodaki Primary Key'i referans göstermek için kullanılır. 
 Böylelikle, tablolar arasında ilişki kurulmuş olur. 

 DEFAULT - Herhangi bir değer atanmadığında Başlangıç değerinin atanmasını sağlar.*/

 CREATE TABLE workers (
	id INT PRIMARY KEY,
	id_number TEXT NOT NULL UNIQUE,
	name TEXT DEFAULT 'NONAME',
	salary INTEGER NOT NULL 
 );
 
 INSERT INTO workers VALUES (1, '12345678910', 'John Doe', 10000);
 
-- UNIQUE constraint violation
 -- INSERT INTO workers VALUES (1, '12345678914', 'Jane Kohler', 9000);
 
  INSERT INTO workers VALUES (2, '12345678914', 'Jane Kohler', 9000);
  
  -- name kısmına NONAME yazılır. (DEFAULT)
  
  INSERT INTO workers (id, id_number, salary) VALUES (3, '12345678918',8000);
  
 /* vacation_plan tablosunu place_id sutunu PK ve employee_id sutununu 
ise FK olarak  değiştirirek vacation_plan2 adinda yeni bir tablo oluşturunuz.
Bu tablo, employees tablosu ile ilişkili olmalıdır */ 

 CREATE TABLE vacation_plan2 (
  place_id INT, 
  country NVARCHAR(50), 
  hotel_name NVARCHAR(100),
  employee_id INTEGER, 
  vacation_length INT,
  budget REAL,
  PRIMARY KEY(place_id),
  FOREIGN KEY (employee_id) REFERENCES employees(EmployeeId) 
 );
 

 /* Employees tablosundaki EmployeeId'si 1 olan kişi için bir tatil planı giriniz.*/
 
 INSERT INTO vacation_plan2 VALUES(45, "Turkey", "Happy Nation", 1, 5, 6500);
 
  /* Employees tablosunda bulunmayan bir kişi için (EmployeeId=9) olan kişi için bir tatil planı giriniz.*/
  
  -- ERROR (FOREIGN KEY constraint failed)
  -- INSERT INTO vacation_plan2 VALUES(35, "Turkey", "Happy Delray", 9, 4, 3000);
  
  
 /*JOIN işlemi ile 2 tablodan veri çekme*/ 
 
 SELECT e.FirstName, e.LastName, v.vacation_length, v.hotel_name
 FROM employees e
 JOIN vacation_plan2 v
 ON e.EmployeeId = v.employee_id;
 
  SELECT e.FirstName, e.LastName, v.vacation_length, v.hotel_name
 FROM employees e
 LEFT JOIN vacation_plan2 v
 -- INNER JOIN vacation_plan2 v
 ON e.EmployeeId = v.employee_id;
 
 /*------------------------------------------------------------------------------------------
/*  ALTER TABLE (ADD, RENAME TO, DROP)
/*  SQLITE MODIFY VE DELETE KOMUTLARINI DOĞRUDAN DESTEKLENMEZ
/*------------------------------------------------------------------------------------------
	
/*vacation_plan2 tablosuna name adında ve DEFAULT değeri noname olan 
yeni bir sutun ekleyelim */

ALTER TABLE vacation_plan2
ADD name TEXT DEFAULT 'nameless';

 /*vacation_plan2 tablosundaki name sütununu siliniz*/
 
ALTER TABLE vacation_plan2
DROP COLUMN name;

/* workers tablosunun adını people olarak değiştiriniz */

ALTER TABLE workers
RENAME TO people;


/*------------------------------------------------------------------------------------------
/*  UPDATE,DELETE
-- SYNTAX
----------
-- UPDATE tablo_adı
-- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
-- WHERE koşul;
		
--DELETE tablo_adı
--WHERE koşul;
/*-----------------------------------------------------------------------------------------*/
   
/*vacation_plan2 tablosundaki employee_id=1 olan kaydini  hotel_name'ini
 Komagene Hotel olarak güncelleyiniz.*/
 
 UPDATE vacation_plan2
 SET hotel_name = "Komagene Hotel"
 WHERE employee_id = 1;
 
 /* people tablosunda salary sutunu 9500 'den az olanların salary(maaşına)
%10 zam yapacak sorguyu yazınız*/ 

UPDATE people
SET salary = salary * 1.1
WHERE salary < 9500;

/*people tablosundaki tüm kayıtkarın salary sutununu 10000 olarak güncelleyiniz */

UPDATE people
SET salary = 10000;
 
 /*people tablosundaki employee_id=1 olan kaydı siliniz*/
DELETE FROM people
WHERE id=1;