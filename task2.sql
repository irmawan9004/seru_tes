SELECT 
    teachers.name AS teacher_name,
    GROUP_CONCAT(classes.name ORDER BY classes.name SEPARATOR ', ') AS classes_taught
FROM 
    classes
JOIN 
    teachers ON classes.teacher_id = teachers.id
GROUP BY 
    teachers.name;
