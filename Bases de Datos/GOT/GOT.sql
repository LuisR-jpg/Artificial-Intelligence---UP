--create database GOT
use GOT
create table reino
(
	Nombre nvarchar(50) primary key,
	CantidadHabitantes int not null, 
	PosicionGeografica int not null
)
create table Ciudad
(
	IDCiudad int identity(1, 1) primary key,
	NombreCiudad nvarchar(50) not null, 
	NombreReino nvarchar(50) not null, 
	foreign key(NombreReino) references reino(Nombre)
)
create table Casa
(
	nombre nvarchar(50) primary key,
	lema nvarchar(200) not null, 
	descripcion nvarchar(200) not null, 
	religion nvarchar(100) null, 
	fechafundacion datetime null, 
	nombrereino nvarchar(50) not null, 
	foreign key(NombreReino) references reino(nombre)
)
create table Guerra
(
	idguerra int identity(1, 1) primary key, 
	anio int not null, 
	lugar nvarchar(100) not null, 
	cantidaddemuertes int not null
)
