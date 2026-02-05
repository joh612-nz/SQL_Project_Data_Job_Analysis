
/*
UNION OPERATORS
    - Get the corresponding skill and skill type for each job posting in q1
    - Includes those withouy any skills, too
    - Why? Look at the skills and the type for each job in the first quarter that has a salary > $70,000
*/


WITH sk AS (
    SELECT
        skills_dim.skill_id, 
        skills_dim.skills,
        skills_dim.type,
        skills_job_dim.job_id AS job_id
    FROM
        skills_dim 
    LEFT JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
)

SELECT 
    jan.job_id,
    jan.job_title_short,
    jan.salary_year_avg,
    jan.job_posted_date,
    sk.skill_id,
    sk.skills,
    sk.type
FROM
    january_2023_jobs AS jan
LEFT JOIN sk ON jan.job_id = sk.job_id
WHERE 
    jan.salary_year_avg >70000

UNION ALL

SELECT 
    feb.job_id,
    feb.job_title_short,
    feb.salary_year_avg,
    feb.job_posted_date,
    sk.skill_id,
    sk.skills,
    sk.type
FROM
    february_2023_jobs AS feb
LEFT JOIN sk ON feb.job_id = sk.job_id
WHERE 
    feb.salary_year_avg >70000

UNION ALL

SELECT 
    mar.job_id,
    mar.job_title_short,
    mar.salary_year_avg,
    mar.job_posted_date,
    sk.skill_id,
    sk.skills,
    sk.type
FROM
    march_2023_jobs AS mar
LEFT JOIN sk ON mar.job_id = sk.job_id
WHERE 
    mar.salary_year_avg >70000
ORDER BY job_posted_date;