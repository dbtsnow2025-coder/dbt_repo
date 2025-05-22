with orders as (

    SELECT * FROM
    {{ ref("stg_jaffle_shop__orders") }}

),

payments as (

    SELECT * FROM
    {{ ref("stg_stripe__payments")}}
),
order_payments as (
    SELECT order_id,
        sum(case when status = 'success' then amount end) as amount
    from payments
    group by 1
),
final as (

    SELECT 
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce (order_payments.amount, 0) as amount
    FROM orders
    left join order_payments using (order_id)
)
select * FROM final

