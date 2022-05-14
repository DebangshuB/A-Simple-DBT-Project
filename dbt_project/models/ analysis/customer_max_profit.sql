with customer_joined as (
    select
        o.customerNumber, sum(od.profitMargin) as profitMarginCustomer
    from
        {{ ref("order_profit_margin") }} as od
    inner join
        {{ source("classicmodels", "orders") }} as o
    on
        od.orderNumber = o.orderNumber
    group by
        o.customerNumber
    order by
        profitMarginCustomer desc
)

select * from customer_joined