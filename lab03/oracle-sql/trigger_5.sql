CREATE OR REPLACE TRIGGER trigger_5
BEFORE INSERT OR UPDATE OR DELETE OF salary ON employee
FOR EACH ROW
  BEGIN
    IF INSERTING THEN
      UPDATE total 
        SET sal = sal + :NEW.salary;
    ELSIF UPDATING THEN
      UPDATE total
        SET sal = sal + :NEW.salary - :OLD.salary;
    ELSE
      UPDATE total
        SET sal = sal - :OLD.salary;
    END IF;
  END;
/
