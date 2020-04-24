CREATE OR REPLACE
PROCEDURE listEmp
AS

  CURSOR ec IS
    SELECT * FROM employee;

  emp ec%ROWTYPE;

BEGIN
  FOR emp IN ec
    LOOP
      DBMS_OUTPUT.PUT_LINE(emp.fname);
    END LOOP;
END;

/
