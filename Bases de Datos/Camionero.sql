--create database Camionero2021

--use Camionero2021 --Debe cambiar en la ventanita arriba a la izquierda (Camionero2021)

--create table Ciudad
--(
--	Codigo int identity(1, 1) primary key not null, --Identity: Donde comienza, incremento
--	Nombre nvarchar(100) not null
--)

--create table Camionero
--(
--	INE nvarchar(50) primary key not null, 
--	Nombre nvarchar(100) not null, 
--	Telefono nvarchar(10) null, --null se puede omitir
--	Salario money not null default 0,
--	CodigoCiudad int not null
--	foreign key (CodigoCiudad) references Ciudad(Codigo)
--)

--Create table Paquete
--(
--	Codigo int identity(1,1) primary key not null,
--	Descripcion nvarchar(100) not null,
--	Destinatario nvarchar(100) not null,
--	CodigoCiudad int not null,
--	INECamionero nvarchar(50) not null,
--	foreign key (CodigoCiudad) references Ciudad(Codigo),
--	foreign key (INECamionero) references Camionero(INE)
--)

/*
Modificar tabla paquete
alter table Paquete add Direccion nvarchar(100) not null
Cambiar el nombre 
exec sp_rename 'Ciudad', 'Ciudad2021' --También modifica las referencias (como llaves foráneas)
*/

--create table Camion
--(
--	Matricula nvarchar(20) primary key,
--	Potencia float not null,
--	Modelo nvarchar(20) not null,
--	Tipo nvarchar(25) not null
--)

--create table CamionerCamion
--(
--	MatriculaCamion nvarchar(20) not null,
--	IneCamionero nvarchar(50) not null,
--	foreign key (MatriculaCamion) references Camion(Matricula),
--	foreign key (IneCamionero) references Camionero(Ine)
--)

--exec sp_rename 'CamionerCamion','CamioneroCamion'
