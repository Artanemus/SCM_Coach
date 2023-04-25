USE SCM_Coach;

DECLARE @hrid AS INT;
SET @hrid = 233; --:HRID

SELECT DISTINCT
       HR.HRID
     , Distance.DistanceID
     , Stroke.StrokeID
     , dbo.PersonalBest(HRID, DistanceID, StrokeID, GETDATE()) AS PB
     , (CONCAT(distance.caption, ' ', stroke.caption)) AS EventStr
FROM Distance
    CROSS JOIN Stroke
    CROSS JOIN HR
WHERE HR.HRID = @hrid
      AND dbo.PersonalBest(HRID, DistanceID, StrokeID, GETDATE()) <> '00:00:00'
ORDER BY HRID
       , DistanceID
       , StrokeID
       , PB ASC;


/* USE SCM_Coach
GO

DECLARE @StrokeID AS INTEGER;
DECLARE @DistanceID as INTEGER;
DECLARE @SeedDate AS DATETIME;
DECLARE @HRID AS INTEGER;

SET @StrokeID = 1;
SET @DistanceID = 1;
SET @SeedDate = GETDATE();
SET @HRID = 229;

    SELECT MIN(RaceHistory.RaceTime) AS rtn
    -- CAST(CAST(MIN(Entrant.RaceTime) AS DATETIME) AS FLOAT) AS PersonalBest
    FROM RaceHistory
    -- INNER JOIN HeatIndividual
        -- ON Entrant.HeatID = HeatIndividual.HeatID
    -- INNER JOIN Event
        -- ON HeatIndividual.EventID = Event.EventID
    -- INNER JOIN Session
        -- ON Event.SessionID = Session.SessionID
    WHERE (RaceHistory.StrokeID = @StrokeID)
        AND (RaceHistory.DistanceID = @DistanceID)
        AND (RaceHistory.RaceTime IS NOT NULL)
        AND (RaceHistory.IsDisqualified <> 1) -- added 16/5/2020
        AND (RaceHistory.IsScratched <> 1) -- added 16/5/2020
        AND (RaceHistory.CreatedOn < @SeedDate)
    GROUP BY RaceHistory.HRID
    HAVING (RaceHistory.HRID = @HRID)

    GO */