create database Aseguradora
use Aseguradora
create table Persona
(
	INE nvarchar(100) primary key not null, 
	Nombre nvarchar(50) not null, 
	Apellidos nvarchar(50) not null, 
	Direccino nvarchar(100), 
	Poblacion int, 
	Telefono nvarchar(10)
)
create table Accidente
(
	Referencia int identity(1, 1) primary key not null, 
	Hora nvarchar(4) not null, 
	Fecha date not null, 
	Lugar nvarchar(50) not null, 

)
create table Deducible
(
	Referencia int identity(1, 1) primary key not null, 
	Fecha date not null, 
	Lugar nvarchar(50) not null, 
	Monto float not null, 
	Hora nvarchar(4),
	VehiculoID nvarchar(10) not null,
	foreign key (VehiculoID) references Vehiculo(Matricula) 
)
create table Vehiculo
(
	Matricula nvarchar(10) primary key not null, 
	Marca nvarchar(20) not null, 
	Modelo nvarchar(20) not null,
	PersonaID nvarchar(100) not null
	foreign key (PersonaID) references Persona(INE)
)
create table VehiculoAccidente
(
	VehiculoID nvarchar(10) not null,
	AccidenteID int not null,
	foreign key (VehiculoID) references Vehiculo(Matricula), 
	foreign key (AccidenteID) references Accidente(Referencia)
)