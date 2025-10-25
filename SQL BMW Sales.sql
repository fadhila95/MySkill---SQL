--Tren Penjualan Tahunan
SELECT
  Year,
  SUM(Sales_Volume) AS Total_Sales
FROM
  dqlab-sql-python-470813.bmw_data.bmw_table
GROUP BY
  Year
ORDER BY
  Year;

--Pendapatan per Tahun
SELECT
  Year,
  SUM(Price_USD) AS Total_Revenue
FROM
  dqlab-sql-python-470813.bmw_data.bmw_table
GROUP BY
  Year
ORDER BY
  Year;

--Transmisi vs Volume Penjualan (Donut Chart)
SELECT
  Transmission,
  SUM(Sales_Volume) AS Total_Sales
FROM
  dqlab-sql-python-470813.bmw_data.bmw_table
GROUP BY
  Transmission;

--Sales Volume by Jenis Bahan Bakar (Fuel_Type)
SELECT
  Fuel_Type,
  SUM(Sales_Volume) AS Total_Sales
FROM
  dqlab-sql-python-470813.bmw_data.bmw_table
GROUP BY
  Fuel_Type;

--5 Model Terlaris
SELECT
  Model,
  SUM(Sales_Volume) AS Total_Sales
FROM
  dqlab-sql-python-470813.bmw_data.bmw_table
GROUP BY Model
ORDER BY Total_Sales DESC
LIMIT 5;

--Sales Volume dan Price USD menurut Warna (Color)
SELECT
  Color,
  SUM(Sales_Volume) AS Total_Sales,
  SUM(Price_USD) AS Total_Revenue
FROM
  dqlab-sql-python-470813.bmw_data.bmw_table
GROUP BY
  Color;

--Penjualan per Region & Tahun (Stacked Bar)
SELECT
  Region,
  Year,
  SUM(Sales_Volume) AS Total_Sales
FROM
  dqlab-sql-python-470813.bmw_data.bmw_table
GROUP BY
  Region, Year
ORDER BY
  Year;

--Total Penjualan (Scorecard)
SELECT
  SUM(Sales_Volume) AS Total_Sales
FROM
  dqlab-sql-python-470813.bmw_data.bmw_table;

--Total Revenue (Scorecard)
SELECT
  SUM(Price_USD) AS Total_Revenue
FROM
  dqlab-sql-python-470813.bmw_data.bmw_table;

--Average Price (Scorecard)
SELECT
  AVG(Price_USD) AS Average_Price
FROM
  dqlab-sql-python-470813.bmw_data.bmw_table;