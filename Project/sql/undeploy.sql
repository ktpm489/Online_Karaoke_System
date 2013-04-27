use mysql;
revoke all privileges on * . * from 'oksusr'@'localhost';
revoke all privileges on `oks` . * from 'oksusr'@'localhost';
revoke grant option on `oks` . * from 'oksusr'@'localhost';
delete from `user` where convert ( user using utf8) = convert ( 'oksusr' using utf8) and convert (host using utf8) = convert ('localhost' using utf8);
drop database if exists `oks`;

