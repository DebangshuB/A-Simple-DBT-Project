with order_delay as (
    select
        od.productCode, (o.shippedDate - o.orderDate) as delay
    from
        {{ source("classicmodels", "orders") }} as o
    inner join
        {{ source("classicmodels", "orderdetails") }} as od
    on
        o.orderNumber = od.orderNumber
    where
        o.status = "Shipped"
)

select
    p.productName, avg(delay) as avgDelay
from
    order_delay as o
inner join
    {{ source("classicmodels", "products")}} as p
on
    o.productCode = p.productCode
group by
    p.productName
order by
    avgDelay desc