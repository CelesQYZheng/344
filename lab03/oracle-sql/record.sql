
GRANT SELECT ON emp TO qzheng1;

Grant SELECT ON dept TO qzheng1;
GRANT UPDATE (dname) ON dept TO qzheng1;



REVOKE select on emp FROM qzheng1;
REVOKE select,update on dept FROM qzheng1;

create role anyone;
GRANT SELECT ON emp To anyone;
GRANT SELECT ON dept TO anyone;
Grant anyone to qzheng1;

CREATE VIEW empdetail AS Select fname,lname,dname FROM emp,dept WHERE emp.dno= dept.dnumber; 
GRANT SELECT ON empdetail TO qzheng1;

CREATE VIEW salarydetail AS SELECT fname,lname,salary FROM emp WHERE salary <50000;
GRANT SELECT ON salarydetail TO qzheng1;




