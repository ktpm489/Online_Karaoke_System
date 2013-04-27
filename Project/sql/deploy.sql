/**
 * deploy db: oks
 * account usr and password： oksusr , oksusr
 **/
create database `oks` default character set utf8 collate utf8_general_ci;
create user 'oksusr'@'localhost' identified by 'oksusr';
grant select,insert,update,delete,create,drop,alter,lock tables on `oks`.* to 'oksusr'@'localhost';

use oks;

drop table if exists `List`;
drop table if exists `Detail`;
drop table if exists `Music`;
drop table if exists `User`;

create table `User`
(
	UID int primary key auto_increment, 
	UNAME char(20) unique not null,
	UPWD char(20) not null,
	AFLAG tinyint(1) not null default 0
);

create table `Detail`
(
	UID int primary key,
	DSEX char,
	DNNAME char(20),
	DEMAIL char(30),
	DPN char(20),
	DLIP char(15),
	DRIP char(15) not null,
	foreign key (UID) references User(UID)
);
create table `Music`
(
	MID int primary key auto_increment,
	MNAME char(100) not null,
	MFA char(255) not null,
	MSA char(255) not null,
	MART char(50),
	MAUM char(50),
	MY int,
	MC char(50),
	MT int,
	MUFLAG tinyint(1) not null default 0,
	constraint ONE_SONG UNIQUE (MNAME,MAUM)
);

create table `List`
(
    LID int primary key auto_increment,
    UID int not null,
	MID int not null,
	foreign key(UID) references User(UID),
	foreign key(MID) references Music(MID)
)


