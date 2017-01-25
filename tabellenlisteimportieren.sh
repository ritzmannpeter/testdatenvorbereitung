#!/bin/bash
#
let RC=0
echo "$1 $2 $3 $4 $5 $6 $7 $8 $9 $10"
while IFS=, read tablename;do
   ./tabelleimportieren.sh $1 $tablename $4 $3 
   let RC=$?
   if [ $RC !=  0 ]; then
      echo "Abbruch aufgrund von Problemen beim Import der Tabelle $tablename, Fehlercode: $RC"
      cat sqlplus.out
      exit $RC
   fi
done < $2

