	
CREATE DATABASE [WorkDB];
GO
USE [WorkDB];
GO
	
	create table Department(
	dno int not null primary key,
	dname nvarchar(50) not null
	);

	create table Employee(
	eno int not null ,
	dob datetime not null ,
	primary key(eno, dob),
	ename nvarchar(50) not null,
	gender bit not null,
	pay money not null,
	skill nvarchar(50) not null,
	dno int foreign key references department(dno),

	sno int,
	superDob datetime,

	constraint FK_SupervisorEmployee Foreign key (sno,superDob)
	references Employee(eno, dob));
	
	create table Dependent(
	dname nvarchar(50) not null,
	gender bit not null,
	dob datetime not null,
	relationship nvarchar(30),
	primary key(dname),
	eno int,
	Foreign key (eno, dob) references Employee(eno, dob)
	);