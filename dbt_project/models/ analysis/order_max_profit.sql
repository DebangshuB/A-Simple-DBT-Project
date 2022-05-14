select
    orderNumber, sum(profitMargin) as profitMarginCustomer
from
    {{ ref("order_profit_margin") }}
group by
    orderNumber
order by
    sum(profitMargin) desc