/*Query 1*/
SELECT mg.groupName, c.cdTitle, c.numberSold
FROM cd c
JOIN musicalGroup mg ON c.groupCode = mg.groupCode
WHERE c.numberSold > 200000
ORDER BY mg.groupName ASC, c.numberSold DESC;

/*Query 2*/
SELECT a.firstName, a.lastName, COUNT (tps.songCode) AS countOfTopSongs
FROM artist a 
JOIN writtenBY wb ON a.artistID = wb.artistID
JOIN topSongs tps ON wb.songCode = tps.songCode
WHERE a.yearBorn >1970 AND tps.rating <= 10 
GROUP BY a.firstName, a.lastName
HAVING COUNT (tps.songCode) > 0 
ORDER BY countOfTopSongs DESC; 

/*Query 3*/
SELECT mg.groupName, 
       MAX(c.numberSold) AS maxSold, 
       MIN(c.numberSold) AS minSold, 
       AVG(c.numberSold) AS avgSold
FROM cd c
JOIN musicalGroup mg ON c.groupCode = mg.groupCode
WHERE c.year > 2000
GROUP BY mg.groupName
ORDER BY avgSold DESC;

/*Query 4 */
SELECT s.songTitle, COUNT(co.cdCode) AS NumOfCDSTheSongIsIn
FROM composeOf co
JOIN song s ON co.songCode = s.songCode
GROUP BY s.songTitle
HAVING COUNT (co.cdCode) > 2
ORDER BY NumOfCDSTheSongIsIn DESC; 

/*Query 5*/
SELECT mg.groupName, mg.groupCode
FROM musicalGroup mg
WHERE NOT EXISTS (
    SELECT *
    FROM cd c
    WHERE c.groupCode = mg.groupCode
    AND c.year >= 2000
	AND c.year <= 2005
    AND c.numberSold > 500000
)
ORDER BY mg.groupName ASC;

/*Query 6*/
SELECT a.artistID, a.firstName, a.lastName, COUNT (DISTINCT tps.songCode) AS countOfTopSongs,
	COUNT (DISTINCT c.cdCode) AS countHighSellingCDs
FROM artist a
JOIN writtenBy wb ON a.artistID = wb.artistID
LEFT JOIN topSongs tps ON wb.songCode = tps.songCode
LEFT JOIN composeOf co ON wb.songCode = co.songCode
LEFT JOIN cd c ON co.cdCode = c.cdCode AND c.numberSold > 600000
GROUP BY a.artistID, a.firstName, a.lastName
HAVING COUNT (DISTINCT tps.songCode) >= 2 AND COUNT (DISTINCT c.cdCode) >= 1
ORDER BY a.lastName ASC;
