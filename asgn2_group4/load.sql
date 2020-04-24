DROP TABLE officiate;
DROP TABLE player_nat;
DROP TABLE attends;
DROP TABLE supports;
DROP TABLE fan;
DROP TABLE sponsors;
DROP TABLE game;
DROP TABLE venue_details;
DROP TABLE venue;
DROP TABLE referee;
DROP TABLE player;
DROP TABLE team;
DROP TABLE company;



CREATE TABLE team (
	team_name       VARCHAR2(20),
    country         VARCHAR2(15)    NOT NULL,
    agent           VARCHAR2(15),
    cfname          VARCHAR2(15)    NOT NULL,
    clname          VARCHAR2(15),
    PRIMARY KEY(team_name)
    );

INSERT INTO team VALUES('Real Madrid CF', 'Spain','Matthew Jones','Zinedine','Zidane');
INSERT INTO team VALUES('FC Barcelona', 'Spain','James Smith','Ernesto','Valverde');
INSERT INTO team VALUES('FC Bayern Munchen', 'Germany','Joshua Brown','Niko','Kovac');
INSERT INTO team VALUES('Juventus', 'Italy','John Smith','Maurizio','Sarri');
INSERT INTO team VALUES('Manchester City FC', 'England','Alexander Moore','Pep','Guardiola');

CREATE TABLE venue (
    team_name       VARCHAR2(20)    REFERENCES team(team_name),
    venue_name      VARCHAR2(30)    NOT NULL UNIQUE,
    PRIMARY KEY(team_name)
    );

INSERT INTO venue VALUES('Real Madrid CF','Santiago Bernabeu Stadium');
INSERT INTO venue VALUES('FC Barcelona','Camp Nou');
INSERT INTO venue VALUES('FC Bayern Munchen','Allianz Arena');
INSERT INTO venue VALUES('Juventus','Allianz Stadium');
INSERT INTO venue VALUES('Manchester City FC','Etihad Stadium');
  
CREATE TABLE venue_details (
    venue_name      VARCHAR2(30)    REFERENCES venue(venue_name),
    location        VARCHAR2(30),
    capacity        NUMBER(6),
    PRIMARY KEY(venue_name)
    );

INSERT INTO venue_details VALUES('Santiago Bernabeu Stadium','Madrid, Spain',81044);
INSERT INTO venue_details VALUES('Camp Nou','Barcelona, Spain',99354);
INSERT INTO venue_details VALUES('Allianz Arena','Munich, Germany',70000);
INSERT INTO venue_details VALUES('Allianz Stadium','Turin, Italy',41507);
INSERT INTO venue_details VALUES('Etihad Stadium','Manchester, England',53000);


CREATE TABLE company (
    company_name    VARCHAR2(15),
    product_type    VARCHAR2(15),
    PRIMARY KEY(company_name)
    );

INSERT INTO company VALUES('Emirates','Uniform');
INSERT INTO company VALUES('Adidas','Equipment');
INSERT INTO company VALUES('Nike','Uniform');
INSERT INTO company VALUES('Rakuten','Merchandise');
INSERT INTO company VALUES('Beko','Merchandise');
INSERT INTO company VALUES('Telekom','Equipment');
INSERT INTO company VALUES('Audi','Uniform');
INSERT INTO company VALUES('Allianz','Merchandise');
INSERT INTO company VALUES('Jeep','Equipment');
INSERT INTO company VALUES('Etihad Airways','Merchandise');
INSERT INTO company VALUES('Puma','Merchandise');
INSERT INTO company VALUES('Nissan','Merchandise');

CREATE TABLE sponsors (
    company_name    VARCHAR2(15)    REFERENCES company(company_name),
    team_name       VARCHAR2(20)    NOT NULL,
    funds           VARCHAR2(15),
    PRIMARY KEY(company_name)
    );
    
INSERT INTO sponsors  VALUES('Emirates','Real Madrid CF','Uniform');
INSERT INTO sponsors  VALUES('Adidas','Real Madrid CF','Equipment');
INSERT INTO sponsors  VALUES('Nike','FC Barcelona','Uniform');
INSERT INTO sponsors  VALUES('Rakuten','FC Barcelona','Merchandise');
INSERT INTO sponsors  VALUES('Beko','FC Barcelona','Merchandise');
INSERT INTO sponsors  VALUES('Telekom','FC Bayern Munchen','Equipment');
INSERT INTO sponsors  VALUES('Audi','FC Bayern Munchen','Uniform');
INSERT INTO sponsors  VALUES('Allianz','FC Bayern Munchen','Merchandise');
INSERT INTO sponsors  VALUES('Jeep','Juventus','Equipment');
INSERT INTO sponsors  VALUES('Etihad Airways','Manchester City FC','Uniform');
INSERT INTO sponsors  VALUES('Puma','Manchester City FC','Merchandise');
INSERT INTO sponsors  VALUES('Nissan','Manchester City FC','Merchandise');


CREATE TABLE fan (
    fan_id          CHAR(7),
    birth_date      DATE,
    address         VARCHAR2(50),
    fname           VARCHAR2(15)    NOT NULL,
    lname           VARCHAR2(15)    NOT NULL,
    PRIMARY KEY(fan_id)
    );
    
INSERT INTO fan  VALUES('1871232',TO_DATE('02-12-1998','DD-MM-YYYY'),'345 Old Nelson Road, Singapore','Govanna','Smith');
INSERT INTO fan  VALUES('7418617',TO_DATE('12-11-1990','DD-MM-YYYY'),' 123 Newtown Road, Singapore', 'Giovannie','Sandro');
INSERT INTO fan  VALUES('8612341',TO_DATE('30-10-1970','DD-MM-YYYY'),'118 Orchard Road, Madrid, Spain','Miguel','Brown');
INSERT INTO fan  VALUES('3151235',TO_DATE('18-02-1980','DD-MM-YYYY'),'43 Nagambie-Locksley Rd, Tabilk, Australia','Contenta','Lomas');
INSERT INTO fan  VALUES('6123126',TO_DATE('26-09-1965','DD-MM-YYYY'),'765 Sigerei District, Moldova','Lucas','Kirk');
INSERT INTO fan  VALUES('1238512',TO_DATE('20-10-1987','DD-MM-YYYY'),'Ernst-Diegel, 36304 Alsfeld, Germany','Augustus','Clout');
INSERT INTO fan  VALUES('1230723',TO_DATE('02-03-1988','DD-MM-YYYY'),'123 Surrey Lane, England','ichard','Browning');
INSERT INTO fan  VALUES('1237412',TO_DATE('01-04-1991','DD-MM-YYYY'),'423 Loch Lane, Ireland','Constance','Hill');
INSERT INTO fan  VALUES('5782340',TO_DATE('30-08-1978','DD-MM-YYYY'),'42 Knox Street','Bruno','Mayer');
INSERT INTO fan  VALUES('4810781',TO_DATE('03-01-2000','DD-MM-YYYY'),'62 Deutshborg Avenue, Sweden','Jake','Vlodkcha');
INSERT INTO fan  VALUES('7812307',TO_DATE('21-05-1972','DD-MM-YYYY'),'123 Gerald Road, Ireland','Tim','McDonald');
INSERT INTO fan  VALUES('1120712',TO_DATE('22-04-1945','DD-MM-YYYY'),'7 Oldman road, Wales','Eustance','Evergreen');
INSERT INTO fan  VALUES('5971823',TO_DATE('22-12-2001','DD-MM-YYYY'),'47 Route de Montastruc, 31380 Roqueseriere, France','Cedric','Gustava');
INSERT INTO fan  VALUES('6123018',TO_DATE('09-08-1992','DD-MM-YYYY'),'240 Chemin des Mirabelles, 81500 Lavaur, France','Davide','Berne');

CREATE TABLE supports (
    fan_id          CHAR(7)         REFERENCES fan(fan_id),
    team_name       VARCHAR2(20)    NOT NULL,
    PRIMARY KEY(fan_id)
    );

INSERT INTO supports  VALUES('1871232','Real Madrid CF');
INSERT INTO supports  VALUES('8612341','Real Madrid CF');
INSERT INTO supports  VALUES('1230723','Real Madrid CF');
INSERT INTO supports  VALUES('1237412','Real Madrid CF');
INSERT INTO supports  VALUES('1120712','Real Madrid CF');
INSERT INTO supports  VALUES('7418617','Juventus');
INSERT INTO supports  VALUES('3151235','Juventus');
INSERT INTO supports  VALUES('6123126','FC Barcelona');
INSERT INTO supports  VALUES('1238512','FC Barcelona');
INSERT INTO supports  VALUES('4810781','FC Barcelona');
INSERT INTO supports  VALUES('5782340','Manchester City FC');
INSERT INTO supports  VALUES('7812307','Manchester City FC');
INSERT INTO supports  VALUES('5971823','Manchester City FC');
INSERT INTO supports  VALUES('6123018','FC Bayern Munchen');

CREATE TABLE player (
    player_id       CHAR(5),
    lname           VARCHAR2(15)   NOT NULL,
    fname           VARCHAR2(15)   NOT NULL,
    squad_num       NUMBER(2)      NOT NULL,
    team_name       VARCHAR2(20)   REFERENCES team(team_name),
    PRIMARY KEY(player_id)
    );
   
INSERT INTO player VALUES('42496','Hazard', 'Eden',1, 'Real Madrid CF');
INSERT INTO player VALUES('94812','Carvajal', 'Dani',2, 'Real Madrid CF');
INSERT INTO player VALUES('76121', 'Asensio', 'Marco',7, 'Real Madrid CF');
INSERT INTO player VALUES('51234','Casilla','Kiko',8, 'Real Madrid CF');
INSERT INTO player VALUES('74534','Navas','Keylor', 6, 'Real Madrid CF');
INSERT INTO player VALUES('51357', 'Rodriguez','James', 4, 'Real Madrid CF');
INSERT INTO player VALUES('93450','Kroos', 'Toni', 3, 'Real Madrid CF');
INSERT INTO player VALUES('51863','Bale','Gareth', 9, 'Real Madrid CF');
INSERT INTO player VALUES('21768','Alba','Jordi', 10, 'FC Barcelona');
INSERT INTO player VALUES('98723','Mascherano','Javier', 11, 'FC Barcelona');
INSERT INTO player VALUES('60456','Villa','David', 8, 'FC Barcelona');
INSERT INTO player VALUES('89764','Busques','Sergio',5, 'FC Barcelona');
INSERT INTO player VALUES('30984','Keitta','Seydou',7, 'FC Barcelona');
INSERT INTO player VALUES('65740','Alves','Dani',3, 'FC Barcelona');
INSERT INTO player VALUES('49810','Abidal','Eric',2, 'FC Barcelona');
INSERT INTO player VALUES('35701','Coman','Kingsley', 10,'FC Bayern Munchen');
INSERT INTO player VALUES('56701','Bernat','Juan', 6,'FC Bayern Munchen');
INSERT INTO player VALUES('23426','Lewandowski','Robert', 8,'FC Bayern Munchen');
INSERT INTO player VALUES('77810','Shaqiri','Xherdan',3,'FC Bayern Munchen');
INSERT INTO player VALUES('22969','Gustavo', 'Luiz',2,'FC Bayern Munchen');
INSERT INTO player VALUES('66445','Neuer', 'Manuel', 1,'FC Bayern Munchen');
INSERT INTO player VALUES('23490','Contento','Diego', 4,'FC Bayern Munchen');
INSERT INTO player VALUES('97406','Alaba', 'David',5,'FC Bayern Munchen');
INSERT INTO player VALUES('98269','Robben', 'Arjen',7,'FC Bayern Munchen');
INSERT INTO player VALUES('33481','Badstuber', 'Holger',9,'FC Bayern Munchen');
INSERT INTO player VALUES('35716','Tymoshchuk','Anatoliy',11,'FC Bayern Munchen');
INSERT INTO player VALUES('98761','Cuadrado','Juan',2,'Juventus');
INSERT INTO player VALUES('49833','Dybala','Paulo', 9,'Juventus');
INSERT INTO player VALUES('68701','Khedira','Sami',11,'Juventus');
INSERT INTO player VALUES('65711','Sandro', 'Alex', 8,'Juventus');
INSERT INTO player VALUES('11233','Asamoah', 'Kwadwo', 3, 'Juventus');
INSERT INTO player VALUES('35674','Padoin', 'Simone', 5, 'Juventus');
INSERT INTO player VALUES('98613','Pogba', 'Paulo', 4, 'Juventus');
INSERT INTO player VALUES('35403','Barzagli', 'Andrea', 6,'Juventus');
INSERT INTO player VALUES('57464','Lichtsteiner','Stephan',7,'Juventus');
INSERT INTO player VALUES('66587','Horlock', 'Kevin', 3,'Manchester City FC');
INSERT INTO player VALUES('32412','Whitley','Jeff', 9,'Manchester City FC');
INSERT INTO player VALUES('37854','Brown', 'Michael', 2,'Manchester City FC');
INSERT INTO player VALUES('98884','Kinkladze', 'Giorgi', 4,'Manchester City FC');
INSERT INTO player VALUES('23319','Symons','Kit', 4,'Manchester City FC');
INSERT INTO player VALUES('12345','Summerbee', 'Nicky', 10,'Manchester City FC');
INSERT INTO player VALUES('98756','Edghill', 'Richard', 11,'Manchester City FC');
INSERT INTO player VALUES('99945','Lomas','Steve',1,'Manchester City FC');
INSERT INTO player VALUES('11123','Flitcroft','Garry', 7,'Manchester City FC');

CREATE TABLE game (
    game_id         CHAR(4),
    home            VARCHAR2(30)   REFERENCES team(team_name),
    away            VARCHAR2(30)   REFERENCES team(team_name),
    game_date       DATE,
    home_score      NUMBER(3)       NOT NULL,
    away_score      NUMBER(3)       NOT NULL,
    PRIMARY KEY(game_id)
    );

INSERT INTO game VALUES('3215','Real Madrid CF','FC Barcelona',TO_DATE('06-05-2019','DD-MM-YYYY'),2,7);
INSERT INTO game VALUES('8943','Juventus','FC Bayern Munchen',TO_DATE('12-07-2019','DD-MM-YYYY'),4,1);
INSERT INTO game VALUES('3247','Manchester City FC','Real Madrid CF',TO_DATE('08-05-2019','DD-MM-YYYY'),2,3);
INSERT INTO game VALUES('3573','FC Barcelona','FC Bayern Munchen',TO_DATE('13-07-2019','DD-MM-YYYY'),4,5);
INSERT INTO game VALUES('1267','Real Madrid CF','FC Bayern Munchen',TO_DATE('18-05-2019','DD-MM-YYYY'),11,3);
INSERT INTO game VALUES('7626','FC Barcelona','Juventus',TO_DATE('11-02-2019','DD-MM-YYYY'),2,2);
INSERT INTO game VALUES('4156','FC Barcelona','Manchester City FC',TO_DATE('16-04-2019','DD-MM-YYYY'),6,7);
INSERT INTO game VALUES('6785','FC Bayern Munchen','Real Madrid CF',TO_DATE('02-08-2019','DD-MM-YYYY'),4,4);
INSERT INTO game VALUES('1442','Juventus','FC Barcelona',TO_DATE('11-06-2019','DD-MM-YYYY'),8,6);
INSERT INTO game VALUES('1067','Juventus','Real Madrid CF',TO_DATE('03-03-2019','DD-MM-YYYY'),12,12);
INSERT INTO game VALUES('7698','Real Madrid CF','Manchester City FC',TO_DATE('01-05-2019','DD-MM-YYYY'),4,14);
INSERT INTO game VALUES('7562','FC Bayern Munchen','Juventus',TO_DATE('06-06-2019','DD-MM-YYYY'),5,2);

CREATE TABLE attends (
    fan_id          CHAR(7)         REFERENCES fan(fan_id),
    game_id         CHAR(4)         REFERENCES game(game_id),
    PRIMARY KEY(fan_id, game_id)
    );
INSERT INTO attends VALUES ('1871232','3215');
INSERT INTO attends VALUES ('3151235','7626');
INSERT INTO attends VALUES ('7418617','3215');
INSERT INTO attends VALUES ('6123126','1067');
INSERT INTO attends VALUES ('1238512','7698');
INSERT INTO attends VALUES ('4810781','7562');
INSERT INTO attends VALUES ('5782340','3215');
INSERT INTO attends VALUES ('5971823','1067');


CREATE TABLE referee (
    ref_id          CHAR(4),
    fname           VARCHAR2(15)    NOT NULL,
    lname           VARCHAR2(15)    NOT NULL,
    birth_date      DATE,
    start_date      DATE            NOT NULL,
    PRIMARY KEY(ref_id)
    );
    
INSERT INTO referee VALUES('0001','Andreas', 'Ekberg', TO_DATE ('02-01-1985','DD-MM-YYYY'), TO_DATE ('10-08-2019','DD-MM-YYYY'));
INSERT INTO referee VALUES('0013','Ramy', 'Touchan', TO_DATE ('14-08-1988','DD-MM-YYYY'), TO_DATE ('20-07-2019','DD-MM-YYYY'));
INSERT INTO referee VALUES('0069','Timothy', 'Ford', TO_DATE ('14-08-1980','DD-MM-YYYY'), TO_DATE ('23-07-2019','DD-MM-YYYY'));
INSERT INTO referee VALUES('0075','Wilton','Sampaio', TO_DATE ('25-12-1981','DD-MM-YYYY'), TO_DATE ('19-12-2018','DD-MM-YYYY'));
INSERT INTO referee VALUES('0023','Jan','Wegereef', TO_DATE ('17-01-1962','DD-MM-YYYY'), TO_DATE ('05-06-2004','DD-MM-YYYY'));
INSERT INTO referee VALUES('0093','Roberto','Rosetti', TO_DATE ('18-09-1967','DD-MM-YYYY'), TO_DATE ('01-06-2004','DD-MM-YYYY'));
INSERT INTO referee VALUES('0176','Deniz','Aytekin', TO_DATE ('21-07-1978','DD-MM-YYYY'), TO_DATE ('22-05-2016','DD-MM-YYYY'));
INSERT INTO referee VALUES('0917','Gianluca','Rocchi', TO_DATE ('25-08-1973','DD-MM-YYYY'), TO_DATE ('20-04-2019','DD-MM-YYYY'));
INSERT INTO referee VALUES('0824','Mauro','Tonolini', TO_DATE ('25-08-1980','DD-MM-YYYY'), TO_DATE ('12-01-2018','DD-MM-YYYY'));
INSERT INTO referee VALUES('0726','Danny','Makkelie', TO_DATE ('13-08-1985','DD-MM-YYYY'), TO_DATE ('12-12-2017','DD-MM-YYYY'));
INSERT INTO referee VALUES('0515', 'Massimilianol', 'Irrati', TO_DATE ('01-01-1979', 'DD-MM-YYYY'), TO_DATE ('01-12-2017','DD-MM-YYYY'));
INSERT INTO referee VALUES('0414', 'Bruno', 'Boschilia', TO_DATE ('07-04-1978', 'DD-MM-YYYY'), TO_DATE ('30-11-2017','DD-MM-YYYY'));
INSERT INTO referee VALUES('0313', 'Matthew', 'Conger', TO_DATE ('19-09-1984', 'DD-MM-YYYY'), TO_DATE ('30-06-2004','DD-MM-YYYY'));
INSERT INTO referee VALUES('0212', 'Toru', 'Sagara', TO_DATE ('10-11-1985', 'DD-MM-YYYY'), TO_DATE ('18-06-2004','DD-MM-YYYY'));
INSERT INTO referee VALUES('0101', 'Frank', 'Anderson', TO_DATE ('10-04-1975', 'DD-MM-YYYY'), TO_DATE ('19-06-2004','DD-MM-YYYY'));

CREATE TABLE officiate (
    ref_id          CHAR(4)         REFERENCES referee(ref_id),
    game_id         CHAR(4)         REFERENCES game(game_id),
    PRIMARY KEY(ref_id)
    );

INSERT INTO officiate VALUES ('0001','3215');
INSERT INTO officiate VALUES ('0023','3215');
INSERT INTO officiate VALUES ('0075','8943');
INSERT INTO officiate VALUES ('0069','3247');
INSERT INTO officiate VALUES ('0013','3573');
INSERT INTO officiate VALUES ('0093','1267');
INSERT INTO officiate VALUES ('0176','3573');
INSERT INTO officiate VALUES ('0917','7626');
INSERT INTO officiate VALUES ('0824','4156');
INSERT INTO officiate VALUES ('0726','1067');
INSERT INTO officiate VALUES ('0515','1442');
INSERT INTO officiate VALUES ('0414','7562');
INSERT INTO officiate VALUES ('0313','1067');
INSERT INTO officiate VALUES ('0101','7698');

    
CREATE TABLE player_nat (
    player_id       CHAR(5)         REFERENCES player(player_id),
    nationality     VARCHAR2(30),
    PRIMARY KEY(player_id)
    );

INSERT INTO player_nat VALUES('42496', 'Belgium');
INSERT INTO player_nat VALUES('94812', 'Spain');
INSERT INTO player_nat VALUES('76121', 'Spain');
INSERT INTO player_nat VALUES('51234', 'Spain');
INSERT INTO player_nat VALUES('74534', 'Costa Rica');
INSERT INTO player_nat VALUES('51357', 'Colombia');
INSERT INTO player_nat VALUES('93450', 'Germany');
INSERT INTO player_nat VALUES('51863', 'Wales');
INSERT INTO player_nat VALUES('21768', 'Spain');
INSERT INTO player_nat VALUES('98723', 'Argentina');
INSERT INTO player_nat VALUES('60456', 'Spain');
INSERT INTO player_nat VALUES('89764', 'Spain');
INSERT INTO player_nat VALUES('30984', 'Mali');
INSERT INTO player_nat VALUES('65740', 'Brazil');
INSERT INTO player_nat VALUES('49810', 'France');
INSERT INTO player_nat VALUES('56701', 'Spain');
INSERT INTO player_nat VALUES('35701', 'France');
INSERT INTO player_nat VALUES('23426', 'Poland');
INSERT INTO player_nat VALUES('77810', 'Switzerland');
INSERT INTO player_nat VALUES('22969', 'Brazil');
INSERT INTO player_nat VALUES('66445', 'Germany');
INSERT INTO player_nat VALUES('97406', 'Austria');
INSERT INTO player_nat VALUES('33481', 'Germany');
INSERT INTO player_nat VALUES('98761', 'Colombia');
INSERT INTO player_nat VALUES('49833', 'Argentina');
INSERT INTO player_nat VALUES('68701', 'Germany');
INSERT INTO player_nat VALUES('65711', 'Brazil');
INSERT INTO player_nat VALUES('11233', 'Ghana');
INSERT INTO player_nat VALUES('35674', 'Italy');
INSERT INTO player_nat VALUES('98613', 'France');
INSERT INTO player_nat VALUES('35403', 'Switzerland');
INSERT INTO player_nat VALUES('57464', 'Italy');
INSERT INTO player_nat VALUES('32412', 'Northern Ireland');
INSERT INTO player_nat VALUES('66587', 'Northern Ireland');
INSERT INTO player_nat VALUES('37854', 'England');
INSERT INTO player_nat VALUES('98884', 'Georgia');
INSERT INTO player_nat VALUES('23319', 'Wales');
INSERT INTO player_nat VALUES('12345', 'England');
INSERT INTO player_nat VALUES('98756', 'England');
INSERT INTO player_nat VALUES('99945','North Ireland');
INSERT INTO player_nat VALUES('11123', 'England');

COMMIT;

