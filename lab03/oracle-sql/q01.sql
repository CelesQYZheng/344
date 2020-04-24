DESCRIBE employee;

SELECT dependent_name FROM dependent WHERE RELATIONSHIP = 'Daughter' OR RELATIONSHIP = 'Spouse';
SELECT dependent_name FROM dependent WHERE relationship IN('Daughter','Spouse');

SELECT PNAME FROM project where PLOCATION IS NULL;

SELECT fname,lname,dname FROM  employee, department WHERE employee.ssn = department.mgrssn;

SELECT DISTINCT fname,lname FROM  employee, works_on WHERE works_on.essn = employee.ssn AND works_on.HOURS < 18;

select fname,lname FROM employee WHERE lname LIKE  'W%';

SELECT sname FROM salespeople WHERE city IN('San Jose','Barcelona');

SELECT DISTINCT cname, amt FROM customers, orders WHERE orders.amt BETWEEN 1500 AND 5000 AND customers.cnum = orders.cnum;

SELECT count(onum) FROM orders;

SELECT avg(amt) FROM orders;
