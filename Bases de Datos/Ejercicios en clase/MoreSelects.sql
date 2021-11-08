---- Schemas are labels for tables, makes easier the organization of the info
--create schema Test
--create table Test.Dummy
--(
--	Id int identity(1, 1) primary key, 
--	DataDummy nvarchar(50)
--)
---- Cuando schema no existe
--create table NewTest.Dummy
--(
--	Id int identity(1, 1) primary key, 
--	DataDummy nvarchar(50)
--)

--select * from HumanResources.Employee

--- Contar número de empleados
--select count(1) ToalEmployee from HumanResources.Employee

--- Total de hombres y mujeres
--select Gender, count(1) Total from HumanResources.Employee group by Gender
--- Total de hombres y mujeres with nombres bonitos
--select case when Gender = 'M' then 'Male' when Gender = 'F' then 'Female' end Gender, count(1) Total
--from HumanResources.Employee
--group by Gender
--order by Total

--- Total casados o solteros
--select MaritalStatus, count(1) Total from HumanResources.Employee group by MaritalStatus

--- Total de empleados por Job Title
----select * from HumanResources.Employee
--select JobTitle, count(1) total from HumanResources.Employee group by JobTitle

--- Total empleados agrupados por genero y por estado marital
--select Gender, MaritalStatus, count(1) from HumanResources.Employee group by Gender, MaritalStatus order by Gender, MaritalStatus

--- Total de empleados por departamento
--select * from HumanResources.Employee
--select * from HumanResources.vEmployeeDepartment
---- Solucion 1
--select d.Department, count(1) total from HumanResources.Employee e, HumanResources.vEmployeeDepartment d
--where e.BusinessEntityID = d.BusinessEntityID
--group by d.Department
--order by d.Department
---- Solucion 2
--select d.Department, count(1) total from HumanResources.Employee e
--join HumanResources.vEmployeeDepartment d on e.BusinessEntityID = d.BusinessEntityID
--group by d.Department
--order by d.Department

---- 
--select isnull(p.Title, '') + ' ' + p.FirstName + ' ' + p.LastName FullName, d.Department from HumanResources.Employee e
--join Person.Person p on e.BusinessEntityID = p.BusinessEntityID
--join HumanResources.vEmployeeDepartment d on e.BusinessEntityID = d.BusinessEntityID
--order by Department, FullName

--select isnull(p.Title, '') + ' ' + p.FirstName + ' ' + p.LastName FullName, d.Department from HumanResources.Employee e
--join Person.Person p on e.BusinessEntityID = p.BusinessEntityID
--join HumanResources.vEmployeeDepartment d on e.BusinessEntityID = d.BusinessEntityID
--where d.Department not in ('Quality Assurance', 'Production')
--order by Department, FullName

--select isnull(p.Title, '') + ' ' + p.FirstName + ' ' + p.LastName FullName, d.Department from HumanResources.Employee e
--join Person.Person p on e.BusinessEntityID = p.BusinessEntityID
--join HumanResources.vEmployeeDepartment d on e.BusinessEntityID = d.BusinessEntityID
--where d.Department not in ('Quality Assurance', 'Production')
--and p.FirstName like '%J%' -- Cadenas antes y después de J
--order by Department, FullName

--select year(QuotaDate) anio, sum(SalesQuota) ventas from Sales.SalesPersonQuotaHistory group by year(QuotaDate) order by year(QuotaDate) 

--select p.FirstName + ' ' + p.LastName fullname, sum(salesquota) total from Sales.SalesPersonQuotaHistory s
--join Person.Person p on s.BusinessEntityID = p.BusinessEntityID
--group by p.FirstName + ' ' + p.LastName
--order by total desc

--select top 5 p.FirstName + ' ' + p.LastName fullname, sum(salesquota) total from Sales.SalesPersonQuotaHistory s
--join Person.Person p on s.BusinessEntityID = p.BusinessEntityID
--group by p.FirstName + ' ' + p.LastName
--order by total 

--select p.FirstName + ' ' + p.LastName fullname, year(QuotaDate) anio, sum(SalesQuota) total from Sales.SalesPersonQuotaHistory s
--join Person.Person p on s.BusinessEntityID = p.BusinessEntityID
--group by p.FirstName + ' ' + p.LastName, year(QuotaDate)
--order by fullname, anio asc

select p.FirstName, p.LastName from Person.Person p
where BusinessEntityID in (
	select BusinessEntityID from Sales.SalesPerson where Bonus = 5000
)
