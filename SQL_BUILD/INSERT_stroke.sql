USE [SCM_Coach]
GO

DELETE FROM [dbo].[stroke]	
GO

SET IDENTITY_INSERT [dbo].[stroke] ON;

-- POOL EQUIPMENT
-- (+ user custom - prefix with #)

INSERT INTO [dbo].[stroke]
			(strokeID
           ,[Caption]
           ,[ShortCaption]
           ,[ABREV]
           ,[IsStandard])
     VALUES
           (1,'FreeStyle','Free','FR',1)
           ,(2,'BackStroke','Back','BK',1)
           ,(3,'BreastStroke','Breast','BR',1)
           ,(4,'ButterFly','Fly','BF',1)
           ,(5,'IndvMedly','IMedly','IM',1)
           ,(6,'Any-Stroke','Mix','MX',0)
           ,(7,'Swimmer-Choices-Stroke','YChoice','YCS',0)
           ,(8,'Your-Worst-Stroke','YWorst','YWS',0)
           ,(9,'Your-Best-Stroke','YBest','YBS',0)
           ,(10,'FreeStyle-or-IndvMedly','FreeOrIM','FRIM',0)
           ,(11,'Custom-Stroke','CustS','CUST',0)
GO

SET IDENTITY_INSERT [dbo].[stroke] OFF;



/*
STROKE
(standard stroke)
FreeStyle Free Fr
BackStroke Back Bk
BreastStroke Breast Br
ButterFly Fly Fl
Individual-Medly IM IM

(system not standard)
Any-Stroke Mix Mx
Swimmer-Choices-Stroke YChoice YCS
Swimmer-worst-stroke YourWorst YWS
Swimmer-best-stroke YourBest YBS
FreeStyle-or-Indivual Medly FreeOrIM FRIM

(+ user custom - prefix with #)
#Custom-Stroke #CustS #CStr
*/