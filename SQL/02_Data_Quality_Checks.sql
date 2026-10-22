Use indian_ecommerce;
-- 1. Total Records, Unique Orders and Missing Ids
select
count(*) As Total_Orders,
Count(distinct Order_Id) AS Unique_Orders,
Sum(Case
When Customer_Id Is Null or Customer_Id = '' then 1
Else 0
End) As Missing_Customer_Id,
Sum(Case
when Product_Id Is Null or Product_Id = '' then 1
Else 0
End) AS Missing_Product_Id
From Sales;

-- 2. Duplicate Order Id check

select
Order_Id,
Count(*) As Duplicate_Count
from sales
group by Order_Id
having count(*) > 1;

-- 3. Validate Qyantity, Price and Sales Amounts

select
sum(Case
When Quantity Is Null or Quantity <= 0
Then 1 else 0
End) As Invalid_Quantity,

Sum(case
when Unit_Price is Null or Unit_Price < 0 
Then 1 else 0
End) As Invalid_Unit_Price,

Sum(case
when Order_Value is null or Order_Value < 0
Then 1 else 0
End)  As Invalid_Order_Value,

Sum(Case
when Shipping_Cost is null or Shipping_Cost < 0
then 1 else 0
end) AS Invalid_Shipping_Cost,

Sum(Case
when Coupon_Discount is null or Coupon_Discount < 0
then 1 else 0
end) As Invalid_Coupon_Discount,

Sum(Case
When Total_Amount is Null or Total_Amount < 0
then 1 else 0
End) As Invalid_Total_Amount
from Sales;
