USE [SCM_Coach]
GO

DELETE FROM [dbo].[TeamType]
GO

SET IDENTITY_INSERT [dbo].[TeamType] ON;

INSERT INTO [dbo].[TeamType]
(
    TeamTypeID
  , [Caption]
)
VALUES
(1, 'Default')
, (2, 'Template')
GO

SET IDENTITY_INSERT [dbo].[TeamType] OFF;
