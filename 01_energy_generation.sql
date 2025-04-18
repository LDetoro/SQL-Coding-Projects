-- Net Energy by Region
SELECT 
  region, 
  SUM(net_generation - demand) AS total_energy 
FROM 
  intel.energy_data 
GROUP BY 
  region 
ORDER BY 
  total_energy DESC;