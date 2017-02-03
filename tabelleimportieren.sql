set serveroutput on
set escape on
VARIABLE return_code NUMBER
DECLARE
   rc integer := 0;
BEGIN
   rc := ZIT_TEST_UTIL_PKG.tabelle_importieren('&1','&2','&3');
   :return_code := rc;
END;
/
set serveroutput off 
set escape off
exit :return_code




