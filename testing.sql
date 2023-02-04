-- test insert tennis cluber --
SELECT * FROM insert_tennis_cluber('{
								   "firstname":"bobi",
								   "lastname":"Doe",
								   "login":"bobi1.doe1",
								   "password":"test",
								   "email":"bobi1.doe1@gmail.com",
								   "activ":"1"
								   }');
								   
-- test insert tennis cluber --
SELECT * FROM modify_tennis_cluber(2,'{
								   "firstname":"bobiRe",
								   "lastname":"DoeRe",
								   "login":"bobi1.doe1",
								   "password":"test",
								   "email":"bobi1.doeRe@gmail.com",
								   "activ":"1"
								   }');								  