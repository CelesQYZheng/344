SELECT DISTINCT s.snum,sname FROM salespeople s, customers couter WHERE EXISTS (SELECT * FROM customers cinner WHERE cinner.snum= couter.snum AND  cinner.cnum <> couter.cnum) AND s.snum=couter.snum;

SELECT DISTINCT * FROM ORDERS outer WHERE amt > (SELECT avg(amt) FROM orders inner WHERE outer.cnum= inner.cnum);

SELECT fname, lname FROM employee WHERE NOT EXISTS (SELECT * FROM dependent WHERE employee.ssn= dependent.essn);

SELECT pno FROM works_on,employee WHERE employee.lname = 'Smith'AND works_on.essn = employee.ssn UNION SELECT pnumber FROM department, project, employee WHERE project.dnum = department.dnumber and department.mgrssn = employee.ssn AND employee.lname = 'Smith';

UPDATE employee set salary = salary * 1.1 WHERE NOT lname = 'Borg';
SELECT lname, salary FROM employee;

DROP TABLE hou_emp;
CREATE TABLE hou_emp AS ( SELECT fname,lname FROM employee WHERE address LIKE '%Houston%');
SELECT * FROM hou_emp;
DROP TABLE emp_dep;
CREATE TABLE emp_dep AS(SELECT fname, lname, dependent_name, dependent.sex, dependent.bdate from employee, dependent WHERE employee.ssn = dependent.essn);
SELECT * FROM emp_dep;
