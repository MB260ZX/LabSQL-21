-- เชื่อมกัน2ตาราง
select CategoryName,ProductName,UnitPrice 
from Products,Categories  
where Products.CategoryID = Categories.CategoryID 
order by CategoryName

select CategoryName,ProductName,UnitPrice 
from Products join Categories 
on Products.CategoryID = Categories.CategoryID 
order by CategoryName

select c.CategoryName,p.ProductName,UnitPrice 
from Products as p ,Categories as c
where p.CategoryID = c.CategoryID 
order by CategoryName

select CompanyName,OrderID 
from Orders as o ,Shippers as s  
where s.ShipperID=o.ShipVia 

select CompanyName,OrderID 
from Orders as o  join Shippers as s  
on s.ShipperID=o.ShipVia 

select p.ProductID, p.ProductName ,s.CompanyName,s.Country 
from Products as p join Suppliers as s  
on p.SupplierID = s.SupplierID 

select s.CompanyName,o.OrderID 
from Orders as o ,Shippers as s 
where s.ShipperID=o.ShipVia 
and OrderID = 10275

select s.CompanyName,o.OrderID
from Orders as o join Shippers as s  
on s.ShipperID=o.ShipVia 
where OrderID = 10275

--แบบฝึกหัด
select e.EmployeeID ,e.FirstName,o.OrderID 
from Employees as e join [Orders] as o 
on e.EmployeeID=o.EmployeeID 
order by EmployeeID

select p.ProductID,p.ProductName,s.City,s.Country
from Products as p join Suppliers as s 
on p.SupplierID=s.SupplierID

select CompanyName,count(*) from 
Orders as o join Shippers as s 
on o.ShipVia = s.ShipperID 
group by CompanyName

select p.ProductID,p.ProductName,sum(quantity) as จำนวนที่ขายได้ทั้งหมด  
from  Products as p join [Order Details] as o 
on p.ProductID=o.ProductID 
group by p.ProductID,p.ProductName order by 1
--เชื่อมกัน3ตาราง
select o.OrderID,c.CompanyName,e.FirstName, o.ShipAddress 
from Orders as o , Customers as c , Employees as e 
where o.CustomerID=c.CustomerID and o.EmployeeID=e.EmployeeID

select o.OrderID,c.CompanyName,e.FirstName, o.ShipAddress 
from Orders as o join Customers as c on o.CustomerID=c.CustomerID join Employees as e 
on o.EmployeeID=e.EmployeeID 

select e.EmployeeID,FirstName,count(*) as [จำนวน order],sum(freight) as [sum of freight] 
from Employees as e join Orders as o 
on e.EmployeeID = o.EmployeeID where year(OrderDate) = 1998 
group by e.EmployeeID,FirstName
--แบบฝึก2
select  --กำจัดคำช้ำกัน
					distinct p.ProductID,p.ProductName from Employees e join Orders o on e.EmployeeID=o.EmployeeID
						 join [Order Details] as od on o.OrderID=od.OrderID
						 join Products p on od.ProductID=p.ProductID
where e.FirstName = 'Nancy' 
order by ProductID

select distinct s.country
from Customers as c join Orders as o on c.CustomerID = o.CustomerID
							 join [Order Details] as od on o.OrderID=od.OrderID
							 join Products as p on od.ProductID=p.ProductID
							 join Suppliers as s on p.SupplierID = s.SupplierID
							 where c.CompanyName ='Around the Horn'

select p.ProductID,p.ProductName,sum(quantity) as [sum of quantity]
from Customers as c join Orders as o on c.CustomerID= o.CustomerID
							join [Order Details] as od on o.OrderID=od.OrderID
							join Products as p on od.ProductID = p.ProductID 
							where c.CompanyName ='Around the Horn'
							group by p.ProductID,ProductName
							order by 1
--คำนวนบงกเชื่อมตาราง
select o.OrderID,e.FirstName, sum(( od.quantity * od.UnitPrice *( 1-od.Discount ))) as Totalcash
from Orders o join Employees e on o.EmployeeID=e.EmployeeID
					join [Order Details] od on o.OrderID = od.OrderID
					group by o.OrderID,e.FirstName
					order by OrderID