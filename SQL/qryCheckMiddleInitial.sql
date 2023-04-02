USE SwimClubMeet;

DECLARE @rtn AS BIT;
SET @rtn = 0;

IF EXISTS
(
    SELECT *
    FROM sys.columns
    WHERE (Name = N'MiddleInitial')
          AND (OBJECT_ID = OBJECT_ID(N'[SwimClubMeet].[dbo].[Member]'))
)
BEGIN
    SET @rtn = 1;
END;

SELECT @rtn AS rtnValue;

