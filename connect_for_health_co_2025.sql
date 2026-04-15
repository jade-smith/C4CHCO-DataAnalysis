-- ============================================================
-- Connect for Health Colorado
-- Open Enrollment Report — Plan Year 2025
-- SQL Project: Schema + Data + Analysis Queries
-- Source: 2025-By-the-Numbers-Report.pdf
-- ============================================================

-- ============================================================
-- SETUP
-- ============================================================
CREATE DATABASE IF NOT EXISTS connect_health_co_2025;
USE connect_health_co_2025;


-- ============================================================
-- TABLE 1: STATEWIDE SUMMARY METRICS
-- ============================================================
DROP TABLE IF EXISTS statewide_summary;
CREATE TABLE statewide_summary (
    metric_id        INT AUTO_INCREMENT PRIMARY KEY,
    plan_year        INT          NOT NULL DEFAULT 2025,
    category         VARCHAR(100) NOT NULL,
    metric_name      VARCHAR(200) NOT NULL,
    metric_value     DECIMAL(18,2),
    metric_text      VARCHAR(500),
    unit             VARCHAR(50)  -- e.g. 'count', 'percent', 'dollars', 'text'
);

INSERT INTO statewide_summary (plan_year, category, metric_name, metric_value, metric_text, unit) VALUES
-- Enrollment totals
(2025, 'Enrollment',  'Total covered Coloradans (Marketplace + Colorado Connect)', 296449,  NULL, 'count'),
(2025, 'Enrollment',  'Marketplace enrollments',                                   282481,  NULL, 'count'),
(2025, 'Enrollment',  'Colorado Connect enrollments',                               13968,  NULL, 'count'),
(2025, 'Enrollment',  'Dental plan enrollments',                                    80272,  NULL, 'count'),
(2025, 'Enrollment',  'YoY enrollment growth (%)',                                     19,  NULL, 'percent'),
(2025, 'Enrollment',  'Returning customer enrollments',                            233434,  NULL, 'count'),
(2025, 'Enrollment',  'Returning customers (%)',                                       83,  NULL, 'percent'),
(2025, 'Enrollment',  'New customer enrollments',                                   49047,  NULL, 'count'),
-- Prior year comparison
(2024, 'Enrollment',  'Marketplace enrollments',                                   237107,  NULL, 'count'),
(2024, 'Enrollment',  'Colorado Connect enrollments',                               12485,  NULL, 'count'),
-- Colorado Option
(2025, 'Plan Choice', 'Colorado Option enrollments',                               132640,  NULL, 'count'),
(2024, 'Plan Choice', 'Colorado Option enrollments',                                80244,  NULL, 'count'),
(2025, 'Plan Choice', 'Colorado Option share of Marketplace (%)',                      47,  NULL, 'percent'),
(2024, 'Plan Choice', 'Colorado Option share of Marketplace (%)',                      34,  NULL, 'percent'),
-- Financials
(2025, 'Financial Assistance', 'Total federal tax credits ($)',                 972558880,  NULL, 'dollars'),
(2025, 'Financial Assistance', 'Additional federal help vs prior year ($)',     305550918,  NULL, 'dollars'),
(2025, 'Financial Assistance', 'Customers receiving financial help (%)',               80,  NULL, 'percent'),
(2025, 'Financial Assistance', 'Avg monthly net premium with help ($)',              138,  NULL, 'dollars'),
(2025, 'Financial Assistance', 'Avg monthly premium without help ($)',               470,  NULL, 'dollars'),
(2025, 'Financial Assistance', 'Avg monthly help for customers 55+ ($)',             807,  NULL, 'dollars'),
(2025, 'Financial Assistance', 'Customers finding plan ≤$10/month (%)',               60,  NULL, 'percent'),
(2025, 'Financial Assistance', 'Customers receiving Cost-Sharing Reductions',      82331,  NULL, 'count'),
-- Operations
(2025, 'Operations', 'Full-time employees',                                          211,  NULL, 'count'),
(2025, 'Operations', 'Annual budget ($)',                                       54000000,  NULL, 'dollars'),
(2025, 'Operations', 'Health plans offered on Marketplace',                          143,  NULL, 'count'),
(2025, 'Operations', 'Health insurance companies offering plans',                      6,  NULL, 'count'),
(2025, 'Operations', 'Dental plans offered',                                          12,  NULL, 'count'),
(2025, 'Operations', 'Dental insurance companies',                                     4,  NULL, 'count'),
-- Brokers & Assistance
(2025, 'Assistance', 'Licensed/certified Brokers',                                  1773,  NULL, 'count'),
(2025, 'Assistance', 'New Brokers certified',                                         409,  NULL, 'count'),
(2025, 'Assistance', 'Assistance Network organizations',                               51,  NULL, 'count'),
(2025, 'Assistance', 'Community-based Assisters',                                     350,  NULL, 'count'),
(2025, 'Assistance', 'Enrollments with Broker or Assister help (%)',                   66,  NULL, 'percent'),
(2025, 'Assistance', 'Customers enrolled via Broker',                              177774,  NULL, 'count'),
(2025, 'Assistance', 'Broker enrollment growth YoY (%)',                               24,  NULL, 'percent'),
(2025, 'Assistance', 'Assister enrollment growth YoY (%)',                             21,  NULL, 'percent'),
(2025, 'Assistance', 'OmniSalud customers enrolled with help (%)',                     87,  NULL, 'percent'),
(2025, 'Assistance', 'Assister appointments in non-English (%)',                       53,  NULL, 'percent'),
-- Customer service
(2025, 'Customer Service', 'Total calls answered',                                  76582,  NULL, 'count'),
(2025, 'Customer Service', 'Average calls per day',                                  1536,  NULL, 'count'),
(2025, 'Customer Service', 'Peak calls (Dec 2)',                                      2682,  NULL, 'count'),
(2025, 'Customer Service', 'Calls answered in ≤5 minutes (%)',                         95,  NULL, 'percent'),
(2025, 'Customer Service', 'Customer satisfaction rate (%)',                            87,  NULL, 'percent'),
-- Enrollment centers
(2025, 'Enrollment Centers', 'Total Enrollment Centers',                               63,  NULL, 'count'),
(2025, 'Enrollment Centers', 'New Enrollment Centers added',                           17,  NULL, 'count'),
(2025, 'Enrollment Centers', 'Marketplace enrollments via Enrollment Centers (%)',     20,  NULL, 'percent'),
(2025, 'Enrollment Centers', 'Rural customers via Enrollment Centers (%)',             31,  NULL, 'percent'),
(2025, 'Enrollment Centers', 'Enrollment Center customers receiving financial help (%)', 85, NULL, 'percent'),
-- Community & outreach
(2025, 'Outreach', 'Community partners',                                              580,  NULL, 'count'),
(2025, 'Outreach', 'New community partners added',                                     50,  NULL, 'count'),
(2025, 'Outreach', 'Total sponsorships and events',                                   140,  NULL, 'count'),
(2025, 'Outreach', 'Urban outreach events',                                            92,  NULL, 'count'),
(2025, 'Outreach', 'Rural outreach events',                                            35,  NULL, 'count'),
-- Web/Marketing
(2025, 'Marketing', 'Website page visits',                                        1520486,  NULL, 'count'),
(2025, 'Marketing', 'Unique English website users',                                648191,  NULL, 'count'),
(2025, 'Marketing', 'English campaign website visits',                            1010074,  NULL, 'count'),
(2025, 'Marketing', 'English campaign impressions',                              82110608,  NULL, 'count'),
(2025, 'Marketing', 'Spanish/bilingual campaign impressions',                    11668740,  NULL, 'count'),
(2025, 'Marketing', 'Spanish/bilingual campaign website visitors',                  75572,  NULL, 'count'),
(2025, 'Marketing', 'Video viewability rate (%)',                                       90,  NULL, 'percent'),
(2025, 'Marketing', 'Video impressions',                                          17262140,  NULL, 'count'),
(2025, 'Marketing', 'Animated video total impressions',                            7241784,  NULL, 'count'),
(2025, 'Marketing', 'Animated video clicks to website',                              35917,  NULL, 'count'),
-- Age demographics
(2025, 'Demographics', 'Enrollments age 55+  (%)',                                     30,  NULL, 'percent'),
(2025, 'Demographics', 'Enrollments age 0-25 (%)',                                     21,  NULL, 'percent'),
(2025, 'Demographics', 'Enrollments age 26-34 (%)',                                    16,  NULL, 'percent'),
(2025, 'Demographics', 'Enrollments age 35-44 (%)',                                    17,  NULL, 'percent'),
(2025, 'Demographics', 'Enrollments age 45-54 (%)',                                    16,  NULL, 'percent');


-- ============================================================
-- TABLE 2: RURAL VS URBAN SUMMARY
-- ============================================================
DROP TABLE IF EXISTS rural_urban_summary;
CREATE TABLE rural_urban_summary (
    id                    INT AUTO_INCREMENT PRIMARY KEY,
    plan_year             INT          NOT NULL DEFAULT 2025,
    area_type             VARCHAR(20)  NOT NULL,  -- 'Rural' or 'Urban'
    total_enrollments     INT,
    avg_net_premium_fin   DECIMAL(10,2),  -- with financial help
    customers_pct_of_total DECIMAL(5,2)
);

INSERT INTO rural_urban_summary (plan_year, area_type, total_enrollments, avg_net_premium_fin) VALUES
(2025, 'Rural', 74194,  140.00),
(2025, 'Urban', 208287, 137.00);


-- ============================================================
-- TABLE 3: ENROLLMENTS BY COUNTY
-- ============================================================
DROP TABLE IF EXISTS enrollments_by_county;
CREATE TABLE enrollments_by_county (
    id               INT AUTO_INCREMENT PRIMARY KEY,
    county_name      VARCHAR(100) NOT NULL,
    enrollments_2024 INT,
    enrollments_2025 INT,
    pct_change       DECIMAL(6,2) GENERATED ALWAYS AS (
                        ROUND(((enrollments_2025 - enrollments_2024) / enrollments_2024) * 100, 2)
                     ) STORED
);

INSERT INTO enrollments_by_county (county_name, enrollments_2024, enrollments_2025) VALUES
('Adams',      13969, 18951),
('Alamosa',      486,   590),
('Arapahoe',   24644, 31150),
('Archuleta',   1239,  1392),
('Baca',         209,   248),
('Bent',         101,   144),
('Boulder',    19230, 21607),
('Broomfield',  3400,  4160),
('Chaffee',     2085,  2527),
('Cheyenne',      64,    75),
('Clear Creek',  493,   534),
('Conejos',      229,   267),
('Costilla',     102,   122),
('Crowley',       65,    97),
('Custer',       301,   362),
('Delta',       1742,  2153),
('Denver',     28825, 35568),
('Dolores',      109,   118),
('Douglas',    16961, 19753),
('Eagle',       3818,  4354),
('El Paso',    19283, 22922),
('Elbert',      1209,  1319),
('Fremont',     1147,  1380),
('Garfield',    3313,  3912),
('Gilpin',       267,   313),
('Grand',       1305,  1384),
('Gunnison',    2493,  2827),
('Hinsdale',      42,    52),
('Huerfano',     308,   402),
('Jackson',       72,    73),
('Jefferson',  26288, 30151),
('Kiowa',         65,    84),
('Kit Carson',   323,   424),
('La Plata',    4806,  5242),
('Lake',         366,   415),
('Larimer',    17077, 19794),
('Las Animas',   466,   555),
('Lincoln',      162,   201),
('Logan',        715,   865),
('Mesa',        6584,  7618),
('Mineral',      111,   123),
('Moffat',       428,   504),
('Montezuma',    966,  1126),
('Montrose',    2218,  2635),
('Morgan',       736,   843),
('Otero',        461,   547),
('Ouray',        619,   726),
('Park',         980,  1039),
('Phillips',     261,   306),
('Pitkin',      1781,  2019),
('Prowers',      458,   566),
('Pueblo',      3330,  4231),
('Rio Blanco',   296,   310),
('Rio Grande',   440,   551),
('Routt',       2760,  3062),
('Saguache',     312,   346),
('San Juan',      91,   125),
('San Miguel',  1270,  1385),
('Sedgwick',      67,    91),
('Summit',      2758,  2910),
('Teller',       977,  1061),
('Washington',   302,   335),
('Weld',       10554, 12891),
('Yuma',         567,   644);


-- ============================================================
-- TABLE 4: COSTS BY COUNTY — FINANCIALLY ASSISTED CUSTOMERS
-- ============================================================
DROP TABLE IF EXISTS costs_financially_assisted;
CREATE TABLE costs_financially_assisted (
    id                      INT AUTO_INCREMENT PRIMARY KEY,
    county_name             VARCHAR(100)  NOT NULL,
    plan_year               INT           NOT NULL DEFAULT 2025,
    avg_monthly_premium     DECIMAL(10,2),  -- submitted/gross premium
    avg_monthly_aptc        DECIMAL(10,2),  -- Advance Premium Tax Credit
    avg_monthly_net_premium DECIMAL(10,2)   -- what customer actually pays
);

INSERT INTO costs_financially_assisted (county_name, avg_monthly_premium, avg_monthly_aptc, avg_monthly_net_premium) VALUES
('Adams',       551.37, 441.30, 110.07),
('Alamosa',     660.22, 549.97, 110.26),
('Arapahoe',    558.31, 443.97, 114.33),
('Archuleta',   732.49, 598.87, 133.63),
('Baca',        665.98, 574.82,  91.16),
('Bent',        729.54, 627.78, 101.76),
('Boulder',     565.81, 389.43, 176.38),
('Broomfield',  554.45, 410.82, 143.64),
('Chaffee',     672.07, 535.17, 136.91),
('Cheyenne',    644.95, 550.18,  94.77),
('Clear Creek', 577.98, 418.53, 159.45),
('Conejos',     669.45, 570.71,  98.74),
('Costilla',    848.68, 759.34,  89.35),
('Crowley',     771.89, 674.47,  97.41),
('Custer',      817.75, 696.04, 121.71),
('Delta',       694.39, 587.87, 106.51),
('Denver',      527.45, 406.45, 121.00),
('Dolores',     786.15, 681.94, 104.21),
('Douglas',     582.60, 419.16, 163.44),
('Eagle',       671.80, 489.59, 182.20),
('El Paso',     597.60, 455.68, 141.92),
('Elbert',      603.05, 445.84, 157.20),
('Fremont',     741.71, 614.31, 127.40),
('Garfield',    756.13, 625.82, 130.31),
('Gilpin',      629.13, 493.02, 136.11),
('Grand',       738.20, 554.69, 183.51),
('Gunnison',    697.53, 561.78, 135.74),
('Hinsdale',    955.02, 786.24, 168.78),
('Huerfano',    790.71, 696.98,  93.73),
('Jackson',     913.53, 811.40, 102.13),
('Jefferson',   574.99, 423.48, 151.51),
('Kiowa',       677.95, 548.95, 129.00),
('Kit Carson',  630.14, 524.41, 105.74),
('La Plata',    659.43, 511.36, 148.07),
('Lake',        711.52, 554.64, 156.87),
('Larimer',     571.92, 429.97, 141.95),
('Las Animas',  788.24, 692.16,  96.08),
('Lincoln',     693.66, 571.37, 122.29),
('Logan',       690.09, 582.37, 107.72),
('Mesa',        620.39, 465.58, 154.81),
('Mineral',     622.13, 509.76, 112.36),
('Moffat',      684.42, 567.50, 116.92),
('Montezuma',   738.34, 599.59, 138.75),
('Montrose',    826.77, 733.99,  92.78),
('Morgan',      710.84, 593.93, 116.91),
('Otero',       748.68, 644.61, 104.07),
('Ouray',       789.71, 674.76, 114.96),
('Park',        615.35, 468.48, 146.87),
('Phillips',    609.53, 477.93, 131.60),
('Pitkin',      737.95, 583.77, 154.18),
('Prowers',     633.19, 531.50, 101.69),
('Pueblo',      629.83, 511.90, 117.94),
('Rio Blanco',  668.00, 526.91, 141.09),
('Rio Grande',  705.09, 575.01, 130.08),
('Routt',       631.80, 457.24, 174.56),
('Saguache',    754.63, 657.65,  96.99),
('San Juan',    719.08, 553.31, 165.77),
('San Miguel',  708.26, 576.13, 132.12),
('Sedgwick',    740.25, 617.91, 122.34),
('Summit',      651.85, 481.29, 170.56),
('Teller',      691.26, 533.38, 157.88),
('Washington',  652.63, 544.64, 107.98),
('Weld',        559.49, 425.02, 134.47),
('Yuma',        615.23, 491.84, 123.39);


-- ============================================================
-- TABLE 5: COSTS BY COUNTY — NON-FINANCIALLY ASSISTED
-- ============================================================
DROP TABLE IF EXISTS costs_non_financially_assisted;
CREATE TABLE costs_non_financially_assisted (
    id                      INT AUTO_INCREMENT PRIMARY KEY,
    county_name             VARCHAR(100) NOT NULL,
    plan_year               INT          NOT NULL DEFAULT 2025,
    avg_monthly_net_premium DECIMAL(10,2)
);

INSERT INTO costs_non_financially_assisted (county_name, avg_monthly_net_premium) VALUES
('Adams',       428.87),
('Alamosa',     535.21),
('Arapahoe',    453.91),
('Archuleta',   640.18),
('Baca',        466.16),
('Bent',        432.40),
('Boulder',     461.92),
('Broomfield',  457.25),
('Chaffee',     550.38),
('Cheyenne',    496.92),
('Clear Creek', 487.43),
('Conejos',     545.97),
('Costilla',    485.89),
('Crowley',     555.35),
('Custer',      564.52),
('Delta',       580.27),
('Denver',      436.08),
('Dolores',     664.86),
('Douglas',     484.68),
('Eagle',       580.83),
('El Paso',     487.13),
('Elbert',      422.41),
('Fremont',     575.95),
('Garfield',    600.83),
('Gilpin',      439.66),
('Grand',       693.69),
('Gunnison',    644.88),
('Hinsdale',    845.01),
('Huerfano',    614.28),
('Jackson',     629.38),
('Jefferson',   457.27),
('Kiowa',       600.57),
('Kit Carson',  443.66),
('La Plata',    569.92),
('Lake',        575.13),
('Larimer',     462.83),
('Las Animas',  644.45),
('Lincoln',     617.00),
('Logan',       544.08),
('Mesa',        483.13),
('Mineral',     550.20),
('Moffat',      560.34),
('Montezuma',   581.04),
('Montrose',    655.63),
('Morgan',      539.03),
('Otero',       530.94),
('Ouray',       675.51),
('Park',        459.72),
('Phillips',    469.34),
('Pitkin',      629.70),
('Prowers',     503.09),
('Pueblo',      455.58),
('Rio Blanco',  553.07),
('Rio Grande',  523.42),
('Routt',       540.72),
('Saguache',    741.63),
('San Juan',    517.78),
('San Miguel',  680.51),
('Sedgwick',    509.17),
('Summit',      563.92),
('Teller',      574.15),
('Washington',  516.39),
('Weld',        435.56),
('Yuma',        559.66);


-- ============================================================
-- TABLE 6: NEW ENROLLMENTS BY COUNTY (NON-FINANCIALLY ASSISTED)
-- ============================================================
DROP TABLE IF EXISTS new_enrollments_non_assisted;
CREATE TABLE new_enrollments_non_assisted (
    id                     INT AUTO_INCREMENT PRIMARY KEY,
    county_name            VARCHAR(100) NOT NULL,
    plan_year              INT          NOT NULL DEFAULT 2025,
    new_medical_enrollments INT
);

INSERT INTO new_enrollments_non_assisted (county_name, new_medical_enrollments) VALUES
('Adams',       709), ('Alamosa',    13), ('Arapahoe',  1166), ('Archuleta',   24),
('Baca',          5), ('Bent',        2), ('Boulder',   1071), ('Broomfield',  224),
('Chaffee',      63), ('Cheyenne',    4), ('Clear Creek', 29), ('Conejos',       1),
('Costilla',      1), ('Crowley',     2), ('Custer',      5),  ('Delta',         28),
('Denver',     1994), ('Dolores',     1), ('Douglas',   934),  ('Eagle',        146),
('El Paso',     870), ('Elbert',     61), ('Fremont',    18),  ('Garfield',     107),
('Gilpin',        7), ('Grand',      36), ('Gunnison',   76),  ('Hinsdale',       0),
('Huerfano',     10), ('Jackson',     0), ('Jefferson', 1409), ('Kiowa',          2),
('Kit Carson',    5), ('La Plata',  106), ('Lake',       10),  ('Larimer',      744),
('Las Animas',    9), ('Lincoln',     2), ('Logan',      23),  ('Mesa',         206),
('Mineral',       0), ('Moffat',     12), ('Montezuma',  17),  ('Montrose',      28),
('Morgan',        6), ('Otero',       3), ('Ouray',      12),  ('Park',          47),
('Phillips',      4), ('Pitkin',     66), ('Prowers',     8),  ('Pueblo',       116),
('Rio Blanco',    8), ('Rio Grande', 14), ('Routt',     117),  ('Saguache',       2),
('San Juan',      2), ('San Miguel', 25), ('Sedgwick',    1),  ('Summit',       116),
('Teller',       18), ('Washington',  5), ('Weld',      533),  ('Yuma',          10);


-- ============================================================
-- ANALYSIS QUERIES
-- ============================================================

-- ----------------------------------------
-- Q1: Top 15 counties by 2025 enrollments
-- ----------------------------------------
SELECT
    county_name,
    enrollments_2024,
    enrollments_2025,
    pct_change AS yoy_pct_change,
    RANK() OVER (ORDER BY enrollments_2025 DESC) AS enrollment_rank
FROM enrollments_by_county
ORDER BY enrollments_2025 DESC
LIMIT 15;


-- ----------------------------------------
-- Q2: Top 15 fastest-growing counties (YoY %)
-- ----------------------------------------
SELECT
    county_name,
    enrollments_2024,
    enrollments_2025,
    pct_change AS yoy_pct_change
FROM enrollments_by_county
ORDER BY pct_change DESC
LIMIT 15;


-- ----------------------------------------
-- Q3: Full county cost comparison
--     (financially assisted vs not)
-- ----------------------------------------
SELECT
    e.county_name,
    e.enrollments_2025,
    fa.avg_monthly_premium      AS gross_premium_assisted,
    fa.avg_monthly_aptc         AS avg_tax_credit,
    fa.avg_monthly_net_premium  AS net_premium_assisted,
    nfa.avg_monthly_net_premium AS net_premium_unassisted,
    ROUND(nfa.avg_monthly_net_premium - fa.avg_monthly_net_premium, 2) AS savings_from_assistance
FROM enrollments_by_county e
LEFT JOIN costs_financially_assisted     fa  ON e.county_name = fa.county_name
LEFT JOIN costs_non_financially_assisted nfa ON e.county_name = nfa.county_name
ORDER BY e.enrollments_2025 DESC;


-- ----------------------------------------
-- Q4: Highest average APTC (tax credit) counties
-- ----------------------------------------
SELECT
    county_name,
    avg_monthly_aptc,
    avg_monthly_net_premium,
    ROUND((avg_monthly_aptc / avg_monthly_premium) * 100, 1) AS aptc_pct_of_gross_premium
FROM costs_financially_assisted
ORDER BY avg_monthly_aptc DESC
LIMIT 15;


-- ----------------------------------------
-- Q5: Most affordable counties for assisted customers
-- ----------------------------------------
SELECT
    county_name,
    avg_monthly_net_premium AS net_monthly_cost
FROM costs_financially_assisted
ORDER BY avg_monthly_net_premium ASC
LIMIT 15;


-- ----------------------------------------
-- Q6: Most expensive counties (unassisted customers)
-- ----------------------------------------
SELECT
    county_name,
    avg_monthly_net_premium
FROM costs_non_financially_assisted
ORDER BY avg_monthly_net_premium DESC
LIMIT 15;


-- ----------------------------------------
-- Q7: New enrollment hotspots (non-assisted)
-- ----------------------------------------
SELECT
    ne.county_name,
    ne.new_medical_enrollments,
    e.enrollments_2025         AS total_2025_enrollments,
    ROUND((ne.new_medical_enrollments / e.enrollments_2025) * 100, 1) AS new_pct_of_total
FROM new_enrollments_non_assisted ne
JOIN enrollments_by_county        e  ON ne.county_name = e.county_name
ORDER BY ne.new_medical_enrollments DESC
LIMIT 15;


-- ----------------------------------------
-- Q8: Statewide KPI dashboard
-- ----------------------------------------
SELECT
    category,
    metric_name,
    COALESCE(
        CONCAT('$', FORMAT(metric_value, 0)),
        metric_text
    ) AS formatted_value,
    unit,
    plan_year
FROM statewide_summary
WHERE plan_year = 2025
ORDER BY category, metric_name;


-- ----------------------------------------
-- Q9: YoY comparison — key metrics
-- ----------------------------------------
SELECT
    cur.metric_name,
    cur.metric_value  AS value_2025,
    prev.metric_value AS value_2024,
    ROUND(((cur.metric_value - prev.metric_value) / prev.metric_value) * 100, 1) AS pct_change
FROM statewide_summary cur
JOIN statewide_summary prev
    ON cur.metric_name = prev.metric_name
    AND cur.plan_year  = 2025
    AND prev.plan_year = 2024
ORDER BY pct_change DESC;


-- ----------------------------------------
-- Q10: Rural vs Urban comparison
-- ----------------------------------------
SELECT
    area_type,
    total_enrollments,
    avg_net_premium_fin,
    ROUND((total_enrollments / SUM(total_enrollments) OVER()) * 100, 1) AS pct_of_total
FROM rural_urban_summary
WHERE plan_year = 2025;


-- ----------------------------------------
-- Q11: Counties with highest total financial assistance
--      (estimated: enrollments × avg APTC)
-- ----------------------------------------
SELECT
    fa.county_name,
    e.enrollments_2025,
    fa.avg_monthly_aptc,
    ROUND(e.enrollments_2025 * fa.avg_monthly_aptc, 0) AS est_monthly_total_aptc,
    ROUND(e.enrollments_2025 * fa.avg_monthly_aptc * 12, 0) AS est_annual_total_aptc
FROM costs_financially_assisted fa
JOIN enrollments_by_county       e ON fa.county_name = e.county_name
ORDER BY est_annual_total_aptc DESC
LIMIT 15;


-- ----------------------------------------
-- Q12: Counties where new unassisted enrollments
--      exceed 100 (high market-rate growth areas)
-- ----------------------------------------
SELECT
    ne.county_name,
    ne.new_medical_enrollments,
    nfa.avg_monthly_net_premium,
    e.enrollments_2025
FROM new_enrollments_non_assisted ne
JOIN costs_non_financially_assisted nfa ON ne.county_name = nfa.county_name
JOIN enrollments_by_county           e  ON ne.county_name = e.county_name
WHERE ne.new_medical_enrollments >= 100
ORDER BY ne.new_medical_enrollments DESC;
