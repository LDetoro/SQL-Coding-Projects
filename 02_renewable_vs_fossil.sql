-- Renewable Energy by Region
SELECT 
  region, 
  SUM(hydropower_and_pumped_storage + wind + solar) AS total_renewable_energy 
FROM 
  intel.energy_data 
GROUP BY 
  region 
ORDER BY 
  total_renewable_energy DESC;

-- Renewable Energy Percentage by Region
SELECT 
  region, 
  (SUM(hydropower_and_pumped_storage + wind + solar) / SUM(net_generation)) * 100 AS renewable_percentage 
FROM 
  intel.energy_data 
GROUP BY 
  region 
ORDER BY 
  renewable_percentage DESC;

-- Renewable Energy Time Series
SELECT 
  date, 
  region, 
  (hydropower_and_pumped_storage + wind + solar) AS energy_generated_mw, 
  'renewable energy' AS energy_type 
FROM 
  intel.energy_data

UNION

-- Fossil Fuel Energy Time Series
SELECT 
  date, 
  region, 
  (all_petroleum_products + coal + natural_gas + nuclear) AS energy_generated_mw, 
  'fossil fuel' AS energy_type 
FROM 
  intel.energy_data;
