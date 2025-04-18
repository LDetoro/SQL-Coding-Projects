SELECT
  reason_for_purchase, 
  COUNT(*) AS n_responses
FROM
  terracotta.survey
GROUP BY
  reason_for_purchase
HAVING
  COUNT(*) >= 30
ORDER BY
  n_responses DESC