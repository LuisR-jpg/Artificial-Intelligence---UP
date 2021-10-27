/*
LENGUAJE DE MANIPULACION DE DATOS
*/

--insert into ciudad(nombreciudad, nombreestado, cantidadhabitantes, superficie)
--values
--(
--	'Aguascalientes', 'Aguascalientes', 11235, 15.32
--)
--insert into ciudad
--values
--	('Calvillo', 'Aguascalientes', 5813, 15.32),
--	('Asientos', 'Aguascalientes', 5813, 15.33),
--	('Jesus Maria', 'Aguascalientes', 5813, 15.34)

--insert into propietario(ine, calle, numero, codigopostal, nombre)
--values 
--('VEMM8234824', '', '', '', '')

--Borra registros de la tabla
--delete propietario

--Borra registros si no hay restricciones
--truncate propietario

--Borra toda la tabla
--drop propietario

--Cambia tipo de atributo
--alter table propietario alter column codigopostal nvarchar(5)

--insert into farmacia
--values
----('Farmacia San José', 'Av Aguascalientes', '15-A', '20217', 'VEMM8234824', 1)
--('Farmacia SIMI', 'Calle Madero', '23-B', '20926', 'VEMM8234824', 1)

--insert into medicamento(idmedicamento, nombrecomercial, quimicos)
--values 
--(1, 'Ulsen', 'q1, q2, q3'),
--(101, 'Paracetamol 100 mg', 'q1, q4')

--insert into farmaciamedicamento(idmedicamento, idfarmacia, precio)
--values
--(1, 4, 40),
--(101, 5, 50)

----Trae todas las columnas de la tabla farmacia
--select * from farmacia

----Actualiza a la farmacia que tiene ID en la tabla farmacia, modificó nombre y codigo postal
--update farmacia set nombre = 'Guadalajara', codigopostal = 12345 where idfarmacia = 4 
----Si no usa where, se actualizan esos campos de todos los registros
--update farmacia set nombre = 'Guadalajara', codigopostal = 12345 

/*Probar primero con select antes de delete*/ 
----Borra todos los registros, si no tienen alguna referencia
--delete farmacia
----Borra esos registros, si no han sido referenciads
--delete farmacia where idfarmacia = 1