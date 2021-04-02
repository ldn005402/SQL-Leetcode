Select Name as 'Customers'
From Customers
Left Join Orders on Customers.id = Orders.id
Where orders.customerid is null
