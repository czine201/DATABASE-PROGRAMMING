/* This query provides detailed information on customers’ carry-out orders with the final prices of $30 and above. */
SELECT c.CustomerID, c.CustFName, c.CustLName, COUNT(o.OrderNum) AS CarryOutOrdersCount, AVG(o.finalPrice) AS AvgFinalPrice
FROM Customer c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Employee e ON o.EmpID = e.EmpID
WHERE o.OrderType = 'carryout'
AND o.finalPrice >= 30
GROUP BY c.CustomerID, c.CustFName, c.CustLName
ORDER BY CarryOutOrdersCount DESC; 

/* For each customer, print the number of products that they ordered. Sort the output by the number in descending order. 
Print only customers that ordered more or equal to 3 products. */

SELECT ord.OrderNum, ord.date as OrderDate, c.CustFName, c.CustLName, sum(o.quantity) as TotalQuantity
FROM OrderLine o, customer c, orders ord
WHERE ord.OrderNum = o.OrderNum AND ord.CustomerID = c.CustomerID
Group By O.OrderNum, ord.OrderNum, ord.date, c.CustomerID
HAVING sum(o.quantity)>= 3
ORDER BY ord.date DESC; 

/*This query links together the Employee, Orders, and Customer tables to provide a detailed look at the performance of each employee in terms of sales. 
It's designed to measure not only how much revenue each employee is generating but also how many unique customers they're serving 
and the average value of the orders they handle. The aim is to pinpoint which employees are excelling not just in sales 
but in attracting a diverse clientele, indicating their effectiveness in both service and salesmanship. 
The results are organized by the total revenue generated in descending order, ensuring the top performers stand out immediately. 
This setup guarantees that the information fits neatly on a single screen, making it easy to digest at a glance.
*/

SELECT 
 Employee.EmpID, 
 Employee.EmpFName || ' ' || Employee.EmpLName AS EmployeeName, 
 COUNT(DISTINCT Orders.OrderNum) AS TotalOrders, 
  SUM(Orders.FinalPrice) AS TotalRevenue, 
  AVG(Orders.FinalPrice) AS AverageOrderValue,
  COUNT(DISTINCT Orders.CustomerID) AS UniqueCustomersServed
FROM 
  Employee
JOIN 
  Orders ON Employee.EmpID = Orders.EmpID
JOIN 
   Customer ON Orders.CustomerID = Customer.CustomerID
GROUP BY 
    Employee.EmpID
ORDER BY 
   TotalRevenue DESC;






