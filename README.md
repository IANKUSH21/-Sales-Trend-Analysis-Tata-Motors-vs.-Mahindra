
# 🚗 Sales Trend Analysis: Tata Motors vs. Mahindra

![Mahindra vs Tata Motors](https://wp-api.pocketful.in/blog/wp-content/uploads/2024/09/Mahindra-Mahindra-vs-Tata-Motors.jpg)


## 📌 Project Overview

This project presents a comprehensive SQL-based analysis of sales data from Tata Motors and Mahindra over a six-month period. By leveraging structured queries, the project uncovers key insights into sales performance, model comparisons, and market trends, providing valuable information for stakeholders and automotive enthusiasts.

## 🧰 Tools & Technologies

- **Database Management System:** MySQL
- **Data Analysis:** SQL (Structured Query Language)
- **Data Visualization:** [Optional: Tableau, Power BI, or Excel]
- **Version Control:** Git & GitHub

## 📂 Dataset Description

The analysis is based on two primary datasets:

1. **Tata_Motor_Sales**
   - **Columns:** Period, Punch, Nexon, Tiago, Curvv, Altroz, Safari, Harrier, Tigor
   - **Description:** Monthly sales figures for various Tata Motors models.

2. **Mahindra_Sales**
   - **Columns:** Period, Scorpio_Scorpio_N, XUV700, Thar_Roxx, XUV_3XO, Bolero_Neo, BE6_9E, XUV400, Marazzo
   - **Description:** Monthly sales figures for various Mahindra models.

*Note: All sales figures are represented as text fields and may require casting to numerical types for analysis.*

## 🎯 Objectives

- **Total Sales Analysis:** Calculate total sales per model and per month.
- **Performance Comparison:** Identify months where one company outperformed the other.
- **Model Insights:** Determine best and worst-performing models.
- **Trend Analysis:** Analyze sales trends over the six-month period.
- **Electric Vehicle (EV) Focus:** Assess the performance of EV models like Curvv and XUV400.
- **Market Share Evaluation:** Evaluate each company's market share and dominance over time.

## 📊 Key Findings

- **Top Performing Models:** Identified the highest-selling models for each company.
- **Sales Trends:** Observed significant growth/decline trends in specific models.
- **EV Market Penetration:** Analyzed the adoption rate and sales figures of EV models.
- **Market Leadership:** Determined which company led in sales during specific months.

## 📁 Repository Structure

```
├── data/
│   ├── tata_motor_sales.csv
│   └── mahindra_sales.csv
├── queries/
│   ├── total_sales_analysis.sql
│   ├── performance_comparison.sql
│   ├── model_insights.sql
│   ├── trend_analysis.sql
│   └── ev_focus.sql
├── visualizations/
│   ├── sales_trends.png
│   └── ev_sales_comparison.png
├── README.md
└── LICENSE
```

## 📝 Usage Instructions

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/sales-trend-analysis.git
   ```

2. **Import Data:**
   - Use the provided CSV files to populate your MySQL database.
   - Ensure proper data types are set for accurate analysis.

3. **Execute Queries:**
   - Navigate to the `queries/` directory.
   - Run the desired SQL scripts using your preferred MySQL client.

4. **Visualize Results:**
   - Utilize the `visualizations/` directory to view generated charts.
   - [Optional] Use tools like Tableau or Power BI for interactive dashboards.

## 🧠 Skills Demonstrated

- **SQL Proficiency:** Advanced querying techniques including JOINs, GROUP BY, subqueries, and CTEs.
- **Data Cleaning:** Handling and converting text-based numerical data.
- **Analytical Thinking:** Deriving meaningful insights from raw data.
- **Data Visualization:** Presenting data in an understandable and impactful manner.
- **Version Control:** Maintaining project versions and collaboration using Git.

## 📈 Sample Queries

- **Average Monthly Sales for Nexon and XUV400:**
  ```sql
  SELECT 
      ROUND(AVG(CAST(t.Nexon AS UNSIGNED)), 2) AS Avg_Nexon_Sales,
      ROUND(AVG(CAST(m.XUV400 AS UNSIGNED)), 2) AS Avg_XUV400_Sales
  FROM tata_motor_sales AS t
  JOIN mahindra_sales AS m ON t.Period = m.Period;
  ```

- **Month with Minimum Thar_Roxx and Safari Sales:**
  ```sql
  SELECT 
      t.Period,
      CAST(m.Thar_Roxx AS UNSIGNED) AS Thar_Roxx_Sales,
      CAST(t.Safari AS UNSIGNED) AS Safari_Sales
  FROM tata_motor_sales AS t
  JOIN mahindra_sales AS m ON t.Period = m.Period
  ORDER BY (CAST(m.Thar_Roxx AS UNSIGNED) + CAST(t.Safari AS UNSIGNED)) ASC
  LIMIT 1;
  ```

## 📬 Contact

For any queries or collaboration opportunities:

- **Email:** [ ak547874@gmail.com ]
- **LinkedIn:** [ Ankush kumar ( www.linkedin.com/in/ankush-kumar-59017919a ) ]
- **GitHub:** ( https://github.com/IANKUSH21 )

---

