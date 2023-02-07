#!/bin/bash
log=logfile.log
date >> $log
echo starting process

psql -U postgres -h localhost -d tennisClub -f initDb.sql &>>$log
psql -U postgres -h localhost -d tennisClub -f functions.sql &>>$log
psql -U postgres -h localhost -d tennisClub -f testing.sql &>>$log
#psql -U postgres -h localhost -d tennisClub -c "select * from tennis_cluber" &>>$log

date >> $log
echo end process