select distinct sta_0.* 
from stadium as sta_0, (
    select case
            when people>=100 then @count:=@count+1
            else @count:=0
        end as total, id
    from stadium, (select @count:=0) as temp
) as sta_1 
where 
sta_1.total >= 3 and 
sta_0.id <= sta_1.id and 
sta_0.id >= sta_1.id - sta_1.total + 1;
