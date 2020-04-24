CREATE OR REPLACE TRIGGER trigger_4
  AFTER UPDATE OF salary ON employee
    BEGIN
      sumit();
    END;
/
