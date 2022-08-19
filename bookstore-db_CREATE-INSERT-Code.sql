CREATE TABLE book_types (
				type_id INT NOT NULL PRIMARY KEY,
				book_type TEXT (50) NOT NULL
				)

CREATE TABLE authors (
				author_id INT NOT NULL PRIMARY KEY,
				author_name TEXT (50) NOT NULL
				)

CREATE TABLE publishers (
				publisher_id INT NOT NULL PRIMARY KEY,
				publisher_name TEXT (50) NOT NULL,
				country TEXT (25)
				)

CREATE TABLE books (
				book_id  INT NOT NULL,
				book_name TEXT (50) NOT NULL,
				
				book_type INT NOT NULL,
				author_id INT NOT NULL,
				publisher_id INT NOT NULL,
				price INT (5, 2),
				
				PRIMARY KEY (book_id, book_type, author_id, publisher_id),
			
				FOREIGN KEY (book_type) REFERENCES book_types (type_id) 
					ON DELETE CASCADE ON UPDATE NO ACTION,
				FOREIGN KEY (author_id) REFERENCES authors (author_id) 
					ON DELETE CASCADE ON UPDATE NO ACTION,
				FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id) 
					ON DELETE CASCADE ON UPDATE NO ACTION
				)
							

INSERT INTO book_types (type_id, book_type) VALUES (1, 'Anı')
INSERT INTO book_types (type_id, book_type) VALUES (2, 'Deneme')
INSERT INTO book_types (type_id, book_type) VALUES (3, 'Hikaye')
INSERT INTO book_types (type_id, book_type) VALUES (4, 'Şiir')

INSERT INTO authors (author_id, author_name) VALUES (1, 'Ömer Seyfettin')
INSERT INTO authors (author_id, author_name) VALUES (2, 'Halide Edip Adıvar')
INSERT INTO authors (author_id, author_name) VALUES (3, 'Ahmet Rasim')
INSERT INTO authors (author_id, author_name) VALUES (4, 'Necip Fazıl Kısakürek')
INSERT INTO authors (author_id, author_name) VALUES (5, 'Rıfat Ilgaz')
INSERT INTO authors (author_id, author_name) VALUES (6, 'George Orwell')
INSERT INTO authors (author_id, author_name) VALUES (7, 'David Atkinson')
INSERT INTO authors (author_id, author_name) VALUES (8, 'Osman Şahin')

INSERT INTO publishers (publisher_id, publisher_name, country) 
VALUES (1, 'Can Yayınları', 'TR')
INSERT INTO publishers (publisher_id, publisher_name, country) 
VALUES (2, 'Özgür Yayınları', 'TR')
INSERT INTO publishers (publisher_id, publisher_name, country) 
VALUES (3, 'Bilge Kültür Sanat', 'TR')
INSERT INTO publishers (publisher_id, publisher_name, country) 
VALUES (4, 'Dergah Yayınları', 'TR')
INSERT INTO publishers (publisher_id, publisher_name, country) 
VALUES (5, 'Büyük Doğu Yayınları', 'TR')
INSERT INTO publishers (publisher_id, publisher_name, country) 
VALUES (6, 'Hacegan Yayınları', 'TR')
INSERT INTO publishers (publisher_id, publisher_name, country) 
VALUES (7, 'Çınar Yayınları', 'TR')
INSERT INTO publishers (publisher_id, publisher_name, country) 
VALUES (8, 'Amazon', 'US')
INSERT INTO publishers (publisher_id, publisher_name, country) 
VALUES (9, 'Joffe Books', 'UK')

INSERT INTO books (book_id , book_name, book_type, author_id, publisher_id, price) 
VALUES (1, 'Mor Salkımlı Ev', 1, 2, 1, 40.00)
INSERT INTO books (book_id , book_name, book_type, author_id, publisher_id, price) 
VALUES (2, 'Vurun Kahpeye', 1, 2, 1, 32.00)
INSERT INTO books (book_id , book_name, book_type, author_id, publisher_id, price) 
VALUES (3, 'Vurun Kahpeye', 1, 2, 2, 12.00)
INSERT INTO books (book_id , book_name, book_type, author_id, publisher_id, price) 
VALUES (4, 'Şehir Mektupları', 2, 3, 4, 65.00)
INSERT INTO books (book_id , book_name, book_type, author_id, publisher_id, price) 
VALUES (5, 'Çile', 4, 4, 5, 100.00)
INSERT INTO books (book_id , book_name, book_type, author_id, publisher_id, price) 
VALUES (6, 'Çöle İnen Nur', 3, 4, 5, 120.00)
INSERT INTO books (book_id , book_name, book_type, author_id, publisher_id, price) 
VALUES (7, 'Dördüncü Bölük', 3, 5, 7, 21.00)
INSERT INTO books (book_id , book_name, book_type, author_id, publisher_id, price) 
VALUES (8, 'Sonuncu İz', 3, 8, 1, 29.00)
INSERT INTO books (book_id , book_name, book_type, author_id, publisher_id, price) 
VALUES (9, 'Animal Farm', 3, 6, 8, 55.00)
INSERT INTO books (book_id , book_name, book_type, author_id, publisher_id, price) 
VALUES (10, 'Love Byte', 3, 7, 9, 35.00)