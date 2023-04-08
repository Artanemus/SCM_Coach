USE [SCM_Coach]
go

-- Dictionary Object Alter SQL

CREATE DEFAULT dbo.BIT_0 AS 0
go
CREATE DEFAULT dbo.BIT_1 AS 1
go

-- Standard Alter Table SQL

ALTER TABLE dbo.stroke DROP CONSTRAINT DF__stroke__IsArchiv__72C60C4A
go
ALTER TABLE dbo.stroke DROP CONSTRAINT DF__stroke__IsVisibl__73BA3083
go
ALTER TABLE dbo.stroke ADD CONSTRAINT DF__stroke__IsArchiv__72C60C4A DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.stroke ADD CONSTRAINT DF__stroke__IsVisibl__73BA3083 DEFAULT (1) FOR IsVisible
go
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
ALTER TABLE dbo.grade DROP CONSTRAINT DF__grade__IsArchive__4F7CD00D
go
ALTER TABLE dbo.grade DROP CONSTRAINT DF__grade__IsStandar__5070F446
go
ALTER TABLE dbo.grade DROP CONSTRAINT DF__grade__IsVisible__5165187F
go
ALTER TABLE dbo.grade ADD CONSTRAINT DF__grade__IsArchive__4F7CD00D DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.grade ADD CONSTRAINT DF__grade__IsStandar__5070F446 DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.grade ADD CONSTRAINT DF__grade__IsVisible__5165187F DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.HR DROP CONSTRAINT DF__HR__IsActive__5629CD9C
go
ALTER TABLE dbo.HR DROP CONSTRAINT DF__HR__IsArchived__571DF1D5
go
EXEC sp_bindefault 'BIT_1', 'dbo.HR.IsActive'
go
EXEC sp_bindefault 'BIT_0', 'dbo.HR.IsArchived'
go
ALTER TABLE dbo.intensity DROP CONSTRAINT DF__intensity__IsArc__5BE2A6F2
go
ALTER TABLE dbo.intensity DROP CONSTRAINT DF__intensity__IsSta__5CD6CB2B
go
ALTER TABLE dbo.intensity DROP CONSTRAINT DF__intensity__IsVis__5DCAEF64
go
ALTER TABLE dbo.intensity ADD CONSTRAINT DF__intensity__IsArc__5BE2A6F2 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.intensity ADD CONSTRAINT DF__intensity__IsSta__5CD6CB2B DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.intensity ADD CONSTRAINT DF__intensity__IsVis__5DCAEF64 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.miscTerm DROP CONSTRAINT DF__miscTerm__IsArch__66603565
go
ALTER TABLE dbo.miscTerm DROP CONSTRAINT DF__miscTerm__IsStan__6754599E
go
ALTER TABLE dbo.miscTerm DROP CONSTRAINT DF__miscTerm__IsVisi__68487DD7
go
ALTER TABLE dbo.miscTerm ADD CONSTRAINT DF__miscTerm__IsArch__66603565 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.miscTerm ADD CONSTRAINT DF__miscTerm__IsStan__6754599E DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.miscTerm ADD CONSTRAINT DF__miscTerm__IsVisi__68487DD7 DEFAULT (1) FOR IsVisible
go

-- Drop Constraint, Rename and Create Table SQL

ALTER TABLE dbo.EventTimeSplit DROP CONSTRAINT PB_PBSplit
go
ALTER TABLE dbo.EventTime DROP CONSTRAINT RefEventTimeType113
go
DROP TABLE dbo.EventTime
go
DROP TABLE dbo.EventTimeSplit
go
DROP TABLE dbo.EventTimeType
go
CREATE TABLE dbo.RaceHistory
(
    RaceHistoryID     int             IDENTITY,
    Caption           nvarchar(128)   NULL,
    LongCaption       nvarchar(1024)  NULL,
    RaceTime          time(7)         NULL,
    CreatedOn         datetime        NULL,
    DistanceID        int              NOT NULL,
    strokeID          int              NOT NULL,
    HRID              int              NOT NULL,
    RaceHistoryTypeID int             NULL,
    CONSTRAINT PK_PB
    PRIMARY KEY CLUSTERED (RaceHistoryID)
)
go
CREATE TABLE dbo.RaceHistorySplit
(
    RaceHistorySplitID int       IDENTITY,
    Lap                smallint  NULL,
    RaceTime           time(7)   NULL,
    RaceHistoryID      int       NULL,
    CONSTRAINT PK_PBSplit
    PRIMARY KEY CLUSTERED (RaceHistorySplitID)
)
go
CREATE TABLE dbo.RaceHistoryType
(
    RaceHistoryTypeID int            IDENTITY,
    Caption           nvarchar(128)  NULL,
    CONSTRAINT PK62
    PRIMARY KEY CLUSTERED (RaceHistoryTypeID)
)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.RaceHistory 
    ADD CONSTRAINT HR_PB
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.RaceHistory 
    ADD FOREIGN KEY (RaceHistoryTypeID)
REFERENCES dbo.RaceHistoryType (RaceHistoryTypeID)
go
ALTER TABLE dbo.RaceHistory 
    ADD CONSTRAINT Distance_PB
FOREIGN KEY (DistanceID)
REFERENCES dbo.Distance (DistanceID)
go
ALTER TABLE dbo.RaceHistory 
    ADD CONSTRAINT stroke_PB
FOREIGN KEY (strokeID)
REFERENCES dbo.stroke (strokeID)
go
ALTER TABLE dbo.RaceHistorySplit 
    ADD CONSTRAINT PB_PBSplit
FOREIGN KEY (RaceHistoryID)
REFERENCES dbo.RaceHistory (RaceHistoryID)
go
