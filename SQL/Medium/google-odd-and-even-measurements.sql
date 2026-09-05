--Difficulty: Medium
-- Description:Write a query to calculate the sum of odd-numbered and even-numbered measurements separately for a particular day and display the results in two different columns. Refer to the Example Output below for the desired format.
with dk as(
select CAST(measurement_time AS DATE) as measurement_day,	measurement_value,
ROW_NUMBER() over(
partition by CAST(measurement_time AS DATE)
order by measurement_time
) as ranked
from measurements
)
select measurement_day, 
sum(case when ranked%2= 0 then measurement_value else 0 end) as even_sum,
sum(case when ranked%2 != 0 then measurement_value else 0 end) as odd_sum	

from dk 
group by measurement_day

