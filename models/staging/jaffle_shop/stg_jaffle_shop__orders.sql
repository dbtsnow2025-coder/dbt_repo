    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from db_raw.sc_jaffle_shop.tb_orders