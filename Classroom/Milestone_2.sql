SELECT
  name,
  category_code,
  status
FROM
  crunchbase.companies
WHERE
  (category_code = 'cleantech')
  AND (name ILIKE '%solar%'
  OR name ILIKE '%power%'
  OR name ILIKE '%energy%')