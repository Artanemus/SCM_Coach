USE SCM_Coach
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 27/4/2023
-- Updated 16/5/2020
-- Description:	Find the 'Personal Best' 
--				race time for a given swimmer
-- =============================================
CREATE FUNCTION [dbo].[PersonalBest]
(
    -- Add the parameters for the function here
    @HRID INT
  , @DistanceID INT
  , @StrokeID INT
  , @SeedDate DATETIME = NULL
)
RETURNS TIME
AS
BEGIN
    -- Declare the return variable here
    DECLARE @Result TIME

    -- use a default sessiontime
    IF @SeedDate IS NULL
        SET @SeedDate = GETDATE();

    -- Add the T-SQL statements to compute the return value here
    SELECT @Result = MIN(RaceHistory.RaceTime)
    -- CAST(CAST(MIN(Entrant.RaceTime) AS DATETIME) AS FLOAT) AS PersonalBest
    FROM RaceHistory
    WHERE (RaceHistory.StrokeID = @StrokeID)
          AND (RaceHistory.DistanceID = @DistanceID)
          AND (RaceHistory.RaceTime IS NOT NULL)
          AND (RaceHistory.IsDisqualified <> 1) -- added 16/5/2020
          AND (RaceHistory.IsScratched <> 1) -- added 16/5/2020
          AND (RaceHistory.CreatedOn < @SeedDate)
    GROUP BY RaceHistory.HRID
    HAVING (RaceHistory.HRID = @HRID)

    -- Return the result of the function
    RETURN @Result
END
GO
