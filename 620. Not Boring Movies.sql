Select id, movie, description, rating
From cinema
Where mod(id,2) = 1 and description != 'boring'
Order by rating desc
