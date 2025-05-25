--project status
WITH project_status AS (
    SELECT 
        project_id,
        project_name,
        project_budget,
        'upcoming' AS status 
    FROM [upcoming projects]
    
    UNION
    
    SELECT 
        project_id,
        project_name,
        project_budget,
        'completed' AS status
    FROM [completed_projects]
)

-- big table
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    e.job_title,
    e.salary,
    d.Department_name,
	p.project_id,
    p.project_name,
    p.status
FROM employees e
JOIN departments d
    ON e.department_id = d.Department_ID
JOIN project_assignments pa
    ON e.employee_id = pa.employee_id
JOIN project_status p
    ON pa.project_id = p.project_id;


