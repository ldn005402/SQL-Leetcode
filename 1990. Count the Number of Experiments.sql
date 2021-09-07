with t1 as (select *
             from (select 'IOS' as platform 
			 union 
			 select 'Android' as platform 
			 union 
			 select 'Web' as platform) as p, 
			 (select 'Programming' as experiment_name 
			 union 
			 select 'Sports' as experiment_name 
			 union 
			 select 'Reading' as experiment_name) as e)

select t1.platform, t1.experiment_name, ifnull(t2.ct,0) as num_experiments
from t1
left join 
(select platform, experiment_name, count(experiment_id) as ct 
from Experiments
group by platform, experiment_name) t2
on t1.platform = t2.platform and t1.experiment_name = t2.experiment_name
