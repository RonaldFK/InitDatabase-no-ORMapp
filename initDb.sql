BEGIN;
-- TRUNCATE TABLES --
TRUNCATE TABLE tennis_cluber,club,schedule,rental,rental_elem,rental_list RESTART IDENTITY CASCADE;
--TRUNCATE TABLE users.tennis_cluber,admin.club,admin.schedule,admin.rental,admin.rental_elem CASCADE;

-- DROP TABLES --
DROP TABLE IF EXISTS "tennis_cluber","club","schedule","rental","rental_elem","rental_list" CASCADE;
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
	"created_at" TIMESTAMPTZ DEFAULT NOW(),
	"updated_at" TIMESTAMPTZ,
	UNIQUE(firstname,lastname,login,email)
);

CREATE TABLE club (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"number" INTEGER DEFAULT 0 UNIQUE, -- use "club_number" sequence to field this data
	"opening_hour" TIME NOT NULL,
	"closing_hour" TIME NOT NULL,
	"created_at" TIMESTAMPTZ DEFAULT NOW(),
	"updated_at" TIMESTAMPTZ
);

CREATE TABLE schedule (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"tennis_cluber_id" INTEGER REFERENCES "tennis_cluber"("id"),
	"club_id" INTEGER REFERENCES "club"("id"),
	"status" TEXT NOT NULL DEFAULT 'pending',
	"date" TIMESTAMPTZ,
	"start_hour" TIME NOT NULL,
	"end_hour" TIME NOT NULL,
	"created_at" TIMESTAMPTZ DEFAULT NOW(),
	"updated_at" TIMESTAMPTZ,
	UNIQUE(tennis_cluber_id,club_id,status,date,start_hour,end_hour) -- to block possibility to reserved more two course by day
);

CREATE TABLE rental (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"tennis_cluber_id" INTEGER REFERENCES "tennis_cluber"("id"),
	"club_id" INTEGER REFERENCES "club"("id"),
	"created_at" TIMESTAMPTZ DEFAULT NOW(),
	"updated_at" TIMESTAMPTZ,
	"schedule_id" INTEGER REFERENCES "schedule"("id")
);

CREATE TABLE rental_list (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"rental_id" INTEGER REFERENCES "rental"("id"),
	"quantity" INTEGER NOT NULL DEFAULT 1,
	"created_at" TIMESTAMPTZ DEFAULT NOW(),
	"updated_at" TIMESTAMPTZ
);

CREATE TABLE rental_elem (
	"id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	"name" NAME NOT NULL UNIQUE,
	"description" TEXT DEFAULT 'ajouter une description',
	"price" INTEGER NOT NULL DEFAULT 0,
	"created_at" TIMESTAMPTZ DEFAULT NOW(),
	"updated_at" TIMESTAMPTZ
);
-- END CREATING TABLE PROCESS--

-- STARTING ALTER TABLE PROCESS--
ALTER TABLE tennis_cluber ADD COLUMN "club_id" INTEGER REFERENCES "club"("id") ON DELETE CASCADE;
ALTER TABLE rental_list ADD COLUMN "rental_elem_id" INTEGER REFERENCES "rental_elem"("id");
ALTER TABLE rental_list ADD CONSTRAINT CONSTRAINT_RENTAL_LIST UNIQUE(rental_id,rental_elem_id);
--INSERT INTO club(name,number,opening_hour,closing_hour) values('test4',nextval('club_number'),5,5);
COMMIT;

-- CREATING INDEX --

CREATE INDEX idx_tennis_cluber ON tennis_cluber("id");
CREATE INDEX idx_club ON club("id");

-- END GLOBAL PROCESS --


