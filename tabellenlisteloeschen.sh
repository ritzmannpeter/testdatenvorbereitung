#/bin/bash
#
let RC=0
while IFS=, read tablename;do
   echo "./tabelleloeschen $1 $tablename"
   ./tabelleloeschen.sh $1 $tablename
   let RC=$?
   if [ $RC !=  0 ]; then
      echo "Abbruch aufgrund von Problemen beim Löschen der Tabelle $tablename, Fehlercode: $rc"
      cat sqlplus.out
      exit $rc
   fi
done < $2





