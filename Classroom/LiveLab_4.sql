SELECT
  *
FROM
  tiktok.tracks
WHERE
  (
    num_posts BETWEEN 6000000
    AND 10000000
  )
  AND (peak_rank > 10)
  AND (chart_velocity > 0)
  AND (time_on_chart < 365)
ORDER BY
  chart_velocity DESC,
  peak_rank ASC,
  num_posts DESC