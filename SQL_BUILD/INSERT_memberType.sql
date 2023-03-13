USE [SCM_Coach]
GO

DELETE FROM [dbo].[MemberType]	
GO

SET IDENTITY_INSERT [dbo].[MemberType] ON;

-- POOL MemberType
-- (+ user custom - prefix with #)

INSERT INTO [dbo].[MemberType]
			(MemberTypeID
           ,[Caption])
     VALUES
           (1,'Coach')
           ,(2,'Parent')
           ,(3,'Swimmer')
GO

SET IDENTITY_INSERT [dbo].[MemberType] OFF;



