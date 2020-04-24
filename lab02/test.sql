LOAD DATA
INFILE 'loader1.dat'
INTO TABLE xyz
FIELDS TERMINATED BY ','
(i, s, d date "dd-mon-yyyy");
