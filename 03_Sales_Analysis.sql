-- Overall Sales Perormance
Use indian_ecommerce;
select
Count(*) AS Total_Orders,
Count(Distinct Order_Id) AS Unique_Orders,
Sum(Quantity) AS Total_Quantity_Sold,
round(sum(Total_Amount),2) AS Total_Sales
From Sales
where Order_Status = 'Delivered';

-- ============================================
-- Query 2: Monthly Sales Trend
-- ============================================

USE Indian_Ecommerce;

SELECT
    DATE_FORMAT(
        STR_TO_DATE(Order_Date, '%d-%m-%Y'),
        '%Y-%m'
    ) AS Order_Month,
    COUNT(*) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity_Sold,
    ROUND(SUM(Total_Amount), 2) AS Total_Sales
FROM sales
WHERE Order_Status = 'Delivered'
GROUP BY DATE_FORMAT(
    STR_TO_DATE(Order_Date, '%d-%m-%Y'),
    '%Y-%m'
)
ORDER BY Order_Month;

-- State Wise Sales Analysis
USE Indian_Ecommerce;

SELECT
    State,
    COUNT(*) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity_Sold,
    ROUND(SUM(Total_Amount), 2) AS Total_Sales
FROM sales
WHERE Order_Status = 'Delivered'
  AND State IS NOT NULL
GROUP BY State
ORDER BY Total_Sales DESC;

-- Payment Mode Analysis


Select
Payment_Mode,
Count(*) As Total_Orders,
Sum(Quantity) AS Total_Quantity_Sold,
Round(Sum(Total_Amount), 2) As Total_Sales
From Sales
Where Order_Status = 'Delivered'
And Payment_Mode is not Null
Group By Payment_Mode
Order by Total_Sales desc;

-- Order Status Analysis

Select
Order_Status,
Count(*) As Total_Orders,
Round(sum(Total_Amount),2) AS Total_Sales
From Sales
Where Order_Status Is not Null
Group By Order_Status
order by Total_Orders Desc;

-- City-Wise Sales Analysis

select
City,
Count(*) AS Total_Orders,
Sum(Quantity) AS Total_Quantiy_Sold,
Round(Sum(Total_Amount), 2) AS Total_Sales
From Sales
Where Order_Status = 'Delivered'
And City is Not Null
group by City
Order by Total_Sales desc;

-- ============================================
-- Query 7: Top 10 Best-Selling Products
-- ============================================

USE Indian_Ecommerce;

SELECT
    Product_ID,
    SUM(Quantity) AS Total_Quantity_Sold,
    COUNT(*) AS Total_Orders,
    ROUND(SUM(Total_Amount), 2) AS Total_Sales
FROM sales
WHERE Order_Status = 'Delivered'
GROUP BY Product_ID
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

-- Customer Age Group Sales Analysis

select
Customer_Age_Group,
Count(*) AS Total_Orders,
Sum(Quantity) AS Total_Quantity_Sold,
Round(Sum(Total_Amount), 2) As Total_Sales
From Sales
Where Order_Status = 'Delivered'
And Customer_Age_Group is Not Null
Group By Customer_Age_Group
Order by Total_Sales desc;

-- Coupon Code Analysis
select 
Coupon_Code,
Count(*) As Total_Orders,
Sum(Quantity) AS Total_Quantity_Sold,
Round(Sum(Coupon_Discount), 2) As Total_Discount,
Round(Sum(Total_Amount), 2) As Total_Sales
From Sales
where Order_Status = 'Delivered'
And Coupon_Code is Not Null
And Trim(Coupon_Code) <> ''
group by Coupon_Code
order by Total_Orders Desc
limit 10;

-- Product Category Analysis

select
p.Category,
Count(s.Order_Id) AS Total_Orders,
Sum(s.Quantity) AS Total_Quantity_Sold,
Round(Sum(s.Total_Amount), 2) As Total_Sales
From Sales s 
inner join Products p 
On s.Product_Id = p.Product_Id
Where s.Order_Status = 'Delivered'
group by p.Category
order by Total_Sales Desc;
