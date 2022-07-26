-- 1

SELECT u.id, u.name, c.name AS city 
FROM users u 
JOIN cities c 
ON u."cityId" = c.id 
WHERE c.name = 'Rio de Janeiro';


-- 2

SELECT t.id, u1.name AS writer, u2.name AS recipient, t.message 
FROM testimonials t 
JOIN users u1 
ON t."writerId" = u1.id 
JOIN users u2 
ON t."recipientId" = u2.id;


-- 3

SELECT e."userId" AS id, u.name, c.name AS course, s.name AS school, e."endDate" 
FROM educations e 
JOIN users u 
ON e."userId" = u.id 
JOIN courses c 
ON e."courseId" = c.id 
JOIN schools s 
ON e."schoolId" = s.id 
WHERE (e."userId" = 30 AND e.status = 'finished');


-- 4

SELECT u.id, u.name, r.name AS role, c.name AS company, e."startDate" 
FROM experiences e 
JOIN users u 
ON u.id = e."userId" 
JOIN roles r 
ON r.id = e."roleId" 
JOIN companies c 
ON c.id = e."companyId" 
WHERE (e."userId" = 50 AND e."endDate" IS NULL);


-- Bonus

SELECT s.id, s.name AS school, c.name AS course, cy.name AS company, r.name AS role 
FROM applicants a 
JOIN educations e 
ON a."userId" = e."userId" 
JOIN schools s 
ON s.id = e."schoolId" 
JOIN courses c 
ON c.id = e."courseId" 
JOIN jobs j 
ON j.id = a."jobId" 
JOIN companies cy 
ON cy.id = j."companyId" 
JOIN roles r 
ON r.id = j."roleId" 
WHERE (cy.id = 10 AND r.name = 'Software Engineer' AND j.active IS TRUE);