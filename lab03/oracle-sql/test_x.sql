DROP TABLE test_x;
CREATE TABLE test_x (
   i int,
   n number,
   r number(8,2),
   c varchar2(10),
   d date);

INSERT INTO test_x VALUES
   (1, 10, 10.1, 'First', 
    to_date('2-aug-2004 1:11:01', 'dd-mon-yyyy hh:mi:ss'));
INSERT INTO test_x VALUES
   (2, 20, 20.2, 'Second', 
    to_date('3-aug-2004 2:22:22', 'dd-mon-yyyy hh:mi:ss'));
INSERT INTO test_x VALUES
   (3, 30, 30.3, 'Third',
    to_date('3-aug-2004 3:33:33', 'dd-mon-yyyy hh:mi:ss'));
INSERT INTO test_x VALUES
   (4, NULL, 40.4, 'Fourth',
    to_date('4-aug-2004 4:44:44', 'dd-mon-yyyy hh:mi:ss'));
