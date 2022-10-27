create database agenda

use agenda

create table Agenda(

apellido varchar(15),
nombre varchar (15),
domicilio varchar (20),
telefono  varchar (15),
)
go 

drop table Agenda

 
 create table Agenda2(

apellido varchar(15),
nombre varchar (15),
domicilio varchar (20),
telefono  varchar (15),
)
go 

Insert into Agenda2 (apellido, nombre , domicilio, telefono )
values ('reynoso','Nicol', 'Colon', '8096374123');

select * from Agenda2;



 


