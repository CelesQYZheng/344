CREATE OR REPLACE 
PROCEDURE insertY (aa IN NUMBER) 
AS

  bb NUMBER := 5;

BEGIN
  IF aa > bb
  THEN
    INSERT INTO y VALUES (aa, 1);
  ELSE
    INSERT INTO y VALUES (bb, 2);
  END IF;
END;

/
