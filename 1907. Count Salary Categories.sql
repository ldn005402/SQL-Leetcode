select 'Low Salary' AS category, sum(income<20000) as accounts_count
from accounts


union all

select
'Average Salary' AS category, sum(income between 20000 and 50000 ) as accounts_count
from accounts


union all

select
'High Salary' AS category, sum(income>50000) as accounts_count
from accounts
