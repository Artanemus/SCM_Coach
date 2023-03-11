USE [SCM_Coach]
go

-- Dictionary Object Alter SQL

CREATE DEFAULT dbo.BIT_0 AS 0
go
CREATE DEFAULT dbo.BIT_1 AS 1
go

-- Standard Alter Table SQL

ALTER TABLE dbo.Distance DROP CONSTRAINT DF__Distance__IsArch__30F848ED
go
ALTER TABLE dbo.Distance DROP CONSTRAINT DF__Distance__IsStan__31EC6D26
go
ALTER TABLE dbo.Distance DROP CONSTRAINT DF__Distance__IsVisi__32E0915F
go
ALTER TABLE dbo.Distance ADD CONSTRAINT DF__Distance__IsArch__30F848ED DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.Distance ADD CONSTRAINT DF__Distance__IsStan__31EC6D26 DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.Distance ADD CONSTRAINT DF__Distance__IsVisi__32E0915F DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.drill DROP CONSTRAINT DF__drill__IsArchive__35BCFE0A
go
ALTER TABLE dbo.drill DROP CONSTRAINT DF__drill__IsStandar__36B12243
go
ALTER TABLE dbo.drill DROP CONSTRAINT DF__drill__IsVisible__37A5467C
go
ALTER TABLE dbo.drill ADD CONSTRAINT DF__drill__IsArchive__35BCFE0A DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.drill ADD CONSTRAINT DF__drill__IsStandar__36B12243 DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.drill ADD CONSTRAINT DF__drill__IsVisible__37A5467C DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.drillEx DROP CONSTRAINT DF__drillEx__IsArchi__3A81B327
go
ALTER TABLE dbo.drillEx DROP CONSTRAINT DF__drillEx__IsStand__3B75D760
go
ALTER TABLE dbo.drillEx DROP CONSTRAINT DF__drillEx__IsVisib__3C69FB99
go
ALTER TABLE dbo.drillEx ADD CONSTRAINT DF__drillEx__IsArchi__3A81B327 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.drillEx ADD CONSTRAINT DF__drillEx__IsStand__3B75D760 DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.drillEx ADD CONSTRAINT DF__drillEx__IsVisib__3C69FB99 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.equipment DROP CONSTRAINT DF__equipment__IsArc__412EB0B6
go
ALTER TABLE dbo.equipment DROP CONSTRAINT DF__equipment__IsSta__4222D4EF
go
ALTER TABLE dbo.equipment DROP CONSTRAINT DF__equipment__IsVis__4316F928
go
ALTER TABLE dbo.equipment ADD CONSTRAINT DF__equipment__IsArc__412EB0B6 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.equipment ADD CONSTRAINT DF__equipment__IsSta__4222D4EF DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.equipment ADD CONSTRAINT DF__equipment__IsVis__4316F928 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.grade DROP CONSTRAINT DF__grade__IsArchive__49C3F6B7
go
ALTER TABLE dbo.grade DROP CONSTRAINT DF__grade__IsStandar__4AB81AF0
go
ALTER TABLE dbo.grade DROP CONSTRAINT DF__grade__IsVisible__4BAC3F29
go
ALTER TABLE dbo.grade ADD CONSTRAINT DF__grade__IsArchive__49C3F6B7 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.grade ADD CONSTRAINT DF__grade__IsStandar__4AB81AF0 DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.grade ADD CONSTRAINT DF__grade__IsVisible__4BAC3F29 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.intensity DROP CONSTRAINT DF__intensity__IsArc__5070F446
go
ALTER TABLE dbo.intensity DROP CONSTRAINT DF__intensity__IsSta__5165187F
go
ALTER TABLE dbo.intensity DROP CONSTRAINT DF__intensity__IsVis__52593CB8
go
ALTER TABLE dbo.intensity ADD CONSTRAINT DF__intensity__IsArc__5070F446 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.intensity ADD CONSTRAINT DF__intensity__IsSta__5165187F DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.intensity ADD CONSTRAINT DF__intensity__IsVis__52593CB8 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.Member DROP CONSTRAINT DF__Member__IsSwimme__59063A47
go
ALTER TABLE dbo.Member DROP CONSTRAINT DF__Member__IsActive__59FA5E80
go
ALTER TABLE dbo.Member DROP CONSTRAINT DF__Member__IsArchiv__5AEE82B9
go
EXEC sp_bindefault 'BIT_1', 'dbo.Member.IsSwimmer'
go
EXEC sp_bindefault 'BIT_1', 'dbo.Member.IsActive'
go
EXEC sp_bindefault 'BIT_0', 'dbo.Member.IsArchived'
go
ALTER TABLE dbo.miscTerm DROP CONSTRAINT DF__miscTerm__IsArch__60A75C0F
go
ALTER TABLE dbo.miscTerm DROP CONSTRAINT DF__miscTerm__IsStan__619B8048
go
ALTER TABLE dbo.miscTerm DROP CONSTRAINT DF__miscTerm__IsVisi__628FA481
go
ALTER TABLE dbo.miscTerm ADD CONSTRAINT DF__miscTerm__IsArch__60A75C0F DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.miscTerm ADD CONSTRAINT DF__miscTerm__IsStan__619B8048 DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.miscTerm ADD CONSTRAINT DF__miscTerm__IsVisi__628FA481 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.stroke DROP CONSTRAINT DF__stroke__IsArchiv__6D0D32F4
go
ALTER TABLE dbo.stroke DROP CONSTRAINT DF__stroke__IsVisibl__6E01572D
go
ALTER TABLE dbo.stroke ADD CONSTRAINT DF__stroke__IsArchiv__6D0D32F4 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.stroke ADD CONSTRAINT DF__stroke__IsVisibl__6E01572D DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.drillLink ADD FOREIGN KEY (drillExID)
REFERENCES dbo.drillEx (drillExID)
go
ALTER TABLE dbo.drillLink ADD FOREIGN KEY (drillID)
REFERENCES dbo.drill (drillID)
go
ALTER TABLE dbo.task ADD FOREIGN KEY (drillID)
REFERENCES dbo.drill (drillID)
go

-- Drop Constraint, Rename and Create Table SQL

CREATE TABLE dbo.SCMSystem
(
    SCMSystemID int  IDENTITY,
    DBVersion   int  NULL,
    Major       int  NULL,
    Minor       int  NULL,
    CONSTRAINT PK_SCMSystem
    PRIMARY KEY CLUSTERED (SCMSystemID)
)
go
