/* Create database */
DROP DATABASE IF EXISTS youtunes;
CREATE DATABASE youtunes;

/* Create user and grant permisisons */
DROP USER IF EXISTS 'youtunes_user'@'localhost';
CREATE USER 'youtunes_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'tunesPass';
GRANT ALL PRIVILEGES ON youtunes.* TO 'youtunes_user'@'localhost';

USE youtunes;

/* Create artists table */
CREATE TABLE IF NOT EXISTS artists (
  artist_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50),
  PRIMARY KEY (artist_id)
);

/* Create albums table */
CREATE TABLE IF NOT EXISTS albums (
  album_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  price FLOAT NOT NULL,
  genre VARCHAR(50) NOT NULL,
  img_url VARCHAR(100),
  artist_id INT NOT NULL,
  release_year INT NOT NULL,
  PRIMARY KEY (album_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);
