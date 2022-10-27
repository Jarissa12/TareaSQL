
create database Libro 

use Libro

create table Libro (

   titulo varchar (30),
    Autor varchar ( 15),
	 Editorial varchar (20),
)

go 

exec sp_columns libro;

 insert into Libro(titulo,autor,editorial) 
 values ('El aleph','Borges','Emece');
 insert into Libro(titulo,autor,editorial) 
 values('Martin Fierro','Jose Hernandez','Emece');
 insert into Libro(titulo,autor,editorial)
  values ('Martin Fierro','Jose Hernandez','Planeta');
 insert into Libro(titulo,autor,editorial) values
  ('Aprenda PHP','Mario Molina','Siglo XXI');

 select * from Libro
  where Autor='Borges';

 select titulo from Libro
  where Editorial='Emece';

 select Editorial from Libro
  where titulo='Martin Fierro';