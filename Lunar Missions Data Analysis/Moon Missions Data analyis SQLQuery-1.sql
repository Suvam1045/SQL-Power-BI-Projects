USE [Moon_Missions.db];

/* Total Number Of Moon Missions */

SELECT COUNT(Mission) AS Total_Moon_Missions FROM moon_missions ;


/* No of Countries Who Carried Out Moon Missions Till Date */

SELECT COUNT(DISTINCT Country) AS Total_Countries FROM moon_missions  ;


/* No of Moon Missions By Each Country  During 1958-2023 */

SELECT COUNT(*) AS Mission_Count, Country
FROM moon_missions
GROUP BY Country
ORDER BY Mission_Count;





/* No of Moon Missions By Space Organisations  During 1958-2023 */

SELECT COUNT(*) AS Mission_Count, Agency
FROM moon_missions
GROUP BY Agency
ORDER BY Mission_Count;



/* No of Moon Missions By Each Country In Each Year During 1958-2023 */

SELECT COUNT(*) AS Mission_Count, YEAR(Launch_Date) AS Year_Of_Mission, Country 
FROM moon_missions
GROUP BY YEAR(Launch_Date), Country
ORDER BY Year_Of_Mission ASC, Country ASC;



/* No of Moon Missions By Each Space Organisation In Each Year During 1958-2023 */

SELECT COUNT(*) AS Mission_Count, YEAR(Launch_Date) AS Year_Of_Mission, Agency
FROM moon_missions
GROUP BY YEAR(Launch_Date), Agency
ORDER BY Year_Of_Mission ASC, Agency ASC;


/* No of Moon Missions By Mission Type  */

SELECT COUNT(Mission_Type) AS Count_Of_Mission_Type, Mission_Type
FROM moon_missions
GROUP BY Mission_Type;

/* No of Moon Missions By Mission Type In Each Year During 1958-2023 */

SELECT COUNT(Mission_Type) AS Count_Of_Mission_Type,YEAR(Launch_Date) AS Year_Of_Mission, Mission_Type
FROM moon_missions
GROUP BY YEAR(Launch_Date), Mission_Type
ORDER BY  Year_Of_Mission ASC, Mission_Type ASC;



/*Count OF Moon Missions By Outcomes */

SELECT COUNT(*) AS Count_Of_Moon_Missions,Outcome
FROM moon_missions
Group By Outcome;

/* No of Moon Missions By Outcomes In Each Year During 1958-2023 */

SELECT COUNT(Mission_Type) AS Count_Of_Mission_Type,YEAR(Launch_Date) AS Year_Of_Mission, Outcome
FROM moon_missions
GROUP BY YEAR(Launch_Date), Outcome
ORDER BY  Year_Of_Mission ASC, Outcome ASC;


/*Count OF Moon Missions By Carrier Type */

SELECT COUNT(*) AS Count_Of_Moon_Missions, Carrier_Rocket
FROM moon_missions
Group By Carrier_Rocket;

/*Count OF Moon Missions By Carrier Type In Each Year During 1958-2023  */

SELECT COUNT(Mission_Type) AS Count_Of_Mission_Type,YEAR(Launch_Date) AS Year_Of_Mission, Carrier_Rocket
FROM moon_missions
GROUP BY YEAR(Launch_Date), Carrier_Rocket
ORDER BY  Year_Of_Mission ASC, Carrier_Rocket ASC;




/*  No Of Succesful Moons Missions By Countries */

SELECT Country, COUNT(Outcome) AS No_Of_Successful_Missions
FROM moon_missions
WHERE Outcome = 'Successful'
GROUP BY Country
ORDER BY No_Of_Successful_Missions DESC;

/* No Of Unsuccesful Moon Missions  By Countries */

SELECT Country, COUNT(Outcome) AS No_Of_Unsuccessful_Missions
FROM moon_missions
WHERE Outcome != 'Successful'
GROUP BY Country
ORDER BY No_Of_Unsuccessful_Missions DESC;


/* No Of Succesful Moon Missions By Space Organisations   */

SELECT Agency, COUNT(Outcome) AS No_Of_Successful_Missions
FROM moon_missions
WHERE Outcome = 'Successful'
GROUP BY Agency
ORDER BY No_Of_Successful_Missions DESC;


/* No Of Unsuccesful Missions By Space Organisations   */

SELECT Agency, COUNT(Outcome) AS No_Of_Unsuccessful_Missions
FROM moon_missions
WHERE Outcome != 'Successful'
GROUP BY Agency
ORDER BY No_Of_Unsuccessful_Missions DESC;


/* No Of Succesful Moon Missions By Mission Types   */

SELECT Mission_Type, COUNT(Outcome) AS No_Of_Successful_Missions
FROM moon_missions
WHERE Outcome = 'Successful'
GROUP BY Mission_Type
ORDER BY No_Of_Successful_Missions DESC;


/* No Of Unsuccesful Moon Missions By Mission Types   */

SELECT Mission_Type, COUNT(Outcome) AS No_Of_Unsuccessful_Missions
FROM moon_missions
WHERE Outcome != 'Successful'
GROUP BY Mission_Type
ORDER BY No_Of_Unsuccessful_Missions DESC;


/* No Of Succesful Moon Missions By Carrier Rockets   */

SELECT Carrier_Rocket, COUNT(Outcome) AS No_Of_Successful_Missions
FROM moon_missions
WHERE Outcome = 'Successful'
GROUP BY Carrier_Rocket
ORDER BY No_Of_Successful_Missions DESC;


/* No Of Unsuccesful Moon Missions By Carrier Rockets   */

SELECT Carrier_Rocket, COUNT(Outcome) AS No_Of_Unsuccessful_Missions
FROM moon_missions
WHERE Outcome != 'Successful'
GROUP BY Carrier_Rocket
ORDER BY No_Of_Unsuccessful_Missions DESC;






-- Calculate the total number of missions
DECLARE @totalMissions float;
SET @totalMissions = (SELECT COUNT(*) FROM moon_missions);

-- Calculate the number of successful missions
DECLARE @successfulMissions float;
SET @successfulMissions = (SELECT COUNT(*) FROM moon_missions WHERE Outcome LIKE '%success%');

-- Calculate the number of failed missions
DECLARE @failedMissions float;
SET @failedMissions = (SELECT COUNT(*) FROM moon_missions WHERE Outcome LIKE '%failure%');

-- Calculate the success rate
DECLARE @successRate float;
SET @successRate = (@successfulMissions / @totalMissions) * 100;
SELECT @successRate as SuccessRate;

-- Calculate the failure rate
DECLARE @failureRate float;
SET @failureRate = (@failedMissions / @totalMissions) * 100;
SELECT @failureRate as FailureRate;



/*Success Rate of Moon Missions By Each Country */

SELECT Country, 
(CAST(SUM(CASE WHEN Outcome = 'Successful' THEN 1 ELSE 0 END) AS float) / COUNT(*)) * 100 AS SuccessRate
FROM moon_missions
GROUP BY Country
ORDER BY  SuccessRate DESC;

/*Failure Rate of Moon Missions By Each Country */

SELECT Country, 
(CAST(SUM(CASE WHEN Outcome != 'Successful' THEN 1 ELSE 0 END) AS float) / COUNT(*)) * 100 AS FailureRate
FROM moon_missions
GROUP BY Country
ORDER BY  FailureRate DESC;

/*Success Rate of Moon Missions By Space Organisations */

SELECT Agency, 
(CAST(SUM(CASE WHEN Outcome = 'Successful' THEN 1 ELSE 0 END) AS float) / COUNT(*)) * 100 AS SuccessRate
FROM moon_missions
GROUP BY Agency
ORDER BY  SuccessRate DESC;

/*Failure Rate of Moon Missions By Space Organisations */

SELECT Agency, 
(CAST(SUM(CASE WHEN Outcome != 'Successful' THEN 1 ELSE 0 END) AS float) / COUNT(*)) * 100 AS FailureRate
FROM moon_missions
GROUP BY Agency
ORDER BY  FailureRate DESC;


/*Success Rate of Moon Missions By Mission Types */

SELECT Mission_Type, 
(CAST(SUM(CASE WHEN Outcome = 'Successful' THEN 1 ELSE 0 END) AS float) / COUNT(*)) * 100 AS SuccessRate
FROM moon_missions
GROUP BY Mission_Type
ORDER BY  SuccessRate DESC;

/*Failure Rate of Moon Missions By Mission Types */

SELECT Mission_Type, 
(CAST(SUM(CASE WHEN Outcome != 'Successful' THEN 1 ELSE 0 END) AS float) / COUNT(*)) * 100 AS FailureRate
FROM moon_missions
GROUP BY Mission_Type
ORDER BY  FailureRate DESC;

/*Success Rate of Moon Missions By Carrier Rockets */

SELECT Carrier_Rocket, 
(CAST(SUM(CASE WHEN Outcome = 'Successful' THEN 1 ELSE 0 END) AS float) / COUNT(*)) * 100 AS SuccessRate
FROM moon_missions
GROUP BY Carrier_Rocket
ORDER BY  SuccessRate DESC;


/*Failure Rate of Moon Missions By Carrier Rockets */

SELECT Carrier_Rocket, 
(CAST(SUM(CASE WHEN Outcome != 'Successful' THEN 1 ELSE 0 END) AS float) / COUNT(*)) * 100 AS FailureRate
FROM moon_missions
GROUP BY Carrier_Rocket
ORDER BY  FailureRate DESC;
















	
