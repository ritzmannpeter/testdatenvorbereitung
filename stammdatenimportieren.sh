#!/bin/bash
#
cd /app/testdatenvorbereitung

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe

let RC=0
msg="keine Importbeschreibung fuer $1 vorhanden"
while IFS=, read identifier connection targetschema sourceschema sourcepassword sourcedatabase;do
   if [ "$1" = "$identifier" ]; then
     ./linkerstellen.sh $connection sourcelink $sourceschema $sourcepassword $sourcedatabase
     ./linktesten.sh $connection sourcelink
     let RC=$?
     echo "RC = $RC"
     if [ $RC !=  0 ]; then
       echo "Abbruch aufgrund von Problemen beim erstellen des Datenbank Link, Fehlercode: $RC"
       cat sqlplus.out 
       echo "exit $0"
        exit $RC
     fi
      echo "./tabellenlisteimportieren.sh $connection stammdaten.lst $targetschema $sourceschema $sourcepassword $sourcedatabase"
     ./tabellenlisteimportieren.sh $connection stammdaten.lst $targetschema $sourceschema $sourcepassword $sourcedatabase
     let RC=$?
     if [ $RC !=  0 ]; then
        echo "exit $0"
        exit $RC
     fi
     msg=""
   fi
done < config.txt
echo $msg
