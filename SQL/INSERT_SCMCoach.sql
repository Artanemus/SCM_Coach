USE [SCM_Coach]
GO

DELETE FROM [dbo].[SCMCoach]
GO

SET IDENTITY_INSERT [dbo].[SCMCoach] ON;

INSERT [dbo].[SCMCoach]
(
    [SCMCoachID]
		, [NickName]
		,[Caption]
		,[Email]
		,[ContactNum]
		,[WebSite]
		,[CreatedOn]
)
VALUES
(1, N'Riptide', N'Utopia Coaching', N'iapetus@sbcglobal.net', N'(284) 899-6811', N'https://www.google.com/', GETDATE())
GO


SET IDENTITY_INSERT [dbo].[SCMCoach] OFF
GO
