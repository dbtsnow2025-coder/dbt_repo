with orders as (
    SELECT * FROM {{ ref('stg_jaffle_shop__orders') }}
)
SELECT sum(customer_id) as sum_cust
from orders
group by order_id
having sum_cust < 0