-- :::::::::::: TEST:- 1 ::::::::::::::::
create database IF NOT EXISTS db_inventory;
create table salesman(
    salesman_id int AUTO_INCREMENT PRIMARY KEY,
    name varchar(30),
    city varchar(15),
    commission decimal(5, 2)
);
-- ON DELETE CASCADE constraint is used in MySQL to delete the rows from the child table automatically,
-- ON UPDATE CASCADE constraint if the parent primary key is changed, the child value will also change to reflect that.
create table customer(
    customer_id int AUTO_INCREMENT PRIMARY KEY,
    cust_name varchar(30),
    city varchar(15),
    grade int(3),
    salesman_id int,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id) ON DELETE CASCADE ON UPDATE CASCADE
);
create table orders(
    order_no int AUTO_INCREMENT PRIMARY KEY,
    purchase_amt decimal(8, 2),
    ord_date date,
    customer_id int,
    salesman_id int,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id) ON DELETE CASCADE ON UPDATE CASCADE
);
-- :::::::::::: TEST:- 2 ::::::::::::::::
create database IF NOT EXISTS db_hr;
create table regions(
    region_id int AUTO_INCREMENT PRIMARY KEY,
    region_name varchar(30)
);
-- RESTRICT MySQL does not allow to delete or update rows in the parent table.
create table countries(
    country_id char(3) PRIMARY KEY,
    country_name varchar(40),
    region_id int,
    FOREIGN KEY (region_id) REFERENCES regions(region_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
create table locations(
    location_id int AUTO_INCREMENT PRIMARY KEY,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12),
    country_id char(3),
    FOREIGN KEY (country_id) REFERENCES countries(country_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
create table departments(
    department_id int PRIMARY KEY,
    department_name varchar(30),
    manager_id int,
    location_id int,
    FOREIGN KEY (location_id) REFERENCES locations(location_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
create table jobs(
    job_id varchar(5) PRIMARY KEY,
    job_title varchar(35),
    min_salary int(10),
    max_salary int(10)
);

create table job_grades(
    grade_level varchar(2) PRIMARY KEY,
    lowest_sal int(10),
    height_dal int(10)
);
create table employees(
    employee_id decimal(6,0),
    first_name varchar(20) NOT NULL,
    last_name varchar(25) NOT NULL,
    email varchar(25) NOT NULL UNIQUE,
    phone_number varchar(20) NOT NULL UNIQUE,
    hire_date date NOT NULL,
    job_id varchar(5),
    salary int(10),
    commission_pct int(10),
    manager_id int,
    department_id int,
    FOREIGN KEY (job_id) 
        REFERENCES jobs(job_id) 
        ON DELETE RESTRICT 
        ON UPDATE RESTRICT,
    FOREIGN KEY (department_id) 
        REFERENCES departments(department_id) 
        ON DELETE RESTRICT 
        ON UPDATE RESTRICT
);

create table job_history(
    employee_id decimal(6,0),
    start_date date NOT NULL,
    end_date date NOT NULL,
    job_id varchar(5) NOT NULL,
    department_id int,
    PRIMARY KEY(employee_id, start_date),
    FOREIGN KEY(department_id) 
        REFERENCES departments(department_id) 
        ON DELETE RESTRICT 
        ON UPDATE RESTRICT,
    FOREIGN KEY(job_id) 
        REFERENCES jobs(job_id) 
        ON DELETE RESTRICT 
        ON UPDATE RESTRICT
);





-- ********************************************************************************
--
-- #DB_NAME :-  db_movie
-- Queries: - create database IF NOT EXISTS db_movie;
--
-- ********************************************************************************

create table actor(
    act_id int,
    act_fname varchar(20),
    act_lname varchar(20),
    act_gender char(1),
    PRIMARY KEY(act_id)
);
create table movie(
    mov_id int,
    mov_title varchar(50),
    mov_year int(10),
    mov_time int(10),
    mov_lang char(50),
    mov_dt_rel date,
    mov_rel_country char(5),
    PRIMARY KEY (mov_id)
);
create table director(
    dir_id int PRIMARY KEY,
    dir_fname varchar(20),
    dir_lname varchar(20)
);
create table genres(
    gen_id int PRIMARY KEY,
    gen_title varchar(20)
);
create table reviewer(rev_id int PRIMARY KEY, mov_id int);
create table movie_cast(
    act_id int,
    mov_id int,
    role varchar(20),
    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY(mov_id) REFERENCES movie(mov_id)
);
create table movie_direction(
    dir_id int,
    mov_id int,
    FOREIGN KEY(dir_id) REFERENCES director(dir_id),
    FOREIGN KEY(mov_id) REFERENCES movie(mov_id)
);
create table movie_genres(
    mov_id int,
    gen_id int,
    FOREIGN KEY(mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY(gen_id) REFERENCES genres(gen_id)
);
create table rating(
    mov_id int,
    rev_id int,
    rev_stars int,
    num_o_ratings int,
    FOREIGN KEY(mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY(rev_id) REFERENCES reviewer(rev_id)
);
#DB_NAME :-  db_hospital
Queries: - create database if not exists db_hospital;
create table procedure(
    code int,
    name text,
    cost decimal(10, 0),
    PRIMARY KEY(code)
);
create table nurse(
    employeeid int,
    name text,
    position text,
    registered boolean,
    ssn int,
    PRIMARY KEY(employeeid)
);
create table block(
    blockfloor int,
    blockcode int,
    PRIMARY KEY(blockfloor, blockcode)
);
create table medication(
    code int,
    name text,
    brand text,
    description text,
    PRIMARY KEY (code)
);
create table working_hours(
    employee_id int AUTO_INCREMENT NOT NULL,
    first_name varchar(45) NOT NULL,
    last_name varchar(45) NOT NULL,
    month varchar(8),
    week int,
    days bit(7),
    PRIMARY KEY(employee_id)
);
