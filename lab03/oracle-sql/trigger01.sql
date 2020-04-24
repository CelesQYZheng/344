CREATE OR REPLACE TRIGGER modify_salary
AFTER INSERT OR UPDATE OR DELETE OF salary ON e1
FOR EACH ROW
BEGIN
	IF INSERTING THEN
		UPDATE d1
		SET total_sal = total_sal + :NEW.salary
		WHERE dnumber = :NEW.dno;

	ELSIF UPDATING THEN
		UPDATE d1
		SET total_sal = total_sal + :New.salary - :OLD.salary
		WHERE dnumbeR = :OLD.DNO;
	ELSE
		UPDATE d1
		SET total_sal = total_sal - :OLD.salary
		WHERE dnumber = :OLD.dno;
	END IF;
END;
/
