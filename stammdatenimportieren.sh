#!/bin/bash
#
cd /app/testdatenvorbereitung
# Verzeichnis, in dem der Oracle Instant Client abgelegt ist
INSTANT_CLIENT="/home/oracle/instantclient_12_1"
# Workaround wegen ungewollter Umlaute-Konvertierung
export NLS_LANG=AMERICAN_AMERICA.WE8MSWIN1252
# Umgebungsvariablen
export PATH="${INSTANT_CLIENT}:${PATH}"
export TNS_ADMIN="${INSTANT_CLIENT}"
export LD_LIBRARY_PATH="${INSTANT_CLIENT}"
if [ "$1" = "Entwicklung" ]; then
   export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
fi
if [ "$1" = "TST" ]; then
   export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
fi
if [ "$1" = "TST1" ]; then
   export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
fi
if [ "$1" = "TST2" ]; then
   export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
fi
let RC=0
msg="keine Importbeschreibung fuer $1 vorhanden"
while IFS=, read identifier connection targetschema sourceschema sourcepassword sourcedatabase;do
   if [ "$1" = "$identifier" ]; then
     ./linkerstellen.sh $connection sourcelink $sourceschema $sourcepassword $sourcedatabase
     ./linktesten.sh $connection sourcelink
     let RC=$?
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


