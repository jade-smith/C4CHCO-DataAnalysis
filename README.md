# Connect for Health Colorado — Open Enrollment 2025
## SQL + Power BI + Tableau Analytics Project

A data analytics portfolio project built from the **Connect for Health Colorado 2025 Open Enrollment Report** ("By the Numbers"). This project transforms the PDF report's raw data into a relational database with analysis queries and two BI dashboards.

---

## 📊 Project Overview

| File | Description |
|------|-------------|
| `connect_for_health_co_2025.sql` | MySQL schema, all data inserts, and 12 analysis queries |
| `connect_for_health_co_2025.twb` | Tableau Desktop workbook (3 dashboards, 7 worksheets) |
| `connect_for_health_co_2025_powerbi.pbit` | Power BI template (5 report pages, DAX measures, M queries) |

**Data source:** [Connect for Health Colorado 2025 Open Enrollment Report](https://connectforhealthco.com)  
**Plan year:** 2025 | **Counties covered:** All 64 Colorado counties

---

## 🗄️ Database Schema

```
connect_health_co_2025/
├── statewide_summary              (65 rows — KPIs across 7 categories)
├── enrollments_by_county          (64 rows — 2024 & 2025 with computed YoY %)
├── costs_financially_assisted     (64 rows — gross premium, APTC, net premium)
├── costs_non_financially_assisted (63 rows — unassisted market rate premiums)
├── new_enrollments_non_assisted   (64 rows — new market-rate signups by county)
└── rural_urban_summary            (2 rows  — rural vs urban aggregates)
```

All county tables join on `county_name`. The `enrollments_by_county` table includes a **computed `pct_change` column** (MySQL generated column — no manual calculation needed).

---

## 🚀 Getting Started

### Prerequisites
- MySQL 8.0+ (or MariaDB 10.6+)
- [Tableau Desktop](https://www.tableau.com/products/desktop) (free trial available)
- [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free)
- MySQL ODBC Driver (for Power BI connection)

### 1 — Load the SQL Project

```bash
# Create the database and load all data
mysql -u root -p < connect_for_health_co_2025.sql

# Verify it loaded
mysql -u root -p -e "USE connect_health_co_2025; SHOW TABLES;"
```

### 2 — Open in Tableau

1. Open **Tableau Desktop**
2. **File → Open** → select `connect_for_health_co_2025.twb`
3. When prompted for a connection, enter your MySQL server credentials
4. Worksheets and dashboards populate automatically

### 3 — Open in Power BI

1. Open **Power BI Desktop**
2. **File → Import → Power BI template** → select `connect_for_health_co_2025_powerbi.pbit`
3. Enter your MySQL server/database when prompted
4. Apply the theme JSON (in the `.pbit` file under Section 6) via **View → Themes → Browse**

---

## 🔍 Key Analysis Queries

The SQL file includes 12 pre-built queries:

| # | Query | Insight |
|---|-------|---------|
| Q1 | Top 15 counties by 2025 enrollment | Denver, Arapahoe, Jefferson lead |
| Q2 | Top 15 fastest-growing counties (YoY %) | Crowley +49%, Bent +43%, San Juan +37% |
| Q3 | Full cost comparison by county | Side-by-side assisted vs unassisted |
| Q4 | Highest average APTC counties | Jackson ($811), Costilla ($759) |
| Q5 | Most affordable counties (assisted) | Costilla ($89), Montrose ($93) |
| Q6 | Most expensive counties (unassisted) | Hinsdale ($845), Saguache ($742) |
| Q7 | New unassisted enrollment hotspots | Denver 1,994; Jefferson 1,409 |
| Q8 | Full KPI dashboard pull | All 65 statewide metrics |
| Q9 | YoY comparison for tracked metrics | Enrollment, Colorado Option, financial help |
| Q10 | Rural vs Urban breakdown | 26% rural, avg premium $140 vs $137 |
| Q11 | Estimated annual tax credits by county | Adams ~$100M, Arapahoe ~$165M |
| Q12 | Market-rate growth counties (100+ new) | High-income growth areas |

---

## 📈 Dashboard Pages

### Tableau (3 Dashboards)
1. **Executive Summary** — KPI tiles, enrollment by county bar, age/customer type donut charts
2. **Cost Analysis** — APTC scatter plot, assisted vs unassisted comparison, savings ranking
3. **Growth & Expansion** — Top growth counties, new enrollment hotspots

### Power BI (5 Report Pages)
1. **Executive Summary** — Cards, top county bar, customer breakdowns
2. **County Enrollment Map** — Filled Colorado map + growth table
3. **Cost & Affordability** — Premium comparison scatter, APTC analysis
4. **Growth & New Enrollments** — New enrollment bars + county map
5. **Rural vs Urban Analysis** — Side-by-side comparisons, treemap

---

## 📌 Key Findings from the Data

- **296,449** Coloradans covered — a **19% increase** over prior year (5th consecutive record)
- **80%** of customers received financial help averaging **$138/month** net premium
- **$972.6 million** in total federal tax credits distributed
- **3 in 5** customers found a plan for **$10/month or less** after credits
- Rural counties dominated growth: **12 of the top 15 fastest-growing counties** are rural
- Colorado Option plans surged — up **65% YoY**, now representing **47%** of all enrollments
- Customer satisfaction reached **87%** — nearly 40% higher than five years ago

---

## 🛠️ Potential Extensions

- Add a `plan_metal_tier` table with Bronze/Silver/Gold/Catastrophic distribution by county
- Connect to the [Colorado Health Access Survey](https://www.coloradohealthinstitute.org/) for demographic overlays
- Build a time-series table to compare 2021–2025 enrollment trends
- Add a `zip_code_to_county` mapping table for more granular geographic analysis
- Create a Python ETL script to scrape future annual reports automatically

---

## 📄 Data Notes

All data is sourced from the publicly available Connect for Health Colorado 2025 Open Enrollment Report. County-level premium data reflects plan year 2025 enrollment averages. The `pct_change` column in `enrollments_by_county` is a MySQL generated column and does not need to be manually maintained.

---

## 📬 Contact

Built for portfolio purposes. Data is public domain — feel free to fork and extend.
