-- drop test user if exists 
DROP USER IF EXISTS 'youtunes_user'@'localhost';


-- create pysports_user and grant them all privileges to the pysports database 
CREATE USER 'youtunes_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL5IsGreat!';


-- grant all privileges to the pysports database to user pysports_user on localhost 
GRANT ALL PRIVILEGES ON youtunes.* TO'youtunes_user'@'localhost';


-- Drop the foreign key
ALTER TABLE album DROP FOREIGN KEY fk_artist;


-- drop tables if they are present
DROP TABLE IF EXISTS artist; 
DROP TABLE IF EXISTS album; 


-- create artist table 
CREATE TABLE artist (
	artist_id 		INT 			NOT NULL		AUTO_INCREMENT,
	first_name		VARCHAR(75)		NOT NULL,
	last_name		VARCHAR(75)		NOT NULL,
	PRIMARY KEY(artist_id)
);

-- create album table 
CREATE TABLE album (
	album_id		INT 			NOT NULL 		AUTO_INCREMENT,
	title			VARCHAR(150)	NOT NULL,
	price			DECIMAL(5, 2)	NOT NULL,
	genre			VARCHAR(75)		NOT NULL,
	img_url			VARCHAR(150)	NOT NULL,
	artist_id		INT				NOT NULL,
	PRIMARY KEY(album_id),
	CONSTRAINT fk_artist
	FOREIGN KEY(artist_id)
		REFERENCES artist(artist_id)
); 


-- insert artist statements 
INSERT INTO artist(first_name, last_name)
	VALUES('Charlie', 'Puth');

INSERT INTO artist(first_name, last_name)
	VALUES('Mat', 'Kearney');
	
INSERT INTO artist(first_name, last_name)
	VALUES('X', 'Ambassadors');
	
INSERT INTO artist(first_name, last_name)
	VALUES('James', 'Arthur');
	
INSERT INTO artist(first_name, last_name)
	VALUES('Elton', 'John');
	
	
-- insert album statements
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Nine Track Mind', 9.99, 'Pop', 'https://img.secure.cdn2.wmgecom.com/media/catalog/product/cache/1744/image/1200x/9df78eab33525d08d6e5fb8d27136e95/c/h/charlieputh_ninetrackmind_web.jpg_1_1.jpeg', (SELECT artist_id FROM artist WHERE last_name = 'Puth'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Young Love', 13.99, 'Singer-Songwriter', 'http://takingtimeformommy.com/wp-content/uploads/2011/08/MK_YL_Cover.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Kearney'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('VHS', 6.99, 'Alternative', 'https://sentireascoltare.com/wp-content/uploads/2015/07/x-ambassadors-vhs.jpeg', (SELECT artist_id FROM artist WHERE last_name = 'Ambassadors'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('Itll All Make Sense In The End', 11.99, 'Pop', 'https://www.lahiguera.net/musicalia/artistas/james_arthur/disco/11333/james_arthur_itll_all_make_sense_in_the_end-portada.jpg', (SELECT artist_id FROM artist WHERE last_name = 'Arthur'));
	
INSERT INTO album(title, price, genre, img_url, artist_id)
	VALUES('The Lockdown Sessions', 9.99, 'Pop', 'https://artmagazinoweb.files.wordpress.com/2021/10/elton_john_the_lockdown_sessions.jpg?w=900', (SELECT artist_id FROM artist WHERE last_name = 'John'));