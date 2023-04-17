USE SwimClubMeet;

DECLARE @EntrantID AS INTEGER;
SET @EntrantID = 12;

SELECT SplitID
, SplitTime
FROM dbo.Split
WHERE EntrantID = @EntrantID;