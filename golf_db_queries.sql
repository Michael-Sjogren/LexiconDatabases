USE golf_db;

SELECT * FROM Players;
SELECT * FROM Contestants;
SELECT * FROM Jackets;

# 1.
SELECT Age FROM Players
WHERE Name = "Johan Andersson";
# 2.
SELECT StartDate FROM Competition
WHERE Name = "Big Golf Cup Skövde";
# 3.
SELECT Material From GlofClubs
WHERE SSN = "9804232451";
# 4.
SELECT * FROM Jackets
WHERE SSN = "9804232451";
# 5.
SELECT Contestants.CompetionName, Players.Name
FROM Players
INNER JOIN Contestants ON Players.SSN = Contestants.PlayerSSN;
# 6.
SELECT Rain.WindForce
FROM Rain
INNER JOIN CompetitionWeather ON Rain.RainType = CompetitionWeather.RainType;
# 7.
SELECT * FROM Players WHERE Age < 30;

# 8.
DELETE FROM Jackets WHERE SSN = "9804232451";

# 9.
DELETE FROM Players WHERE Name = 'Nicklas Jansson';

# 10.
SELECT AVG(Age) FROM Players;
