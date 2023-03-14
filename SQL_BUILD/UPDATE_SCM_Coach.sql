USE [SCM_Coach]
go

-- Dictionary Object Alter SQL

CREATE DEFAULT dbo.BIT_0 AS 0
go
CREATE DEFAULT dbo.BIT_1 AS 1
go

-- Standard Alter Table SQL

ALTER TABLE dbo.stroke DROP CONSTRAINT DF__stroke__IsArchiv__6EF57B66
go
ALTER TABLE dbo.stroke DROP CONSTRAINT DF__stroke__IsVisibl__6FE99F9F
go
ALTER TABLE dbo.stroke ADD CONSTRAINT DF__stroke__IsArchiv__6EF57B66 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.stroke ADD CONSTRAINT DF__stroke__IsVisibl__6FE99F9F DEFAULT (1) FOR IsVisible
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

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.coachLink DROP CONSTRAINT MembercoachLink
go
ALTER TABLE dbo.ContactNum DROP CONSTRAINT MemberContactNum
go
ALTER TABLE dbo.memberLink DROP CONSTRAINT MembermemberLink
go
ALTER TABLE dbo.PB DROP CONSTRAINT MemberPB
go

-- Drop Constraint, Rename and Create Table SQL

EXEC sp_rename 'dbo.Member.PK_Member','PK_Member_03142023011327001','INDEX'
go
EXEC sp_rename 'dbo.GenderMember','GenderMemb_03142023011327002'
go
EXEC sp_rename 'dbo.gradeMember','gradeMembe_03142023011327003'
go
EXEC sp_rename 'dbo.MemberTypeMember','MemberType_03142023011327004'
go
EXEC sp_rename 'dbo.DF__Member__IsArchiv__59FA5E80', 'DF__Member_03142023011327005',OBJECT
go
EXEC sp_rename 'dbo.DF__Member__IsActive__59063A47', 'DF__Member_03142023011327006',OBJECT
go
EXEC sp_rename 'dbo.Member','Member_03142023011327000',OBJECT
go
CREATE TABLE dbo.Member
(
    MemberID     int            IDENTITY,
    FirstName    char(64)       NULL,
    LastName     char(64)       NULL,
    DOB          datetime       NULL,
    RegisterNum  int            NULL,
    RegisterStr  nvarchar(24)   NULL,
    IsActive     bit            NULL,
    IsArchived   bit            NULL,
    CreatedOn    datetime       NULL,
    ArchivedOn   datetime       NULL,
    Email        nvarchar(256)  NULL,
    GenderID     int             NOT NULL,
    gradeID      int            NULL,
    MemberTypeID int             NOT NULL
)
ON [PRIMARY]
go
EXEC sp_bindefault 'BIT_1', 'dbo.Member.IsActive'
go
EXEC sp_bindefault 'BIT_0', 'dbo.Member.IsArchived'
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.Member ON
go
INSERT INTO dbo.Member(
                       MemberID,
                       FirstName,
                       LastName,
                       DOB,
                       RegisterNum,
                       RegisterStr,
                       IsActive,
                       IsArchived,
                       CreatedOn,
                       ArchivedOn,
                       Email,
                       GenderID,
                       gradeID,
                       MemberTypeID
                      )
                SELECT 
                       MemberID,
                       FirstName,
                       LastName,
                       DOB,
                       RegisterNum,
                       RegisterStr,
                       IsActive,
                       IsArchived,
                       CreatedOn,
                       ArchivedOn,
                       Email,
                       GenderID,
                       gradeID,
                       MemberTypeID
                  FROM dbo.Member_03142023011327000 
go
SET IDENTITY_INSERT dbo.Member OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.Member ADD CONSTRAINT PK_Member
PRIMARY KEY NONCLUSTERED (MemberID)
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.coachLink ADD CONSTRAINT MembercoachLink
FOREIGN KEY (MemberID)
REFERENCES dbo.Member (MemberID)
go
ALTER TABLE dbo.ContactNum ADD CONSTRAINT MemberContactNum
FOREIGN KEY (MemberID)
REFERENCES dbo.Member (MemberID)
go
ALTER TABLE dbo.memberLink ADD CONSTRAINT MembermemberLink
FOREIGN KEY (MemberID)
REFERENCES dbo.Member (MemberID)
go
ALTER TABLE dbo.PB ADD CONSTRAINT MemberPB
FOREIGN KEY (MemberID)
REFERENCES dbo.Member (MemberID)
go
ALTER TABLE dbo.Member ADD CONSTRAINT GenderMember
FOREIGN KEY (GenderID)
REFERENCES dbo.Gender (GenderID)
go
ALTER TABLE dbo.Member ADD CONSTRAINT gradeMember
FOREIGN KEY (gradeID)
REFERENCES dbo.grade (gradeID)
go
ALTER TABLE dbo.Member ADD CONSTRAINT MemberTypeMember
FOREIGN KEY (MemberTypeID)
REFERENCES dbo.MemberType (MemberTypeID)
go
