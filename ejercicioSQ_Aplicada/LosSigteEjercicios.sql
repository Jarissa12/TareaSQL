
create database tareaSQL
use tareaSQL


-- Cree la tabla con la siguiente estructura:
create table medicamentos(
	codigo integer not null,
	nombre varchar(20) not null,
	laboratorio varchar(20),
	precio float,
	cantidad integer not null
)

--14. Visualice la estructura de la tabla "medicamentos"
exec SP_columns medicamentos

--15. Ingrese algunos registros con valores "null" para los campos que lo admitan

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
values(1,'Sertal gotas',null,null,100); 
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
values(2,'Sertal compuesto',null,8.90,150);
insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
values(3,'Buscapina','Roche',null,200);

--16. Vea todos los registros

select * from medicamentos

--16. Ingrese un registro con valor "0" para el precio y cadena vacía para el laboratorio

insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad)
values(4,'Bayaspirina','',0,150);
select * from medicamentos

--17. Ingrese un registro con valor "0" para el código y cantidad y cadena vacía para el nombre

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
values(0,'','Bayer',15.60,0);
select * from medicamentos

--18. Muestre todos los registros

select * from medicamentos

--19. Intente ingresar un registro con valor nulo para un campo que no lo admite (aparece un mensaje de error)

insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
values(null,'Amoxidal jarabe','Bayer',25,120);


select laboratorio from medicamentos
where laboratorio is null;
select laboratorio from medicamentos
where laboratorio = ''

/*20. Recupere los registros que contengan valor "null" en el campo "precio", luego los que tengan el 
valor 0 en el mismo campo. Note que el resultado es distinto.*/

select precio from medicamentos
where precio is null
select precio from medicamentos
where precio = 0

/*21. Recupere los registros cuyo laboratorio no contenga una cadena vacía, luego los que sean 
distintos de "null".
Note que la salida de la primera sentencia no muestra los registros con cadenas vacías y tampoco los 
que tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el 
campo laboratorio (incluso cadena vacía).*/

select * from medicamentos
where laboratorio <>0
select * from medicamentos
where laboratorio is not null

/*22. Recupere los registros cuyo precio sea distinto de 0, luego los que sean distintos de "null":
Note que la salida de la primera sentencia no muestra los registros con valor 0 y tampoco los que 
tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el 
campo precio (incluso el valor 0).*/

select * from medicamentos
where precio <>0
select * from medicamentos
where precio is not null

/*SEGUNDO PROBLEMA
Trabaje con la tabla que almacena los datos sobre películas, llamada "peliculas".
23. Elimine la tabla si exist*/

if OBJECT_ID('peliculas') is not null
drop table peliculas

--24 Crrela con la siguinte estructura
create table peliculas
(
codigo int not null,
titulo varchar(40) not null,
actor varchar(20),
duracion int
);

--25. Visualice la estructura de la tabla

exec SP_columns peliculas

--25. Ingrese los siguientes registros
insert into peliculas (codigo,titulo,actor,duracion)
values(1,'Mision imposible','Tom Cruise',120);
insert into peliculas (codigo,titulo,actor,duracion)
values(2,'Harry Potter y la piedra filosofal',null,180);
insert into peliculas (codigo,titulo,actor,duracion)
values(3,'Harry Potter y la camara secreta','Daniel R.',null);
insert into peliculas (codigo,titulo,actor,duracion)
values(0,'Mision imposible 2','',150);
insert into peliculas (codigo,titulo,actor,duracion)
values(4,'','L. Di Caprio',220);
insert into peliculas (codigo,titulo,actor,duracion)
values(5,'Mujer bonita','R. Gere-J. Roberts',0);

--26. Recupere todos los registros para ver cómo SQL Server los almacenó
select * from peliculas

--26. Intente ingresar un registro con valor nulo para campos que no lo admiten (aparece un mensaje de error)
insert into peliculas(codigo,titulo,actor,duracion)
values(null,'Mujer bonita','R. Gere-J. Roberts',190);

/*27. Muestre los registros con valor nulo en el campo "actor" y luego los que guardan una cadena vacía 
(note que la salida es distinta) (1 registro)*/

select * from peliculas
where actor is null

/*28. Modifique los registros que tengan valor de duración desconocido (nulo) por "120" (1 registro 
actualizado)*/

update peliculas set duracion = 120
where duracion is null

/*29.Coloque 'Desconocido' en el campo "actor" en los registros que tengan una cadena vacía en dicho 
campo (1 registro afectado)*/

update peliculas set actor = 'Desconicido'
where actor = ''
/*30. Muestre todos los registros. Note que el cambio anterior no afectó a los registros con valor 
nulo en el campo "actor".*/
select * from peliculas

--30. Elimine los registros cuyo título sea una cadena vacía (1 registro)

delete from peliculas
where titulo = '';

select * from peliculas

--32.  Clave primaria Primer problema: Trabaje con la tabla "libros" de una librería.
--1. Elimine la tabla si existe

if OBJECT_ID('libros') is not null
drop table libros

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 -- 34
--Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".
--- Elimine la tabla,si existe

if object_id('medicamentos') is not null
drop table medicamentos

create table medicamentos(
	codigo integer identity(10,1),
	nombre varchar(20) not null,
	laboratorio varchar(20),
	precio float,
	cantidad integer
)

--35- Ingrese los siguientes registros

insert into medicamentos (nombre, laboratorio,precio,cantidad)
values('Sertal','Roche',5.2,100);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
values('Buscapina','Roche',4.10,200);
insert into medicamentos (nombre, laboratorio,precio,cantidad)
values('Amoxidal 500','Bayer',15.60,100)


--36- Verifique que SQL Server generó valores para el campo "código" de modo automático

select *from medicamentos

--37- Intente ingresar un registro con un valor para el campo "codigo"

insert into medicamentos (codigo, laboratorio,precio,cantidad)
values(6,'amoxicilina','Bayer',250.10,50)

--38- Setee la opción "identity_insert" en "on"

set identity_insert medicamentos on

--39- Ingrese un nuevo registro sin valor para el campo "codigo" (no lo permite)

insert into medicamentos (nombre, laboratorio,precio,cantidad)
values('Amoxilina 500','Bayer',15.60,100)


--40- Ingrese un nuevo registro con valor para el campo "codigo" repetido
select * from medicamentos

insert into medicamentos (codigo, laboratorio,precio,cantidad)
values(10,'Amoxilina 500','Bayer',15.60,100)

/*40- Use la función "ident_seed()" para averiguar el valor de inicio del campo "identity" de la tabla 
"medicamentos"*/

select IDENT_SEED('medicamentos')

/*40- Emplee la función "ident_incr()" para saber cuál es el valor de incremento del campo "identity" 
de "medicamentos"*/

select IDENT_INCR('medicamentos')
--41
/*Segundo problema:
Un videoclub almacena información sobre sus películas en una tabla llamada "peliculas".
1- Elimine la tabla si existe*/

if object_id('peliculas') is not null
drop table peliculas

--2- Créela definiendo un campo "codigo" autoincrementable que comience en 50 y se incremente en 3:
create table peliculas(
	codigo int identity (50,3),
	titulo varchar(40),
	actor varchar(20),
	duracion int
)

-- 3- Ingrese los siguientes registros:
insert into peliculas (titulo,actor,duracion)
values('Mision imposible','Tom Cruise',120);
insert into peliculas (titulo,actor,duracion)
values('Harry Potter y la piedra filosofal','Daniel R.',180);
insert into peliculas (titulo,actor,duracion)
values('Harry Potter y la camara secreta','Daniel R.',190);

--4- Seleccione todos los registros y verifique la carga automática de los códigos:
 
select *from peliculas

--5- Setee la opción "identity_insert" en "on"

SET IDENTITY_INSERT peliculas on

--6- Ingrese un registro con valor de código menor a 50

insert into peliculas (codigo,titulo,actor,duracion)
values(38,'Mision imposible 2','Tom Cruise',120);

--7- Ingrese un registro con valor de código mayor al último generado

insert into peliculas (codigo, titulo,actor,duracion)
values(60,'Arte y Crime','Tom sam',120);

--8- Averigue el valor de inicio del campo "identity" de la tabla "peliculas"

select ident_seed('peliculas')

--9- Averigue el valor de incremento del campo "identity" de "peliculas"

select ident_incr('peliculas')

--10- Intente ingresar un registro sin valor para el campo código

insert into peliculas (titulo,actor,duracion)
values('La mujer maravilla','Enna Husten',163);

--11- Desactive la opción se inserción para el campo de identidad.

set identity_insert peliculas off

/*12- Ingrese un nuevo registro y muestre todos los registros para ver cómo SQL Server siguió la 
secuencia tomando el último valor del campo como referencia.*/

insert into peliculas (titulo,actor,duracion)
values('Super Man','Henry Cavill',120);
select * from peliculas

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*42- Truncate table, primer problema: Un instituto de enseñanza almacena los datos de sus estudiantes en una tabla llamada "alumnos".
1- Elimine la tabla "alumnos" si existe*/
if object_id('alumnos') is not null
drop table alumnos

--2- Cree la tabla con la siguiente estructura:
create table alumnos(
	legajo int identity,
	documento varchar(8),
	nombre varchar(30),
	domicilio varchar(30)
)

--3- Ingrese los siguientes registros y muéstrelos para ver la secuencia de códigos:
insert into alumnos (documento,nombre,domicilio)
values('22345345','Perez Mariana','Colon 234');
insert into alumnos (documento,nombre,domicilio)
values('23545345','Morales Marcos','Avellaneda 348');
insert into alumnos (documento,nombre,domicilio)
values('24356345','Gonzalez Analia','Caseros 444');
insert into alumnos (documento,nombre,domicilio)
values('25666777','Torres Ramiro','Dinamarca 209');

--4- Elimine todos los registros con "delete".

delete from alumnos

--5- Ingrese los siguientes registros y selecciónelos para ver cómo SQL Server generó los códigos

insert into alumnos (documento,nombre,domicilio)
values('22345345','Perez Mariana','Colon 234');
insert into alumnos (documento,nombre,domicilio)
values('23545345','Morales Marcos','Avellaneda 348');
insert into alumnos (documento,nombre,domicilio)
values('24356345','Gonzalez Analia','Caseros 444');
insert into alumnos (documento,nombre,domicilio)
values('25666777','Torres Ramiro','Dinamarca 209');
select * from alumnos

--6- Elimine todos los registros con "truncate table"

truncate table alumnos

/*7- Ingrese los siguientes registros y muestre todos los registros para ver que SQL Server reinició 
la secuencia del campo "identity"*/

insert into alumnos (documento,nombre,domicilio)
values('22345345','Perez Mariana','Colon 234');
insert into alumnos (documento,nombre,domicilio)
values('23545345','Morales Marcos','Avellaneda 348');
insert into alumnos (documento,nombre,domicilio)
values('24356345','Gonzalez Analia','Caseros 444');
insert into alumnos (documento,nombre,domicilio)
values('25666777','Torres Ramiro','Dinamarca 209');
select * from alumnos;

/* Segundo problema: Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con ese nombre.
48- Elimine "articulos", si existe*/
if object_id('articulos') is not null
drop table articulos

--2- Cree la tabla, con la siguiente estructura

create table articulos(
	codigo integer identity,
	nombre varchar(20),
	descripcion varchar(30),
	precio float
)

--3- Ingrese algunos registros

insert into articulos (nombre, descripcion, precio)
values ('impresora','Epson Stylus C45',400.80);
insert into articulos (nombre, descripcion, precio)
values ('impresora','Epson Stylus C85',500);

--4- Elimine todos los registros con "truncate table".

truncate table articulos

-- 5- Ingrese algunos registros y muéstrelos para ver que la secuencia de códigos se reinicia

insert into articulos (nombre, descripcion, precio)
values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio)
values ('teclado','ingles Biswal',100);
insert into articulos (nombre, descripcion, precio)
values ('teclado','español Biswal',90);

select * from articulos

--6- Elimine todos los registros con "delete".

delete from articulos

--7- Ingrese algunos registros y muéstrelos para ver que la secuencia de códigos continua

insert into articulos (nombre, descripcion, precio)
values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio)
values ('teclado','ingles Biswal',100);
insert into articulos (nombre, descripcion, precio)
values ('teclado','español Biswal',90);
select * from articulos;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* 43 - Tipo de dato (texto), primer problema:
Una concesionaria de autos vende autos usados y almacena los datos de los autos en una tabla llamada "autos".
1- Elimine la tabla "autos" si existe*/
if object_id('autos') is not null
drop table autos

/* 2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo, estableciendo el campo 
"patente" como clave primaria*/

create table autos(
patente char(6),
marca varchar(20),
modelo char(4),
precio float,
primary key (patente)
);

--3- Ingrese los siguientes registros

insert into autos
values('ACD123','Fiat 128','1970',15000);
insert into autos
values('ACG234','Renault 11','1990',40000);
insert into autos
values('BCD333','Peugeot 505','1990',80000);
insert into autos
values('GCD123','Renault Clio','1990',70000);
insert into autos
values('BCC333','Renault Megane','1998',95000);
insert into autos
values('BVF543','Fiat 128','1975',20000);

--4- Seleccione todos los autos del año 1990:
select * from autos
where modelo='1990'

/*Segundo problema:
Una empresa almacena los datos de sus clientes en una tabla llamada "clientes".
1- Elimine la tabla "clientes" si existe*/

if object_id('clientes') is not null
drop table clientes

--2- Créela eligiendo el tipo de dato más adecuado para cada campo

create table clientes
(
documento char(8),
apellido varchar(20),
nombre varchar(20),
domicilio varchar(30),
telefono varchar (11)
)

--4- Ingrese algunos registros:

insert into clientes
values('2233344','Perez','Juan','Sarmiento 980','4342345');
insert into clientes (documento,apellido,nombre,domicilio)
values('2333344','Perez','Ana','Colon 234');
insert into clientes
values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
insert into clientes
values('2533344','Juarez','Ana','Urquiza 444','4789900')

--5- Seleccione todos los clientes de apellido "Perez" (2 registros):

select * from clientes
where apellido='Perez'

/*44 - Tipo de dato (numérico)
1- Elimine la tabla "cuentas" si existe*/

if object_id('cuentas') is not null
drop table cuentas

-- Cree la tabla eligiendo el tipo de dato adecuado para almacenar los datos descriptos arriba:

create table cuentas(
	primary key (numero),
	numero int not null,
	documento char(8),
	nombre varchar(30),
	saldo money
)

--3- Ingrese los siguientes registros

insert into cuentas(numero,documento,nombre,saldo)
values('1234','25666777','Pedro Perez',500000.60);
insert into cuentas(numero,documento,nombre,saldo)
values('2234','27888999','Juan Lopez',-250000);
insert into cuentas(numero,documento,nombre,saldo)
values('3344','27888999','Juan Lopez',4000.50);
insert into cuentas(numero,documento,nombre,saldo)
values('3346','32111222','Susana Molina',1000)

--4- Seleccione todos los registros cuyo saldo sea mayor a "4000" (2 registros)

select * from cuentas
where saldo<4000

--5- Muestre el número de cuenta y saldo de todas las cuentas cuyo propietario sea "Juan Lopez" (2 registros)

select numero,saldo from cuentas
where nombre='Juan Lopez'

--6- Muestre las cuentas con saldo negativo (1 registro)

select saldo from cuentas
where saldo < 0

--7- Muestre todas las cuentas cuyo número es igual o mayor a "3000" (2 registros):
select * from cuentas
where numero>=3000

/*Segundo problema:
Una empresa almacena los datos de sus empleados en una tabla "empleados" que guarda los siguientes 
datos: nombre, documento, sexo, domicilio, sueldobasico.
45- Elimine la tabla, si existe*/

if object_id('empleados') is not null
drop table empleados

--2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:

create table empleados(
	nombre varchar(30),
	documento char(8),
	sexo char(1),
	domicilio varchar(30),
	sueldobasico decimal(7,2),
	cantidadhijos tinyint
)

--3- Ingrese algunos registros

insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
values ('Juan Perez','22333444','m','Sarmiento 123',500,2);
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
values ('Ana Acosta','24555666','f','Colon 134',850,0);
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
values ('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);

/*4- Ingrese un valor de "sueldobasico" con más decimales que los definidos (redondea los decimales al 
valor más cercano 800.89)*/

insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
values ('Susana Molina','29000555','f','Salta 876',800.888,3)

--5- Intente ingresar un sueldo que supere los 7 dígitos (no lo permite)
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
values ('Luis Ramiro','53628405','m','sanchez 7483',1000000,2)

--6- Muestre todos los empleados cuyo sueldo no supere los 900 pesos (1 registro)

select * from empleados
where sueldobasico >= 900

--7- Seleccione los nombres de los empleados que tengan hijos (3 registros)

select * from empleados
where cantidadhijos > 0

/*
4 - Tipo de dato (fecha y hora)
Primer problema:
Una facultad almacena los datos de sus alumnos en una tabla denominada "alumnos".
1- Elimine la tabla, si existe*/

if object_id('alumnos') is not null
drop table alumnos

--2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo
create table alumnos(
	apellido varchar(30),
	nombre varchar(30),
	documento char(8),
	domicilio varchar(30),
	fechaingreso datetime,
	fechanacimiento datetime
)

--3- Setee el formato para entrada de datos de tipo fecha para que acepte valores "día-mes-año"

set dateformat 'dmy'

--4- Ingrese un alumno empleando distintos separadores para las fechas

insert into alumnos values('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972')

--5- Ingrese otro alumno empleando solamente un dígito para día y mes y 2 para el año

insert into alumnos values('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972')

/*6- Ingrese un alumnos empleando 2 dígitos para el año de la fecha de ingreso y "null" en 
"fechanacimiento":*/

insert into alumnos values('Perez','Laura','26666666','Bulnes 345','03-03-91',null)

/*7- Intente ingresar un alumno con fecha de ingreso correspondiente a "15 de marzo de 1990" pero en 
orden incorrecto "03-15-90"*/

insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null)

--8- Muestre todos los alumnos que ingresaron antes del '1-1-91'. 1 registro

select * from alumnos 
where fechaingreso<'1-1-91'

--9- Muestre todos los alumnos que tienen "null" en "fechanacimiento":
select * from alumnos
where fechanacimiento is null

--10- Intente ingresar una fecha de ingreso omitiendo los separadores:

insert into alumnos values('Rosas','Romina','28888888','Avellaneda 487','03151990',null)

--11- Setee el formato de entrada de fechas para que acepte valores "mes-dia-año".

set dateformat 'mdy'

--12- Ingrese el registro del punto 7

insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*46 - Ingresar algunos campos (insert into)
Primer problema: Un banco tiene registrados las cuentas corrientes de sus clientes en una tabla llamada "cuentas".
1- Elimine la tabla "cuentas" si existe	*/

if object_id('cuentas') is not null
drop table cuentas

--2- Cree la tabla :
create table cuentas(
	numero int identity,
	documento char(8) not null,
	nombre varchar(30),
	saldo money
)

/*3- Ingrese un registro con valores para todos sus campos, inclusive el campo identity, omitiendo la 
lista de campos (error, no se debe ingresar para el campo identity)*/

insert into cuentas
values (1,'25666777','Juan Perez',2500.50);

/*4- Ingrese un registro con valores para todos sus campos omitiendo la lista de campos (excepto el 
campo "identity"):*/
insert into cuentas
values ('25666777','Juan Perez',2500.50)

--5- Ingrese un registro omitiendo algún campo que admitan valores nulo

insert into cuentas (documento,saldo)
values ('464829',-50032)

--6- Intente ingresar un registro con valor para el campo "numero" (error):

insert into cuentas (numero,documento,nombre,saldo)
values (5,'28999777','Luis Lopez',34000)

--7- Intente ingresar un registro listando 3 campos y colocando 4 valores (error)

insert into cuentas(documento, nombre, saldo)
values(832, '8393021', 'Jose Luis', 45000)

--8- Intente ingresar un registro sin valor para el campo "documento" (error)

insert into cuentas(nombre, saldo)
values('Luis Jose', 30000)

--9- Vea los registros ingresados:

select * from cuentas

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
47 - Valores por defecto (default)
Primer problema: Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos 
de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.
1- Elimine la tabla "visitantes", si existe*/

if object_id('visitantes') is not null
drop table visitantes

--2- Cree la tabla con la siguiente estructura

create table visitantes(
	nombre varchar(30),
	edad tinyint,
	sexo char(1) default 'f',
	domicilio varchar(30),
	ciudad varchar(20) default 'Cordoba',
	telefono varchar(11),
	mail varchar(30) default 'no tiene',
	montocompra decimal (6,2)
)

--4- Vea la información de las columnas "COLUMN_DEF" y "IS_NULLABLE":
exec sp_columns visitantes

/*5- Ingrese algunos registros sin especificar valores para algunos campos para ver cómo opera la 
cláusula "default"*/

insert into visitantes (nombre, domicilio, montocompra)
values ('Susana Molina','Colon 123',59.80);
insert into visitantes (nombre, edad, ciudad, mail)
values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');
select * from visitantes

--6- Use la palabra "default" para ingresar valores en un insert
insert into visitantes
values ('Antonio Garcia',44,default, 'Los mameyes 5643', default, default, 'antoniagracia@gmail,com', default)

--7- Ingrese un registro con "default values".

insert into visitantes default values

select * from visitantes

--48
/*Segundo problema:
Una pequeña biblioteca de barrio registra los préstamos de sus libros en una tabla llamada 
"prestamos". En ella almacena la siguiente información: título del libro, documento de identidad del 
socio a quien se le presta el libro, fecha de préstamo, fecha en que tiene que devolver el libro y 
si el libro ha sido o no devuelto.
1- Elimine la tabla "prestamos" si existe*/

if object_id('prestamos') is not null
drop table prestamos

--2- Cree la tabla:
create table prestamos(
	titulo varchar(40) not null,
	documento char(8) not null,
	fechaprestamo datetime not null,
	fechadevolucion datetime,
	devuelto char(1) default 'n'
)

--3- Ingrese algunos registros omitiendo el valor para los campos que lo admiten

insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion)
values ('Manual de 1 grado','23456789','2006-12-15','2006-12-18');
insert into prestamos (titulo,documento,fechaprestamo)
values ('Alicia en el pais de las maravillas','23456789','2006-12-16');
insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion)
values ('El aleph','22543987','2006-12-16','2006-08-19');
insert into prestamos (titulo,documento,fechaprestamo,devuelto)
values ('Manual de geografia 5 grado','25555666','2006-12-18','s')

--4- Seleccione todos los registros

select * from prestamos

--5- Ingrese un registro colocando "default" en los campos que lo admiten y vea cómo se almacenó.

insert into prestamos
values('Matematica Basica', 78431, '2022-2-17', default, default)

--6- Intente ingresar un registro con "default values" y analice el mensaje de error (no se puede)

insert into prestamos default values

/*En este caso si ejecuramos la linea 637, va a tirar error porque tenemos campos que contiene 
valores que no son nulo, y por ende aparece el error que no se puede insertar valores nulo*/

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*49 - Columnas calculadas (operadores aritméticos y de concatenación)
Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con 
ese nombre.
1- Elimine la tabla si existe */

if object_id ('articulos') is not null
drop table articulos

--2- Cree la tabla:
create table articulos(
	codigo int identity,
	nombre varchar(20),
	descripcion varchar(30),
	precio smallmoney,
	cantidad tinyint default 0,
	primary key (codigo)
)

--3- Ingrese algunos registros:

insert into articulos (nombre, descripcion, precio,cantidad)
values ('impresora','Epson Stylus C45',400.80,20);
insert into articulos (nombre, descripcion, precio)
values ('impresora','Epson Stylus C85',500);
insert into articulos (nombre, descripcion, precio)
values ('monitor','Samsung 14',800);
insert into articulos (nombre, descripcion, precio,cantidad)
values ('teclado','ingles Biswal',100,50)

/*4- El comercio quiere aumentar los precios de todos sus artículos en un 15%. Actualice todos los 
precios empleando operadores aritméticos.*/

update articulos set precio = precio + (precio * (15 / 100))

--5- Vea el resultado

select * from articulos

/*6- Muestre todos los artículos, concatenando el nombre y la descripción de cada uno de ellos 
separados por coma.*/

select nombre + ',' + descripcion from articulos

--7- Reste a la cantidad de todos los teclados, el valor 5, empleando el operador aritmético menos ("-")

update articulos set cantidad = cantidad - 5
where nombre = 'teclado'
select * from articulos

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*50 - Alias 
Primer problema: Trabaje con la tabla "libros" de una librería.
1- Elimine la tabla si existe */

if object_id ('libros') is not null
drop table libros

--2- Cree la tabla:
create table libros(
	codigo int identity,
	titulo varchar(40) not null,
	autor varchar(20) default 'Desconocido',
	editorial varchar(20),
	precio decimal(6,2),
	cantidad tinyint default 0,
	primary key (codigo)
)

--3- Ingrese algunos registros:

insert into libros (titulo,autor,editorial,precio)
values('El aleph','Borges','Emece',25);
insert into libros
values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50)

/*4- Muestre todos los campos de los libros y un campo extra, con el encabezado "monto total" en la 
que calcule el monto total en dinero de cada libro (precio por cantidad)*/

select titulo, autor, editorial, precio, cantidad,
precio * cantidad as 'Monto total' from libros


/*5- Muestre el título, autor y precio de todos los libros de editorial "Emece" y agregue dos columnas 
extra en las cuales muestre el descuento de cada libro, con el encabezado "descuento" y el precio 
con un 10% de descuento con el encabezado "precio final". */

select titulo, autor, precio, precio*0.1 as descuento,
precio-(precio*0.1) as 'precio final'
from libros
where editorial='Emece';

--6- Muestre una columna con el título y el autor concatenados con el encabezado "Título y autor"

select titulo + ' - ' +autor as "Título y autor"
from libros;

select * from libros

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*51 - Funciones para el uso de fechas y horas
Primer problema: Una empresa almacena los datos de sus empleados en una tabla denominada "empleados".
1- Elimine la tabla si existe*/

if object_id ('empleados') is not null
drop table empleados 

--2- Cree la tabla
create table empleados (
	nombre varchar(30) not null,
	apellido varchar(20) not null,
	documento char(8),
	fechanacimiento datetime,
	fechaingreso datetime,
	sueldo decimal(6,2),
	primary key(documento)
)

--3- Ingrese algunos registros:

insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309);
insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68);
insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25);
insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98)

/*4- Muestre nombre y apellido concatenados, con el apellido en letras mayúsculas, el documento 
precedido por "DNI Nº " y el sueldo precedido por "$ ".	*/

select nombre+space(1)+upper(apellido) as nombre,
stuff(documento,1,0,'DNI Nº ') as documento,
stuff(sueldo,1,0,'$ ') as sueldo from empleados

--5.  Muestre el documento y el sueldo redondeado hacia arriba y precedido por "$ ".

select documento, stuff(ceiling(sueldo),1,0,'$ ')	as 'Saldo Redondeado'
	from empleados

/* 6.  Muestre los nombres y apellidos de los empleados que cumplen años en el mes "october" (3 
registros)	*/

select nombre, apellido from empleados
where DATENAME(month, fechanacimiento) = 'october'

/*- Muestre los nombres y apellidos de los empleados que ingresaron en un determinado año (2 registros).	*/

select nombre, apellido 
from empleados
	where DATEPART(year, fechaingreso) = 1998

--1- Elimine la tabla "visitas", si existe:
if object_id('visitas') is not null
drop table visitas;

--2- Créela con la siguiente estructura:
create table visitas (
	numero int identity,
	nombre varchar(30) default 'Anonimo',
	mail varchar(50),
	pais varchar (20),
	fecha datetime,
	primary key(numero)
)

--3- Ingrese algunos registros:
insert into visitas (nombre,mail,pais,fecha)
values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10');
insert into visitas (nombre,mail,pais,fecha)
values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30');
insert into visitas (nombre,mail,pais,fecha)
values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45');
insert into visitas (nombre,mail,pais,fecha)
values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15');
insert into visitas (nombre,mail,pais,fecha)
values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45');
insert into visitas (nombre,mail,pais,fecha)
values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20');
insert into visitas (nombre,mail,pais,fecha)
values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

--4- Ordene los registros por fecha, en orden descendente.
select * from visitas
order by fecha desc;
/*5- Muestre el nombre del usuario, pais y el nombre del mes, ordenado por pais (ascendente) y nombre 
del mes (descendente)*/
select nombre,pais,datename(month,fecha)
from visitas
order by pais,datename(month,fecha) desc;

/*6- Muestre el pais, el mes, el día y la hora y ordene las visitas por nombre del mes, del día y la hora.*/

select nombre,mail,
datename(month,fecha) mes,
datename(day,fecha) dia,
datename(hour,fecha) hora
from visitas
order by 3,4,5;

/*7- Muestre los mail, país, ordenado por país, de todos los que visitaron la página en octubre (4 
registros)*/
select mail, pais
from visitas
where datename(month,fecha)='October'
order by 2;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--54
--Trabaje con la tabla llamada "medicamentos" de una farmacia.

--1- Elimine la tabla, si existe:

if object_id('medicamentos') is not null
drop table medicamentos;

--2- Cree la tabla con la siguiente estructura:
create table medicamentos(
	codigo int identity,
	nombre varchar(20),
	laboratorio varchar(20),
	precio decimal(5,2),
	cantidad tinyint,
	primary key(codigo)
)

--3- Ingrese algunos registros:
insert into medicamentos
values('Sertal','Roche',5.2,100);
insert into medicamentos
values('Buscapina','Roche',4.10,200);
insert into medicamentos
values('Amoxidal 500','Bayer',15.60,100);
insert into medicamentos
values('Paracetamol 500','Bago',1.90,200);
insert into medicamentos
values('Bayaspirina','Bayer',2.10,150); 
insert into medicamentos
values('Amoxidal jarabe','Bayer',5.10,250); 

/*4- Recupere los códigos y nombres de los medicamentos cuyo laboratorio sea 'Roche' y cuyo precio sea menor a 5 (1 registro cumple con ambas condiciones)*/

select codigo,nombre
from medicamentos
where laboratorio='Roche' and (precio<5);

--5- Recupere los medicamentos cuyo laboratorio sea 'Roche' o cuyo precio sea menor a 5 (4 registros):
select * from medicamentos
where laboratorio='Roche' or precio < 5;

/*6- Muestre todos los medicamentos cuyo laboratorio NO sea "Bayer" y cuya cantidad sea=100 (1 
registro)*/

select * from medicamentos
where not laboratorio='Bayer' and
cantidad=100;

--7- Muestre todos los medicamentos cuyo laboratorio sea "Bayer" y cuya cantidad NO sea=100 (2 registros):
select * from medicamentos
where laboratorio='Bayer' and
not cantidad=100;

/*Analice estas 2 últimas sentencias. El operador "not" afecta a la condición a la cual antecede, no a 
las siguientes. Los resultados de los puntos 6 y 7 son diferentes.
*/

/*8- Elimine todos los registros cuyo laboratorio sea igual a "Bayer" y su precio sea mayor a 10 (1 
registro eliminado)*/
delete from medicamentos
where laboratorio='Bayer' and
precio>10;


/*9- Cambie la cantidad por 200, a todos los medicamentos de "Roche" cuyo precio sea mayor a 5 (1 registro afectado)*/
update medicamentos set cantidad=200
where laboratorio='Roche' and
(precio>5);

/*10- Borre los medicamentos cuyo laboratorio sea "Bayer" o cuyo precio sea menor a 3 (3 registros borrados)*/

delete from medicamentos
where laboratorio='Bayer' or
precio<3;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--55
/*Trabajamos con la tabla "peliculas" de un video club que alquila películas en video.
1- Elimine la tabla, si existe;*/
 
if object_id('peliculas') is not null
drop table peliculas;

--2- Créela con la siguiente estructura:
create table peliculas(
	codigo int identity,
	titulo varchar(40) not null,
	actor varchar(20),
	duracion tinyint,
	primary key (codigo)
)

--3- Ingrese algunos registros:
insert into peliculas
values('Mision imposible','Tom Cruise',120);
insert into peliculas
values('Harry Potter y la piedra filosofal','Daniel R.',180);
insert into peliculas
values('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas
values('Mision imposible 2','Tom Cruise',120);
insert into peliculas
values('Mujer bonita','Richard Gere',120);
insert into peliculas
values('Tootsie','D. Hoffman',90);
insert into peliculas
values('Un oso rojo','Julio Chavez',100);
insert into peliculas
values('Elsa y Fred','China Zorrilla',110);

--4- Recupere los registros cuyo actor sea "Tom Cruise" or "Richard Gere" (3 registros)

select * from peliculas
where actor='Tom Cruise' or
actor='Richard Gere';


/*5- Recupere los registros cuyo actor sea "Tom Cruise" y duración menor a 100 (ninguno cumple ambas 
condiciones)*/

select * from peliculas
where actor='Tom Cruise' and
duracion<100;

/*6- Cambie la duración a 200, de las películas cuyo actor sea "Daniel R." y cuya duración sea 180 (1 
registro afectado)*/

update peliculas set duracion=200
where actor='Jose A.' and
duracion=180;

/*7- Borre todas las películas donde el actor NO sea "Tom Cruise" y cuya duración sea mayor o igual a 
100 (2 registros eliminados)*/

delete from peliculas
where not actor='Tom Cruise' and
duracion<=100;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--57
/*Trabaje con la tabla llamada "medicamentos" de una farmacia.
1- Elimine la tabla, si existe:*/
if object_id('medicamentos') is not null
drop table medicamentos;

--2- Cree la tabla con la siguiente estructura:
create table medicamentos(
	codigo int identity,
	nombre varchar(20),
	laboratorio varchar(20),
	precio decimal(5,2),
	cantidad tinyint,
	primary key(codigo)
)

--3- Ingrese algunos registros:
insert into medicamentos
values('Sertal','Roche',5.2,100);
insert into medicamentos
values('Buscapina','Roche',4.10,200);
insert into medicamentos
values('Amoxidal 500','Bayer',15.60,100);
insert into medicamentos
values('Paracetamol 500','Bago',1.90,200);
insert into medicamentos
values('Bayaspirina','Bayer',2.10,150); 
insert into medicamentos
values('Amoxidal jarabe','Bayer',5.10,250); 

/*4- Recupere los códigos y nombres de los medicamentos cuyo laboratorio sea 'Roche' y cuyo precio sea 
menor a 5 (1 registro cumple con ambas condiciones)*/
select codigo,nombre
from medicamentos
where laboratorio='Roche' and precio < 5;

--5- Recupere los medicamentos cuyo laboratorio sea 'Roche' o cuyo precio sea menor a 5 (4 registros):
select * from medicamentos
where laboratorio='Roche' or precio < 5;

-- 6- Muestre todos los medicamentos cuyo laboratorio NO sea "Bayer" y cuya cantidad sea=100 (1 registro)
select * from medicamentos
where not laboratorio='Bayer' and cantidad = 100;

--7- Muestre todos los medicamentos cuyo laboratorio sea "Bayer" y cuya cantidad NO sea=100 (2 registros):
select * from medicamentos
where laboratorio='Bayer' and
not cantidad=100;

/*8- Elimine todos los registros cuyo laboratorio sea igual a "Bayer" y su precio sea mayor a 10 (1 
registro eliminado)*/

delete from medicamentos
where laboratorio='Bayer' and precio > 10;

--9- Cambie la cantidad por 200, a todos los medicamentos de "Roche" cuyo precio sea mayor a 5 (1 registro afectado)

update medicamentos set cantidad = 200
where laboratorio='Roche' and precio>5;
--10- Borre los medicamentos cuyo laboratorio sea "Bayer" o cuyo precio sea menor a 3 (3 registros borrados)

delete from medicamentos
where laboratorio='Bayer' or precio < 3;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--60

--Trabajamos con la tabla "peliculas" de un video club que alquila películas en video.

--1- Elimine la tabla, si existe;
if object_id('peliculas') is not null
drop table peliculas;

--2- Créela con la siguiente estructura:
create table peliculas(
	codigo int identity,
	titulo varchar(40) not null,
	actor varchar(20),
	duracion tinyint,
	primary key (codigo)
)

--3- Ingrese algunos registros:
insert into peliculas
values('Mision imposible','Tom Cruise',120);
insert into peliculas
values('Harry Potter y la piedra filosofal','Daniel R.',180);
insert into peliculas
values('Harry Potter y la camara secreta','Daniel R.',190);
insert into peliculas
values('Mision imposible 2','Tom Cruise',120);
insert into peliculas
values('Mujer bonita','Richard Gere',120);
insert into peliculas
values('Tootsie','D. Hoffman',90);
insert into peliculas
values('Un oso rojo','Julio Chavez',100);
insert into peliculas
values('Elsa y Fred','China Zorrilla',110);

--4- Recupere los registros cuyo actor sea "Tom Cruise" or "Richard Gere" (3 registros)
select * from peliculas
where actor='Tom Cruise' or actor='Richard Gere';

/*5- Recupere los registros cuyo actor sea "Tom Cruise" y duración menor a 100 (ninguno cumple ambas 
condiciones)*/

select * from peliculas where actor='Tom Cruise' and duracion<100;

--6- Cambie la duración a 200, de las películas cuyo actor sea "Daniel R." y cuya duración sea 180 (1 registro afectado)
update peliculas set duracion=200
where actor='Jose A.' and duracion=180;

/*7- Borre todas las películas donde el actor NO sea "Tom Cruise" y cuya duración sea mayor o igual a 
100 (2 registros eliminados)*/

delete from peliculas
where not actor='Tom Cruise' and duracion<=100;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------


