SELECT snum, MAX(amt) FROM orders GROUP BY snum ORDER BY snum ASC;

SELECT snum, MAX(amt) FROM orders GROUP BY snum HAVING MAX(AMT)>3000;

SELECT fname, lname, salary FROM employee GROUP BY fname, lname,salary ORDER BY salary ASC, lname;



SELECT onum, cname, orders.cnum,orders.snum FROM orders, customers, salespeople WHERE salespeople.snum =  customers.snum AND salespeople.city <> customers.city AND orders.snum = customers.snum AND orders.cnum = customers.cnum;

SELECT CNAME, amt FROM orders, customers WHERE amt = (SELECT MAX(amt) FROM ORDERS) AND customers.cnum = orders.cnum;

SELECT * FROM ORDERS WHERE amt > (SELECT AVG(amt) FROM orders WHERE odate = '03-OCT-90');

SELECT onum, amt, odate, cnum, snum FROM ORDERS WHERE orders.snum IN (SELECT snum FROM salespeople WHERE city = 'London') ORDER BY odate;

