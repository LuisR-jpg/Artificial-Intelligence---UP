--use AdventureWorks2017	

--select * from Purchasing.PurchaseOrderDetail
--select * from Production.Product
--select * from Sales.SalesOrderHeader
--select * from Purchasing.ShipMethod
--select * from Sales.SalesTerritory

-- 1. De las compras realizadas, se desea conocer el monto total de compras por año, ordenadas por año de mayor a menor
select year(DueDate) Year, sum(LineTotal) LineTotal
from Purchasing.PurchaseOrderDetail
group by year(DueDate)
order by year(DueDate) desc

-- 2. De las compras realizadas, se desea conocer el total de productos comprados por nombre de productos ordenados por la cantidad de productos recibidos de menor a mayor
select Production.Product.Name, sum(Purchasing.PurchaseOrderDetail.ReceivedQty)
from Production.Product
join Purchasing.PurchaseOrderDetail on Purchasing.PurchaseOrderDetail.ProductID = Production.Product.ProductID
group by Production.Product.Name
order by sum(Purchasing.PurchaseOrderDetail.ReceivedQty)

-- 3. De las ventas realizadas, se desea conocer cuantas ventas se entregaron por tipo de envío.
select Purchasing.ShipMethod.name, count(1) total
from Purchasing.ShipMethod
join Sales.SalesOrderHeader on Sales.SalesOrderHeader.ShipMethodID = Purchasing.ShipMethod.ShipMethodID
group by Purchasing.ShipMethod.Name

-- 4. De las ventas realizadas, se desea conocer los impuestos pagados por año ordenados año de menor a mayor.
select year(OrderDate) Year, sum(TaxAmt) TaxAmt
from Sales.SalesOrderHeader
group by year(OrderDate)
order by year(OrderDate)

-- 5. De las ventas realizadas, se desea conocer las ventas por nombre de territorio y año, ordenados por nombre de territorio y año de mayor a menor
select t.Name Name, year(s.OrderDate) Year, sum(s.TotalDue) TotalDue
from Sales.SalesTerritory t
join Sales.SalesOrderHeader s on s.TerritoryID = t.TerritoryID
group by t.Name, year(s.OrderDate)
order by t.Name, year(s.OrderDate) desc