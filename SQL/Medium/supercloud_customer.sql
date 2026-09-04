-- Difficulty: Medium
-- Description: A Microsoft Azure Supercloud customer is defined as a customer who has purchased at least one product from every product category listed in the products table. Write a query that identifies the customer IDs of these Supercloud customers.
SELECT customer_id
FROM customer_contracts c
inner join products p 
on c.product_id	 = p.product_id	

group by c.customer_id
having count(DISTINCT product_category) = (
select count(DISTINCT product_category)
from products)
;
