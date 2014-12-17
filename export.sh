#!/bin/bash
if ps -x | grep -v grep | grep Google\ Chrome > /dev/null; then
    echo "Close Chrome and try again..."
    exit 1
fi

DESTINATION=${1:-./keywords.sql}
DESTINATION=${PWD}/keywords.sql
TEMP_SQL_SCRIPT=/tmp/sync_chrome_sql_script
echo "Exporting Chrome keywords to $DESTINATION ..."
cd ~/Library/Application\ Support/Google/Chrome/Default
echo .output $DESTINATION > $TEMP_SQL_SCRIPT
echo .dump keywords >> $TEMP_SQL_SCRIPT
sqlite3 -init $TEMP_SQL_SCRIPT Web\ Data .exit
#rm $TEMP_SQL_SCRIPT
