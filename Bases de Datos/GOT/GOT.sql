create database GOT
use GOT
create table Reino
(
	Nombre nvarchar(50) primary key, 
	CantidadDeHabitantes int not null,
	PosicionGeografica int not null
)

create table Ciudad
(
	IDCiudad int identity(1,1) primary key,
	NombreCiudad nvarchar(50) not null,
	NombreReino nvarchar(50) not null,
	foreign key (NombreReino) references Reino(Nombre)
)

create table Casa
(
	Nombre nvarchar(50) primary key,
	Lema nvarchar(200) not null, 
	Descripcion nvarchar(200) not null, 
	Religion nvarchar(100) null, 
	FechaFundacion datetime null, 
	NombreReino nvarchar(50) not null, 
	foreign key(NombreReino) references Reino(nombre)
)

create table Guerra
(
	IDGuerra int identity(1,1) primary key,
	Anio int not null,
	Lugar nvarchar(100) not null,
	CantidadMuertes int not null
)

create table CasaGuerra
(
	NombreCasa nvarchar(50) not null,
	IDGuerra int,
	foreign key (NombreCasa) references Casa(Nombre),
	foreign key (IDGuerra) references Guerra(IDGuerra),
)

create table Personaje
(
	IDPersonaje int identity(1,1) primary key,
	Nombre nvarchar(100) not null,
	FechaNacimiento datetime null,
	EsBastardo bit not null default 0,
	Estatus nvarchar(50) not null,
	IDPadre int null,
	IDMadre int null,
	foreign key (IDPadre) references Personaje(IDPersonaje),
	foreign key (IDMadre) references Personaje(IDPersonaje),
)

alter table Personaje add NombreCasa nvarchar(50)

alter table Personaje add foreign key (NombreCasa) references Casa(Nombre)

insert into Reino
(Nombre,CantidadDeHabitantes,PosicionGeografica)
values
('The North',5000,5000)

insert into Casa
(Nombre,Lema,Descripcion,Religion,FechaFundacion,NombreReino)
values
('Stark','Winter is Coming','',null,null,'The North')

insert into Personaje
(Nombre,FechaNacimiento,EsBastardo,Estatus,IDPadre,IDMadre,NombreCasa)
values
('Rickard Stark',null,0,'Desconocido',null,null,'Stark'),
('Liana Stark',null,0,'Desconocido',null,null,'Stark')

insert into Personaje
(Nombre,FechaNacimiento,EsBastardo,Estatus,IDPadre,IDMadre,NombreCasa)
values
('Ned Stark',null,0,'Muerto',1,2,'Stark'),
('Brandon Stark',null,0,'Muerto',1,2,'Stark'),
('Benjen Stark',null,0,'Muerto',1,2,'Stark'),
('Lyanna Stark',null,0,'Muerto',1,2,'Stark')

select p1.Nombre, p2.Nombre Padre from Personaje p1, Personaje p2
where p1.IDPadre = p2.IDPersonaje

select * from Personaje

insert into Reino
(Nombre,CantidadDeHabitantes,PosicionGeografica)
values
('The Reach',10000,10000)

insert into Casa
(Nombre,Lema,Descripcion,Religion,FechaFundacion,NombreReino)
values
('Targaryen','Fire and Blood','',null,null,'The Reach')

insert into Personaje
(Nombre,FechaNacimiento,EsBastardo,Estatus,IDPadre,IDMadre,NombreCasa)
values
('Rhaegar Targaryen',null,0,'Muerto',null,null,'Targaryen')

insert into Personaje
(Nombre,FechaNacimiento,EsBastardo,Estatus,IDPadre,IDMadre,NombreCasa)
values
('Jon Snow',null,1,'Vivo',7,6,'Stark')

insert into Personaje
(Nombre,FechaNacimiento,EsBastardo,Estatus,IDPadre,IDMadre,NombreCasa)
values
('Catelyn Stark',null,0,'Muerto',null,null,'Stark')

insert into Personaje
(Nombre,FechaNacimiento,EsBastardo,Estatus,IDPadre,IDMadre,NombreCasa)
values
('Rob Stark',null,0,'Muerto',3,9,'Stark'),
('Sansa Stark',null,0,'Vivo',3,9,'Stark'),
('Arya Stark',null,0,'Vivo',3,9,'Stark'),
('Bran Stark',null,0,'Vivo',3,9,'Stark'),
('Rickon Stark',null,0,'Muerto',3,9,'Stark')