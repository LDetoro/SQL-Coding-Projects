-- Renewable Energy by Hour by Region
SELECT
  region,
  DATE_PART('hour', time_at_end_of_hour) AS hour,
  SUM(hydropower_and_pumped_storage + wind + solar) AS total_renewable_energy
FROM
  intel.energy_data
GROUP BY
  region, hour
ORDER BY
  hour;

-- Filtered for California and Northwest Only
SELECT
  region,
  DATE_PART('hour', time_at_end_of_hour) AS hour,
  SUM(hydropower_and_pumped_storage + wind + solar) AS total_renewable_energy
FROM
  intel.energy_data
WHERE
  region IN ('California', 'Northwest')
GROUP BY
  region, hour
ORDER BY
  hour;
