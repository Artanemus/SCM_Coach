USE [SCM_Coach]
GO

DELETE FROM [dbo].[Gender]
GO
SET IDENTITY_INSERT [dbo].[Gender] ON;

INSERT [dbo].[Gender]
(
    [GenderID]
  , [Caption]
)
VALUES
(1, N'Male')
GO
INSERT [dbo].[Gender]
(
    [GenderID]
  , [Caption]
)
VALUES
(2, N'Female')
GO

SET IDENTITY_INSERT [dbo].[Gender] OFF
GO

