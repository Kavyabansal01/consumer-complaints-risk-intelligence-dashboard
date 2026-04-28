# Consumer Complaints Intelligence Dashboard

## Project Overview
This project studies consumer financial complaint records and turns them into a practical reporting workflow. The analysis follows the data from preparation in Python, structured querying in SQL, and final business presentation in Power BI.

The dashboard is designed to answer four questions quickly:

* How many complaints were received, and how fast were they handled?
* Which products, states, companies, and submission channels create the highest complaint volume?
* Where do late responses appear most often?
* Which complaint patterns should be prioritized by an operations or compliance team?

## Tools Used
* **Python:** data cleaning, feature creation, exploratory analysis
* **Pandas and NumPy:** tabular transformation and validation
* **Matplotlib and Seaborn:** exploratory visuals with custom dashboard colors
* **MySQL:** grouped analysis, ranking logic, KPI-ready query outputs
* **Power BI:** interactive dashboard pages, slicers, KPI cards, and visual storytelling

## Visual Style
The report has been customized into a dark executive style with cooler graph colors:

* **Page Background:** `#0B0F0E`
* **Visual Panel:** `#121C18`
* **Primary Text:** `#FFFFFF`
* **Soft Text:** `#B8D8C0`
* **Main Graph Color:** `#25D0D9`
* **Secondary Graph Color:** `#2F80ED`
* **Highlight Color:** `#F59E0B`
* **Comparison Color:** `#7C3AED`
* **Late Response Color:** `#FF4D4D`

To apply the Power BI style, open the dashboard and choose:

`View > Themes > Browse for themes`

Then select:

`PowerBI/Consumer_Complaints_Black_Blue_Theme.json`

## Project Files
* **Redesigned Power BI Dashboard:** `PowerBI/Consumer_Complaints_Redesigned_Openable.pbix`
* **Power BI Theme:** `PowerBI/Consumer_Complaints_Black_Blue_Theme.json`
* **Power BI Customization Guide:** `PowerBI/PowerBI_Visual_Customization_Guide.md`
* **Cleaned Dataset:** `Python/Consumer_Complaints_Cleaned_Data.csv`
* **Data Preparation Notebook:** `Python/Consumer_Complaints_Data_Preparation.ipynb`
* **EDA Notebook:** `Python/Consumer_Complaints_EDA_Black_Theme.ipynb`
* **SQL Analysis:** `SQL/Consumer_Complaints_SQL_Analysis.sql`
* **Project Report:** `Report/Consumer_Complaints_Analysis_Report.pdf`
* **Dashboard Screenshots:** `Outputs/Risk Overview .png`, `Outputs/Project and Company risk insights.png`, `Outputs/Response Quality and Resolution Trends.png`

## Workflow
### 1. Data Preparation
The Python notebook standardizes date fields, handles missing categorical values, prepares response-time features, and creates region-level groupings for geographic analysis.

### 2. SQL Analysis
The SQL script calculates dashboard-ready summaries such as complaint totals, product rankings, monthly trends, response status counts, and company-level response performance.

### 3. Power BI Reporting
The Power BI report presents three pages:

* **Executive Overview:** high-level KPIs, monthly movement, timely response split, and state-level volume
* **Company & Product Insights:** complaint-heavy products, sub-products, issues, and company tiers
* **Complaints & Response Analysis:** submission channels, response outcomes, region split, and timely response patterns

## Key Insights
* Complaint volume is concentrated in a small set of financial products, especially credit reporting and banking-related categories.
* July shows a visible complaint increase, which may be useful for staffing and monitoring decisions.
* Most complaints receive timely responses, but late-response records should be reviewed separately because they carry higher compliance risk.
* A few states and companies contribute a large share of total volume, making them good candidates for focused investigation.

## Originality Note
The project wording has been rewritten in a custom style for this version. The analysis, file names, color palette, and dashboard documentation have also been adjusted so the portfolio presentation feels more personal and less template-based.
