select min( p1.x - p2.x) as shortest
from point as p1 
join point as p2 on p1.x > p2.x
