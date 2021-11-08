--create database farmacia2021

--use farmacia2021

--create table ciudad
--(
--	id_ciudad int identity(1,1) primary key,
--	nombreciudad nvarchar(50) not null,
--	nombreestado nvarchar(50) not null,
--	cantidadhabitantes int not null,
--	superficie float
--)

--create table propietario
--(
-- Ine nvarchar(50) primary key,
-- nombre nvarchar(100) not null,
-- calle nvarchar(100) not null,
-- numero nvarchar(100) not null,
-- codigopostal nvarchar(5) not null
--)

-- create table farmacia
-- (
--  idfarmacia int identity(1,1) primary key,
--  nombre nvarchar(100),
--  calle nvarchar(100) not null,
--  numero nvarchar(100) not null,
--  codigopostal nvarchar(5) not null,
--  INEPropietario nvarchar(50) not null,
--  IdCiudad int not null,
--  foreign key (INEPropietario) references propietario(INE),
--  foreign key (idciudad) references ciudad(id_ciudad)
-- )
-- 
-- create table medicamento
-- (
-- 	idmedicamento int primary key,
-- 	nombrecomercial nvarchar(50) not null,
-- 	quimicos nvarchar(max) not null
-- )
-- 
-- create table farmaciamedicamento
-- (
--  idmedicamento int not null,
--  idfarmacia int not null,
--  precio money not null default 0,
--  foreign key (idmedicamento) references medicamento(idmedicamento),
--  foreign key (idfarmacia) references farmacia(idfarmacia)
-- )



