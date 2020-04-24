CREATE OR REPLACE TRIGGER trigger_2
  BEFORE UPDATE OF salary ON employee
  FOR EACH ROW
    DECLARE
      sal_diff NUMBER;
    BEGIN
      sal_diff := :new.salary - :old.salary;
      UPDATE total
        SET sal = sal + sal_diff;
    END;
/
