CREATE OR REPLACE TRIGGER trigger_6
BEFORE UPDATE OF salary ON employee
FOR EACH ROW
DECLARE
  too_much EXCEPTION;
BEGIN
  IF :new.salary>90000 THEN
    RAISE too_much;
  END IF;
EXCEPTION
  WHEN too_much THEN
    RAISE_APPLICATION_ERROR (-20001,
      'Cannot pay that much');
END;
/
