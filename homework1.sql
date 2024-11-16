create database homework1;
use homework1;

create table employees(
	id int primary key auto_increment not null,
    firstname varchar(128) not null,
    lastname varchar(128) not null,
    job varchar(64) not null,
    age int check(age between 20 and 100),
    hascar char(1) default 'N', 
	username varchar(128) unique not null
 );

select * from employees;

insert into employees (firstname, lastname, job, age, username)
values ('Ally' , 'Austin' , 'Junior UI Designer', 28 , 'ally1'),
		('Daniel', 'Faviet', 'Senior UX Designer', 43, 'favietD'),
        ('Lex' , 'De Haan' , 'Salesmanager', 35 , 'Sales'),
        ('Diana' , 'Lorentz', 'Financemanager', 32, 'Finance'),
        ('Lily', 'Chen', 'Senior Teacher', 25, 'lilychen');
        
select * from employees;

drop table employees;
drop database homework1;

