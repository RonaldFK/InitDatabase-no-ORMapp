-- list of schedule by tennis cluber --
CREATE OR REPLACE VIEW "schedule_tennis_cluber" AS
	SELECT distinct t.firstname,t.lastname ,c.name as "club''s name",
		s.date as "date of course"
		s.start_hour as "start course",
		s.end_hour as "end course",
		s.status as "course''s status"
	FROM schedule s
	JOIN tennis_cluber t on t.id = s.tennis_cluber_id
	JOIN club c ON c.id = s.club_id;
	
SELECT * FROM schedule_tennis_cluber;

-- view to prepare sum of rental --
CREATE OR REPLACE VIEW sum_rental AS		
SELECT SUM(rental_list.quantity*(SELECT price FROM rental_elem WHERE id = rental_list.rental_elem_id
								 AND r.id = rental_list.rental_id
								 AND s.id = r.schedule_id
								 AND t.id = s.tennis_cluber_id)) as total
FROM rental_list,tennis_cluber t, rental r, schedule s
GROUP BY t.firstname,t.lastname;


-- list and sum of rental by schedule for each tennis cluber --
SELECT t.firstname,t.lastname, c.name,s.date,
	(SELECT total FROM sum_rental WHERE firstname=t.firstname)
	
FROM TENNIS_CLUBER t,club c, schedule s
	WHERE t.id IN( SELECT tennis_cluber_id from schedule WHERE id IN (
		SELECT schedule_id FROM rental WHERE id IN (
			SELECT rental_id FROM rental_list WHERE rental_elem_id IN (
				SELECT id FROM rental_elem
			))
		)
	)
GROUP BY t.firstname,t.lastname,c.name,s.date;