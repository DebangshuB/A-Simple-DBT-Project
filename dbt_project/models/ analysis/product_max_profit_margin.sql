select
    productName, (MSRP - buyPrice) as profitMargin
from
    {{ source("classicmodels", "products") }}
order by
    profitMargin desc