select
    c.salesRepEmployeeNumber, avg(cm.profitMarginCustomer) as profit
from
    {{ ref("customer_max_profit") }} as cm
inner join
    {{ source("classicmodels", "customers") }} as c
on
    cm.customerNumber = c.customerNumber
group by
    c.salesRepEmployeeNumber
order by
    profit desc