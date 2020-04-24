CREATE OR REPLACE TRIGGER trigger_1
  BEFORE UPDATE OF salary ON employee
  FOR EACH ROW
    BEGIN
      UPDATE total
        SET sal = sal + :NEW.salary - :OLD.salary;
    END;
/
