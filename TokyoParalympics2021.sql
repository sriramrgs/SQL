--About the Data: This data consist of Number of medals and rankings of each country in 2021 Tokyo Paralympics
--Aim of the analysis: To perform basic SQL manipulations with the dataset

-- View the Dataset
Select * 
from dbo.Paralympic_Medal_Count

-- Sort the Countries in alphabetical order using Column Index
Select * 
from dbo.Paralympic_Medal_Count
order by 1

-- Sort the Countries by Total medals won using Column Name
Select Team_Npc,MAX(CAST(total_medals as int)) as total
from dbo.Paralympic_Medal_Count
group by Team_Npc
order by total desc

-- Sort the Countries by their rank
Select Team_Npc, total_medals, CONVERT(int,rank_by_total) as rank
from dbo.Paralympic_Medal_Count
order by rank asc

--Find the Medal tally of India
Select * 
from dbo.Paralympic_Medal_Count
where Team_Npc = 'India'

--Find Top 5  countries based on Total medals won
Select top 5 Team_npc,total_medals 
from dbo.Paralympic_Medal_Count

--Find Top 5  countries with highest number of Gold medals
Select top 5 Team_Npc, Gold
from dbo.Paralympic_Medal_Count

--Find Countries with No Gold or Silver medals
Select Team_Npc, Gold, Silver
from dbo.Paralympic_Medal_Count
where Gold = '0'
and silver = '0'

--Find Medal tally of Countries having "States" in their name
Select *
from dbo.Paralympic_Medal_Count
where Team_Npc LIKE '%States%'

--Find total number of Countries who have won Gold medals
Select count(Team_Npc) as CountrieswithGold
from dbo.Paralympic_Medal_Count
where Gold <= '1'

--Create a summary view with total number of countries and medals
Create View SummaryParalympics as 
Select 
count(Team_NPC) as TotalCountriesparticipated, 
sum(cast(Gold as int)) as TotalGoldwon, 
sum(cast(Silver as int)) as TotalSilverwon, 
sum(cast(Bronze as int)) as TotalBronzewon
from dbo.Paralympic_Medal_Count
