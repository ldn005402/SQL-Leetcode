select users.name as NAME, sum(transactions.amount) as BALANCE
from users
join transactions on users.account = transactions.account
group by users.account
having sum(transactions.amount) > 10000
