CREATE OR REPLACE TRIGGER trigger_7
BEFORE INSERT OR UPDATE OR DELETE OF salary ON employee
FOR EACH ROW
DECLARE
  too_much EXCEPTION;
BEGIN
  IF INSERTING THEN
    IF :new.salary>90000 THEN
       RAISE too_much;
    ELSE
      UPDATE total 
        SET sal = sal + :NEW.salary;
    END IF;
  ELSIF UPDATING THEN
    IF :new.salary>90000 THEN
       RAISE too_much;
    ELSE
       UPDATE total
         SET sal = sal + :NEW.salary - :OLD.salary;
    END IF;
  ELSE  -- deleting
    UPDATE total
      SET sal = sal - :OLD.salary;
  END IF;
EXCEPTION
  WHEN too_much THEN
    RAISE_APPLICATION_ERROR (-20001,
      'Cannot pay that much');
END;
/
