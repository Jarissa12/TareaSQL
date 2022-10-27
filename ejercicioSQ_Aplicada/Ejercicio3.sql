

create database Pelicula
use Pelicula

create table peliculas(
  nombre varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );

 exec sp_columns peliculas;

 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('La macara ','Nose ',129,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Rapido furios 7','Ramon ',138,3);
 
 select * from peliculas;


