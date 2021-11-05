--create database SiVale
--use SiVale
--create table Abono
--(
--	idCredito int not null,
--	monto float not null
--	foreign key(idCredito) references Credito(folio)
--)
--create table Credito
--(
--	folio int identity(1, 1) primary key,
--	tipo nvarchar(20) not null,
--	nSemanas int not null,
--	monto float not null,
--	fEntrega date,
--	estado nvarchar(20) not null
--)
--create table Persona 
--(
--	idPersona int identity(1, 1) primary key,
--	nombre nvarchar(30) not null,
--	apellido nvarchar(30) not null,
--	curp nvarchar(50),
--	fNacimiento date,
--	telefono nvarchar(10),
--	direccion nvarchar(200),
--	telTrabajo nvarchar(10),
--	dirTrabajo nvarchar(200)
--)
--create table ClienteCredito
--(
--	folioCredito int not null,
--	idCliente int not null,
--	foreign key(folioCredito) references Credito(folio),
--	foreign key(idCliente) references Persona(idPersona)
--)
--create table CreditoAval
--(
--	folioCredito int not null,
--	idAval int not null,
--	foreign key(folioCredito) references Credito(folio),
--	foreign key(idAval) references Persona(idPersona)
--)

---- a.	(2.5%) Crédito Personal 14 semanas 5000 A nombre de José Velarde (Abono 357.14).
--insert into Credito (tipo, nSemanas, monto, estado) values ('Efectivo', 14, 5000, 'Activo')
--insert into Persona (nombre, apellido) values ('Jose', 'Velarde')
--insert into ClienteCredito (folioCredito, idCliente) values (1, 1)
--insert into Abono values (1, 357.14)
---- b.	(2.5%) Crédito Personal 28 semanas 10,000 A nombre de José Velarde, aval Sergio Velarde (Abono 357.14).
--insert into Credito (tipo, nSemanas, monto, estado) values ('Efectivo', 28, 10000, 'Activo')
--insert into Persona (nombre, apellido) values ('Sergio', 'Velarde')
--insert into ClienteCredito (folioCredito, idCliente) values (2, 1)
--insert into CreditoAval (folioCredito, idAval) values (2, 2)
--insert into Abono values (2, 357.14)
---- c.	(2.5%) Crédito Personal 36 semanas 15,000 A nombre de José Velarde, aval Sergio Velarde, Maribel Velarde (Abono 416.66).
--insert into Credito (tipo, nSemanas, monto, estado) values ('Efectivo', 36, 15000, 'Activo')
--insert into ClienteCredito (folioCredito, idCliente) values (3, 1)
--insert into Persona (nombre, apellido) values ('Maribel', 'Velarde')
--insert into CreditoAval (folioCredito, idAval) values (3, 2)
--insert into CreditoAval (folioCredito, idAval) values (3, 3)
--insert into Abono values (3, 416.66)
---- d.	(2.5%) Cambiar el estatus a cancelado del crédito personal de 14 semanas del cliente José Velarde.
--update Credito set estado = 'Cancelado' where nSemanas = 14
---- e.	(5%) Insertar 3 Créditos Personales a 14 semanas por 5000 a nombre de nuevos clientes (Abono 357.14).
--insert into Persona (nombre, apellido) values ('Luis', 'Robles'), ('Gabriela', 'Jimenez'), ('Karla', 'Robles')
--update Persona set 
--	curp = 'CURPLuis', 
--	telefono = '4499906619',
--	direccion = 'SuCasa',
--	telTrabajo = '4499906619',
--	dirTrabajo = 'SuTrabajo' 
--	where idPersona = 4
--update Persona set 
--	curp = 'CURPGaby', 
--	telefono = '4493641234',
--	direccion = 'SuCasa',
--	telTrabajo = '1234567890',
--	dirTrabajo = 'SuTrabajo' 
--	where idPersona = 5
--update Persona set 
--	curp = 'CURPKarla', 
--	telefono = '0123456789',
--	direccion = 'SuCasa'
--	where idPersona = 6
--insert into Credito (tipo, nSemanas, monto, estado) 
--values ('Efectivo', 14, 5000, 'Activo'), ('Efectivo', 14, 5000, 'Activo'), ('Efectivo', 14, 5000, 'Activo')
--insert into ClienteCredito (folioCredito, idCliente) values (4, 4)
--insert into ClienteCredito (folioCredito, idCliente) values (5, 5)
--insert into ClienteCredito (folioCredito, idCliente) values (6, 6)
--insert into Abono values (4, 357.14), (5, 357.14), (5, 357.14)
---- f.	(5%) Insertar 2 Créditos Personales por 10000 a 28 semanas a nombre de nuevos clientes y nuevos avales (Abono 357.14).	
--insert into Credito (tipo, nSemanas, monto, estado) 
--values ('Efectivo', 28, 10000, 'Activo'), ('Efectivo', 28, 10000, 'Activo')
--insert into ClienteCredito (folioCredito, idCliente) values (7, 4), (8, 5)
--insert into CreditoAval (folioCredito, idAval) values (7, 6), (8, 6)
--insert into Abono values (7, 357.14), (8, 357.14)
-- g.	(5%) Insertar 3 Créditos de Línea Blanca a 14 semanas por 5000 a nombre de nuevos clientes (Abono 357.14).
--insert into Credito (tipo, nSemanas, monto, estado) 
--values ('LineaBlanca', 14, 5000, 'Activo'), ('LineaBlanca', 14, 5000, 'Activo'), ('LineaBlanca', 14, 5000, 'Activo')
--insert into ClienteCredito (folioCredito, idCliente) values (9, 4), (10, 5), (11, 6)
--insert into Abono values (9, 357.14), (10, 357.14), (11, 357.14)
-- h.	(5%) Insertar 2 Créditos Línea Blanca por 30000 a 14 semanas a nombre de nuevos clientes y nuevos avales (cabe mencionar que se requieren 2 avales en estos préstamos) (Abono 2142.85).
--insert into Credito (tipo, nSemanas, monto, estado) 
--values ('LineaBlanca', 14, 30000, 'Activo'), ('LineaBlanca', 14, 30000, 'Activo')
--insert into Persona(nombre, apellido, telefono) values ('Sara', 'Gomez', '4441234567')
--insert into ClienteCredito (folioCredito, idCliente) values (12, 4), (13, 5)
--insert into CreditoAval (folioCredito, idAval) values (12, 6), (12, 7), (13, 6), (13, 7)
--insert into Abono values (12, 2142.85), (13, 2142.85)

-- c.	(10%) Generar un listado que incluya el folio del crédito, monto del crédito, nombre completo del cliente y nombre completo del aval de los créditos activos.
--select c.folio Folio, c.monto Monto, p.nombre + ' ' + p.apellido NombreCliente, a.nombre + ' ' + a.apellido NombreAval from ClienteCredito cc
--join Credito c on c.folio = cc.folioCredito
--join Persona p on p.idPersona = cc.idCliente
--join CreditoAval ca on cc.folioCredito = ca.folioCredito
--join Persona a on ca.idAval = a.idPersona
--where c.estado = 'Activo'
select c.folio Folio, c.monto Monto, p.nombre + ' ' + p.apellido NombreCliente, 
(
	select top 1 a.nombre + ' ' + a.apellido
	from CreditoAval ca, Persona a 
	where ca.idAval = a.idPersona and ca.folioCredito = c.folio
) AvalUno,
(
	select a.nombre + ' ' + a.apellido
	from CreditoAval ca, Persona a
	where ca.idAval = a.idPersona and ca.folioCredito = c.folio and a.nombre <> 
	(
		select top 1 a.nombre
		from CreditoAval ca, Persona a
		where ca.idAval = a.idPersona and ca.folioCredito = c.folio
	) 
) AvalDos
from Credito c
join ClienteCredito cc on cc.folioCredito = c.folio
join Persona p on p.idPersona = cc.idCliente



---- d.	(10%) Generar un listado que incluya el id del cliente, el nombre del cliente y total de créditos que ha tenido dentro de la empresa.
--select p.idPersona ClienteID, p.nombre + ' ' + p.apellido Nombre, count(1) Creditos from Persona p
--join ClienteCredito cc on cc.idCliente = p.idPersona
--group by p.idPersona, p.nombre, p.apellido
---- e.	(10%) Generar un listado que contenga los avales y el total de créditos avalados, el reporte mostrara el id del aval, el nombre del aval y total de créditos avalados.
--select p.idPersona AvalID, p.nombre + ' ' + p.apellido Nombre, count(1) totalCreditos from Persona p
--join CreditoAval ca on ca.idAval = p.idPersona
--group by p.idPersona, p.nombre, p.apellido
---- f.	(10%) Generar el total prestado para los créditos de tipo línea blanca y créditos personales, agrupados por tipo de crédito y numero de semanas y que actualmente se encuentran activos.
--select c.tipo TipoPrestamo, c.nSemanas, c.estado Estado, sum(c.monto) Cantidad
--from Credito c
--where c.estado = 'Activo'
--group by c.tipo, c.nSemanas, c.estado
--order by c.tipo, c.nSemanas
