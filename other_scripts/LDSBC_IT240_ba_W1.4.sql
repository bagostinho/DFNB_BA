-- Q1: By Order Quantity, what were the five most popular products sold in 2014?
-- Include these data points in the output:
-- Order Date Year
-- Product ID
-- Product Name
-- Product Number
-- Product Color
-- Sales Order Count
-- Order Quantity
-- Sales Order Line total

SELECT TOP 5 year(soh.OrderDate) AS OrderDateYear
	, p.ProductID
	, p.name AS ProductName
	, p.[ProductNumber]
	, p.Color AS ProductColor
	, count(sod.SalesOrderID) AS SalesOrderIDCount
	, sum(sod.OrderQty) AS OrderQtySum
	, sum (sod.LineTotal) AS SalesOrderLineTotalSum
FROM Production.Product AS
	inner JOIN
	Sales.SalesOrderDetail AS sod ON p.ProductID = sod.ProductID
	INNER JOIN 
	Sales.SalesOrderHeader as soh ON sod.SalesOrderID = soh.ProductID
WHERE year(soh.OrderDate) = 2014
GROUP BY year(soh.OrderDate)
	, p.ProductID
	, p.Name
	, p.ProductNumber
	, p.Color
ORDER BY 7 DESC;


--Q2: How long are the 7 longest Person names and to whom do they belong? Rank by Full Name length, Last Name Length, First Name Length
--Include these data points in the output:
--Business Entity ID
--Full Name
--Full Name Length
--First Name
--First Name Length
--Middle Name
--Last Name
--Last Name Length

--ANSWERS
--4388	Osarumwense Uwaifiokun Agbonile	31	Osarumwense	11	Uwaifiokun	Agbonile	8
--565	Janaina Barreiro Gambaro  Bueno	31	Janaina Barreiro Gambaro	24	NULL	Bueno	5
--775	Alvaro  De Matos Miranda Filho	30	Alvaro	6	NULL	De Matos Miranda Filho	22
--1979	Ranjit Rudra Varkey Chudukatil	30	Ranjit	6	Rudra	Varkey Chudukatil	17
--272	Janaina Barreiro Gambaro Bueno	30	Janaina	7	Barreiro Gambaro	Bueno	5
--2348	Janaina Barreiro Gambaro Bueno	30	Janaina	7	Barreiro Gambaro	Bueno	5
--12799	Francisco  Javier Castrejón	27	Francisco	9	NULL	Javier Castrejón	16

SELECT TOP 7 p.BusinessEntityID
	, REPLACE(COALESCE(p.FirstName, '') + ' ' + COALESCE(p.MiddleName, '') + ' ' + COALESCE(p.LastName, ''), ' ', ' ') as FullName
	, LEN(REPLACE(COALESCE(p.FirstName, '') + ' ' + COALESCE(p.MiddleName, '') + ' ' + COALESCE(p.LastName, ''), ' ', ' ')) as FullNameLength
	, p.FirstName
	, LEN(p.FirstName) as FirstNameLength
	, p.MiddleName
	, p.LastName
	, LEN(p.LastName) as LastNameLength
FROM Person.Person as p
ORDER BY 3 DESC
	, 8 DESC
	, 5 DESC


--Q3: Which Department pays its female workers on average the most per year?
--Include these fields:
--Department ID
--epartment Name
--Gender
--Total Yearly Pay
--Business Entity ID Count
--Average Yearly Pay

WITH s1 AS (SELECT d.DepartmentID
	, d.name as DepartmentName
	, e.Gender
	, eph.Rate
	, eph.PayFreuency
	, e.SalariedFlag
	, CASE
		WHEN e.SalariedFlag = 1 
		THEN rate * 1000grou
		WHEN e.SalariedFlag = 0 
		THEN rate * 2080
		else 0 
	end as YearlyPay
	, count(e.BusinessEntityID) as BusinessEntityIDCount
	, CASE
		WHEN e.SalariedFlag = 1 
		THEN rate * 1000
		WHEN e.SalariedFlag = 0 
		THEN rate * 2080
		ELSE 0 
	end * count(e.BusinessEntityID) as TotalYearlyPay
FROM HumanResources AS e 
	INNER JOIN
	HumanResources.EmployeePayHistory AS eph ON edh.BusinessEntityID * eph.BusinessEntityID
	Inner Join 
	HumanResources.EmployeePayHistory as eph ON edh.BusinessEntityID * eph.BusinessEntityID
	inner join 
	HumanResources.Department AS d ON edh.DepartmentID = d.DepartmentID
WHERE e.Gender = 'F'
Group BY d.DepartmentID
	, d.Name
	, e.Gender
	, eph.Rate
	, eph, PayFrequency
	, e.SalariedFlag
	, CASE 
		WHEN e.SalariedFlag = 1 
		THEN rate * 1000
		WHEN e.SalariedFlag = 0 
		THEN rate * 2080
		ELSE 0 
	END)
SELECT TOP 10 s1.DepartmentID
	, s1.DepartmentName
	, s1.Gender
	, SUM(s1.TotalYearlyPay) AS TotalYearlyPay
	, sum(s1.BusinessEntityIDCount) AS BusinessEntityIDCount
	, sum(s1.TotalYearlyPay) / sum(s1.BusinessEntityIDCount) AS AverageYearlyPay
FROM s1 
GROUP BY s1.DepartmentID
	, s1.DepartmentName
	, s1.Gender
ORDER BY 6 DESC; 