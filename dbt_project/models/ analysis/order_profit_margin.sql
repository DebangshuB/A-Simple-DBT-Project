with order_profit_details as (
    select
        od.orderNumber, od.quantityOrdered, od.priceEach, p.buyPrice
    from
        {{ source("classicmodels", "orderdetails") }} as od
    inner join
        {{ source("classicmodels", "products") }} as p
    on
        od.productCode = p.productCode
)

select
    orderNumber, ((priceEach - buyPrice) * quantityOrdered) as profitMargin
from
    order_profit_details