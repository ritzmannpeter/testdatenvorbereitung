-- privileges und role grants, die im Zielschema vorhanden sein muessen
-- connect as sys
-- import direct table
grant imp_full_database to testqs_core_test;
grant exp_full_database to testqs_core_test;
alter user testqs_core_test default role all;
grant create database link to testqs_core_test;
grant create public database link to testqs_core_test;
-- export dump
grant create any table to testqs_core_test;
grant create table to testqs_core_test;
-- file handling
grant execute on sys.utl_file to testqs_core_test;
grant read, write on directory data_pump_dir to testqs_core_test;
-- debug
grant debug connect session to testqs_core_test;
grant create any table to testqs_core_test;
-- verschiedenes
grant dba to testqs_core_test;


