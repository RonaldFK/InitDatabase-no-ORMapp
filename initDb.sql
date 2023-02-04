-- STARTING GLOBAL PROCESS --
BEGIN;

-- DROP SCHEMAS TO SEPARATE DATA ACCES --
DROP SCHEMA IF EXISTS users CASCADE;
DROP SCHEMA IF EXISTS admin CASCADE;

-- CREATING SCHEMAS TO SEPARATE DATA ACCES --
CREATE SCHEMA users AUTHORIZATION postgres;
CREATE SCHEMA admin AUTHORIZATION postgres;
COMMIT;

BEGIN;
-- TRUNCATE TABLES --
TRUNCATE TABLE users.tennis_cluber,admin.club,admin.schedule,admin.rental,admin.rental_elem CASCADE;

-- DROP TABLES --
DROP TABLE IF EXISTS "users.tennis_cluber","admin.club","admin.schedule","admin.rental","admin.rental_elem" CASCADE;
DROP SEQUENCE club_number CASCADE;
DROP DOMAIN users.NAME CASCADE;

-- domain to use for data type --
CREATE DOMAIN NAME as TEXT CHECK (value ~ '^[-''a-zA-Z]{1,10}$'); -- letters on max 10 char

-- sequence to increment club number during insert query --
CREATE SEQUENCE club_number AS INTEGER
INCREMENT 1
START 100;

-- CREATING TABLE PROCESS--
CREATE TABLE users.tennis_cluber (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"firstname" NAME NOT NULL,
	"lastname" NAME NOT NULL,
	"login" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	"email" TEXT NOT NULL,
	"activ" BOOLEAN DEFAULT false,
	UNIQUE(firstname,lastname,login)
);

CREATE TABLE admin.club (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"number" INTEGER NOT NULL UNIQUE, -- use "club_number" sequence to field this data
	"opening_hour" TIMETZ NOT NULL,
	"closing_hour" TIMETZ NOT NULL
);

CREATE TABLE admin.schedule (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"tennis_cluber_id" INTEGER REFERENCES "tennis_cluber"("id"),
	"club_id" INTEGER REFERENCES "club"("id"),
	"status" TEXT NOT NULL DEFAULT 'pending'
);

CREATE TABLE admin.rental (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"tennis_cluber_id" INTEGER REFERENCES "tennis_cluber"("id"),
	"club_id" INTEGER REFERENCES "club"("id")
);

CREATE TABLE admin.rental_elem (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"description" TEXT DEFAULT 'ajouter une description',
	"rental_id" INTEGER REFERENCES "rental"("id")
);
-- END CREATING TABLE PROCESS--

-- STARTING ALTER TABLE PROCESS--
ALTER TABLE tennis_cluber ADD COLUMN "club_id" INTEGER REFERENCES "club"("id");
--INSERT INTO club(name,number,opening_hour,closing_hour) values('test4',nextval('club_number'),5,5);
COMMIT;

-- END GLOBAL PROCESS --
select * from club;

