CREATE OR REPLACE TRIGGER trigger_3
  AFTER UPDATE OF salary ON employee
    BEGIN
      UPDATE total
        SET sal = 
          (SELECT SUM(salary) FROM employee);
    END;
/
