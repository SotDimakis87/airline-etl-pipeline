--Most Profitable Routes
SELECT
    route,
    COUNT(*) AS flights,
    ROUND(SUM(total_revenue), 2) AS revenue,
    ROUND(SUM(total_cost), 2) AS cost,
    ROUND(SUM(profit), 2) AS profit
FROM fact_airline_flights
GROUP BY route
ORDER BY profit DESC
LIMIT 10;

--Aircraft Efficiency Analysis
SELECT
    aircraft_type,
    ROUND(AVG(load_factor), 2) AS avg_load_factor,
    ROUND(AVG(rask), 4) AS avg_rask,
    ROUND(AVG(cask), 4) AS avg_cask,
    ROUND(AVG(profit), 2) AS avg_profit
FROM fact_airline_flights
GROUP BY aircraft_type
ORDER BY avg_profit DESC;

--Route Profitability Ranking
SELECT
    route,
    SUM(profit) AS total_profit,
    RANK() OVER (
        ORDER BY SUM(profit) DESC
    ) AS profitability_rank
FROM fact_airline_flights
GROUP BY route
ORDER BY total_profit DESC;

--Seasonality
SELECT
    season,
    ROUND(SUM(total_revenue),2) AS revenue,
    ROUND(SUM(total_cost),2) AS cost,
    ROUND(SUM(profit),2) AS profit
FROM fact_airline_flights
GROUP BY season
ORDER BY profit DESC;