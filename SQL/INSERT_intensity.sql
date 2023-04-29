USE [SCM_Coach]
GO
DELETE FROM [dbo].[intensity]
GO
SET IDENTITY_INSERT [dbo].[intensity] ON;

INSERT INTO   [dbo].[intensity]
      (
      intensityID,
      [Caption],
      [ShortCaption],
      [ABREV],
      [Level]
      )
VALUES
      (1, 'Easy Pace', 'EASY', 'EASY', 40),
      (2, 'Half Pace', 'HALFPACE', 'HALFP', 50),
      (3, 'Build Up Pace', 'BUILDUP', 'BUILD', 50),
      (4, 'Moderate Pace', 'MODERATE', 'MOD', 65),
      (5, 'Fast', 'BUILDUP', 'BUILD', 75),
      (6, 'Sprint', 'BUILDUP', 'BUILD', 90),
      (7, 'As Fast As Possible', 'AFAP', 'AFAP', 100)
GO

SET IDENTITY_INSERT [dbo].[intensity] OFF;
