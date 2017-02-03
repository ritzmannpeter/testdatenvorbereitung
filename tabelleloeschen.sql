VARIABLE return_code NUMBER
set serveroutput off
set escape on
DECLARE
   rc integer := 0;
BEGIN
   rc := ZIT_TEST_UTIL_PKG.tabelle_loeschen('&1', '');
   :return_code := rc;
END;
/
set serveroutput off 
set escape off
exit :return_code




