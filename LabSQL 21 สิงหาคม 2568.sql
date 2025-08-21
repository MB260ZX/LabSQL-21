select CategoryName,ProductName,UnitPrice from Products,Categories  where Products.CategoryID = Categories.CategoryID order by CategoryName

select CategoryName,ProductName,UnitPrice from Products join Categories on Products.CategoryID = Categories.CategoryID order by CategoryName

select c.CategoryName,p.ProductName,UnitPrice from Products as p ,Categories as c where p.CategoryID = c.CategoryID order by CategoryName

select CompanyName,OrderID from Orders as o ,Shippers as s  where s.ShipperID=o.ShipVia 

select CompanyName,OrderID from Orders as o  join Shippers as s  on s.ShipperID=o.ShipVia 

select p.ProductID, p.ProductName ,s.CompanyName,s.Country from Products as p join Suppliers as s  on p.SupplierID = s.SupplierID 

select s.CompanyName,o.OrderID from Orders as o ,Shippers as s where s.ShipperID=o.ShipVia and OrderID = 10275

select s.CompanyName,o.OrderID from Orders as o join Shippers as s  on s.ShipperID=o.ShipVia where OrderID = 10275

--แบบฝึกหัด
select e.EmployeeID ,e.FirstName,o.OrderID from Employees as e join [Orders] as o on e.EmployeeID=o.EmployeeID order by EmployeeID

select p.ProductID,p.ProductName,s.City,s.Country from Products as p join Suppliers as s on p.SupplierID=s.SupplierID

select CompanyName,count(*) from Orders as o join Shippers as s on o.ShipVia = s.ShipperID group by CompanyName

select p.ProductID,p.ProductName,sum(quantity) as จำนวนที่ขายได้ทั้งหมด   from  Products as p join [Order Details] as o on p.ProductID=o.ProductID group by p.ProductID,p.ProductName order by 1