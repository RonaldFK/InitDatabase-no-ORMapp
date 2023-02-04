#!/bin/bash
log=logfile.log
date >> $log
echo starting process

psql -U postgres -h localhost -d tennisClub -f initDb.sql >> $log
date >> $log
echo end process