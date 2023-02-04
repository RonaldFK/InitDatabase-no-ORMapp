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
SELECT * FROM delete_tennis_cluber(4);		

-------------------------------
--------- TABLE CLUB ----------
-------------------------------

-- test insert club --
SELECT * FROM insert_club('{
						  "name":"club de la villette",
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
SELECT * FROM delete_club(1);		

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
SELECT * FROM delete_schedule(1);								  


select * from schedule								   