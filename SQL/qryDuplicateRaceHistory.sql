USE SCM_Coach;

DECLARE @EntrantID AS INTEGER;
SET @EntrantID = 12;

SELECT COUNT(RaceHistoryID) AS rtnValue
FROM RaceHistory
WHERE EntrantID <> @EntrantID;