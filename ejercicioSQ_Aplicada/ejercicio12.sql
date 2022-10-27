

create database medicamento
use medicamento

create table medicamento(
  codigo integer identity(10,1),
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 );

 insert into medicamento (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
 insert into medicamento (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamento (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);

 select * from medicamento;

 insert into medicamento (codigo,nombre, laboratorio,precio,cantidad)
  values(4,'Amoxilina 500','Bayer',15.60,100);

  set identity_insert medicamento on;

 insert into medicamento (nombre, laboratorio,precio,cantidad)
  values('Amoxilina 500','Bayer',15.60,100);

 insert into medicamento (codigo,nombre, laboratorio,precio,cantidad)
  values(10,'Amoxilina 500','Bayer',15.60,100);

 select ident_seed('medicamentos');

 select ident_incr('medicamentos');

 


 

