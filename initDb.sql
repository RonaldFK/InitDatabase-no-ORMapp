BEGIN;
-- TRUNCATE TABLES --
TRUNCATE TABLE tennis_cluber,club,schedule,rental,rental_elem CASCADE;
--TRUNCATE TABLE users.tennis_cluber,admin.club,admin.schedule,admin.rental,admin.rental_elem CASCADE;

-- DROP TABLES --
DROP TABLE IF EXISTS "tennis_cluber","club","schedule","rental","rental_elem" CASCADE;
DROP SEQUENCE IF EXISTS club_number CASCADE;
DROP DOMAIN IF EXISTS public.VALID_NAME CASCADE;
DROP DOMAIN IF EXISTS public.VALID_EMAIL CASCADE;

-- domain to use for data type --
CREATE DOMAIN VALID_NAME as TEXT CHECK (value ~ '^[-''a-zA-Z]{3,10}$'); -- letters on max 10 char
CREATE DOMAIN VALID_EMAIL as TEXT CHECK (value ~ '^([a-zA-Z0-9]+[-_.]?)*[a-zA-Z0-9]+@[a-zA-Z0-9]+[-]?[a-zA-Z0-9]+.[a-z]{2,}$'); -- letters on max 10 char

-- sequence to increment club number during insert query --
CREATE SEQUENCE club_number AS INTEGER
INCREMENT 1
START 100;

-- CREATING TABLE PROCESS--
CREATE TABLE tennis_cluber (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"firstname" VALID_NAME NOT NULL,
	"lastname" VALID_NAME NOT NULL,
	"login" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"email" VALID_EMAIL NOT NULL UNIQUE,
	"activ" BOOLEAN DEFAULT false,
	UNIQUE(firstname,lastname,login,email)
);

CREATE TABLE club (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"number" INTEGER NOT NULL UNIQUE, -- use "club_number" sequence to field this data
	"opening_hour" TIMETZ NOT NULL,
	"closing_hour" TIMETZ NOT NULL
);

CREATE TABLE schedule (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"tennis_cluber_id" INTEGER REFERENCES "tennis_cluber"("id"),
	"club_id" INTEGER REFERENCES "club"("id"),
	"status" TEXT NOT NULL DEFAULT 'pending'
);

CREATE TABLE rental (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"tennis_cluber_id" INTEGER REFERENCES "tennis_cluber"("id"),
	"club_id" INTEGER REFERENCES "club"("id")
);

CREATE TABLE rental_elem (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"name" NAME NOT NULL UNIQUE,
	"description" TEXT DEFAULT 'ajouter une description',
	"rental_id" INTEGER REFERENCES "rental"("id")
);
-- END CREATING TABLE PROCESS--

-- STARTING ALTER TABLE PROCESS--
ALTER TABLE tennis_cluber ADD COLUMN "club_id" INTEGER REFERENCES "club"("id") ON DELETE CASCADE;

--INSERT INTO club(name,number,opening_hour,closing_hour) values('test4',nextval('club_number'),5,5);
COMMIT;

-- END GLOBAL PROCESS --


