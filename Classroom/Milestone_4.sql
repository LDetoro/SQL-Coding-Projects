SELECT
  origin_purpose,
  destination_purpose,
  time_period,
  SUM(daily_journeys) AS total_journeys
FROM
  tfl.rods
WHERE
  (origin_purpose = 'Tourist')
  or (destination_purpose = 'Tourist')
GROUP BY
  origin_purpose,
  destination_purpose,
  time_period
ORDER BY 
  total_journeys DESC,
  time_period DESC