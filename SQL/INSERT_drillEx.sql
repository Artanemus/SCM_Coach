USE [SCM_Coach]
GO

DELETE FROM [dbo].[drillEx]
GO

SET IDENTITY_INSERT [dbo].[drillEx] ON;

INSERT INTO [dbo].[drillEx]
(
    drillExID
  , [Caption]
  , [ShortCaption]
  , [ABREV]
)
VALUES
(1, 'REVERSE', 'Rev', 'REV')
, (2, 'SPLIT', 'Split', 'SPLIT')

GO

SET IDENTITY_INSERT [dbo].[drillEx] OFF;

