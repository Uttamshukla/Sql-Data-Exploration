select * from dbo.[Covid Record];

select * from dbo.[covid vaccination];

select * from [covid database].dbo.[Covid Record];

 -- ordering done on the basis of location and date 
select location, date, total_cases, total_deaths, new_cases, population from [covid database]..[Covid Record]
order by 1,2;   

-- Total deaths against total cases in percentage 
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_to_case_ratio
from [covid database]..[Covid Record]
order by 1,2;  

alter table [covid database]..[Covid Record] -- changed data type of two columns to float for division purpose
alter column total_cases float;


-- Countries with highest infection compared to population 

select location, MAX(total_cases) as highest_number_of_cases
from [covid database]..[Covid Record]
where continent is not null
group by location
order by highest_number_of_cases desc; 



-- Total population vs total vaccinations done

select cr.continent, cr.location, cr.population, cv.total_vaccinations 
from [covid database]..[Covid Record] cr
join [covid database]..[covid vaccination] cv
on cr.location= cv.location
and cr.date= cv.date
where cr.continent is not null
order by 1,2





 

