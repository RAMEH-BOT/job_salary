select * from job_salary_prediction_dataset ;
select job_title , round(avg(salary),2) as avg_salary from job_salary_prediction_dataset 
group by job_title 
order by avg_salary  desc ;

# The impact of education level on salary 

select education_level , round(avg(salary),2) as avg_salary from job_salary_prediction_dataset 
group by education_level 
order by avg_salary desc ;


# Classifying employees based on remote work and its impact on salary 

select 
   case 
      when remote_work = "yes" then "Remote"
      when remote_work = "No" then "On-site"
      else "Hzdbrid" 
      end as work_type, 
      avg(salary) as avg_salary 
      from job_salary_prediction_dataset 
      group by work_type; 
      
	# The Highest salaries for each job 
    
    select job_title , salary , experience_years , education_level ,
    rank() over (partition by job_title order by salary desc) as rank_in_job 
    from job_salary_prediction_dataset ;
    
    
    # Impact the number of skills on the salary 
    
    select skills_count , avg(salary)  as avg_salary 
    from job_salary_prediction_dataset 
    group by skills_count 
    order by skills_count asc ;  
    
    
    # the top salary by country 
    
    create view top_salary_by_country as 
    select * 
    from (select 
    location , job_title , salary , 
    row_number() over (partition by location order by salary desc ) as rn 
    from job_salary_prediction_dataset 
    ) t
    where rn = 1 ; 
    
    
    select * from top_salary_by_country ;
    
    
    
      
      