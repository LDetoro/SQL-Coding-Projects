-- Join Power Plants and Energy by Plant
SELECT  
    pp.plant_name, 
    pp.plant_code, 
    pp.region, 
    pp.state, 
    pp.primary_technology, 
    ebp.energy_type, 
    ebp.energy_generated_mw 
FROM  
    intel.power_plants pp 
INNER JOIN  
    intel.energy_by_plant ebp 
ON  
    pp.plant_code = ebp.plant_code;

-- Count of Renewable Power Plants by Region
WITH power_plants_data AS (
  SELECT 
    pp.region, 
    ebp.energy_type 
  FROM 
    intel.power_plants pp 
    INNER JOIN intel.energy_by_plant ebp ON pp.plant_code = ebp.plant_code
)
SELECT 
  region, 
  COUNT(*) AS renewable_power_plants 
FROM 
  power_plants_data 
WHERE 
  LOWER(energy_type) LIKE '%renewable%' 
GROUP BY 
  region 
ORDER BY 
  renewable_power_plants DESC;

-- Solar Photovoltaic Plants by Region (Filtered to ≥ 50)
WITH solar_plants_data AS (
  SELECT 
    pp.region, 
    ebp.energy_generated_mw 
  FROM 
    intel.power_plants pp 
    INNER JOIN intel.energy_by_plant ebp ON pp.plant_code = ebp.plant_code 
  WHERE 
    pp.primary_technology = 'Solar Photovoltaic'
)
SELECT 
  region, 
  COUNT(*) AS total_solar_plants, 
  SUM(energy_generated_mw) AS total_energy_generated 
FROM 
  solar_plants_data 
GROUP BY 
  region 
HAVING 
  COUNT(*) >= 50 
ORDER BY 
  total_solar_plants DESC;
