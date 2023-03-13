USE SCM_Coach
GO

DELETE FROM [SCM_Coach].[dbo].[Member]
GO

-- Drop a temporary table called '#scmSwimmers'
-- Drop the table if it already exists
IF OBJECT_ID('tempDB..#scmSwimmers', 'U') IS NOT NULL
    DROP TABLE #scmSwimmers
GO
-- Create the temporary table from a physical table called 'TableName' in schema 'dbo' in database 'DatabaseName'
SELECT FirstName
     , LastName
     , DOB
     , GenderID
     , [SwimClubMeet].[dbo].[SwimmerAge](GETDATE(), [SwimClubMeet].[dbo].[DOB] ) AS AGE
INTO #scmSwimmers
FROM [SwimClubMeet].[dbo].[Member]
WHERE isSwimmer = 1;

-- Insert rows into table 'Member' in schema '[dbo]'
INSERT INTO [dbo].[Member]
( -- Columns to insert data into
    [FirstName]
  , [LastName]
  , [DOB]
  , [GenderID]
  ,[IsActive]
  ,[IsArchived]
  ,[CreatedOn]
  ,[MemberTypeID]
)
SELECT #scmSwimmers.FirstName
     , #scmSwimmers.LastName
     , #scmSwimmers.DOB
     , #scmSwimmers.GenderID
     ,1
     ,0
     ,GETDATE()
     ,3
FROM #scmSwimmers
WHERE (#scmSwimmers.AGE >= 8) 
GO

