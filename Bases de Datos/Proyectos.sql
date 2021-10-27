create database Proyectos
use Proyectos
create table Cliente
(
	Codigo int identity(1, 1) primary key not null,
	Telefono nvarchar(10), 
	Domicilio nvarchar(300) not null, 
	RFC nvarchar(50) not null
)
create table TipoPago
(
	Codigo int identity(1, 1) primary key not null, 
	Descripcion nvarchar(300)
)
create table Proyecto
(
	Codigo int identity(1, 1) primary key not null, 
	Descripcion nvarchar(300), 
	Costo float not null, 
	FechaInicio date not null, 
	FechaFinal date not null,
	ClienteID int not null, 
	foreign key (ClienteID) references Cliente(Codigo)
)
create table Pago 
(
	Numero int identity(1, 1) primary key not null, 
	Concepto nvarchar(100) not null, 
	Cantidad int not null, 
	Fecha date, 
	TipoPagoID int not null, 
	foreign key (TipoPagoID) references TipoPago(Codigo)
)
create table Colaborador
(
	INE nvarchar(200) primary key not null, 
	Nombre nvarchar(50) not null,
	Domicilio nvarchar(100), 
	Telefono nvarchar(10), 
	Banco nvarchar(50) not null, 
	NumerodeCuenta nvarchar(100) not null
)
create table ProyectoColaborador
(
	ProyectoID int not null, 
	ColaboradorID nvarchar(200) not null, 
	foreign key (ProyectoID) references Proyecto(Codigo),
	foreign key (ColaboradorID) references Colaborador(INE)
)
create table PagoColaborador
(
	PagoID int not null, 
	ColaboradorID nvarchar(200) not null, 
	foreign key (PagoID) references Pago(Numero), 
	foreign key (ColaboradorID) references Colaborador(INE)
)