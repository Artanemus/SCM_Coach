USE [SCM_Coach]
GO

DELETE FROM [dbo].[Distance]	
GO

SET IDENTITY_INSERT [dbo].[Distance] ON;

-- POOL EQUIPMENT
-- (+ user custom - prefix with #)

INSERT INTO [dbo].[Distance]
			(DistanceID
           ,[Caption]
           ,[ShortCaption]
           ,[ABREV]
           ,[IsStandard]
           ,[Meters])
     VALUES
           (1,'25M','25M','25',1,25.0)
           ,(2,'50M','50M','50',1,50.0)
           ,(3,'100M','100M','100',1,100.0)
           ,(4,'200M','200M','200',1,200.0)
           ,(5,'400M','400M','400',1,400.0)
           ,(6,'1000M','1000M','1000',1,1000.0)
GO

