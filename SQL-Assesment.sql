USE userprogresssdb;

SELECT * FROM userprogresssdb.users;
-- 1. Analyse the data
-- Hint: use a SELECT statement via a JOIN to sample the data
-- ****************************************************************
-- What is the common attribute between the twotables? to perform a join
SELECT u.*, p.*
FROM users u JOIN progress p
ON u.user_id = p.user_id

-- 2. What are the Top 25 schools (.edu domains)?
-- Hint: use an aggregate function to COUNT() schools with most students
-- ****************************************************************
SELECT email_domain as "Top 25 Schools!", count(email_domain) as students
FROM users u
GROUP BY email_domain
ORDER by students DESC
limit 25;

-- 3. How many .edu learners are located in New York?
-- Hint: use an aggregate function to COUNT() students in New York
-- ****************************************************************

SELECT city, COUNT (*) AS ".edu leaners"
FROM Users
WHERE city = 'New York'
-- GROUP BY city
-- ORDER BY city

-- 4. The mobile_app column contains either mobile-user or NULL. 
-- How many of these learners are using the mobile app?
-- Hint: COUNT()...WHERE...IN()...GROUP BY...
-- Hint: Alternate answers are accepted.
-- ****************************************************************
SELECT mobile_app, COUNT (*) AS "Mobile app users"
FROM users
WHERE mobile_app = 'mobile-user'


-- 5. Query for the sign up counts for each hour.
-- Hint: https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html#function_date-format 
-- ****************************************************************users
SELECT hour(sign_up_at) AS "Hour",COUNT (*) AS "Sign ups for each hour"
FROM users
GROUP BY hour(sign_up_at)
ORDER BY hour(sign_up_at)

-- 6. What courses are the New Yorker Students taking?
-- Hint: SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking C++"
-- ****************************************************************
SELECT 
    SUM(CASE WHEN p.learn_cpp NOT IN ('') THEN 1 ELSE 0 END) AS "New Yorker learners taking C++",
    SUM(CASE WHEN p.learn_html NOT IN ('') THEN 1 ELSE 0 END) AS "New Yorker learners taking HTML",
    SUM(CASE WHEN p.learn_javascript NOT IN ('') THEN 1 ELSE 0 END) AS "New Yorker learners taking javascript",
    SUM(CASE WHEN p.learn_java NOT IN ('') THEN 1 ELSE 0 END) AS "New Yorker learners taking Java"
FROM users u
JOIN progress p ON u.user_id = p.user_id
WHERE u.city = 'New York';


-- 7. What courses are the Chicago Students taking?
-- Hint: SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking C++"
-- ****************************************************************

SELECT 
    SUM(CASE WHEN p.learn_cpp NOT IN ('') THEN 1 ELSE 0 END) AS "Chicago learners taking C++",
    SUM(CASE WHEN p.learn_html NOT IN ('') THEN 1 ELSE 0 END) AS "Chicago learners taking HTML",
    SUM(CASE WHEN p.learn_javascript NOT IN ('') THEN 1 ELSE 0 END) AS "Chicago learners taking javascript",
    SUM(CASE WHEN p.learn_java NOT IN ('') THEN 1 ELSE 0 END) AS "Chicago learners taking Java"
FROM users u
JOIN progress p ON u.user_id = p.user_id
WHERE u.city = 'Chicago';
