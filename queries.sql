
-- Query 1: County rankings

SELECT
    e.`County Name`,
    SUM(e.`Fifth Grade` + e.`Sixth Grade` + e.`Seventh Grade` + e.`Eighth Grade`) AS middle_school_sum
FROM enrollments as e
JOIN title1_allocations as t
    ON UPPER(TRIM(REPLACE(e.`District Name`, ' School District', ''))) 
     = UPPER(TRIM(t.District))
WHERE t.funds > 0
GROUP BY e.`County Name`
ORDER BY middle_school_sum DESC;

-- Query 2: School rankings within districts

SELECT
    e.`County Name`,
    e.`District Name`,
    e.`School Name`,
    SUM(e.`Fifth Grade` + e.`Sixth Grade` + e.`Seventh Grade` + e.`Eighth Grade`) AS middle_school_sum
FROM enrollments as e
JOIN title1_allocations t
    ON UPPER(TRIM(REPLACE(e.`District Name`, ' School District', ''))) 
     = UPPER(TRIM(t.District))
WHERE t.funds > 0
GROUP BY e.`County Name`, e.`District Name`, e.`School Name`
having middle_school_sum > 0
ORDER BY e.`District Name`, middle_school_sum DESC;
 
