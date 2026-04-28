create database consumer_financial_complaints;
use consumer_financial_complaints;

---------------------------------------------------------------------------------
-- Presentation palette for the Power BI report
-- Background: #0B0F0E | Visual panel: #121C18 | Text: #FFFFFF
-- Primary graph: #25D0D9 | Secondary graph: #2F80ED
-- Highlight: #F59E0B | Comparison: #7C3AED | Late response: #FF4D4D
---------------------------------------------------------------------------------
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE "secure_file_priv";
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_financial_complaints.csv'
INTO TABLE financial_complaints
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- KPI: total complaint records
select count(*) as Total_Complaints from financial_complaints;

---------------------------------------------------------------------------------
-- KPI pack for Power BI cards
---------------------------------------------------------------------------------
select
    count(`Complaint ID`) as Total_Complaints,
    round(avg(Response_Time_Days), 2) as Average_Response_Days,
    count(distinct Product) as Total_Products,
    count(distinct `Sub-product`) as Total_Sub_Products,
    round(100 * sum(case when `Timely response?` = 'Yes' then 1 else 0 end) / count(*), 2) as Timely_Response_Rate
from financial_complaints;

---------------------------------------------------------------------------------
-- Product categories ranked by complaint volume
---------------------------------------------------------------------------------
select 
	Product, 
    count(`Complaint ID`) as Total_Complaints
from financial_complaints 
group by Product 
order by Total_Complaints desc;

---------------------------------------------------------------------------------
-- Sub-product categories ranked by complaint volume
---------------------------------------------------------------------------------
select 
	`Sub-product`, 
    count(`Complaint ID`) as Total_Complaints
from financial_complaints 
group by `Sub-product`
order by Total_Complaints desc;

---------------------------------------------------------------------------------
-- Complaint intake volume by submission channel
---------------------------------------------------------------------------------
select
	`Submitted via` as Submission_Channel,
    count(`Complaint ID`) as Total_Complaints
from financial_complaints 
group by  `Submitted via`
order by Total_Complaints desc;

---------------------------------------------------------------------------------
-- State-level complaint concentration
---------------------------------------------------------------------------------
select
	State,
    count(`Complaint ID`) as Total_Complaints
from financial_complaints 
group by State
order by Total_Complaints desc;

---------------------------------------------------------------------------------
-- Census region complaint split
---------------------------------------------------------------------------------
select
	Census_Region,
    count(`Complaint ID`) as Total_Complaints
from financial_complaints 
group by Census_Region
order by Total_Complaints desc; 

---------------------------------------------------------------------------------
-- Annual complaint trend
---------------------------------------------------------------------------------
Select 
	year(`Date submitted`) as Complaint_Year,
    count(`Complaint ID`) as Total_Complaints
from financial_complaints
group by year(`Date submitted`)
order by Complaint_Year;

---------------------------------------------------------------------------------
-- Monthly complaint trend
---------------------------------------------------------------------------------
select
	monthname(`Date submitted`) as Complaint_Month,
    count(`Complaint ID`) as Total_Complaints
from financial_complaints
group by month(`Date submitted`), monthname(`Date submitted`)
order by month(`Date submitted`);

---------------------------------------------------------------------------------
-- Month-by-year trend for time-series visuals
---------------------------------------------------------------------------------
select
	year(`Date submitted`) as Complaint_Year,
	month(`Date submitted`) as Complaint_Month,
    count(`Complaint ID`) as Total_Complaints
from financial_complaints
group by 
	year(`Date submitted`),
	month(`Date submitted`)
order by 
	Complaint_Year,
	Complaint_Month;
    
---------------------------------------------------------------------------------
-- Response status split
---------------------------------------------------------------------------------
select 
	`Timely response?` as Timely_Response_Status,
    count(`Timely response?`) as Total_Complaints
from financial_complaints
group by `Timely response?`
order by Total_Complaints desc;

---------------------------------------------------------------------------------
-- Most frequent complaint issues
---------------------------------------------------------------------------------
select
	Issue,
    count(`Timely response?`) as Total_Complaints
from financial_complaints
group by Issue
order by Total_Complaints desc limit 10;

---------------------------------------------------------------------------------
-- Most frequent detailed complaint sub-issues
---------------------------------------------------------------------------------
select
	`Sub-issue`,
    count(`Timely response?`) as Total_Complaints
from financial_complaints
group by `Sub-issue`
order by Total_Complaints desc limit 10;

---------------------------------------------------------------------------------
-- Top three recurring issues inside each product category
---------------------------------------------------------------------------------
SELECT Product, Issue, Complaint_Count
FROM (
    SELECT 
        Product, 
        Issue, 
        COUNT(*) AS Complaint_Count,
        DENSE_RANK() OVER (PARTITION BY Product ORDER BY COUNT(*) DESC) as Issue_Rank
    FROM financial_complaints
    GROUP BY Product, Issue
) AS Ranked_Issues
WHERE Issue_Rank <= 3
ORDER BY Product, Issue_Rank;

---------------------------------------------------------------------------------
-- Companies with the highest timely-response count
---------------------------------------------------------------------------------
select
	Company_ID_1081,
    count(`Timely response?`) as Timely_Responses
from financial_complaints
where `Timely response?` = 'Yes'
group by Company_ID_1081
order by Timely_Responses desc
limit 10;

---------------------------------------------------------------------------------
-- Companies with the highest late-response count
---------------------------------------------------------------------------------
select
	`Company_ID_1081`,
    count(`Timely response?`) as late_Responses
from financial_complaints
where `Timely response?` = 'No'
group by Company_ID_1081
order by late_Responses desc
limit 10;

---------------------------------------------------------------------------------
-- Conditional color helper for Power BI visuals
---------------------------------------------------------------------------------
select
    `Timely response?` as Timely_Response_Status,
    case
        when `Timely response?` = 'Yes' then '#25D0D9'
        when `Timely response?` = 'No' then '#FF4D4D'
        else '#F59E0B'
    end as Dashboard_Color,
    count(`Complaint ID`) as Total_Complaints
from financial_complaints
group by `Timely response?`;
