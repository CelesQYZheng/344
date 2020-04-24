CREATE OR REPLACE 
PROCEDURE empBySSN (v_ssn IN VARCHAR2) 
AS

  v_fname employee.fname%TYPE;
  v_lname employee.lname%TYPE;

BEGIN
  SELECT fname, lname
    INTO v_fname, v_lname
    FROM employee
    WHERE ssn = v_ssn;
  DBMS_OUTPUT.PUT_LINE(v_fname || '  ' || v_lname);
END;

/
