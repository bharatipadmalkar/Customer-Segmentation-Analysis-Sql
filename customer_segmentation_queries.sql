-- create database customer;
use customer ;
show tables;

-- alter table customer_segmentation_data
-- rename customer_data ;

select * from customer_data;

-- Q1: Retrieve all records from the dataset.
SELECT * FROM customer_data;

-- Q2: Retrieve the names and locations of all customers.
SELECT Name, Location FROM customer_data;

-- Q3: Find distinct customer categories in the dataset.
SELECT DISTINCT CustomerCategory FROM customer_data;

-- Q4: Count the total number of customers in the dataset.
SELECT COUNT(*) AS TotalCustomers FROM customer_data;

-- Q5: Retrieve customers who are from 'New York'.
SELECT * FROM customer_data WHERE Location = 'New York';

-- Q6: Find customers older than 50 years.
SELECT Name, Age FROM customer_data WHERE Age > 50;

-- Q7: List customers who made a purchase greater than $500.
SELECT Name, PurchaseAmount FROM customer_data WHERE PurchaseAmount > 500;

-- Q8: Find the number of customers in each category.
SELECT CustomerCategory, COUNT(*) AS CustomerCount FROM customer_data GROUP BY CustomerCategory;

-- Q9: Calculate the average purchase amount for all customers.
SELECT AVG(PurchaseAmount) AS AveragePurchase FROM customer_data;

-- Q10: Retrieve customers who made purchases more than 20 times.
SELECT Name, PurchaseFrequency FROM customer_data WHERE PurchaseFrequency > 20;

-- Q11: Find the top 5 customers with the highest purchase amount.
SELECT Name, PurchaseAmount FROM customer_data ORDER BY PurchaseAmount DESC LIMIT 5;

-- Q12: Segment customers by location and calculate their average purchase amount.
SELECT Location, AVG(PurchaseAmount) AS AvgPurchaseAmount FROM customer_data GROUP BY Location ORDER BY AvgPurchaseAmount DESC;

-- Q13: Find the total purchase amount for each customer category.
SELECT CustomerCategory, SUM(PurchaseAmount) AS TotalPurchase FROM customer_data GROUP BY CustomerCategory ORDER BY TotalPurchase DESC;

-- Q14: Identify customers who have not purchased anything in the last year.
SELECT Name, LastPurchaseDate FROM customer_data WHERE LastPurchaseDate < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- Q15: Retrieve customers with a purchase frequency between 10 and 20.
SELECT Name, PurchaseFrequency FROM customer_data WHERE PurchaseFrequency BETWEEN 10 AND 20;

-- Q16: Count the number of customers grouped by gender and location.
SELECT Gender, Location, COUNT(*) AS CustomerCount FROM customer_data GROUP BY Gender, Location ORDER BY Location, Gender;

-- Q17: Find the most recent purchase date in the dataset.
SELECT MAX(LastPurchaseDate) AS MostRecentPurchase FROM customer_data;

-- Q18: Retrieve customers who belong to the 'Loyal' category and have made purchases more than 15 times.
SELECT Name, PurchaseFrequency FROM customer_data WHERE CustomerCategory = 'Loyal' AND PurchaseFrequency > 15;

-- Q19: Calculate the total and average purchase amount for each location.
SELECT Location, SUM(PurchaseAmount) AS TotalPurchase, AVG(PurchaseAmount) AS AveragePurchase FROM customer_data GROUP BY Location ORDER BY TotalPurchase DESC;

-- Q20: Rank customers by their purchase amount using a ranking function.
SELECT Name, PurchaseAmount, RANK() OVER (ORDER BY PurchaseAmount DESC) AS p_amt FROM customer_data LIMIT 10;

-- Q21: Find the location with the highest total purchase amount.
SELECT Location, SUM(PurchaseAmount) AS TotalPurchase FROM customer_data GROUP BY Location ORDER BY TotalPurchase DESC LIMIT 1;

-- Q22: List customers whose last purchase was exactly 6 months ago.
SELECT Name, LastPurchaseDate FROM customer_data WHERE LastPurchaseDate = DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- Q23: Calculate the percentage of customers in each category.
SELECT CustomerCategory, (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_data)) AS Percentage FROM customer_data GROUP BY CustomerCategory;

-- Q24: Identify the youngest and oldest customers in each location.
SELECT Location, MIN(Age) AS Youngest, MAX(Age) AS Oldest FROM customer_data GROUP BY Location;

-- Q25: Find customers with purchase frequency greater than twice the average purchase frequency.
SELECT Name, PurchaseFrequency FROM customer_data WHERE PurchaseFrequency > (SELECT AVG(PurchaseFrequency) * 2 FROM customer_data);

-- Q26: Segment customers based on age brackets (e.g., 18-25, 26-35, etc.).
SELECT CASE WHEN Age BETWEEN 18 AND 25 THEN '18-25' WHEN Age BETWEEN 26 AND 35 THEN '26-35' WHEN Age BETWEEN 36 AND 50 THEN '36-50' ELSE '51+' END AS AgeGroup, COUNT(*) AS CustomerCount FROM customer_data GROUP BY AgeGroup ORDER BY CustomerCount DESC;

-- Q27: Identify customers who made purchases in the last month but are not 'Loyal'.
SELECT Name, LastPurchaseDate FROM customer_data WHERE LastPurchaseDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CustomerCategory != 'Loyal';

-- Q28: Find customers with the highest purchase frequency for each location.
SELECT Location, Name, PurchaseFrequency FROM customer_data WHERE (Location, PurchaseFrequency) IN (SELECT Location, MAX(PurchaseFrequency) FROM customer_data GROUP BY Location);

-- Q29: Rank locations by the total number of customers.
SELECT Location, COUNT(*) AS TotalCustomers, RANK() OVER (ORDER BY COUNT(*) DESC) AS total_cutstomer FROM customer_data GROUP BY Location;

-- Q30: Identify the top 5 youngest customers with the highest purchase amount.
SELECT Name, Age, PurchaseAmount FROM customer_data ORDER BY PurchaseAmount DESC, Age ASC LIMIT 5;

