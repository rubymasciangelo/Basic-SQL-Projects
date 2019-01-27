/* DRILL 7 CREATE A DATABASE WITH 2 TABLES. ASSIGN FK CONSTRAINT THAT SHARES RELATED DATA WITH A PK ON
	THE OTHER TABLE AND CREATE A STATEMENT THAT QUERIES DATA FROM BOTH TABLES */

CREATE DATABASE real_celebrity_allergies

USE [real_celebrity_allergies]

CREATE TABLE tbl_allergens (
	allergen_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	allergen_type VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_celebs (
	celeb_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	celeb_name VARCHAR(50) NOT NULL,
	celeb_allergy  INT FOREIGN KEY REFERENCES tbl_allergens(allergen_id)

);


INSERT INTO tbl_allergens
	(allergen_type)
	VALUES
	('bees'),
	('magnets'),
	('corduroy'),
	('cell-phone cases'),
	('paper'),
	('hair'),
	('cages')
;

UPDATE tbl_allergens
	SET allergen_type = 'ice cubes'
	WHERE allergen_id = 3;

UPDATE tbl_allergens
	SET allergen_type = 'mice'
	WHERE allergen_id = 5;

INSERT INTO tbl_celebs
	(celeb_name, celeb_allergy)
	VALUES
	('Chrissy Teigen', 2),
	('Anthony Hawk', 3),
	('Britney Spears', 1),
	('Kendall Jenner', 4),
	('Danny DeVito', 7),
	('Kodak Black', 5),
	('Bob Ross', 5),
	('Celine Dion', 6),
	('Zac Efron', 2)
	;


SELECT * FROM tbl_celebs;

SELECT * FROM tbl_allergens;

SELECT allergen_type, celeb_name
	FROM (tbl_celebs          
	INNER JOIN tbl_allergens ON allergen_id = celeb_allergy);

SELECT allergen_type, celeb_name
	FROM (tbl_celebs          
	INNER JOIN tbl_allergens ON allergen_id = celeb_allergy)
	WHERE celeb_name = 'Kodak Black';                                                                                                          