---------- Total Revenue
SELECT
SUM(transaction_qty*unit_price) AS total_revenue
FROM coffeeshop_sales;

-------- Number of units sold
SELECT
SUM(transaction_qty) As number_of_unit_sold
FROM coffeeshop_sales;

------------Number of sales
SELECT
COUNT(*) AS number_of_sales
FROM coffeeshop_sales;

---------units sold
SELECT
SUM(transaction_qty) AS Units_sold
FROM COFFEESHOP_SALES;

-------final query

SELECT
SUM(transaction_qty*unit_price) AS total_revenue,
SUM(transaction_qty) AS number_of_units_sold,
COUNT(*) AS number_of_sales,
SUM(transaction_qty) AS units_sold,

TO_CHAR(transaction_time, 'HH24') AS hour_of_day,
TO_CHAR(transaction_date, 'YYYMM') AS month_id,
MONTHNAME(transaction_date) AS month_name,
DAYNAME(transaction_date) AS day_of_week,

CASE
WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'morning'
WHEN transaction_time BETWEEN '12:00:00' AND '15:59:59' THEN 'afternoon'
ELSE 'evening'
END AS time_bucket,

product_detail,
product_type,
store_location,
product_category,

FROM coffeeshop_sales

GROUP BY time_bucket,
         store_location,
         product_detail,
         product_type,
         hour_of_day,
         product_category,
         month_id,
         day_of_week,
         month_name;

