/*
  movie_rating_tables.sql
*/
DROP TABLE IF EXISTS ratings;

CREATE TABLE ratings 
(
  id int NOT NULL,   
  movie varchar(50) NOT NULL,
  rating int NULL
);

SELECT * FROM ratings;

INSERT INTO 2020_movie_ratings.ratings
(
  id,  
  movie, 
  rating
) VALUES 
(1,'Joker',4),
(1,'nineteen_seventeen',NULL),
(1,'once_upon_a_time_hollywood',3),
(1,'the_irishman',NULL),
(1,'little_women',1),
(1,'marriage_story',4),
(1,'the_farewell',NULL),
(1,'hustlers',3),
(2,'Joker',4),
(2,'nineteen_seventeen',4),
(2,'once_upon_a_time_hollywood',NULL),
(2,'the_irishman',NULL),
(2,'little_women',1),
(2,'marriage_story',3),
(2,'the_farewell',4),
(2,'hustlers',NULL)
(3,'Joker',4),
(3,'nineteen_seventeen',5),
(3,'once_upon_a_time_hollywood',NULL),
(3,'the_irishman',NULL),
(3,'little_women',NULL),
(3,'marriage_story',2),
(3,'the_farewell',4),
(3,'hustlers',4),
(4,'Joker',NULL),
(4,'nineteen_seventeen',NULL)
(4,'once_upon_a_time_hollywood',NULL),
(4,'the_irishman', 4),
(4,'little_women',5),
(4,'marriage_story',3),
(4,'the_farewell',3),
(4,'hustlers',2),
(5,'Joker',NULL),
(5,'once_upon_a_time_hollywood',5),
(5,'nineteen_seventeen',NULL),
(5,'the_irishman', NULL),
(5,'little_women',1),
(5,'marriage_story',4),
(5,'the_farewell',5),
(5,'hustlers',1),
(6,'Joker',5),
(6,'once_upon_a_time_hollywood',5),
(6,'nineteen_seventeen',NULL),
(6,'the_irishman', NULL),
(6,'little_women',1),
(6,'marriage_story',2),
(6,'the_farewell',NULL),
(6,'hustlers',NULL),
(7,'Joker',5),
(7,'once_upon_a_time_hollywood',5),
(7,'nineteen_seventeen',5),
(7,'the_irishman', 3),
(7,'little_women',3),
(7,'marriage_story',5),
(7,'the_farewell',4),
(7,'hustlers',5),
(8,'Joker',NULL),
(8,'once_upon_a_time_hollywood',NULL),
(8,'nineteen_seventeen',3),
(8,'the_irishman', 1),
(8,'little_women',5),
(8,'marriage_story',5),
(8,'the_farewell',5),
(8,'hustlers',5)
;

DROP TABLE IF EXISTS oscars;

CREATE TABLE oscars 
(
  id int NOT NULL,   
  movie varchar(50) NOT NULL,
  rating int NULL
);

SELECT * FROM oscars;

INSERT INTO 2020_movie_ratings.oscars
(
  id,  
  movie, 
  rating
) VALUES 
(1,'Joker',2),
(1,'nineteen_seventeen',NULL),
(1,'once_upon_a_time_hollywood',3),
(1,'the_irishman',NULL),
(1,'little_women',1),
(1,'marriage_story',2),
(1,'the_farewell',NULL),
(1,'hustlers',2),
(2,'Joker',5),
(2,'nineteen_seventeen',5),
(2,'once_upon_a_time_hollywood',NULL),
(2,'the_irishman',NULL),
(2,'little_women',2),
(2,'marriage_story',3),
(2,'the_farewell',5),
(2,'hustlers',NULL)
(3,'Joker',3),
(3,'nineteen_seventeen',5),
(3,'once_upon_a_time_hollywood',NULL),
(3,'the_irishman',NULL),
(3,'little_women',NULL),
(3,'marriage_story',3),
(3,'the_farewell',5),
(3,'hustlers',5),
(4,'Joker',NULL),
(4,'nineteen_seventeen',NULL)
(4,'once_upon_a_time_hollywood',NULL),
(4,'the_irishman', 5),
(4,'little_women',5),
(4,'marriage_story',3),
(4,'the_farewell',3),
(4,'hustlers',1),
(5,'Joker',NULL),
(5,'once_upon_a_time_hollywood',4),
(5,'nineteen_seventeen',NULL),
(5,'the_irishman', NULL),
(5,'little_women',2),
(5,'marriage_story',4),
(5,'the_farewell',5),
(5,'hustlers',1),
(6,'Joker',4),
(6,'once_upon_a_time_hollywood',5),
(6,'nineteen_seventeen',NULL),
(6,'the_irishman', NULL),
(6,'little_women',1),
(6,'marriage_story',4),
(6,'the_farewell',NULL),
(6,'hustlers',NULL),
(7,'Joker',5),
(7,'once_upon_a_time_hollywood',4),
(7,'nineteen_seventeen',5),
(7,'the_irishman', 3),
(7,'little_women',2),
(7,'marriage_story',5),
(7,'the_farewell',2),
(7,'hustlers',3),
(8,'Joker',NULL),
(8,'once_upon_a_time_hollywood',NULL),
(8,'nineteen_seventeen',3),
(8,'the_irishman', 3),
(8,'little_women',5),
(8,'marriage_story',5),
(8,'the_farewell',5),
(8,'hustlers',5)
;