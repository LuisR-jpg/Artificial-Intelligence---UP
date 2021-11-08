--Ejercicio 1
create database Hospital
use Hospital
create table Doctor
(
	Codigo int identity(1, 1) primary key not null, 
	Nombre nvarchar(100) not null,
	Apellido nvarchar(100) not null, 
	Telefono nvarchar(10), 
	Especialidad nvarchar(50)
)
create table Paciente
(
	Codigo int identity(1, 1) primary key not null, 
	Nombre nvarchar(100) not null, 
	Apellido nvarchar(100) not null, 
	Direccion nvarchar(300) not null, 
	Ciudad nvarchar(50), 
	Estado nvarchar(50),
	FechaNacimiento date not null, 
	CodigoPosta nvarchar(5) not null, 
	Telefono nvarchar(10)
)
create table Ingresos
(
	Codigo int identity(1, 1) primary key not null, 
	Cama int,
	Habitacion int,
	FechaIngreso date not null, 
	FechaAlta date not null,
	AtiendeID int not null, 
	PacienteID int not null, 
	foreign key (PacienteID) references Paciente(Codigo),
	foreign key (AtiendeID) references Doctor(Codigo)
)

