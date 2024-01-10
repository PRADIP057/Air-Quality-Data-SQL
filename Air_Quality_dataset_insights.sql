SELECT * FROM qualityair.air_quality_dataset
limit 10;

-- What are the top 10 cities with the highest average pollutant levels on December 26, 2023?
select city ,avg(pollutant_avg) as Avg_poll
from qualityair.air_quality_dataset
group by city
order by Avg_poll desc
limit 10;


-- Which 5 state has the overall worst air quality on December 26, 2023?
select state ,avg(pollutant_avg) as Avg_poll
from qualityair.air_quality_dataset
group by state
order by Avg_poll desc
limit 5;

-- What are the top 10 station with the highest average pollutant levels on December 26, 2023?
select station ,avg(pollutant_avg) as Avg_poll
from qualityair.air_quality_dataset
group by station
order by Avg_poll desc
limit 10;

-- What is the highest pollutant level recorded on December 26, 2023, and in which city did it occur?
with Pollutant_details as (
select pollutant_id as pollutant,max(pollutant_max) as Highest_poll_level
from qualityair.air_quality_dataset
group by pollutant_id)

select city , pollutant_id,pollutant_max
from qualityair.air_quality_dataset
where (pollutant_max , pollutant_id)   in (select Highest_poll_level ,pollutant from Pollutant_details)
order by 3 desc;

-- What is the distribution of pollutant levels across different states on December 26, 2023?
select state ,pollutant_id,avg(pollutant_avg) as Avg_Level
from qualityair.air_quality_dataset
group by state,pollutant_id;

-- Which pollutants are most commonly observed across all stations on December 26, 2023?
select pollutant_id , count(station) as present_at_total_no_station
from qualityair.air_quality_dataset
group by pollutant_id
order by count(station) desc;

-- Identify the stations that experienced a sudden and significant increase (more than double)
-- in pollutant levels compared to the country's average on December 26, 2023.
with country_avg as (
select avg(pollutant_avg) as counryAvg 
from qualityair.air_quality_dataset
)
select station , latitude,longitude,pollutant_avg
from qualityair.air_quality_dataset,country_avg
where pollutant_avg >= 2*counryAvg;

--  cities where the air quality remained consistently good (below average country) 
--  on December 26, 2023.

select distinct city as GoodAirQualityCity ,avg(pollutant_max) as Avg_Max_pollutant_level
from qualityair.air_quality_dataset

group by city
having avg(pollutant_max) < (select avg(pollutant_min) as counryMinAvg 
							from qualityair.air_quality_dataset) ;

-- contribution of each pollutant at contry level in percentage
select pollutant_id , 100*sum(pollutant_avg)/(select sum(pollutant_avg) from qualityair.air_quality_dataset)
 as Percentage_contribution_overall
from qualityair.air_quality_dataset
group by pollutant_id;

-- Calculate the percentage contribution of each pollutant to the overall pollutant levels at on December 26, 2023,
--  for a specific state.
with State_info_with_pollutant as(
 select state,pollutant_id ,sum(pollutant_avg) as avg_poll_in_state
from qualityair.air_quality_dataset
group by  state,pollutant_id
)

 select state ,pollutant_id,(100*avg_poll_in_state/sum(avg_poll_in_state) over (partition by state) )as precentage_contribution
 from State_info_with_pollutant
 order by 1;
 
 -- find pollutant_id with max_pollutant level along with state it occure
with poll_info as (
select pollutant_id,max(pollutant_max) as Max_level
from qualityair.air_quality_dataset
group by pollutant_id
),
state_info as(
select state ,pollutant_id,max(pollutant_max) as Max_level_state
from qualityair.air_quality_dataset
group by state ,pollutant_id
)

select state , pollutant_id,Max_level_state
from state_info 
where (pollutant_id,Max_level_state) in (select * from poll_info )
order by 3 desc;



