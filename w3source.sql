-- ********************************************************************************
--
-- DATABASE :::::::::::::- learn_mysql
--
-- ********************************************************************************

CREATE DATABASE IF NOT EXISTS learn_mysql;

--  TABLE :-  REGIONS

CREATE TABLE regions (
    region_id decimal(5,0) NOT NULL,
    region_name varchar(25) DEFAULT NULL,
    PRIMARY KEY (region_id),
    UNIQUE KEY (region_name)
);

INSERT INTO regions 
VALUES 
(1,'Europe\r'),
(2,'Americas\r'),
(3,'Asia\r'),
(4,'Middle East and Africa\r');


-- TABLE :- COUNTRIES

CREATE TABLE countries(
    country_id char(2),
    country_name text,
    region_id decimal(5,0),
    PRIMARY KEY(country_id),
    FOREIGN KEY(region_id)
        REFERENCES regions(region_id)
);

INSERT INTO countries(country_id, country_name, region_id)
VALUES ('AR', 'Argentina', 2),
    ('AU', 'Australia', 3),
    ('BE', 'Belgium', 1),
    ('BR', 'Brazil', 2),
    ('CA', 'Canada', 2),
    ('CH', 'Switzerland', 1),
    ('CN', 'China', 3),
    ('DE', 'Germany', 1),
    ('DK', 'Denmark', 1),
    ('EG', 'Egypt', 4),
    ('FR', 'France', 1),
    ('HK', 'HongKong', 3),
    ('IL', 'Israel ', 4),
    ('IN', 'India', 3),
    ('IT', 'Italy', 1),
    ('JP', 'Japan', 3),
    ('KW', 'Kuwait', 4),
    ('MX', 'Mexico', 2),
    ('NG', 'Nigeria', 4),
    ('NL', 'Netherlands', 1),
    ('SG', 'Singapore', 3),
    ('UK', 'United Kingd', 1),
    ('US', 'United State', 2),
    ('ZM', 'Zambia', 4),
    ('ZW', 'Zimbabwe', 4);


--  TABLE :- LOCATON

CREATE TABLE locations(
    location_id int,
    street_address text,
    postal_code varchar(10),
    city varchar(30),
    state_province varchar(50),
    country_id char(2),
    PRIMARY KEY (location_id),
    FOREIGN KEY (country_id)
        REFERENCES countries(country_id),
    KEY (city),
    KEY (state_province)
);

INSERT INTO locations(
        location_id,
        street_address,
        postal_code,
        city,
        state_province,
        country_id
)
VALUES (1000,"1297 Via Coladi Rie","989","Roma","",'IT'),
(1100,"93091 Calledella Te","10934","Venice","",'IT'),
(1200,"2017 Shinjuku-ku","1689","Tokyo","Tokyo Prefectu",'JP'),
(1300,"9450 Kamiya-cho","6823","Hiroshima","",'JP'),
(1400,"2014 Jabberwocky Rd","26192","Southlake","Texas",'US'),
(1500,"2011 Interiors Blvd","99236","South San","California",'US'),
(1600,"2007 Zagora St","50090","South Brun","New Jersey",'US'),
(1700,"2004 Charade Rd","98199","Seattle","Washington",'US'),
(1800,"147 Spadina Ave","M5V2L7","Toronto","Ontario",'CA'),
(1900,"6092 Boxwood St","YSW9T2","Whitehorse","Yukon",'CA'),
(2000,"40-5-12 Laogianggen","190518","Beijing","",'CN'),
(2100,"1298 Vileparle(E)","490231","Bombay","Maharashtra",'IN'),
(2200,"12-98 Victoria Stree","2901","Sydney","New South Wale",'AU'),
(2300,"198 Clementi North","540198","Singapore","",'SG'),
(2400,"8204 Arthur St","","London","",'UK'),
(2500,"Magdalen Centre,The","OX99ZB","Oxford","Oxford",'UK'),
(2600,"9702 Chester Road","9629850293","Stretford","Manchester",'UK'),
(2700,"Schwanthalerstr.703","80925","Munich","Bavaria",'DE'),
(2800,"Rua Frei Caneca 1360","01307-002","Sao Paulo","Sao Paulo",'BR'),
(2900,"20 Ruedes Corps-Sai","1730","Geneva","Geneve",'CH'),
(3000,"Murtenstrasse 921","3095","Bern","BE",'CH'),
(3100,"Pieter Breughelstraa","3029SK","Utrecht","Utrecht",'NL'),
(3200,"Mariano Escobedo 999","11932","Mexico Cit","Distrito Feder",'MX');




-- TABLE :- DEPARTMENT

CREATE TABLE departments(
    department_id decimal(4,0),
    department_name varchar(50),
    manager_id int,
    location_id int,
    PRIMARY KEY(department_id),
    FOREIGN KEY (location_id) 
        REFERENCES locations(location_id),
    KEY(location_id)
);


INSERT INTO departments(
        department_id,
        department_name,
        manager_id,
        location_id
)
VALUES (10, "Administration", 200, 1700),
    (20, "Marketing", 201, 1800),
    (30, "Purchasing", 114, 1700),
    (40, "Human Resources", 203, 2400),
    (50, "Shipping", 121, 1500),
    (60, "IT", 103, 1400),
    (70, "Public Relations", 204, 2700),
    (80, "Sales", 145, 2500),
    (90, "Executive", 100, 1700),
    (100, "Finance", 108, 1700),
    (110, "Accounting", 205, 1700),
    (120, "Treasury", 0, 1700),
    (130, "Corporate Tax", 0, 1700),
    (140, "Control And Credit", 0, 1700),
    (150, "Shareholder Services", 0, 1700),
    (160, "Benefits", 0, 1700),
    (170, "Manufacturing", 0, 1700),
    (180, "Construction", 0, 1700),
    (190, "Contracting", 0, 1700),
    (200, "Operations", 0, 1700),
    (210, "IT Support", 0, 1700),
    (220, "NOC", 0, 1700),
    (230, "IT Helpdesk", 0, 1700),
    (240, "Government Sales", 0, 1700),
    (250, "Retail Sales", 0, 1700),
    (260, "Recruiting", 0, 1700),
    (270, "Payroll", 0, 1700);





CREATE TABLE jobs(
    job_id varchar(10),
    job_title varchar(35) NOT NULL,
    min_salary decimal(6,0) NOT NULL,
    max_salary decimal(6,0) NOT NULL,
    PRIMARY KEY(job_id)
);

INSERT INTO jobs 
VALUES 
('AD_PRES','President',20000,40000),
('AD_VP','Administration Vice President',15000,30000),
('AD_ASST','Administration Assistant',3000,6000),
('FI_MGR','Finance Manager',8200,16000),
('FI_ACCOUNT','Accountant',4200,9000),
('AC_MGR','Accounting Manager',8200,16000),
('AC_ACCOUNT','Public Accountant',4200,9000),
('SA_MAN','Sales Manager',10000,20000),
('SA_REP','Sales Representative',6000,12000),
('PU_MAN','Purchasing Manager',8000,15000),
('PU_CLERK','Purchasing Clerk',2500,5500),
('ST_MAN','Stock Manager',5500,8500),
('ST_CLERK','Stock Clerk',2000,5000),
('SH_CLERK','Shipping Clerk',2500,5500),
('IT_PROG','Programmer',4000,10000),
('MK_MAN','Marketing Manager',9000,15000),
('MK_REP','Marketing Representative',4000,9000),
('HR_REP','Human Resources Representative',4000,9000),
('PR_REP','Public Relations Representative',4500,10500);



-- TABLE :- EMPLOYEES

CREATE TABLE employees(
    employee_id decimal(6,0) NOT NULL,
    first_name varchar(50),
    last_name varchar(50) ,
    email varchar(30) NOT NULL,
    phone_number varchar(13) DEFAULT NULL,
    hire_date date,
    job_id varchar(10),
    salary decimal(10, 2) DEFAULT NULL,
    commission_pc decimal(5, 2) DEFAULT NULL,
    manager_id int DEFAULT NULL,
    department_id decimal(4,0) DEFAULT NULL,
    PRIMARY KEY (employee_id),
    FOREIGN KEY(department_id) 
        REFERENCES departments(department_id),
    FOREIGN KEY(job_id) 
        REFERENCES jobs(job_id),
    UNIQUE KEY (email),
    KEY (job_id),
    KEY (manager_id),
    KEY (first_name,last_name)
);



INSERT INTO employees(employee_id, first_name, last_name, email, phone_number, hire_date,job_id,salary,commission_pc,manager_id,department_id)
VALUES
(100,"Steven","King","SKING@email.com",5151234567,"1987-06-17","AD_PRES",24000.00,0.00,0,90),
(101,"Neena","Kochhar","NKOCHHAR@email.com",5151234568,"1987-06-18","AD_VP",17000.00,0.00,100,90),
(102,"Lex","DeHaan","LDEHAAN@email.com",5151234569,"1987-06-19","AD_VP",17000.00,0.00,100,90),
(103,"Alexander","Hunold","AHUNOLD@email.com",5904234567,"1987-06-20","IT_PROG",9000.00,0.00,102,60),
(104,"Bruce","Ernst","BERNST@email.com",5904234568,"1987-06-21","IT_PROG",6000.00,0.00,103,60),
(105,"David","Austin","DAUSTIN@email.com",5904234569,"1987-06-22","IT_PROG",4800.00,0.00,103,60),
(106,"Valli","Pataballa","VPATABAL@email.com",5904234560,"1987-06-23","IT_PROG",4800.00,0.00,103,60),
(107,"Diana","Lorentz","DLORENTZ@email.com",5904235567,"1987-06-24","IT_PROG",4200.00,0.00,103,60),
(108,"Nancy","Greenberg","NGREENBE@email.com",5151244569,"1987-06-25","FI_MGR",12000.00,0.00,101,100),
(109,"Daniel","Faviet","DFAVIET@email.com",5151244169,"1987-06-26","FI_ACCOUNT",9000.00,0.00,108,100),
(110,"John","Chen","JCHEN@email.com",5151244269,"1987-06-27","FI_ACCOUNT",8200.00,0.00,108,100),
(111,"Ismael","Sciarra","ISCIARRA@email.com",5151244369,"1987-06-28","FI_ACCOUNT",7700.00,0.00,108,100),
(112,"JoseManuel","Urman","JMURMAN@email.com",5151244469,"1987-06-29","FI_ACCOUNT",7800.00,0.00,108,100),
(113,"Luis","Popp","LPOPP@email.com",5151244567,"1987-06-30","FI_ACCOUNT",6900.00,0.00,108,100),
(114,"Den","Raphaely","DRAPHEAL@email.com",5151274561,"1987-07-01","PU_MAN",11000.00,0.00,100,30),
(115,"Alexander","Khoo","AKHOO@email.com",5151274562,"1987-07-02","PU_CLERK",3100.00,0.00,114,30),
(116,"Shelli","Baida","SBAIDA@email.com",5151274563,"1987-07-03","PU_CLERK",2900.00,0.00,114,30),
(117,"Sigal","Tobias","STOBIAS@email.com",5151274564,"1987-07-04","PU_CLERK",2800.00,0.00,114,30),
(118,"Guy","Himuro","GHIMURO@email.com",5151274565,"1987-07-05","PU_CLERK",2600.00,0.00,114,30),
(119,"Karen","Colmenares","KCOLMENA@email.com",5151274566,"1987-07-06","PU_CLERK",2500.00,0.00,114,30),
(120,"Matthew","Weiss","MWEISS@email.com",6501231234,"1987-07-07","ST_MAN",8000.00,0.00,100,50),
(121,"Adam","Fripp","AFRIPP@email.com",6501232234,"1987-07-08","ST_MAN",8200.00,0.00,100,50),
(122,"Payam","Kaufling","PKAUFLIN@email.com",6501233234,"1987-07-09","ST_MAN",7900.00,0.00,100,50),
(123,"Shanta","Vollman","SVOLLMAN@email.com",6501234234,"1987-07-10","ST_MAN",6500.00,0.00,100,50),
(124,"Kevin","Mourgos","KMOURGOS@email.com",6501235234,"1987-07-11","ST_MAN",5800.00,0.00,100,50),
(125,"Julia","Nayer","JNAYER@email.com",6501241214,"1987-07-12","ST_CLERK",3200.00,0.00,120,50),
(126,"Irene","Mikkilineni","IMIKKILI@email.com",6501241224,"1987-07-13","ST_CLERK",2700.00,0.00,120,50),
(127,"James","Landry","JLANDRY@email.com",6501241334,"1987-07-14","ST_CLERK",2400.00,0.00,120,50),
(128,"Steven","Markle","SMARKLE@email.com",6501241434,"1987-07-15","ST_CLERK",2200.00,0.00,120,50),
(129,"Laura","Bissot","LBISSOT@email.com",6501245234,"1987-07-16","ST_CLERK",3300.00,0.00,121,50),
(130,"Mozhe","Atkinson","MATKINSO@email.com",6501246234,"1987-07-17","ST_CLERK",2800.00,0.00,121,50),
(131,"James","Marlow","JAMRLOW@email.com",6501247234,"1987-07-18","ST_CLERK",2500.00,0.00,121,50),
(132,"TJ","Olson","TJOLSON@email.com",6501248234,"1987-07-19","ST_CLERK",2100.00,0.00,121,50),
(133,"Jason","Mallin","JMALLIN@email.com",6501271934,"1987-07-20","ST_CLERK",3300.00,0.00,122,50),
(134,"Michael","Rogers","MROGERS@email.com",6501271834,"1987-07-21","ST_CLERK",2900.00,0.00,122,50),
(135,"Ki","Gee","KGEE@email.com",6501271734,"1987-07-22","ST_CLERK",2400.00,0.00,122,50),
(136,"Hazel","Philtanker","HPHILTAN@email.com",6501271634,"1987-07-23","ST_CLERK",2200.00,0.00,122,50),
(137,"Renske","Ladwig","RLADWIG@email.com",6501211234,"1987-07-24","ST_CLERK",3600.00,0.00,123,50),
(138,"Stephen","Stiles","SSTILES@email.com",6501212034,"1987-07-25","ST_CLERK",3200.00,0.00,123,50),
(139,"John","Seo","JSEO@email.com",6501212019,"1987-07-26","ST_CLERK",2700.00,0.00,123,50),
(140,"Joshua","Patel","JPATEL@email.com",6501211834,"1987-07-27","ST_CLERK",2500.00,0.00,123,50),
(141,"Trenna","Rajs","TRAJS@email.com",6501218009,"1987-07-28","ST_CLERK",3500.00,0.00,124,50),
(142,"Curtis","Davies","CDAVIES@email.com",6501212994,"1987-07-29","ST_CLERK",3100.00,0.00,124,50),
(143,"Randall","Matos","RMATOS@email.com",6501212874,"1987-07-30","ST_CLERK",2600.00,0.00,124,50),
(144,"Peter","Vargas","PVARGAS@email.com",6501212004,"1987-07-31","ST_CLERK",2500.00,0.00,124,50),
(145,"John","Russell","JRUSSEL@email.com",0114434465,"1987-08-01","SA_MAN",14000.00,0.40,100,80),
(146,"Karen","Partners","KPARTNER@email.com",0114434465,"1987-08-02","SA_MAN",13500.00,0.30,100,80),
(147,"Alberto","Errazuriz","AERRAZUR@email.com",0114434465,"1987-08-03","SA_MAN",12000.00,0.30,100,80),
(148,"Gerald","Cambrault","GCAMBRAU@email.com",0114434465,"1987-08-04","SA_MAN",11000.00,0.30,100,80),
(149,"Eleni","Zlotkey","EZLOTKEY@email.com",0114434465,"1987-08-05","SA_MAN",10500.00,0.20,100,80),
(150,"Peter","Tucker","PTUCKER@email.com",0114434465,"1987-08-06","SA_REP",10000.00,0.30,145,80),
(151,"David","Bernstein","DBERNSTE@email.com",0114434465,"1987-08-07","SA_REP",9500.00,0.25,145,80),
(152,"Peter","Hall","PHALL@email.com",0114434465,"1987-08-08","SA_REP",9000.00,0.25,145,80),
(153,"Christopher","Olsen","COLSEN@email.com",0114434465,"1987-08-09","SA_REP",8000.00,0.20,145,80),
(154,"Nanette","Cambrault","NCAMBRAU@email.com",0114434465,"1987-08-10","SA_REP",7500.00,0.20,145,80),
(155,"Oliver","Tuvault","OTUVAULT@email.com",0114434465,"1987-08-11","SA_REP",7000.00,0.15,145,80),
(156,"Janette","King","JKING@email.com",0114434565,"1987-08-12","SA_REP",10000.00,0.35,146,80),
(157,"Patrick","Sully","PSULLY@email.com",0114434565,"1987-08-13","SA_REP",9500.00,0.35,146,80),
(158,"Allan","McEwen","AMCEWEN@email.com",0114434565,"1987-08-14","SA_REP",9000.00,0.35,146,80),
(159,"Lindsey","Smith","LSMITH@email.com",0114434565,"1987-08-15","SA_REP",8000.00,0.30,146,80),
(160,"Louise","Doran","LDORAN@email.com",0114434565,"1987-08-16","SA_REP",7500.00,0.30,146,80),
(161,"Sarath","Sewall","SSEWALL@email.com",0114434565,"1987-08-17","SA_REP",7000.00,0.25,146,80),
(162,"Clara","Vishney","CVISHNEY@email.com",0114434665,"1987-08-18","SA_REP",10500.00,0.25,147,80),
(163,"Danielle","Greene","DGREENE@email.com",0114434665,"1987-08-19","SA_REP",9500.00,0.15,147,80),
(164,"Mattea","Marvins","MMARVINS@email.com",0114434665,"1987-08-20","SA_REP",7200.00,0.10,147,80),
(165,"David","Lee","DLEE@email.com",0114434665,"1987-08-21","SA_REP",6800.00,0.10,147,80),
(166,"Sundar","Ande","SANDE@email.com",0114434665,"1987-08-22","SA_REP",6400.00,0.10,147,80),
(167,"Amit","Banda","ABANDA@email.com",0114434665,"1987-08-23","SA_REP",6200.00,0.10,147,80),
(168,"Lisa","Ozer","LOZER@email.com",0114434365,"1987-08-24","SA_REP",11500.00,0.25,148,80),
(169,"Harrison","Bloom","HBLOOM@email.com",0114434365,"1987-08-25","SA_REP",10000.00,0.20,148,80),
(170,"Tayler","Fox","TFOX@email.com",0114434365,"1987-08-26","SA_REP",9600.00,0.20,148,80),
(171,"William","Smith","WSMITH@email.com",0114434365,"1987-08-27","SA_REP",7400.00,0.15,148,80),
(172,"Elizabeth","Bates","EBATES@email.com",0114434365,"1987-08-28","SA_REP",7300.00,0.15,148,80),
(173,"Sundita","Kumar","SKUMAR@email.com",0114434365,"1987-08-29","SA_REP",6100.00,0.10,148,80),
(174,"Ellen","Abel","EABEL@email.com",0114464465,"1987-08-30","SA_REP",11000.00,0.30,149,80),
(175,"Alyssa","Hutton","AHUTTON@email.com",0114464465,"1987-08-31","SA_REP",8800.00,0.25,149,80),
(176,"Jonathon","Taylor","JTAYLOR@email.com",0114464465,"1987-09-01","SA_REP",8600.00,0.20,149,80),
(177,"Jack","Livingston","JLIVINGS@email.com",0114464465,"1987-09-02","SA_REP",8400.00,0.20,149,80),
(178,"Kimberely","Grant","KGRANT@email.com",0114464465,"1987-09-03","SA_REP",7000.00,0.15,149,80),
(179,"Charles","Johnson","CJOHNSON@email.com",0114464465,"1987-09-04","SA_REP",6200.00,0.10,149,80),
(180,"Winston","Taylor","WTAYLOR@email.com",6505079876,"1987-09-05","SH_CLERK",3200.00,0.00,120,50),
(181,"Jean","Fleaur","JFLEAUR@email.com",6505079877,"1987-09-06","SH_CLERK",3100.00,0.00,120,50),
(182,"Martha","Sullivan","MSULLIVA@email.com",6505079878,"1987-09-07","SH_CLERK",2500.00,0.00,120,50),
(183,"Girard","Geoni","GGEONI@email.com",6505079879,"1987-09-08","SH_CLERK",2800.00,0.00,120,50),
(184,"Nandita","Sarchand","NSARCHAN@email.com",6505091876,"1987-09-09","SH_CLERK",4200.00,0.00,121,50),
(185,"Alexis","Bull","ABULL@email.com",6505092876,"1987-09-10","SH_CLERK",4100.00,0.00,121,50),
(186,"Julia","Dellinger","JDELLING@email.com",6505093876,"1987-09-11","SH_CLERK",3400.00,0.00,121,50),
(187,"Anthony","Cabrio","ACABRIO@email.com",6505094876,"1987-09-12","SH_CLERK",3000.00,0.00,121,50),
(188,"Kelly","Chung","KCHUNG@email.com",6505051876,"1987-09-13","SH_CLERK",3800.00,0.00,122,50),
(189,"Jennifer","Dilly","JDILLY@email.com",6505052876,"1987-09-14","SH_CLERK",3600.00,0.00,122,50),
(190,"Timothy","Gates","TGATES@email.com",6505053876,"1987-09-15","SH_CLERK",2900.00,0.00,122,50),
(191,"Randall","Perkins","RPERKINS@email.com",6505054876,"1987-09-16","SH_CLERK",2500.00,0.00,122,50),
(192,"Sarah","Bell","SBELL@email.com",6505011876,"1987-09-17","SH_CLERK",4000.00,0.00,123,50),
(193,"Britney","Everett","BEVERETT@email.com",6505012876,"1987-09-18","SH_CLERK",3900.00,0.00,123,50),
(194,"Samuel","McCain","SMCCAIN@email.com",6505013876,"1987-09-19","SH_CLERK",3200.00,0.00,123,50),
(195,"Vance","Jones","VJONES@email.com",6505014876,"1987-09-20","SH_CLERK",2800.00,0.00,123,50),
(196,"Alana","Walsh","AWALSH@email.com",6505079811,"1987-09-21","SH_CLERK",3100.00,0.00,124,50),
(197,"Kevin","Feeney","KFEENEY@email.com",6505079822,"1987-09-22","SH_CLERK",3000.00,0.00,124,50),
(198,"Donald","OConnell","DOCONNEL@email.com",6505079833,"1987-09-23","SH_CLERK",2600.00,0.00,124,50),
(199,"Douglas","Grant","DGRANT@email.com",6505079844,"1987-09-24","SH_CLERK",2600.00,0.00,124,50),
(200,"Jennifer","Whalen","JWHALEN@email.com",5151234444,"1987-09-25","AD_ASST",4400.00,0.00,101,10),
(201,"Michael","Hartstein","MHARTSTE@email.com",5151235555,"1987-09-26","MK_MAN",13000.00,0.00,100,20),
(202,"Pat","Fay","PFAY@email.com",6031236666,"1987-09-27","MK_REP",6000.00,0.00,201,20),
(203,"Susan","Mavris","SMAVRIS@email.com",5151237777,"1987-09-28","HR_REP",6500.00,0.00,101,40),
(204,"Hermann","Baer","HBAER@email.com",5151238888,"1987-09-29","PR_REP",10000.00,0.00,101,70),
(205,"Shelley","Higgins","SHIGGINS@email.com",5151238080,"1987-09-30","AC_MGR",12000.00,0.00,101,110),
(206,"William","Gietz","WGIETZ@email.com",5151238181,"1987-10-01","AC_ACCOUNT",8300.00,0.00,205,110);



CREATE TABLE job_history(
    employee_id decimal(6,0) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL, 
    job_id varchar(10) NOT NULL,
    department_id decimal(4,0) NOT NULL,
    PRIMARY KEY(employee_id,start_date),
    FOREIGN KEY (employee_id) 
        REFERENCES employees(employee_id),
    FOREIGN KEY(department_id)
        REFERENCES departments(department_id),
    FOREIGN KEY(job_id)
        REFERENCES jobs(job_id)
);


INSERT INTO job_history(employee_id,start_date,end_date,job_id,department_id) VALUES (102,'1993-01-13','1998-07-24','IT_PROG',60),
(101,'1989-09-21','1993-10-27','AC_ACCOUNT',110),
(101,'1993-10-28','1997-03-15','AC_MGR',110),
(201,'1996-02-17','1999-12-19','MK_REP',20),
(114,'1998-03-24','1999-12-31','ST_CLERK',50),
(122,'1999-01-01','1999-12-31','ST_CLERK',50),
(200,'1987-09-17','1993-06-17','AD_ASST',90),
(176,'1998-03-24','1998-12-31','SA_REP',80),
(176,'1999-01-01','1999-12-31','SA_MAN',80),
(200,'1994-07-01','1998-12-31','AC_ACCOUNT',90);



-- Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. Go to the editor
-- Hint : Use NATURAL JOIN.


-- ANS - 1 INNER JOIN
select locations.location_id, locations.street_address, locations.city, locations.state_province, countries.country_name
from locations
join countries
on locations.country_id = countries.country_id; 

-- ANS - 2 NATURAL JOIN
select location_id, street_address, city, state_province, country_name
from locations
natural join countries;


-- Write a query to find the name (first_name, last name), department ID and name of all the employees.

-- ANS - 1
select employees.first_name, employees.last_name, departments.department_id,departments.department_name
from employees 
join departments
on employees.department_id = departments.department_id;

-- ANS - 2
SELECT employees.first_name, employees.last_name, departments.department_id,departments.department_name
FROM employees 
JOIN departments USING (department_id);


-- Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London

-- Ans - 1
select employees.first_name, employees.last_name, employees.job_id, employees.department_id, departments.department_name
from employees
join departments
on employees.department_id = departments.department_id
join locations
on departments.location_id = locations.location_id 
where locations.city = "London";

-- Ans - 2
select emp.first_name, emp.last_name, emp.job_id, emp.department_id, dep.department_name
from employees as emp
join departments as dep using(department_id)
join locations using(location_id)
where locations.city = "London";

-- ans - 3
SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name 
FROM employees e 
JOIN departments d 
ON (e.department_id = d.department_id) 
JOIN locations l ON 
(d.location_id = l.location_id) 
WHERE LOWER(l.city) = 'London';


-- 4. Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).

-- ANS - 1
SELECT e.employee_id 'Emp_Id', e.last_name 'Employee', 
m.employee_id 'Mgr_Id', m.last_name 'Manager' 
FROM employees e 
join employees m 
ON (e.manager_id = m.employee_id);


 -- 5. Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'

select e.first_name, e.last_name, e.hire_date 
from employees e
join employees emp 
on (emp.last_name = 'Jones')
where emp.hire_date < e.hire_date;


--6. Write a query to get the department name and number of employees in the department.

select department_name as 'Department Name',
COUNT(*) as 'No Of Employees'
from departments
join employees using(department_id)
group by departments.department_id, department_name
order by department_name;

-- 7. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90

select employee_id, job_title, end_date - start_date as "Days" from 
job_history
NATURAL join jobs
where department_id = 90;

-- 8. Write a query to display the department ID and name and first name of manager.

SELECT d.department_id, d.department_name, d.manager_id, e.first_name 
FROM departments d 
INNER JOIN employees e 
ON (d.manager_id = e.employee_id);

-- 9. Write a query to display the department name, manager name, and city.


-- 10. Write a query to display the job title and average salary of employees


-- 11. Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.



-- 12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of 



-- 13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
