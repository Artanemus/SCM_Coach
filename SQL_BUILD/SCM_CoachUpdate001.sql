USE [SCM_Coach]
go

-- Dictionary Object Alter SQL

CREATE DEFAULT dbo.BIT_0 AS 0
go
CREATE DEFAULT dbo.BIT_1 AS 1
go

-- Standard Alter Table SQL

EXEC sp_rename 'dbo.team.PK2','PK_team','INDEX'
go
ALTER TABLE dbo.teamMember DROP CONSTRAINT Refteam4
go
ALTER TABLE dbo.teamMember DROP CONSTRAINT RefMember5
go
EXEC sp_rename 'dbo.teamMember.PK4','PK_teamMember','INDEX'
go
ALTER TABLE dbo.coach DROP CONSTRAINT RefMember30
go
ALTER TABLE dbo.coach DROP CONSTRAINT Refteam31
go
EXEC sp_rename 'dbo.coach.PK5','PK_coach','INDEX'
go
ALTER TABLE dbo.ContactNum DROP CONSTRAINT RefMember29
go
EXEC sp_rename 'dbo.FK_ContactNumType_ContactNum','ContactNumType_ContactNum'
go
ALTER TABLE dbo.course
ALTER COLUMN ABREV nvarchar(5) NULL
go
EXEC sp_rename 'dbo.course.PK25','PK_course','INDEX'
go
ALTER TABLE dbo.dictionary DROP CONSTRAINT RefdictionaryType48
go
ALTER TABLE dbo.dictionary DROP CONSTRAINT DF__dictionar__IsSta__2C3393D0
go
ALTER TABLE dbo.dictionary
ALTER COLUMN ABREV nvarchar(5) NULL
go
ALTER TABLE dbo.dictionary ADD CONSTRAINT DF__dictionar__IsSta__2C3393D0 DEFAULT ((0)) FOR IsStandard
go
EXEC sp_rename 'dbo.dictionary.PK34','PK_dictionary','INDEX'
go
EXEC sp_rename 'dbo.dictionaryType.PK35','PK_dictionaryType','INDEX'
go
ALTER TABLE dbo.Distance DROP CONSTRAINT DF__Distance__IsStan__30F848ED
go
ALTER TABLE dbo.Distance
ALTER COLUMN ABREV nvarchar(5) NULL
go
ALTER TABLE dbo.Distance ADD CONSTRAINT DF__Distance__IsStan__30F848ED DEFAULT ((0)) FOR IsStandard
go
EXEC sp_rename 'dbo.Distance.PK7','PK_Distance','INDEX'
go
ALTER TABLE dbo.drill DROP CONSTRAINT Reftask46
go
ALTER TABLE dbo.drill
ALTER COLUMN ABREV nvarchar(5) NULL
go
EXEC sp_rename 'dbo.drill.PK32','PK_drill','INDEX'
go
ALTER TABLE dbo.drillEx
ALTER COLUMN ABREV nvarchar(5) NULL
go
EXEC sp_rename 'dbo.drillEx.PK33','PK_drillEx','INDEX'
go
ALTER TABLE dbo.drillExLink DROP CONSTRAINT RefdrillEx64
go
ALTER TABLE dbo.drillExLink DROP CONSTRAINT Reftask65
go
EXEC sp_rename 'dbo.drillExLink.PK42','PK_drillExLink','INDEX'
go
ALTER TABLE dbo.equipment
ALTER COLUMN ABREV nvarchar(5) NULL
go
EXEC sp_rename 'dbo.equipment.PK26','PK_equipment','INDEX'
go
ALTER TABLE dbo.evTime DROP CONSTRAINT RefheartRange56
go
ALTER TABLE dbo.evTime DROP CONSTRAINT RefheartRange57
go
ALTER TABLE dbo.evTime DROP CONSTRAINT Reftask58
go
EXEC sp_rename 'dbo.evTime.PK38','PK_evTime','INDEX'
go
EXEC sp_rename 'dbo.Gender.PK16','PK_Gender','INDEX'
go
EXEC sp_rename 'dbo.grade.PK36','PK_grade','INDEX'
go
EXEC sp_rename 'dbo.heartRange.PK39','PK_heartRange','INDEX'
go
ALTER TABLE dbo.intensity
ALTER COLUMN ABREV nvarchar(5) NULL
go
EXEC sp_rename 'dbo.intensity.PK23','PK_intensity','INDEX'
go
ALTER TABLE dbo.line DROP CONSTRAINT Refteam22
go
ALTER TABLE dbo.line DROP CONSTRAINT Refsession42
go
EXEC sp_rename 'dbo.line.PK19','PK_line','INDEX'
go
ALTER TABLE dbo.Member DROP CONSTRAINT RefGender17
go
ALTER TABLE dbo.Member DROP CONSTRAINT Refgrade49
go
ALTER TABLE dbo.Member DROP CONSTRAINT DF__Member__IsSwimme__46E78A0C
go
ALTER TABLE dbo.Member DROP CONSTRAINT DF__Member__IsActive__47DBAE45
go
ALTER TABLE dbo.Member DROP CONSTRAINT DF__Member__IsArchiv__48CFD27E
go
ALTER TABLE dbo.Member DROP CONSTRAINT DF__Member__IsCoach__49C3F6B7
go
EXEC sp_bindefault 'BIT_1', 'dbo.Member.IsSwimmer'
go
EXEC sp_bindefault 'BIT_1', 'dbo.Member.IsActive'
go
EXEC sp_bindefault 'BIT_0', 'dbo.Member.IsArchived'
go
ALTER TABLE dbo.Member ADD CONSTRAINT DF__Member__IsCoach__49C3F6B7 DEFAULT ((0)) FOR IsCoach
go
EXEC sp_rename 'dbo.Member.PK3','PK_Member','INDEX'
go
ALTER TABLE dbo.miscTerm
ALTER COLUMN ABREV nvarchar(5) NULL
go
EXEC sp_rename 'dbo.miscTerm.PK33_1','PK_miscTerm','INDEX'
go
ALTER TABLE dbo.PB DROP CONSTRAINT RefDistance7
go
ALTER TABLE dbo.PB DROP CONSTRAINT Refstroke8
go
ALTER TABLE dbo.PB DROP CONSTRAINT RefMember9
go
EXEC sp_rename 'dbo.PB.PK6','PK_PB','INDEX'
go
ALTER TABLE dbo.pool DROP CONSTRAINT Refcourse38
go
EXEC sp_rename 'dbo.pool.PK1','PK_pool','INDEX'
go
ALTER TABLE dbo.[session] DROP CONSTRAINT Refpool39
go
EXEC sp_rename 'dbo.session.PK30','PK_session','INDEX'
go
ALTER TABLE dbo.stroke
ALTER COLUMN ABREV nvarchar(5) NULL
go
EXEC sp_rename 'dbo.stroke.PK8','PK_stroke','INDEX'
go
ALTER TABLE dbo.subline DROP CONSTRAINT Refline45
go
ALTER TABLE dbo.subline DROP CONSTRAINT RefsublineType61
go
EXEC sp_rename 'dbo.subline.PK31','PK_subline','INDEX'
go
ALTER TABLE dbo.sublinelink DROP CONSTRAINT Refsubline59
go
ALTER TABLE dbo.sublinelink DROP CONSTRAINT Refsubline60
go
EXEC sp_rename 'dbo.sublinelink.PK40','PK_sublinelink','INDEX'
go
ALTER TABLE dbo.sublineType
ALTER COLUMN ABREV nvarchar(5) NULL
go
EXEC sp_rename 'dbo.sublineType.PK18','PK_sublineType','INDEX'
go
ALTER TABLE dbo.task DROP CONSTRAINT Refequipment36
go
ALTER TABLE dbo.task DROP CONSTRAINT RefDistance40
go
ALTER TABLE dbo.task DROP CONSTRAINT Refstroke41
go
ALTER TABLE dbo.task DROP CONSTRAINT Refsubline44
go
ALTER TABLE dbo.task DROP CONSTRAINT RefmiscTerm50
go
ALTER TABLE dbo.task DROP CONSTRAINT Refgrade69
go
ALTER TABLE dbo.task DROP CONSTRAINT Refintensity34
go
ALTER TABLE dbo.task DROP CONSTRAINT DF__task__repsdesc__5BE2A6F2
go
ALTER TABLE dbo.task DROP CONSTRAINT DF__task__repsasc__5CD6CB2B
go
ALTER TABLE dbo.task DROP CONSTRAINT DF__task__intensityd__5DCAEF64
go
ALTER TABLE dbo.task ADD CONSTRAINT DF__task__repsdesc__5BE2A6F2 DEFAULT ((0)) FOR repsdesc
go
ALTER TABLE dbo.task ADD CONSTRAINT DF__task__repsasc__5CD6CB2B DEFAULT ((0)) FOR repsasc
go
ALTER TABLE dbo.task ADD CONSTRAINT DF__task__intensityd__5DCAEF64 DEFAULT ((0)) FOR intensitydesc
go
EXEC sp_rename 'dbo.task.PK29','PK_task','INDEX'
go
ALTER TABLE dbo.teamMember ADD CONSTRAINT team_teamMember
FOREIGN KEY (teamID)
REFERENCES dbo.team (teamID)
go
ALTER TABLE dbo.teamMember ADD CONSTRAINT Member_teamMember
FOREIGN KEY (MemberID)
REFERENCES dbo.Member (MemberID)
go
ALTER TABLE dbo.coach ADD CONSTRAINT Member_coach
FOREIGN KEY (MemberID)
REFERENCES dbo.Member (MemberID)
go
ALTER TABLE dbo.coach ADD CONSTRAINT team_coach
FOREIGN KEY (teamID)
REFERENCES dbo.team (teamID)
go
ALTER TABLE dbo.ContactNum ADD CONSTRAINT Member_ContactNum
FOREIGN KEY (MemberID)
REFERENCES dbo.Member (MemberID)
go
ALTER TABLE dbo.dictionary ADD CONSTRAINT dictionaryType_dictionary
FOREIGN KEY (dictionaryType)
REFERENCES dbo.dictionaryType (dictionaryType)
go
ALTER TABLE dbo.drill ADD CONSTRAINT task_drill
FOREIGN KEY (taskID)
REFERENCES dbo.task (taskID)
go
ALTER TABLE dbo.drillExLink ADD CONSTRAINT drillEx_drillExLink
FOREIGN KEY (drillExID)
REFERENCES dbo.drillEx (drillExID)
go
ALTER TABLE dbo.drillExLink ADD CONSTRAINT task_drillExLink
FOREIGN KEY (taskID)
REFERENCES dbo.task (taskID)
go
ALTER TABLE dbo.evTime ADD CONSTRAINT heartRange_evTime
FOREIGN KEY (heartRACED)
REFERENCES dbo.heartRange (heartRangeID)
go
ALTER TABLE dbo.evTime ADD CONSTRAINT heartRange_evTi6
FOREIGN KEY (heartREST)
REFERENCES dbo.heartRange (heartRangeID)
go
ALTER TABLE dbo.evTime ADD CONSTRAINT task_evTime
FOREIGN KEY (taskID)
REFERENCES dbo.task (taskID)
go
ALTER TABLE dbo.line ADD CONSTRAINT team_line
FOREIGN KEY (teamID)
REFERENCES dbo.team (teamID)
go
ALTER TABLE dbo.line ADD CONSTRAINT session_line
FOREIGN KEY (sessionID)
REFERENCES dbo.[session] (sessionID)
go
ALTER TABLE dbo.Member ADD CONSTRAINT Gender_Member
FOREIGN KEY (GenderID)
REFERENCES dbo.Gender (GenderID)
go
ALTER TABLE dbo.Member ADD CONSTRAINT grade_Member
FOREIGN KEY (gradeID)
REFERENCES dbo.grade (gradeID)
go
ALTER TABLE dbo.PB ADD CONSTRAINT Distance_PB
FOREIGN KEY (DistanceID)
REFERENCES dbo.Distance (DistanceID)
go
ALTER TABLE dbo.PB ADD CONSTRAINT stroke_PB
FOREIGN KEY (strokeID)
REFERENCES dbo.stroke (strokeID)
go
ALTER TABLE dbo.PB ADD CONSTRAINT Member_PB
FOREIGN KEY (MemberID)
REFERENCES dbo.Member (MemberID)
go
ALTER TABLE dbo.pool ADD CONSTRAINT course_pool
FOREIGN KEY (courseID)
REFERENCES dbo.course (courseID)
go
ALTER TABLE dbo.[session] ADD CONSTRAINT pool_session
FOREIGN KEY (poolID)
REFERENCES dbo.pool (poolID)
go
ALTER TABLE dbo.subline ADD CONSTRAINT line_subline
FOREIGN KEY (lineID)
REFERENCES dbo.line (lineID)
go
ALTER TABLE dbo.subline ADD CONSTRAINT sublineType_subline
FOREIGN KEY (sublineTypeID)
REFERENCES dbo.sublineType (sublineTypeID)
go
ALTER TABLE dbo.sublinelink ADD CONSTRAINT subline_sublineli8
FOREIGN KEY (parentID)
REFERENCES dbo.subline (sublineID)
go
ALTER TABLE dbo.sublinelink ADD CONSTRAINT subline_sublinelink
FOREIGN KEY (childID)
REFERENCES dbo.subline (sublineID)
go
ALTER TABLE dbo.task ADD CONSTRAINT equipment_task
FOREIGN KEY (equipmentID)
REFERENCES dbo.equipment (equipmentID)
go
ALTER TABLE dbo.task ADD CONSTRAINT Distance_task
FOREIGN KEY (DistanceID)
REFERENCES dbo.Distance (DistanceID)
go
ALTER TABLE dbo.task ADD CONSTRAINT stroke_task
FOREIGN KEY (strokeID)
REFERENCES dbo.stroke (strokeID)
go
ALTER TABLE dbo.task ADD CONSTRAINT subline_task
FOREIGN KEY (sublineID)
REFERENCES dbo.subline (sublineID)
go
ALTER TABLE dbo.task ADD CONSTRAINT miscTerm_task
FOREIGN KEY (miscTermID)
REFERENCES dbo.miscTerm (miscTermID)
go
ALTER TABLE dbo.task ADD CONSTRAINT grade_task
FOREIGN KEY (gradeID)
REFERENCES dbo.grade (gradeID)
go
ALTER TABLE dbo.task ADD CONSTRAINT intensity_task
FOREIGN KEY (intensityID)
REFERENCES dbo.intensity (intensityID)
go
