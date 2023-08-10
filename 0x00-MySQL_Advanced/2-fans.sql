SELECT origin, SUM(num_fans) AS total_fans
FROM metal_bands
GROUP BY origin
ORDER BY total_fans DESC;