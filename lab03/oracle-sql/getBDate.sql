CREATE OR REPLACE 
FUNCTION getBDate (v_ssn VARCHAR2) RETURN DATE
AS

  v_bdate employee.bdate%TYPE;

BEGIN
  SELECT bdate
    INTO v_bdate
    FROM employee
    WHERE ssn = v_ssn;
  RETURN v_bdate;
END;

/

CREATE OR REPLACE 
PROCEDURE driver
AS

BEGIN
  DBMS_OUTPUT.PUT_LINE(getBDate('123456789'));
END;

/
