#!/bin/bash
echo starting process

psql -U postgres -h localhost -d tennisClub -f initDb.sql -L=logfile.log

echo end process