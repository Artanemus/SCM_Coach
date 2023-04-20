USE [SCM_Coach]
go

-- Dictionary Object Alter SQL

CREATE DEFAULT dbo.BIT_0 AS 0
go
CREATE DEFAULT dbo.BIT_1 AS 1
go
CREATE DEFAULT dbo.Def_NumOfLanes AS 8
go
CREATE DEFAULT dbo.Def_LenOfPool AS 25
go

-- Standard Alter Table SQL

ALTER TABLE dbo.stroke DROP CONSTRAINT DF__stroke__IsArchiv__71D1E811
go
ALTER TABLE dbo.stroke DROP CONSTRAINT DF__stroke__IsVisibl__72C60C4A
go
ALTER TABLE dbo.stroke ADD CONSTRAINT DF__stroke__IsArchiv__71D1E811 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.stroke ADD CONSTRAINT DF__stroke__IsVisibl__72C60C4A DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.task DROP CONSTRAINT RefTreeNode126
go
ALTER TABLE dbo.TreeNode DROP CONSTRAINT RefTreeRoot127
go
ALTER TABLE dbo.TreeNode DROP CONSTRAINT RefNodeType128
go
ALTER TABLE dbo.TreeNode DROP CONSTRAINT RefTreeNode129
go
EXEC sp_rename 'dbo.TreeNode.PK70','PK_TreeNode','INDEX'
go
EXEC sp_rename 'dbo.TreeRoot.PK69','PK_TreeRoot','INDEX'
go
ALTER TABLE dbo.ContactNum DROP CONSTRAINT DF__ContactNu__IsArc__267ABA7A
go
ALTER TABLE dbo.ContactNum ADD CONSTRAINT DF__ContactNu__IsArc__267ABA7A DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.Distance DROP CONSTRAINT DF__Distance__IsArch__31EC6D26
go
ALTER TABLE dbo.Distance DROP CONSTRAINT DF__Distance__IsStan__32E0915F
go
ALTER TABLE dbo.Distance DROP CONSTRAINT DF__Distance__IsVisi__33D4B598
go
ALTER TABLE dbo.Distance ADD CONSTRAINT DF__Distance__IsArch__31EC6D26 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.Distance ADD CONSTRAINT DF__Distance__IsStan__32E0915F DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.Distance ADD CONSTRAINT DF__Distance__IsVisi__33D4B598 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.drill DROP CONSTRAINT DF__drill__IsArchive__36B12243
go
ALTER TABLE dbo.drill DROP CONSTRAINT DF__drill__IsStandar__37A5467C
go
ALTER TABLE dbo.drill DROP CONSTRAINT DF__drill__IsVisible__38996AB5
go
ALTER TABLE dbo.drill ADD CONSTRAINT DF__drill__IsArchive__36B12243 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.drill ADD CONSTRAINT DF__drill__IsStandar__37A5467C DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.drill ADD CONSTRAINT DF__drill__IsVisible__38996AB5 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.drillEx DROP CONSTRAINT DF__drillEx__IsArchi__3B75D760
go
ALTER TABLE dbo.drillEx DROP CONSTRAINT DF__drillEx__IsStand__3C69FB99
go
ALTER TABLE dbo.drillEx DROP CONSTRAINT DF__drillEx__IsVisib__3D5E1FD2
go
ALTER TABLE dbo.drillEx ADD CONSTRAINT DF__drillEx__IsArchi__3B75D760 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.drillEx ADD CONSTRAINT DF__drillEx__IsStand__3C69FB99 DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.drillEx ADD CONSTRAINT DF__drillEx__IsVisib__3D5E1FD2 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.equipment DROP CONSTRAINT DF__equipment__IsArc__4222D4EF
go
ALTER TABLE dbo.equipment DROP CONSTRAINT DF__equipment__IsSta__4316F928
go
ALTER TABLE dbo.equipment DROP CONSTRAINT DF__equipment__IsVis__440B1D61
go
ALTER TABLE dbo.equipment ADD CONSTRAINT DF__equipment__IsArc__4222D4EF DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.equipment ADD CONSTRAINT DF__equipment__IsSta__4316F928 DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.equipment ADD CONSTRAINT DF__equipment__IsVis__440B1D61 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.grade DROP CONSTRAINT DF__grade__IsArchive__4AB81AF0
go
ALTER TABLE dbo.grade DROP CONSTRAINT DF__grade__IsStandar__4BAC3F29
go
ALTER TABLE dbo.grade DROP CONSTRAINT DF__grade__IsVisible__4CA06362
go
ALTER TABLE dbo.grade ADD CONSTRAINT DF__grade__IsArchive__4AB81AF0 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.grade ADD CONSTRAINT DF__grade__IsStandar__4BAC3F29 DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.grade ADD CONSTRAINT DF__grade__IsVisible__4CA06362 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.intensity DROP CONSTRAINT DF__intensity__IsArc__571DF1D5
go
ALTER TABLE dbo.intensity DROP CONSTRAINT DF__intensity__IsSta__5812160E
go
ALTER TABLE dbo.intensity DROP CONSTRAINT DF__intensity__IsVis__59063A47
go
ALTER TABLE dbo.intensity ADD CONSTRAINT DF__intensity__IsArc__571DF1D5 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.intensity ADD CONSTRAINT DF__intensity__IsSta__5812160E DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.intensity ADD CONSTRAINT DF__intensity__IsVis__59063A47 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.miscTerm DROP CONSTRAINT DF__miscTerm__IsArch__5DCAEF64
go
ALTER TABLE dbo.miscTerm DROP CONSTRAINT DF__miscTerm__IsStan__5EBF139D
go
ALTER TABLE dbo.miscTerm DROP CONSTRAINT DF__miscTerm__IsVisi__5FB337D6
go
ALTER TABLE dbo.miscTerm ADD CONSTRAINT DF__miscTerm__IsArch__5DCAEF64 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.miscTerm ADD CONSTRAINT DF__miscTerm__IsStan__5EBF139D DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.miscTerm ADD CONSTRAINT DF__miscTerm__IsVisi__5FB337D6 DEFAULT (1) FOR IsVisible
go
EXEC sp_rename 'dbo.NodeType.PK_lineType','PK_NodeType','INDEX'
go
ALTER TABLE dbo.RaceHistorySplit DROP CONSTRAINT PB_PBSplit
go
EXEC sp_rename 'dbo.RaceHistorySplit.PK_PBSplit','PK_RaceHistorySplit','INDEX'
go
EXEC sp_rename 'dbo.RaceHistoryType.PK62','PK_RaceHistoryType','INDEX'
go
ALTER TABLE dbo.task ADD FOREIGN KEY (TreeNodeID)
REFERENCES dbo.TreeNode (TreeNodeID)
go
ALTER TABLE dbo.TreeNode ADD FOREIGN KEY (TreeRootID)
REFERENCES dbo.TreeRoot (TreeRootID)
go
ALTER TABLE dbo.TreeNode ADD FOREIGN KEY (NodeTypeID)
REFERENCES dbo.NodeType (NodeTypeID)
go
ALTER TABLE dbo.TreeNode ADD FOREIGN KEY (Child)
REFERENCES dbo.TreeNode (TreeNodeID)
go
ALTER TABLE dbo.TreeRoot ADD FOREIGN KEY (WorkOutID)
REFERENCES dbo.WorkOut (WorkOutID)
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.coachLink DROP CONSTRAINT HR_coachLink
go
ALTER TABLE dbo.ContactNum DROP CONSTRAINT HR_ContactNum
go
ALTER TABLE dbo.memberLink DROP CONSTRAINT HR_memberLink
go
ALTER TABLE dbo.RaceHistory DROP CONSTRAINT HR_PB
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.HR.PK_HR','PK_HR_04202023002058001','INDEX'
go
EXEC sp_rename 'dbo.Gender_HR','Gender_HR_04202023002058002'
go
EXEC sp_rename 'dbo.grade_HR','grade_HR_04202023002058003'
go
EXEC sp_rename 'dbo.HRType_HR','HRType_HR_04202023002058004'
go
EXEC sp_rename 'dbo.DF__HR__IsArchived__52593CB8', 'DF__HR__Is_04202023002058005',OBJECT
go
EXEC sp_rename 'dbo.DF__HR__IsActive__5165187F', 'DF__HR__Is_04202023002058006',OBJECT
go
EXEC sp_rename 'dbo.HR','HR_04202023002058000',OBJECT
go
CREATE TABLE dbo.HR
(
    HRID          int            IDENTITY,
    FirstName     char(64)       NULL,
    MiddleInitial char(4)        NULL,
    LastName      char(64)       NULL,
    DOB           datetime       NULL,
    RegisterNum   int            NULL,
    RegisterStr   nvarchar(24)   NULL,
    IsActive      bit            NULL,
    IsArchived    bit            NULL,
    CreatedOn     datetime       NULL,
    ArchivedOn    datetime       NULL,
    Email         nvarchar(256)  NULL,
    SCMMemberID   int            NULL,
    GenderID      int             NOT NULL,
    gradeID       int            NULL,
    HRTypeID      int             NOT NULL
)
ON [PRIMARY]
go
EXEC sp_bindefault 'BIT_1', 'dbo.HR.IsActive'
go
EXEC sp_bindefault 'BIT_0', 'dbo.HR.IsArchived'
go
EXEC sp_rename 'dbo.RaceHistory.PK_PB','PK_PB_04202023002059001','INDEX'
go
EXEC sp_rename 'dbo.RefRaceHistoryType118','RefRaceHis_04202023002059002'
go
EXEC sp_rename 'dbo.Distance_PB','Distance_P_04202023002059003'
go
EXEC sp_rename 'dbo.stroke_PB','stroke_PB_04202023002059005'
go
EXEC sp_rename 'dbo.RaceHistory','RaceHistor_04202023002059000',OBJECT
go
CREATE TABLE dbo.RaceHistory
(
    RaceHistoryID     int             IDENTITY,
    Caption           nvarchar(128)   NULL,
    LongCaption       nvarchar(1024)  NULL,
    RaceTime          time(7)         NULL,
    Lane              int             NULL,
    IsDisqualified    bit             NULL,
    IsScratched       bit             NULL,
    NumOfLanes        int             NULL,
    LenOfPool         int             NULL,
    CreatedOn         datetime        NULL,
    EntrantID         int             NULL,
    PoolName          nvarchar(128)   NULL,
    DistanceID        int              NOT NULL,
    strokeID          int              NOT NULL,
    HRID              int              NOT NULL,
    RaceHistoryTypeID int             NULL,
    PoolTypeID        char(10)        NULL,
    DisqualifiedID    int             NULL
)
ON [PRIMARY]
go
EXEC sp_bindefault 'BIT_0', 'dbo.RaceHistory.IsDisqualified'
go
EXEC sp_bindefault 'BIT_0', 'dbo.RaceHistory.IsScratched'
go
EXEC sp_bindefault 'Def_NumOfLanes', 'dbo.RaceHistory.NumOfLanes'
go
EXEC sp_bindefault 'Def_LenOfPool', 'dbo.RaceHistory.LenOfPool'
go
CREATE TABLE dbo.Disqualified
(
    DisqualifiedID int             NOT NULL,
    Caption        nvarchar(128)  NULL,
    ABREV          nvarchar(16)   NULL,
    CONSTRAINT PK_Disqualified
    PRIMARY KEY CLUSTERED (DisqualifiedID)
)
go
CREATE TABLE dbo.PoolType
(
    PoolTypeID char(10)        NOT NULL,
    ABREV      nvarchar(5)    NULL,
    Caption    nvarchar(128)  NULL,
    CONSTRAINT PK_PoolType
    PRIMARY KEY CLUSTERED (PoolTypeID)
)
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.HR ON
go
INSERT INTO dbo.HR(
                   HRID,
                   FirstName,
                   MiddleInitial,
                   LastName,
                   DOB,
                   RegisterNum,
                   RegisterStr,
                   IsActive,
                   IsArchived,
                   CreatedOn,
                   ArchivedOn,
                   Email,
                   SCMMemberID,
                   GenderID,
                   gradeID,
                   HRTypeID
                  )
            SELECT 
                   HRID,
                   FirstName,
                   NULL,
                   LastName,
                   DOB,
                   RegisterNum,
                   RegisterStr,
                   IsActive,
                   IsArchived,
                   CreatedOn,
                   ArchivedOn,
                   Email,
                   SCMMemberID,
                   GenderID,
                   gradeID,
                   HRTypeID
              FROM dbo.HR_04202023002058000 
go
SET IDENTITY_INSERT dbo.HR OFF
go
SET IDENTITY_INSERT dbo.RaceHistory ON
go
INSERT INTO dbo.RaceHistory(
                            RaceHistoryID,
                            Caption,
                            LongCaption,
                            RaceTime,
                            Lane,
                            IsDisqualified,
                            IsScratched,
                            NumOfLanes,
                            LenOfPool,
                            CreatedOn,
                            EntrantID,
                            PoolName,
                            DistanceID,
                            strokeID,
                            HRID,
                            RaceHistoryTypeID,
                            PoolTypeID,
                            DisqualifiedID
                           )
                     SELECT 
                            RaceHistoryID,
                            Caption,
                            LongCaption,
                            RaceTime,
                            NULL,
                            NULL,
                            NULL,
                            NULL,
                            NULL,
                            CreatedOn,
                            EntrantID,
                            NULL,
                            DistanceID,
                            strokeID,
                            HRID,
                            RaceHistoryTypeID,
                            NULL,
                            NULL
                       FROM dbo.RaceHistor_04202023002059000 
go
SET IDENTITY_INSERT dbo.RaceHistory OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.HR ADD CONSTRAINT PK_HR
PRIMARY KEY CLUSTERED (HRID)
go
ALTER TABLE dbo.RaceHistory ADD CONSTRAINT PK_RaceHistory
PRIMARY KEY CLUSTERED (RaceHistoryID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.coachLink ADD CONSTRAINT HR_coachLink
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.ContactNum ADD CONSTRAINT HR_ContactNum
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.memberLink ADD CONSTRAINT HR_memberLink
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.RaceHistory ADD CONSTRAINT HR_PB
FOREIGN KEY (HRID)
REFERENCES dbo.HR (HRID)
go
ALTER TABLE dbo.RaceHistorySplit ADD CONSTRAINT PB_PBSplit
FOREIGN KEY (RaceHistoryID)
REFERENCES dbo.RaceHistory (RaceHistoryID)
go
ALTER TABLE dbo.HR ADD CONSTRAINT Gender_HR
FOREIGN KEY (GenderID)
REFERENCES dbo.Gender (GenderID)
go
ALTER TABLE dbo.HR ADD CONSTRAINT grade_HR
FOREIGN KEY (gradeID)
REFERENCES dbo.grade (gradeID)
go
ALTER TABLE dbo.HR ADD CONSTRAINT HRType_HR
FOREIGN KEY (HRTypeID)
REFERENCES dbo.HRType (HRTypeID)
go
ALTER TABLE dbo.RaceHistory ADD FOREIGN KEY (RaceHistoryTypeID)
REFERENCES dbo.RaceHistoryType (RaceHistoryTypeID)
go
ALTER TABLE dbo.RaceHistory ADD CONSTRAINT Distance_PB
FOREIGN KEY (DistanceID)
REFERENCES dbo.Distance (DistanceID)
go
ALTER TABLE dbo.RaceHistory ADD CONSTRAINT stroke_PB
FOREIGN KEY (strokeID)
REFERENCES dbo.stroke (strokeID)
go
ALTER TABLE dbo.RaceHistory ADD FOREIGN KEY (PoolTypeID)
REFERENCES dbo.PoolType (PoolTypeID)
go
ALTER TABLE dbo.RaceHistory ADD FOREIGN KEY (DisqualifiedID)
REFERENCES dbo.Disqualified (DisqualifiedID)
go
