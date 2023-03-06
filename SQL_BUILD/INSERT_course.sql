USE [SCM_Coach]
GO

DELETE FROM
      [dbo].[course]
GO

SET
  IDENTITY_INSERT [dbo].[course] ON;

-- SUFFIXED EXTENSIONS TO 
-- (+ user custom - prefix with #)
INSERT [dbo].[course] ([courseID], [Caption], [shortcaption],[ABREV]) VALUES (1, N'Long Course',  N'LCourse', N'LC')
GO
INSERT [dbo].[course] ([courseID], [Caption], [shortcaption],[ABREV]) VALUES (2, N'Short Course',  N'SCourse', N'SC')
GO

SET
  IDENTITY_INSERT [dbo].[course] OFF
GO

/*
Long Course LC
Short Course SC
*/