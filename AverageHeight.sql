--Average height Men & Women (1896 - 1996)
	select * from PortfolioProject..average_height_by_birth_year
	
--1. 
  
	-- Max avg height for male & women, height difference between male & women
	
	select 
		round(avg(Mean_male),2) Male, round(avg(Mean_female),2) Female, round(abs(avg(Mean_male) - avg(Mean_female)),2) 'Height Difference'
	from PortfolioProject..average_height_by_birth_year
	where Code is null
		
--2.
	
	-- Difference in height for male and female in 1896 and 1996 by region
	
	 select Entity, year, round(Mean_male - Mean_female,2) 'Height Difference'
	 from PortfolioProject..average_height_by_birth_year
	 where code is null
--3.

	-- Height differences (1896 - 1996) for each region

	select  
		t2.Entity, round((t2.Mean_male - t1.Mean_male),2) Mean_male, round((t2.Mean_female - t1.Mean_female),2) Mean_female
	from
		(select *
		from PortfolioProject..average_height_by_birth_year
		where Code is null
		and year in (1896, 1996)) t2
		inner join
		(select *
		from PortfolioProject..average_height_by_birth_year
		where Code is null
		and year in (1896, 1996)) t1
	on t2.Entity = t1.Entity
	where t1.year < t2.year 
	
		

--4.

	-- Countries ranking by height difference between male and female on map

	select 
		Entity, Code, round(avg(Mean_male) - avg(Mean_female),2) 'Height Difference'
	from PortfolioProject..average_height_by_birth_year
	where Code is not null
	group by entity, code
	order by 'Height Difference' desc