-------------------------------
----- TABLE TENNIS CLUBER -----
-------------------------------

-- test insert tennis cluber --
SELECT * FROM insert_tennis_cluber('{
								   "firstname":"bobi",
								   "lastname":"Doe",
								   "login":"bobi1.doe1",
								   "password":"test",
								   "email":"bobi1.doe1@gmail.com",
								   "activ":"1"
								   }');
								   
-- test modify tennis cluber --
SELECT * FROM modify_tennis_cluber(2,'{
								   "firstname":"bobiRe",
								   "lastname":"DoeRe",
								   "login":"bobi1.doe1",
								   "password":"test",
								   "email":"bobi1.doeRe@gmail.com",
								   "activ":"1"
								   }');
								   
-- test delete tennis cluber --
SELECT * FROM delete_tennis_cluber(50);		

-------------------------------
--------- TABLE CLUB ----------
-------------------------------

-- test insert club --
SELECT * FROM insert_club('{
						  "name":"club de la villette",
						  "opening_hour":"09:00:00",
						  "closing_hour":"19:00:00"				
						  }');
						  
SELECT * FROM insert_club('{
						  "name":"club de la villette2",
						  "opening_hour":"09:00:00",
						  "closing_hour":"19:00:00"				
						  }');						  
-- test modify club --
SELECT * FROM modify_club(1,'{
						  "name":"club de la ville première",
						  "opening_hour":"09:00:00",
						  "closing_hour":"19:00:00"				
						  }');

-- test delete tennis cluber --
SELECT * FROM delete_club(50);

-------------------------------
------- TABLE SCHEDULE --------
-------------------------------

-- test insert schedule --
SELECT * FROM insert_schedule('{
						  "tennis_cluber_id":"1",
						  "club_id":"1",
						  "status":"reserved",
						  "start_hour":"09:00:00",
						  "end_hour":"10:00:00"
						  }');
						  
-- test modify schedule --
SELECT * FROM modify_schedule(1,'{
						  
						  "status":"abord",
						  "start_hour":"09:00:00",
						  "end_hour":"10:00:00"
						  }');
						  
-- test delete schedule --
SELECT * FROM delete_schedule(50);								  

-------------------------------
------- TABLE RENTAL --------
-------------------------------

-- test insert rental --
SELECT * FROM insert_rental('{
						  "tennis_cluber_id":"1",
						  "club_id":"1",
						  "schedule_id":"1"
						  }');
						  
-- test modify rental --
SELECT * FROM modify_rental(1,'{
						  "tennis_cluber_id":"1",
						  "club_id":"2",
						  "schedule_id":"1"
						  }');
						  
-- test delete rental --
SELECT * FROM delete_rental(50);

-------------------------------
------ TABLE RENTAL_ELEM ------
-------------------------------

-- test insert rental_elem --
SELECT * FROM insert_rental_elem('{
						  "name":"short nike",
						  "description":"un short de marque nike",
						  "price":"60"
						  }');
						  
-- test modify rental_elem --
SELECT * FROM modify_rental_elem(1,'{
						  "name":"short nike nouvelle édition",
						  "description":"un short de marque nike",
						  "price":"60"
						  }');
						  
-- test delete rental_elem --
SELECT * FROM delete_rental_elem(50);

-------------------------------
------ TABLE RENTAL_LIST ------
-------------------------------

-- test insert rental_list --
SELECT * FROM insert_rental_list('{
						  "rental_id":"1",
						  "quantity":"5",
						  "rental_elem_id":"1"
						  }');
						  
-- test modify rental_list --
SELECT * FROM modify_rental_list(1,'{
						  "rental_id":"1",
						  "quantity":"6",
						  "rental_elem_id":"1"
						  }');
						  
-- test delete rental_list --
SELECT * FROM delete_rental_list(50);



select * from rental_list								   