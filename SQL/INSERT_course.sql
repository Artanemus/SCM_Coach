USE [SCM_Coach]
GO

DELETE FROM
      [dbo].[course]
GO

SET
  IDENTITY_INSERT [dbo].[course] ON;

INSERT [dbo].[course] ([courseID], [Caption], [shortcaption],[ABREV]) VALUES (1, N'Long Course Meters',  N'LCourseM', N'LCM')
GO
INSERT [dbo].[course] ([courseID], [Caption], [shortcaption],[ABREV]) VALUES (2, N'Short Course Meters',  N'SCourseM', N'SCM')
GO
INSERT [dbo].[course] ([courseID], [Caption], [shortcaption],[ABREV]) VALUES (3, N'Long Course Yards',  N'LCourseY', N'LCY')
GO

SET
  IDENTITY_INSERT [dbo].[course] OFF
GO

/*
Long Course LC
Short Course SC
*/