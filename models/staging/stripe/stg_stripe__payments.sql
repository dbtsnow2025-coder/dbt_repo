SELECT 
    id as payment_id,
    ORDERID as order_id,
    PAYMENTMETHOD as payment_method,
    STATUS as status,
    AMOUNT / 100 as amount
FROM {{ source('stripe', 'tb_payment') }}