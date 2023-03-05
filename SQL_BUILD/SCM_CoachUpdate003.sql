USE [SCM_Coach]
go

-- Drop Constraint, Rename and Create Table SQL

CREATE TABLE dbo.SCMCoach
(
    SCMCoachID      int            IDENTITY,
    NickName        nvarchar(128)  NULL,
    Caption         nvarchar(128)  NULL,
    Email           nvarchar(128)  NULL,
    ContactNum      nvarchar(30)   NULL,
    WebSite         nvarchar(256)  NULL,
    CreatedOn       datetime       NULL,
    LogoDir         varchar(max)   NULL,
    LogoImg         image          NULL,
    LogoType        nvarchar(5)    NULL,
    DictionaryState int            NULL,
    CONSTRAINT PK_SCMCoach
    PRIMARY KEY CLUSTERED (SCMCoachID)
)
go


-- Standard Alter Table SQL

ALTER TABLE dbo.dictionary ADD SCMCoachID int  NULL
go
ALTER TABLE dbo.Distance DROP CONSTRAINT DF__Distance__IsStan__30F848ED
go
ALTER TABLE dbo.Distance ADD CONSTRAINT DF__Distance__IsStan__30F848ED DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.[session] ADD SCMCoachID int  NULL
go
ALTER TABLE dbo.dictionary ADD CONSTRAINT SCMCoach_dictionary
FOREIGN KEY (SCMCoachID)
REFERENCES dbo.SCMCoach (SCMCoachID)
go
ALTER TABLE dbo.[session] ADD CONSTRAINT SCMCoach_session
FOREIGN KEY (SCMCoachID)
REFERENCES dbo.SCMCoach (SCMCoachID)
go

