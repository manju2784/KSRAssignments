
/***************************************************************************************************
   Task: SQL Assignment 1 (Basic)
   Date: 23-NOV-2025
   Student : Manju Reddy
   Input files : Ele_Store1.csv
   Questions Answered from "Ele_Store_Questions.pdf"
   
   Table 'ele_store1' created and used from the csv file given.
   Issue Noticed: Import created 1630 rows. Used 'Table Data Import Wizard' to import the csv file. 
                  Import does not stop by itself. Had to cancel import and use the data that was loaded. 
                  Queries are submitted but did not attach the results, as it be bad data.
****************************************************************************************************/

## desc ele_store1;
##OrderID, OrderDate,UnitCost,Price,OrderQty,CostofSales,Sales,Profit,Channel,PromotionName,ProductName,Manufacturer,ProductSubCategory,ProductCategory,Region,City,Country


## 1)What is total number of orders placed?
SELECT COUNT(DISTINCT OrderID) AS 'TotalOrders'
FROM ele_store1;

## 2)What are the unique channels present and how many are there?
SELECT channel, COUNT(channel) as 'Total orders per Channel'
FROM ele_store1
GROUP BY channel;

## 3)How many cities are there?
SELECT COUNT(DISTINCT City) as 'Number of Cities'
FROM ele_store1;

## 4)Query the total cities count by Country
SELECT country, COUNT(DISTINCT City) as 'TotalCities'
FROM ele_store1
GROUP BY country;

## 5)How many products are there?
SELECT count(distinct productname) as 'ToatlProducts'
FROM ele_store1;

##6)Query the total sales and total profit?
SELECT sum(sales) AS 'TotalSales', sum(profit) AS 'TotalProfit'
FROM ele_store1; 

## 7)Query the total sales by region and country?
SELECT Region, Country, sum(sales) as 'TotalSales'
FROM ele_store1
GROUP BY Region, Country
ORDER BY Region, Country;

## 8)Query the total order qty by promotion name?
select PromotionName, sum(OrderQty) as 'TotalOrderQuantity'
from ele_store1
group by PromotionName;


## 9)How much the total sales happened in Asia region?
select region, sum(sales) as 'TotalSales'
from ele_store1
where upper(region) in ('ASIA')
group by region;

## 10)How much profit got in Asia region and India?
select  region, COUNTRY, sum(profit) as 'TotalProfit'
from ele_store1
where upper(region) in ('ASIA') AND upper(COUNTRY) in ('INDIA')
group by region,COUNTRY;


## 11)Query the total order qty by Manufacturer and Product Name?
SELECT Manufacturer, ProductName, SUM(OrderQty) AS 'TotalOrderQty'
FROM ele_store1
GROUP BY Manufacturer, ProductName
order by 1,2;

## 12)Query the total order quantity greater than 27 by city?
select city, sum(OrderQty) as 'TotalOrderQty'
from ele_store1
group by city 
having sum(OrderQty)>27;


## 13)How much total sales happened in China and Beijing?
SELECT Country, City, sum(Sales) AS 'TotalSales'
FROM ele_store1
WHERE UPPER(Country) IN ('CHINA') AND UPPER(City) IN ('BEIJING') 
GROUP BY Country, City;

## 14)How much total sales happened in Asian Holiday Promotion?
SELECT PromotionName, SUM(Sales)AS 'TotalSales'
FROM ele_store1 
WHERE UPPER(PromotionName) IN ('ASIAN HOLIDAY PROMOTION')
GROUP BY PromotionName
;

## 15)How much total profit value by Contoso, Ltd Manufacturer?
SELECT Manufacturer, SUM(Profit)AS 'TotalProfit'
FROM ele_store1 
WHERE UPPER(Manufacturer) IN ('CONTOSO, LTD')
GROUP BY Manufacturer;


## 16)Query the total sales and total order qty by productcategory?
SELECT ProductCategory, SUM(Sales) AS 'TotalSales', SUM(OrderQty) AS 'OrderQuantity'
FROM ele_store1 
GROUP BY ProductCategory;

## 17)Query the total sales value in between 1057 and 26700 by Region?
SELECT Region, SUM(Sales) AS 'TotalSales'
FROM ele_store1 
GROUP BY Region
HAVING SUM(Sales) BETWEEN 1057 AND 26700;

## 18)How many orders placed in Pittsfield city?
SELECT City, SUM(OrderQty) AS 'TotalOrders'
FROM ele_store1 
where UPPER(City) in ('PITTSFIELD')
GROUP BY City;

## 19)Query the total sales and total profit by region, country and city?
SELECT Region, Country, City, SUM(Sales) AS 'TotalSales', SUM(Profit) AS 'TotalProfit'
FROM ele_store1
GROUP BY Region, Country, City
order by 1,2,3;

## 20) Query the total unit cost and total price by productcategory, productsubcategory and Manufacturer?
SELECT ProductCategory, ProductSubCategory, Manufacturer, SUM(UnitCost) AS 'TotalUnitCost', SUM(Price) AS 'TotalPrice'
FROM ele_store1
GROUP BY ProductCategory, ProductSubCategory, Manufacturer
ORDER BY 1,2,3;



