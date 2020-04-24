CREATE OR REPLACE PACKAGE dep_package IS

  -- Inserts a specific dependent who will be born tomorrow
  PROCEDURE insertDep;

  -- Deletes a named dependent
  PROCEDURE deleteDep (name dependent.dependent_name%TYPE);

  -- Calculates tomorrow's date
  FUNCTION nday RETURN DATE;

END dep_package;
/

CREATE OR REPLACE PACKAGE BODY dep_package IS

PROCEDURE insertDep IS

  BEGIN
    INSERT INTO dependent VALUES
      ('453453453', 'Nicole', 'F', nday(), 'Daughter');
  END insertDep;

PROCEDURE deleteDep (name dependent.dependent_name%TYPE) IS
  BEGIN
    DELETE FROM dependent WHERE dependent_name=name;
  END deleteDep;

FUNCTION nday RETURN DATE IS
  BEGIN
    RETURN (SYSDATE + 1);
  END nday;

END dep_package;
/
