#!/bin/bash
#
echo "$0 $1 $2 $3 $4 $5 $6 $7 $8 $9"
$ORACLE_HOME/bin/sqlplus $1 @linkerstellen $2 $3 $4 $5 >sqlplus.out
