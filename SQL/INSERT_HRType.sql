USE [SCM_Coach]
GO

DELETE FROM [dbo].[HRType]
GO

SET IDENTITY_INSERT [dbo].[HRType] ON;

INSERT INTO [dbo].[HRType]
(
    HRTypeID
  , [Caption]
)
VALUES
(1, 'Coach')
, (2, 'Contact')
, (3, 'Swimmer')
GO

SET IDENTITY_INSERT [dbo].[HRType] OFF;



