#!/bin/bash
#
cd /app/testdatenvorbereitung

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
#$ORACLE_HOME/bin/sqlplus -?
msg="keine Importbeschreibung fuer $1 vorhanden"
while IFS=, read identifier connection targetschema sourceschema sourcepassword sourcedatabase;do
   if [ "$1" = "$identifier" ]; then
     echo "$0 $connection alles.lst $sourceschema $sourcepassword $sourcedatabase"
     ./tabellenlisteloeschen.sh $connection alles.lst $sourceschema $sourcepassword $sourcedatabase
     msg=""
   fi
done < config.txt
echo $msg







