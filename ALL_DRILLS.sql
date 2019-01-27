USE [zoo_db]

[dbo].[Populate_db_zoo]

/* DRILL 1 ALL INFO FROM HABITAT TABLE */
SELECT * FROM tbl_habitat;

/* DRILL 2 ALL NAMES FROM species_name THAT HAVE species_order VALUE OF 3 */
SELECT species_name FROM tbl_species WHERE species_order = 3;

/* DRILL 3 RETRIEVE NUTRITION_TYPE FROM NUTRI TION TABLE THAT HAVE A NUTRITION_COST OF 600 OR LESS */
SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600; 

/* DRILL 4 RETRIEVE ALL SPECIES_NAMES WITH THE NUTRITION_ID BETWEEN 2202 AND 2206 FROM TBL_NUTRITION */
SELECT species_name FROM tbl_species WHERE species_nutrition BETWEEN 2202 AND 2206;

/* DRILL 5 RETRIEVE ALL NAMES IN SPECIES_NAME USING ALIAS: 'SPECIES NAME:' FROM SPECIES TABLE AND THEIR NUTRITION TYPE UNDER 'NUTRITION TYPE:' FROM THE NUTRITION TABLE */
SELECT species_name AS [Species Name:], nutrition_type AS [Nutrition Type:]
FROM tbl_species a1
	INNER JOIN tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition;

/* DRILL 6 FROM THE SPECIALIST TABLE RETRIEVE THE FIRST, LAST AND CONTACT INFO FOR THE PENGUIN CARETAKERS FROM THE SPECIES TABLE */
SELECT specialist_fname, specialist_lname, specialist_contact
	FROM ((tbl_specialist
	INNER JOIN tbl_care ON specialist_id = care_specialist)
	INNER JOIN tbl_species ON care_id = species_care)
	WHERE species_name = 'penguin';

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
	('ice cubes'),
	('cell-phone cases'),
	('mice'),
	('hair'),
	('cages')
;


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

SELECT allergen_type, celeb_name
	FROM (tbl_celebs          
	INNER JOIN tbl_allergens ON allergen_id = celeb_allergy);

SELECT allergen_type, celeb_name
	FROM (tbl_celebs          
	INNER JOIN tbl_allergens ON allergen_id = celeb_allergy)
	WHERE celeb_name = 'Kodak Black';     