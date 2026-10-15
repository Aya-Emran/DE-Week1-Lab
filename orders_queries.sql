-- Replace YOUR_PROJECT_ID with the project ID shown in BigQuery Explorer.
-- Activity 1: profile the raw batch and count simple data quality issues.
SELECT
  COUNT(*) AS row_count,
  COUNTIF(customer_city IS NULL OR TRIM(customer_city) = '') AS missing_city_rows,
  COUNTIF(quantity <= 0) AS nonpositive_quantity_rows
FROM `YOUR_PROJECT_ID.de_intro.raw_orders`;

-- Activity 2: create a curated preview by excluding incomplete/invalid rows
-- and keeping one row per order ID. This query displays results; it does not
-- create a permanent table in BigQuery Sandbox.
SELECT order_id, order_date, customer_city, product_category, quantity, unit_price, order_total, status
FROM `YOUR_PROJECT_ID.de_intro.raw_orders`
WHERE quantity > 0
  AND customer_city IS NOT NULL
  AND TRIM(customer_city) <> ''
QUALIFY ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY order_date) = 1;
