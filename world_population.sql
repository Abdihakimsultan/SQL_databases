create table world_population (
rank int,
cca3 varchar(3),
country_territory varchar(100),
capital varchar(100),
continent varchar(50),
Population_2022 BIGINT,
Population_2020 BIGINT,
Population_2015 BIGINT,
Population_2010 BIGINT,
Population_2000 BIGINT,
Population_1990 BIGINT,
Population_1980 BIGINT,
Population_1970 BIGINT,
Area_km2 float,
Density_km2 float,
Growth_rate float,
World_Population_Percentage float
)
select * from world_population;
-- top 10 populous countries in 2022
select country_territory, population_2022 from world_population
order by population_2022 desc
limit 10;
-- select countries in Asia only
select country_territory, population_2022 from world_population
where continent = 'Asia'
order by population_2022 desc;

-- select countries with over 100 million population in 2022
select country_territory, population_2022 from world_population
where population_2022 > 100000000
order by population_2022 desc
-- select countries with land in their name
select country_territory, population_2022 from world_population 
where country_territory like '%land%';

-- total world population 2022
select sum(population_2022) as total_world_population
from world_population;

-- average population by continent
select continent, avg(population_2022) as average_population 
from world_population
group by continent
order by average_population desc;

-- count the number of countries in each continent
select continent, count(country_territory) as count_countries
from world_population
group by continent 
order by count_countries desc;

-- view list of countries in oceania continent
select country_territory 
from world_population
where continent = 'Oceania'
order by country_territory;
-- find population change from 2020 to 2022
select country_territory, population_2022 - population_2020 as population_change
from world_population
order by population_change desc;

-- list africa population by country from highest to lowest
select country_territory, population_2022
from world_population
where continent ='Africa'
order by population_2022 desc;

select country_territory, density_km2, 
	CASE
		WHEN density_km2 < 50 THEN 'Low'
		WHEN density_km2 >= 50 AND density_km2 < 200 THEN 'Medium'
		ELSE 'High'
	END AS density_category
from world_population;

-- top 10 fastest growing countries
select country_territory, growth_rate
from world_population
order by growth_rate desc
limit 10;
-- countries that lost population between 2020 and 2022
select country_territory, population_2022, population_2020
from world_population
where population_2022 < population_2020;

-- population percentage by continent
select continent, sum(world_population_percentage) as population_per_continent
from world_population
group by continent
order by population_per_continent desc;

