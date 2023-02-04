-------------------------------
----- TABLE TENNIS CLUBER -----
-------------------------------

-- insert a new tennis cluber

CREATE FUNCTION insert_tennis_cluber(data json) RETURNS tennis_cluber AS $$

	INSERT INTO tennis_cluber(firstname,lastname,login,password,email,activ)
	VALUES (
		data->>'firstname',
		data->>'lastname',
		data->>'login',
		data->>'password',
		data->>'email',
		(data->>'activ')::boolean
	)
	RETURNING *;

$$ LANGUAGE SQL SECURITY DEFINER;

-- modify tennis cluber profil -- 
CREATE OR REPLACE FUNCTION modify_tennis_cluber(id_to_update integer,data json) RETURNS integer AS $$

	UPDATE tennis_cluber
	SET 
		firstname = data->>'firstname',
		lastname = data->>'lastname',
		login = data->>'login',
		password = data->>'password',
		email = data->>'email',
		activ = (data->>'activ')::boolean
	WHERE id = id_to_update
	RETURNING id;

$$ LANGUAGE SQL SECURITY DEFINER;

								   
-- delete tennis cluber --

CREATE OR REPLACE FUNCTION delete_tennis_cluber(id_to_detete integer) RETURNS integer AS $$

	DELETE FROM tennis_cluber where id = id_to_detete
	RETURNING id;

$$ LANGUAGE SQL SECURITY DEFINER;

-------------------------------
---------- TABLE CLUB ---------
-------------------------------

-- insert a new tennis cluber

CREATE OR REPLACE FUNCTION insert_club(data json) RETURNS club AS $$

	INSERT INTO club(name,number,opening_hour,closing_hour)
	VALUES (
		data->>'name',
		nextval('club_number'),
		(data->>'opening_hour')::TIME,
		(data->>'closing_hour')::TIME
	)
	RETURNING *;

$$ LANGUAGE SQL SECURITY DEFINER;

-- modify tennis cluber profil -- 
CREATE OR REPLACE FUNCTION modify_club(id_to_update integer,data json) RETURNS club AS $$

	UPDATE club
	SET 
		name = data->>'name',
		opening_hour = (data->>'opening_hour')::TIME,
		closing_hour = (data->>'closing_hour')::TIME
	WHERE id = id_to_update
	RETURNING *;

$$ LANGUAGE SQL SECURITY DEFINER;

								   
-- delete tennis cluber --

CREATE OR REPLACE FUNCTION delete_club(id_to_detete integer) RETURNS integer AS $$

	DELETE FROM club where id = id_to_detete
	RETURNING id;

$$ LANGUAGE SQL SECURITY DEFINER;


-------------------------------
---------- TABLE SCHEDULE ---------
-------------------------------

-- insert a new schedule

CREATE OR REPLACE FUNCTION insert_schedule(data json) RETURNS schedule AS $$

	INSERT INTO schedule(tennis_cluber_id,club_id,status,start_hour,end_hour)
	VALUES (
		(data->>'tennis_cluber_id')::INTEGER,
		(data->>'club_id')::INTEGER,
		(data->>'status'),
		(data->>'start_hour')::TIME,
		(data->>'end_hour')::TIME
	)
	RETURNING *;

$$ LANGUAGE SQL SECURITY DEFINER;

-- modify schedule -- 
CREATE OR REPLACE FUNCTION modify_schedule(id_to_update integer,data json) RETURNS schedule AS $$

	UPDATE schedule
	SET 
		status = data->>'status',
		start_hour = (data->>'start_hour')::TIME,
		end_hour = (data->>'end_hour')::TIME
	WHERE id = id_to_update
	RETURNING *;

$$ LANGUAGE SQL SECURITY DEFINER;

								   
-- delete schedule --

CREATE OR REPLACE FUNCTION delete_schedule(id_to_detete integer) RETURNS integer AS $$

	DELETE FROM schedule where id = id_to_detete
	RETURNING id;

$$ LANGUAGE SQL SECURITY DEFINER;
