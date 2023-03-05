USE [SCM_Coach]
GO

DELETE FROM [dbo].[equipment]	
GO

SET IDENTITY_INSERT [dbo].[equipment] ON;

-- POOL EQUIPMENT
-- (+ user custom - prefix with #)

INSERT INTO [dbo].[equipment]
			(equipmentID
           ,[Caption]
           ,[ShortCaption]
           ,[ABREV])
     VALUES
           (1,'KICKBOARD','KickB','KB')
           ,(2,'FLOAT','Float','FLT')
           ,(3,'BUOY','Buoy','BUOY')
           ,(4,'SNORKLE','SnorkL','SNKL')
           ,(5,'PADDLES','PaddL','PADL')
           ,(6,'FINS','Fins','FINS')
GO



