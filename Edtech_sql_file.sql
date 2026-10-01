create database edtech;

use edtech;

show tables;

select * from edtech_tab
limit 10;

SELECT * FROM edtechq.edtech_table;

# 1. Top Engaged Students Based on Activity
SELECT student_id, engagement_score
FROM edtech.edtech_tab
ORDER BY engagement_score DESC
LIMIT 10;

# 2. Dropout Rate by Subscription Type 
SELECT subscription_type,
       ROUND(AVG(completion_flag = 0) * 100, 2) AS dropout_rate
FROM edtechq.edtech_table
GROUP BY subscription_type;

# 3. Average Session Time by Device
SELECT device_type,
       ROUND(AVG(avg_session_time), 2) AS avg_session_time
FROM edtech.edtech_tab
GROUP BY device_type;

# 4. Completion Rate by Location
SELECT location,
       ROUND(AVG(completion_flag = 1) * 100, 2) AS completion_rate
FROM edtechq.edtech_table
GROUP BY location;

# 5. Students with High Risk but Low Activity
SELECT student_id, dropout_risk_score, engagement_score
FROM edtech.edtech_tab
WHERE dropout_risk_score >= 70
  AND engagement_score <= 30;
  
# 6. Monthly Active Users Trend
SELECT DATE_FORMAT(last_login_date, '%Y-%m') AS month,
       COUNT(DISTINCT student_id) AS active_users
FROM edtech.edtech_tab
GROUP BY month
ORDER BY month ASC;

# 7. Correlation Between Engagement and Completion
SELECT completion_status,
       ROUND(AVG(engagement_score), 2) AS avg_engagement
FROM edtech.edtech_tab
GROUP BY completion_status;