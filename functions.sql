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

$$ LANGUAGE SQL;

-- modify tennis cluber profil -- 
CREATE OR REPLACE FUNCTION modify_tennis_cluber(id integer,data json) RETURNS integer AS $$

	UPDATE tennis_cluber
	SET 
		firstname = data->>'firstname',
		lastname = data->>'lastname',
		login = data->>'login',
		password = data->>'password',
		email = data->>'email',
		activ = (data->>'activ')::boolean
	WHERE id = id
	RETURNING id;

$$ LANGUAGE SQL;

								   
-- supprimer un tennis cluber
-- modifier un tennis cluber