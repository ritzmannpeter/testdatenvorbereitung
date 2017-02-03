set serveroutput off
set escape on
DECLARE
   rc integer := 0;
BEGIN
   rc := ZIT_TEST_UTIL_PKG.drop_link('&1');
   rc := ZIT_TEST_UTIL_PKG.create_link('&1', '&2', '&3', '&4');
END;
/
set serveroutput off 
set escape off
quit



