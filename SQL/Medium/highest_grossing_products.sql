-- This is the same question as problem #12 in the SQL Chapter of Ace the Data Science Interview!
-- Difficulty: Medium
-- Description: Assume you're given a table containing data on Amazon customers and their spending on products in different category, write a query to identify the top two highest-grossing products within each category in the year 2022. The output should include the category, product, and total spend.

WITH rk AS (
    SELECT 
        category,
        product, 
        SUM(spend) AS total_spend,
        ROW_NUMBER() OVER(
            PARTITION BY category 
            ORDER BY SUM(spend) DESC
        ) AS ranking
    FROM product_spend
    WHERE EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY category, product
)
SELECT 
    category,
    product, 
    total_spend
FROM rk
WHERE ranking <= 2;
