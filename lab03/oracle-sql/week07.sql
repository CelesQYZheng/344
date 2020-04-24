SET SERVEROUTPUT ON;
DECLARE
	CURSOR ec IS SELECT * FROM works_on;
	wrk ec%ROWTYPE;
	workingtime EXCEPTION;

BEGIN
	FOR wrk in ec LOOP
		IF wrk.hours < 8.0 THEN
			RAISE workingtime;
		END IF;
	DBMS_OUTPUT.PUT_LINE(wrk.essn || ' ' ||wrk.hours);		
	END LOOP;

EXCEPTION
	WHEN workingtime THEN dbms_output.put_line('someone works too less');
END;
/
