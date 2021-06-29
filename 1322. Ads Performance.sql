SELECT ad_id,
IFNULL(ROUND(SUM(action = 'clicked') / SUM(action = 'clicked' OR action = 'viewed') * 100, 2), 0) AS ctr
FROM ads
GROUP BY ad_id
ORDER BY ctr DESC, ad_id
