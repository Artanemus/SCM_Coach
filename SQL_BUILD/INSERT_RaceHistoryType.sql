USE [SCM_Coach]
GO

DELETE FROM [dbo].[RaceHistoryType]
GO

SET IDENTITY_INSERT [dbo].[RaceHistoryType] ON;

-- POOL EventTimeType 
-- (+ user custom - prefix with #)

INSERT INTO [dbo].[RaceHistoryType]
(
    [RaceHistoryTypeID]
  , [Caption]
)
VALUES
(1, 'Club Night')
, (2, 'Regional Meet')
, (3, 'Reginal Championship')
, (4, 'Club vs Club')
, (5, 'Nationals')
GO

SET IDENTITY_INSERT [dbo].[RaceHistoryType] OFF;



