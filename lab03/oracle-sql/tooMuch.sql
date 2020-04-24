CREATE OR REPLACE 
PROCEDURE tooMuch AS

  CURSOR ec IS 
    SELECT * FROM employee;

  emp ec%ROWTYPE;
  toomuch EXCEPTION;

BEGIN
  FOR emp IN ec LOOP
    IF emp.salary>50000 THEN
      RAISE toomuch;
    END IF;
  END LOOP;

EXCEPTION
  WHEN tooMuch THEN
    DBMS_OUTPUT.PUT_LINE('Someone makes too much');
END;

/

