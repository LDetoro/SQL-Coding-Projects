SELECT
  COUNT(DISTINCT team_home) AS team_with_high_3p
FROM
  nba.games
WHERE
  season >= '2018'
GROUP BY
  team_home,
  season
HAVING
  AVG(pct_3p_home) <= 0.34
  AND AVG(home_team_win) < 0.5
