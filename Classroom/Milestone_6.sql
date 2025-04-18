Select
  COUNT(p.case_id) AS n_collisions,
  day_of_week
FROM
  switrs.parties AS p
  INNER JOIN switrs.collisions AS c ON c.case_id = p.case_id
WHERE
  oaf_1 = 'F'
  OR oaf_2 = 'F'
GROUP BY
  day_of_week
