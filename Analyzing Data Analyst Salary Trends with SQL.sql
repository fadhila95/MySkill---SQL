select * from ds_salaries;

-- 1. apakah ada data yang NULL?
SELECT *
from ds_salaries
where work_year IS NULL
OR experience_level IS NULL
OR employment_type IS NULL
OR job_title IS NULL
OR salary IS NULL
OR salary_currency IS NULL
OR salary_in_usd IS NULL
OR employee_residence IS NULL
OR remote_ratio IS NULL
OR company_location IS NULL
OR company_size IS NULL;

-- 2. melihat ada job_title apa saja
select distinct job_title
from ds_salaries
order by job_title;

-- 3. melihat job_title apa saja yang berkaitan dengan data analyst
select distinct job_title
from ds_salaries
where job_title like '%data analyst%'
order by job_title;

-- 4. berapa rata-rata gaji data analyst
select (avg(salary_in_usd) * 15000) /12 as avg_sal_rp_monthly
from ds_salaries;

-- 4.1 berapa rata-rata gaji data analyst berdasarkan experience levelnya?
select experience_level, 
	(avg(salary_in_usd) * 15000) /12 as avg_sal_rp_monthly
from ds_salaries
group by experience_level;

-- 4.2 berapa rata-rata gaji data analyst berdasarkan experience level dan employment typenya?
select experience_level, 
	employment_type,
	(avg(salary_in_usd) * 15000) /12 as avg_sal_rp_monthly
from ds_salaries
group by experience_level, 
	employment_type
order by experience_level, employment_type;

-- 5. negara dengan gaji yang menarik untuk posisi data analyst, full time
select company_location, 
	avg(salary_in_usd) as avg_sal_in_usd
from ds_salaries
where job_title like '%data analyst%'
	and employment_type = 'FT'
	and experience_level in ('MI', 'EN')
group by company_location
having avg_sal_in_usd >= 20000;

-- 6. di tahun berapa kenaikan gaji dari mid ke senior itu memiliki kenaikan yang tertinggi
-- (untuk pekerjaan yang berkaitan dengan data analyst yang penuh waktu)
with ds_1 as (
	select work_year,
		avg(salary_in_usd) sal_in_usd_ex
	from ds_salaries
	where
		employment_type = 'FT'
        and experience_level = 'EX'
        and job_title like '%data analyst%'
	group by work_year
), ds_2 as (
	select work_year,
		avg(salary_in_usd) sal_in_usd_mi
	from ds_salaries
	where
		employment_type = 'FT'
        and experience_level = 'MI'
        and job_title like '%data analyst%'
	group by work_year
) select ds_1.work_year,
		ds_1.sal_in_usd_ex,
        ds_2.sal_in_usd_mi,
        ds_1.sal_in_usd_ex - ds_2.sal_in_usd_mi differences
from ds_1 
left outer join ds_2 
	on ds_1.work_year = ds_2.work_year;

with ds_1 as (
	select work_year,
		avg(salary_in_usd) sal_in_usd_ex
	from ds_salaries
	where
		employement_type = 'FT'
        and experience_level = 'EX'
        and job_title like '%data analyst%'
	group by work_year
), ds_2 as (
	select work_year,
		avg(salary_in_usd) sal_in_usd_mi
	from ds_salaries
	where
		employement_type = 'FT'
        and experience_level = 'MI'
        and job_title like '%data analyst%'
	group by work_year
) select ds_1.work_year,
		ds_1.sal_in_usd_ex,
        ds_2.sal_in_usd_mi,
        ds_1.sal_in_usd_ex - ds_2.sal_in_usd_mi differences
from ds_1 
right join ds_2 
	on ds_1.work_year = ds_2.work_year;
    
-- 7. di tahun berapa kenaikan gaji dari mid ke senior itu memiliki kenaikan yang tertinggi
-- munculin semua tahun, termasuk 2020 dan isi-isi valuesnya
with ds_1 as (
	select work_year,
		avg(salary_in_usd) sal_in_usd_ex
	from ds_salaries
	where
		employment_type = 'FT'
        and experience_level = 'EX'
        and job_title like '%data analyst%'
	group by work_year
), ds_2 as (
	select work_year,
		avg(salary_in_usd) sal_in_usd_mi
	from ds_salaries
	where
		employment_type = 'FT'
        and experience_level = 'MI'
        and job_title like '%data analyst%'
	group by work_year
), t_year as (
	select distinct work_year
	from ds_salaries
) select t_year.work_year,
		ds_1.sal_in_usd_ex,
        ds_2.sal_in_usd_mi,
        ds_1.sal_in_usd_ex - ds_2.sal_in_usd_mi differences
from t_year 
left join ds_1 on ds_1.work_year = t_year.work_year
left join ds_2 on ds_2.work_year = t_year.work_year;