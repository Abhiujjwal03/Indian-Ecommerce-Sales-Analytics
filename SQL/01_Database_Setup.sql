
-- 1. CREATE DATABASE
-- =======================================================

CREATE DATABASE IF NOT EXISTS Indian_Ecommerce
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

USE Indian_Ecommerce;


-- =======================================================
-- 2. CUSTOMERS TABLE
-- =======================================================

CREATE TABLE IF NOT EXISTS customers (
    Customer_ID       VARCHAR(20) NOT NULL,
    Customer_Name     VARCHAR(100) DEFAULT NULL,
    Gender            VARCHAR(20) DEFAULT NULL,
    Age               INT DEFAULT NULL,
    Age_Group         VARCHAR(20) DEFAULT NULL,
    Date_of_Birth     VARCHAR(10) DEFAULT NULL,
    Email             VARCHAR(150) DEFAULT NULL,
    Phone             VARCHAR(20) DEFAULT NULL,
    City              VARCHAR(100) DEFAULT NULL,
    State             VARCHAR(100) DEFAULT NULL,
    Pincode           VARCHAR(10) DEFAULT NULL,
    Registration_Date VARCHAR(10) DEFAULT NULL,
    Customer_Tier     VARCHAR(30) DEFAULT NULL,
    Total_Orders      INT DEFAULT NULL,
    Total_Spent       DECIMAL(15,2) DEFAULT NULL,

    PRIMARY KEY (Customer_ID)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;


-- =======================================================
-- 3. PRODUCTS TABLE
-- =======================================================

CREATE TABLE IF NOT EXISTS products (
    Product_ID       VARCHAR(20) NOT NULL,
    Product_Name     VARCHAR(200) DEFAULT NULL,
    Category          VARCHAR(50) DEFAULT NULL,
    Brand             VARCHAR(100) DEFAULT NULL,
    Original_Price    DECIMAL(15,2) DEFAULT NULL,
    Discount_Percent  DECIMAL(5,2) DEFAULT NULL,
    Discount_Amount   DECIMAL(15,2) DEFAULT NULL,
    Selling_Price     DECIMAL(15,2) DEFAULT NULL,
    Stock_Quantity    INT DEFAULT NULL,
    Weight_kg         DECIMAL(10,2) DEFAULT NULL,
    Avg_Rating        DECIMAL(3,2) DEFAULT NULL,
    Total_Reviews     INT DEFAULT NULL,

    PRIMARY KEY (Product_ID)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;


-- =======================================================
-- 4. SALES TABLE
-- =======================================================

CREATE TABLE IF NOT EXISTS sales (
    Order_ID          VARCHAR(20) NOT NULL,
    Customer_ID       VARCHAR(20) DEFAULT NULL,
    Product_ID        VARCHAR(20) DEFAULT NULL,
    Order_Date        VARCHAR(10) DEFAULT NULL,
    Order_Time        TIME DEFAULT NULL,
    Delivery_Date     VARCHAR(10) DEFAULT NULL,
    Quantity          INT DEFAULT NULL,
    Unit_Price        DECIMAL(15,2) DEFAULT NULL,
    Order_Value       DECIMAL(15,2) DEFAULT NULL,
    Shipping_Cost     DECIMAL(15,2) DEFAULT NULL,
    Coupon_Code       VARCHAR(50) DEFAULT NULL,
    Coupon_Discount   DECIMAL(15,2) DEFAULT NULL,
    Total_Amount      DECIMAL(15,2) DEFAULT NULL,
    Payment_Mode      VARCHAR(50) DEFAULT NULL,
    Order_Status      VARCHAR(30) DEFAULT NULL,
    Rating            VARCHAR(10) DEFAULT NULL,
    Review_Text       TEXT,
    City              VARCHAR(100) DEFAULT NULL,
    State             VARCHAR(100) DEFAULT NULL,
    Customer_Age      INT DEFAULT NULL,
    Customer_Age_Group VARCHAR(20) DEFAULT NULL,

    PRIMARY KEY (Order_ID)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_0900_ai_ci;


-- =======================================================
-- 5. VERIFY DATABASE AND TABLES
-- =======================================================

SELECT DATABASE() AS Current_Database;

SHOW TABLES;

DESCRIBE customers;
DESCRIBE products;
DESCRIBE sales;

-- =======================================================
-- END OF SCRIPT
-- =======================================================
```
