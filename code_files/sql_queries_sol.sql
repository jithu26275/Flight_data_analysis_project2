-- Which airline has the highest average flight duration?
SELECT airline, AVG(duration) AS avg_duration
FROM flights
GROUP BY airline
ORDER BY avg_duration DESC
LIMIT 1;

-- Which source–destination pairs have the longest average duration?
SELECT source_city, destination_city, AVG(duration) AS avg_duration
FROM flights
GROUP BY source_city, destination_city
ORDER BY avg_duration DESC;

-- How many flights are recorded per airline and class (Business vs Economy)?
SELECT airline, class, COUNT(*) AS flight_count
FROM flights
GROUP BY airline, class
ORDER BY flight_count DESC;

-- Which departure time of day has the longest average durations?
SELECT departure_time, AVG(duration) AS avg_duration
FROM flights
GROUP BY departure_time
ORDER BY avg_duration DESC;

-- Which airlines operate the least number of unique routes?
SELECT airline, COUNT(DISTINCT source_city || '-' || destination_city) AS unique_routes
FROM flights
GROUP BY airline
ORDER BY unique_routes ASC;

-- Do non-stop flights cost more than connecting ones (same route)?
SELECT stops, AVG(price) AS avg_price
FROM flights
GROUP BY stops;
-- What are the top 5 most frequent flight routes?
SELECT source_city, destination_city, COUNT(*) AS flight_count
FROM flights
GROUP BY source_city, destination_city
ORDER BY flight_count DESC
LIMIT 5;

-- Which source cities have the most departures?
SELECT source_city, COUNT(*) AS departure_count
FROM flights
GROUP BY source_city
ORDER BY departure_count DESC;

-- Do last-minute bookings cost more than early bookings?
SELECT CASE 
           WHEN days_left <= 3 THEN 'Last Minute'
           ELSE 'Early'
       END AS booking_type,
       AVG(price) AS avg_price
FROM flights
GROUP BY booking_type;

-- Do certain airlines dominate specific routes?
SELECT source_city, destination_city, airline, COUNT(*) AS flight_count
FROM flights
GROUP BY source_city, destination_city, airline
ORDER BY flight_count DESC;
