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
-------- TABLE SCHEDULE -------
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

-------------------------------
-------- TABLE RENTAL -------
-------------------------------

-- insert a new rental

CREATE OR REPLACE FUNCTION insert_rental(data json) RETURNS rental AS $$

	INSERT INTO rental(tennis_cluber_id,club_id,schedule_id)
	VALUES (
		(data->>'tennis_cluber_id')::INTEGER,
		(data->>'club_id')::INTEGER,
		(data->>'schedule_id')::INTEGER
	)
	RETURNING *;

$$ LANGUAGE SQL SECURITY DEFINER;

-- modify rental -- 
CREATE OR REPLACE FUNCTION modify_rental(id_to_update integer,data json) RETURNS rental AS $$

	UPDATE rental
	SET 
		tennis_cluber_id = (data->>'tennis_cluber_id')::INTEGER,
		club_id = (data->>'club_id')::INTEGER,
		schedule_id = (data->>'end_hour')::INTEGER
	WHERE id = id_to_update
	RETURNING *;

$$ LANGUAGE SQL SECURITY DEFINER;

								   
-- delete rental --

CREATE OR REPLACE FUNCTION delete_rental(id_to_detete integer) RETURNS integer AS $$

	DELETE FROM rental where id = id_to_detete
	RETURNING id;

$$ LANGUAGE SQL SECURITY DEFINER;

-------------------------------
------- TABLE RENTAL_LIST------
-------------------------------

-- insert a new rental_list

CREATE OR REPLACE FUNCTION insert_rental_list(data json) RETURNS rental_list AS $$

	INSERT INTO rental_list(rental_id,quantity,rental_elem_id)
	VALUES (
		(data->>'rental_id')::INTEGER,
		(data->>'quantity')::INTEGER,
		(data->>'rental_elem_id')::INTEGER
	)
	RETURNING *;

$$ LANGUAGE SQL SECURITY DEFINER;

-- modify rental_list -- 
CREATE OR REPLACE FUNCTION modify_rental_list(id_to_update integer,data json) RETURNS rental_list AS $$

	UPDATE rental_list
	SET 
		rental_id = (data->>'rental_id')::INTEGER,
		quantity = (data->>'quantity')::INTEGER,
		rental_elem_id = (data->>'rental_elem_id')::INTEGER
	WHERE id = id_to_update
	RETURNING *;

$$ LANGUAGE SQL SECURITY DEFINER;

								   
-- delete rental_list --

CREATE OR REPLACE FUNCTION delete_rental_list(id_to_detete integer) RETURNS integer AS $$

	DELETE FROM rental_list where id = id_to_detete
	RETURNING id;

$$ LANGUAGE SQL SECURITY DEFINER;

-------------------------------
------- TABLE RENTAL_ELEM------
-------------------------------

-- insert a new rental_elem

CREATE OR REPLACE FUNCTION insert_rental_elem(data json) RETURNS rental_elem AS $$

	INSERT INTO rental_elem(name,description,price)
	VALUES (
		(data->>'name'),
		(data->>'description'),
		(data->>'price')::INTEGER
	)
	RETURNING *;

$$ LANGUAGE SQL SECURITY DEFINER;

-- modify rental_elem -- 
CREATE OR REPLACE FUNCTION modify_rental_elem(id_to_update integer,data json) RETURNS rental_elem AS $$

	UPDATE rental_elem
	SET 
		name = (data->>'name'),
		description = (data->>'description'),
		price = (data->>'price')::INTEGER
	WHERE id = id_to_update
	RETURNING *;

$$ LANGUAGE SQL SECURITY DEFINER;

								   
-- delete rental_elem --

CREATE OR REPLACE FUNCTION delete_rental_elem(id_to_detete integer) RETURNS integer AS $$

	DELETE FROM rental_elem where id = id_to_detete
	RETURNING id;

$$ LANGUAGE SQL SECURITY DEFINER;