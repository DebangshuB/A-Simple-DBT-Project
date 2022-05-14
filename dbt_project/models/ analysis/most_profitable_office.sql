select
    e.officeCode, sum(profit) as totalOfficeProfit
from
    {{ ref("most_profitable_salesman") }} as ps
inner join
    {{ source("classicmodels", "employees") }} as e
on
    e.employeeNumber = ps.salesRepEmployeeNumber
group by
    e.officeCode
order by
    totalOfficeProfit desc