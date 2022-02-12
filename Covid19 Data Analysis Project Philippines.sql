select *
From [Portfolio Project]..CovidDeaths$
order by 3,4

--select *
--From [Portfolio Project]..CovidVaccinations$
--order by 3,4	

--select data that we are using

Select location, date, total_cases, new_cases,total_deaths,population
From [Portfolio Project]..CovidDeaths$
order by 1,2



-- looking at countries with highest infection rate compared to population
Select location,MAX(total_cases) as HighestInfectionCount, population, Max((total_cases/population))*100 as Infected_percentage_of_population
From [Portfolio Project]..CovidDeaths$
group by Location,Population
order by Infected_percentage_of_population desc

--showing countries with highest death count per population
Select location, max(cast(total_deaths as int)) as totalDeathCount,population, Max((total_cases/population))*100 as Infected_percentage_of_population
From [Portfolio Project]..CovidDeaths$
Where continent is not null
group by location, population
order by totalDeathCount desc

-- looking at total cases vs total deaths
Select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
From [Portfolio Project]..CovidDeaths$
Where location = 'philippines'
order by 1,2

--looking at total cases vs population
Select location, date, total_cases, population, (total_cases/population)*100 as Infected_percentage_of_population
From [Portfolio Project]..CovidDeaths$
Where location = 'philippines'
order by 1,2

-- join vaccination table and covid deaths
Select *
From [Portfolio Project]..CovidDeaths$ dea
	Join [Portfolio Project]..CovidVaccinations$ vac
	 on dea.location = vac.location
	 and dea.date = vac.date
Where dea.location = 'philippines'

-- join vaccination table and covid deaths
Select 
dea.location, dea.date,dea.population,dea.total_cases,dea.total_deaths,
vac.total_vaccinations,vac.people_fully_vaccinated,
(dea.total_deaths/dea.total_cases)*100 as death_percentage,
(vac.people_fully_vaccinated/population)* 100 as VaccinationPercentagebyPopulation
From [Portfolio Project]..CovidDeaths$ dea
	Join [Portfolio Project]..CovidVaccinations$ vac
	 on dea.location = vac.location
	 and dea.date = vac.date
Where dea.location = 'philippines'

