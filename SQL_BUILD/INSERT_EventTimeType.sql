USE [SCM_Coach]
GO

DELETE FROM [dbo].[EventTimeType]
GO

SET IDENTITY_INSERT [dbo].[EventTimeType] ON;

-- POOL EventTimeType 
-- (+ user custom - prefix with #)

INSERT INTO [dbo].[EventTimeType]
(
    EventTimeTypeID
  , [Caption]
)
VALUES
(1, 'Club Night')
, (2, 'Regional Meet')
, (3, 'Reginal Championship')
, (4, 'Club vs Club')
, (5, 'Nationals')
GO

SET IDENTITY_INSERT [dbo].[EventTimeType] OFF;



