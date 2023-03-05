/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      SCM_Coach_v1.0.1.0.DM1
 *
 * Date Created : Sunday, March 05, 2023 10:49:11
 * Target DBMS : Microsoft SQL Server 2017
 */

USE master
go
CREATE DATABASE SCM_Coach
go
USE SCM_Coach
go
/* 
 * TABLE: coach 
 */

CREATE TABLE coach(
    coachID     int              IDENTITY(1,1),
    MemberID    int              NOT NULL,
    teamID      int              NOT NULL,
    NickName    nvarchar(128)    NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (coachID, MemberID, teamID)
)
go



IF OBJECT_ID('coach') IS NOT NULL
    PRINT '<<< CREATED TABLE coach >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE coach >>>'
go

/* 
 * TABLE: ContactNum 
 */

CREATE TABLE ContactNum(
    ContactNumID        int             IDENTITY(1,1),
    Number              nvarchar(30)    NULL,
    ContactNumTypeID    int             NULL,
    MemberID            int             NOT NULL,
    CONSTRAINT PK_ContactNum PRIMARY KEY NONCLUSTERED (ContactNumID)
)
go



IF OBJECT_ID('ContactNum') IS NOT NULL
    PRINT '<<< CREATED TABLE ContactNum >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ContactNum >>>'
go

/* 
 * TABLE: ContactNumType 
 */

CREATE TABLE ContactNumType(
    ContactNumTypeID    int             IDENTITY(1,1),
    Caption             nvarchar(30)    NULL,
    CONSTRAINT PK_ContactNumType PRIMARY KEY NONCLUSTERED (ContactNumTypeID)
)
go



IF OBJECT_ID('ContactNumType') IS NOT NULL
    PRINT '<<< CREATED TABLE ContactNumType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ContactNumType >>>'
go

/* 
 * TABLE: course 
 */

CREATE TABLE course(
    courseID        int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(10)     NULL,
    ABREV           nvarchar(4)      NULL,
    CONSTRAINT PK25 PRIMARY KEY NONCLUSTERED (courseID)
)
go



IF OBJECT_ID('course') IS NOT NULL
    PRINT '<<< CREATED TABLE course >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE course >>>'
go

/* 
 * TABLE: dictionary 
 */

CREATE TABLE dictionary(
    dictionaryID      int              IDENTITY(1,1),
    Caption           nvarchar(128)    NULL,
    ShortCaption      nvarchar(10)     NULL,
    ABREV             nvarchar(4)      NULL,
    IsStandard        bit              DEFAULT 0 NOT NULL,
    dictionaryType    int              NOT NULL,
    CONSTRAINT PK34 PRIMARY KEY NONCLUSTERED (dictionaryID)
)
go



IF OBJECT_ID('dictionary') IS NOT NULL
    PRINT '<<< CREATED TABLE dictionary >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dictionary >>>'
go

/* 
 * TABLE: dictionaryType 
 */

CREATE TABLE dictionaryType(
    dictionaryType    int              IDENTITY(1,1),
    Caption           nvarchar(128)    NULL,
    CONSTRAINT PK35 PRIMARY KEY NONCLUSTERED (dictionaryType)
)
go



IF OBJECT_ID('dictionaryType') IS NOT NULL
    PRINT '<<< CREATED TABLE dictionaryType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dictionaryType >>>'
go

/* 
 * TABLE: Distance 
 */

CREATE TABLE Distance(
    DistanceID      int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(10)     NULL,
    ABREV           nvarchar(4)      NULL,
    IsStandard      bit              DEFAULT 0 NOT NULL,
    Meters          int              NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (DistanceID)
)
go



IF OBJECT_ID('Distance') IS NOT NULL
    PRINT '<<< CREATED TABLE Distance >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Distance >>>'
go

/* 
 * TABLE: drill 
 */

CREATE TABLE drill(
    drillID         int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(10)     NULL,
    ABREV           nvarchar(4)      NULL,
    taskID          int              NOT NULL,
    CONSTRAINT PK32 PRIMARY KEY NONCLUSTERED (drillID)
)
go



IF OBJECT_ID('drill') IS NOT NULL
    PRINT '<<< CREATED TABLE drill >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE drill >>>'
go

/* 
 * TABLE: drillEx 
 */

CREATE TABLE drillEx(
    drillExID       int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(10)     NULL,
    ABREV           nvarchar(4)      NULL,
    CONSTRAINT PK33 PRIMARY KEY NONCLUSTERED (drillExID)
)
go



IF OBJECT_ID('drillEx') IS NOT NULL
    PRINT '<<< CREATED TABLE drillEx >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE drillEx >>>'
go

/* 
 * TABLE: drillExLink 
 */

CREATE TABLE drillExLink(
    drillExLinkID    char(10)         NOT NULL,
    Caption          nvarchar(128)    NULL,
    taskID           int              NULL,
    drillExID        int              NULL,
    CONSTRAINT PK42 PRIMARY KEY CLUSTERED (drillExLinkID)
)
go



IF OBJECT_ID('drillExLink') IS NOT NULL
    PRINT '<<< CREATED TABLE drillExLink >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE drillExLink >>>'
go

/* 
 * TABLE: equipment 
 */

CREATE TABLE equipment(
    equipmentID     int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(10)     NULL,
    ABREV           nvarchar(4)      NULL,
    CONSTRAINT PK26 PRIMARY KEY NONCLUSTERED (equipmentID)
)
go



IF OBJECT_ID('equipment') IS NOT NULL
    PRINT '<<< CREATED TABLE equipment >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE equipment >>>'
go

/* 
 * TABLE: evTime 
 */

CREATE TABLE evTime(
    evTimeID      int         IDENTITY(1,1),
    MemberID      char(10)    NULL,
    raceTime      time(7)     NULL,
    repCount      int         NULL,
    heartRACED    char(10)    NOT NULL,
    heartREST     char(10)    NOT NULL,
    taskID        int         NOT NULL,
    CONSTRAINT PK38 PRIMARY KEY NONCLUSTERED (evTimeID)
)
go



IF OBJECT_ID('evTime') IS NOT NULL
    PRINT '<<< CREATED TABLE evTime >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE evTime >>>'
go

/* 
 * TABLE: Gender 
 */

CREATE TABLE Gender(
    GenderID    int              IDENTITY(1,1),
    Caption     nvarchar(128)    NULL,
    CONSTRAINT PK16 PRIMARY KEY NONCLUSTERED (GenderID)
)
go



IF OBJECT_ID('Gender') IS NOT NULL
    PRINT '<<< CREATED TABLE Gender >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Gender >>>'
go

/* 
 * TABLE: grade 
 */

CREATE TABLE grade(
    gradeID     int              IDENTITY(1,1),
    Alpha       char(1)          NULL,
    Caption     nvarchar(128)    NULL,
    NickName    nvarchar(10)     NULL,
    CONSTRAINT PK36 PRIMARY KEY NONCLUSTERED (gradeID)
)
go



IF OBJECT_ID('grade') IS NOT NULL
    PRINT '<<< CREATED TABLE grade >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE grade >>>'
go

/* 
 * TABLE: heartRange 
 */

CREATE TABLE heartRange(
    heartRangeID    char(10)         NOT NULL,
    Caption         nvarchar(128)    NULL,
    BPMmin          int              NULL,
    BPMmax          int              NULL,
    CONSTRAINT PK39 PRIMARY KEY NONCLUSTERED (heartRangeID)
)
go



IF OBJECT_ID('heartRange') IS NOT NULL
    PRINT '<<< CREATED TABLE heartRange >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE heartRange >>>'
go

/* 
 * TABLE: intensity 
 */

CREATE TABLE intensity(
    intensityID     int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(10)     NULL,
    ABREV           nvarchar(4)      NULL,
    Level           int              NULL,
    CONSTRAINT PK23 PRIMARY KEY NONCLUSTERED (intensityID)
)
go



IF OBJECT_ID('intensity') IS NOT NULL
    PRINT '<<< CREATED TABLE intensity >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE intensity >>>'
go

/* 
 * TABLE: line 
 */

CREATE TABLE line(
    lineID        int              IDENTITY(1,1),
    Caption       nvarchar(128)    NULL,
    CreatedOn     datetime         NULL,
    ModifiedOn    datetime         NULL,
    teamID        int              NOT NULL,
    sessionID     int              NOT NULL,
    CONSTRAINT PK19 PRIMARY KEY NONCLUSTERED (lineID)
)
go



IF OBJECT_ID('line') IS NOT NULL
    PRINT '<<< CREATED TABLE line >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE line >>>'
go

/* 
 * TABLE: Member 
 */

CREATE TABLE Member(
    MemberID         int              IDENTITY(1,1),
    FirstName        char(64)         NULL,
    LastName         char(64)         NULL,
    DOB              datetime         NULL,
    MembershipNum    int              NULL,
    MembershipStr    nvarchar(24)     NULL,
    IsSwimmer        bit              DEFAULT 1 NULL,
    IsActive         bit              DEFAULT 1 NULL,
    IsArchived       bit              DEFAULT 0 NULL,
    IsCoach          bit              DEFAULT 0 NULL,
    CreatedOn        datetime         NULL,
    ArchivedOn       datetime         NULL,
    Email            nvarchar(256)    NULL,
    GenderID         int              NOT NULL,
    gradeID          int              NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (MemberID)
)
go



IF OBJECT_ID('Member') IS NOT NULL
    PRINT '<<< CREATED TABLE Member >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Member >>>'
go

/* 
 * TABLE: miscTerm 
 */

CREATE TABLE miscTerm(
    miscTermID      int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(10)     NULL,
    ABREV           nvarchar(4)      NULL,
    CONSTRAINT PK33_1 PRIMARY KEY NONCLUSTERED (miscTermID)
)
go



IF OBJECT_ID('miscTerm') IS NOT NULL
    PRINT '<<< CREATED TABLE miscTerm >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE miscTerm >>>'
go

/* 
 * TABLE: PB 
 */

CREATE TABLE PB(
    PBID          int    IDENTITY(1,1),
    DistanceID    int    NOT NULL,
    strokeID      int    NOT NULL,
    MemberID      int    NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (PBID)
)
go



IF OBJECT_ID('PB') IS NOT NULL
    PRINT '<<< CREATED TABLE PB >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PB >>>'
go

/* 
 * TABLE: pool 
 */

CREATE TABLE pool(
    poolID      int              IDENTITY(1,1),
    Caption     nvarchar(128)    NULL,
    Lanes       char(10)         NULL,
    courseID    int              NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (poolID)
)
go



IF OBJECT_ID('pool') IS NOT NULL
    PRINT '<<< CREATED TABLE pool >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE pool >>>'
go

/* 
 * TABLE: session 
 */

CREATE TABLE session(
    sessionID      int              IDENTITY(1,1),
    Caption        nvarchar(128)    NULL,
    CreatedOn      datetime         NULL,
    ModifiedOn     datetime         NULL,
    lanesBooked    int              NULL,
    timeBooked     time(7)          NULL,
    totTime        time(7)          NULL,
    totKM          char(10)         NULL,
    poolID         int              NOT NULL,
    CONSTRAINT PK30 PRIMARY KEY NONCLUSTERED (sessionID)
)
go



IF OBJECT_ID('session') IS NOT NULL
    PRINT '<<< CREATED TABLE session >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE session >>>'
go

/* 
 * TABLE: stroke 
 */

CREATE TABLE stroke(
    strokeID        int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(10)     NULL,
    ABREV           nvarchar(4)      NULL,
    IsStandard      bit              NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (strokeID)
)
go



IF OBJECT_ID('stroke') IS NOT NULL
    PRINT '<<< CREATED TABLE stroke >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE stroke >>>'
go

/* 
 * TABLE: subline 
 */

CREATE TABLE subline(
    sublineID        int         IDENTITY(1,1),
    reps             char(10)    NULL,
    CreatedOn        datetime    NULL,
    ModifiedOn       datetime    NULL,
    sublineTypeID    int         NOT NULL,
    lineID           int         NOT NULL,
    CONSTRAINT PK31 PRIMARY KEY NONCLUSTERED (sublineID)
)
go



IF OBJECT_ID('subline') IS NOT NULL
    PRINT '<<< CREATED TABLE subline >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE subline >>>'
go

/* 
 * TABLE: sublinelink 
 */

CREATE TABLE sublinelink(
    sublinelinkID    int    IDENTITY(1,1),
    parentID         int    NULL,
    childID          int    NULL,
    CONSTRAINT PK40 PRIMARY KEY NONCLUSTERED (sublinelinkID)
)
go



IF OBJECT_ID('sublinelink') IS NOT NULL
    PRINT '<<< CREATED TABLE sublinelink >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE sublinelink >>>'
go

/* 
 * TABLE: sublineType 
 */

CREATE TABLE sublineType(
    sublineTypeID    int              IDENTITY(1,1),
    Caption          nvarchar(128)    NULL,
    ShortCaption     nvarchar(10)     NULL,
    ABREV            nvarchar(4)      NULL,
    CONSTRAINT PK18 PRIMARY KEY CLUSTERED (sublineTypeID)
)
go



IF OBJECT_ID('sublineType') IS NOT NULL
    PRINT '<<< CREATED TABLE sublineType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE sublineType >>>'
go

/* 
 * TABLE: task 
 */

CREATE TABLE task(
    taskID             int               IDENTITY(1,1),
    Caption            nvarchar(128)     NULL,
    LongCaption        nvarchar(1024)    NULL,
    interval           time(7)           NULL,
    rest               time(7)           NULL,
    reps               int               NULL,
    repsdesc           bit               DEFAULT 0 NULL,
    repsdescby         int               NULL,
    repsasc            bit               DEFAULT 0 NULL,
    repsascby          int               NULL,
    intensitydesc      bit               DEFAULT 0 NULL,
    intensitydescby    int               NULL,
    intensityID        int               NOT NULL,
    equipmentID        int               NOT NULL,
    DistanceID         int               NOT NULL,
    strokeID           int               NOT NULL,
    sublineID          int               NOT NULL,
    miscTermID         int               NOT NULL,
    gradeID            int               NULL,
    CONSTRAINT PK29 PRIMARY KEY NONCLUSTERED (taskID)
)
go



IF OBJECT_ID('task') IS NOT NULL
    PRINT '<<< CREATED TABLE task >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE task >>>'
go

/* 
 * TABLE: team 
 */

CREATE TABLE team(
    teamID     int              IDENTITY(1,1),
    Caption    nvarchar(128)    NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (teamID)
)
go



IF OBJECT_ID('team') IS NOT NULL
    PRINT '<<< CREATED TABLE team >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE team >>>'
go

/* 
 * TABLE: teamMember 
 */

CREATE TABLE teamMember(
    teamMemberID    int    IDENTITY(1,1),
    teamID          int    NOT NULL,
    MemberID        int    NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (teamMemberID, teamID, MemberID)
)
go



IF OBJECT_ID('teamMember') IS NOT NULL
    PRINT '<<< CREATED TABLE teamMember >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE teamMember >>>'
go

/* 
 * TABLE: coach 
 */

ALTER TABLE coach ADD CONSTRAINT RefMember30 
    FOREIGN KEY (MemberID)
    REFERENCES Member(MemberID)
go

ALTER TABLE coach ADD CONSTRAINT Refteam31 
    FOREIGN KEY (teamID)
    REFERENCES team(teamID)
go


/* 
 * TABLE: ContactNum 
 */

ALTER TABLE ContactNum ADD CONSTRAINT RefMember29 
    FOREIGN KEY (MemberID)
    REFERENCES Member(MemberID)
go

ALTER TABLE ContactNum ADD CONSTRAINT FK_ContactNumType_ContactNum 
    FOREIGN KEY (ContactNumTypeID)
    REFERENCES ContactNumType(ContactNumTypeID) ON DELETE SET NULL
go


/* 
 * TABLE: dictionary 
 */

ALTER TABLE dictionary ADD CONSTRAINT RefdictionaryType48 
    FOREIGN KEY (dictionaryType)
    REFERENCES dictionaryType(dictionaryType)
go


/* 
 * TABLE: drill 
 */

ALTER TABLE drill ADD CONSTRAINT Reftask46 
    FOREIGN KEY (taskID)
    REFERENCES task(taskID)
go


/* 
 * TABLE: drillExLink 
 */

ALTER TABLE drillExLink ADD CONSTRAINT RefdrillEx64 
    FOREIGN KEY (drillExID)
    REFERENCES drillEx(drillExID)
go

ALTER TABLE drillExLink ADD CONSTRAINT Reftask65 
    FOREIGN KEY (taskID)
    REFERENCES task(taskID)
go


/* 
 * TABLE: evTime 
 */

ALTER TABLE evTime ADD CONSTRAINT RefheartRange56 
    FOREIGN KEY (heartRACED)
    REFERENCES heartRange(heartRangeID)
go

ALTER TABLE evTime ADD CONSTRAINT RefheartRange57 
    FOREIGN KEY (heartREST)
    REFERENCES heartRange(heartRangeID)
go

ALTER TABLE evTime ADD CONSTRAINT Reftask58 
    FOREIGN KEY (taskID)
    REFERENCES task(taskID)
go


/* 
 * TABLE: line 
 */

ALTER TABLE line ADD CONSTRAINT Refteam22 
    FOREIGN KEY (teamID)
    REFERENCES team(teamID)
go

ALTER TABLE line ADD CONSTRAINT Refsession42 
    FOREIGN KEY (sessionID)
    REFERENCES session(sessionID)
go


/* 
 * TABLE: Member 
 */

ALTER TABLE Member ADD CONSTRAINT RefGender17 
    FOREIGN KEY (GenderID)
    REFERENCES Gender(GenderID)
go

ALTER TABLE Member ADD CONSTRAINT Refgrade49 
    FOREIGN KEY (gradeID)
    REFERENCES grade(gradeID)
go


/* 
 * TABLE: PB 
 */

ALTER TABLE PB ADD CONSTRAINT RefDistance7 
    FOREIGN KEY (DistanceID)
    REFERENCES Distance(DistanceID)
go

ALTER TABLE PB ADD CONSTRAINT Refstroke8 
    FOREIGN KEY (strokeID)
    REFERENCES stroke(strokeID)
go

ALTER TABLE PB ADD CONSTRAINT RefMember9 
    FOREIGN KEY (MemberID)
    REFERENCES Member(MemberID)
go


/* 
 * TABLE: pool 
 */

ALTER TABLE pool ADD CONSTRAINT Refcourse38 
    FOREIGN KEY (courseID)
    REFERENCES course(courseID)
go


/* 
 * TABLE: session 
 */

ALTER TABLE session ADD CONSTRAINT Refpool39 
    FOREIGN KEY (poolID)
    REFERENCES pool(poolID)
go


/* 
 * TABLE: subline 
 */

ALTER TABLE subline ADD CONSTRAINT Refline45 
    FOREIGN KEY (lineID)
    REFERENCES line(lineID)
go

ALTER TABLE subline ADD CONSTRAINT RefsublineType61 
    FOREIGN KEY (sublineTypeID)
    REFERENCES sublineType(sublineTypeID)
go


/* 
 * TABLE: sublinelink 
 */

ALTER TABLE sublinelink ADD CONSTRAINT Refsubline59 
    FOREIGN KEY (parentID)
    REFERENCES subline(sublineID)
go

ALTER TABLE sublinelink ADD CONSTRAINT Refsubline60 
    FOREIGN KEY (childID)
    REFERENCES subline(sublineID)
go


/* 
 * TABLE: task 
 */

ALTER TABLE task ADD CONSTRAINT Refintensity34 
    FOREIGN KEY (intensityID)
    REFERENCES intensity(intensityID)
go

ALTER TABLE task ADD CONSTRAINT Refequipment36 
    FOREIGN KEY (equipmentID)
    REFERENCES equipment(equipmentID)
go

ALTER TABLE task ADD CONSTRAINT RefDistance40 
    FOREIGN KEY (DistanceID)
    REFERENCES Distance(DistanceID)
go

ALTER TABLE task ADD CONSTRAINT Refstroke41 
    FOREIGN KEY (strokeID)
    REFERENCES stroke(strokeID)
go

ALTER TABLE task ADD CONSTRAINT Refsubline44 
    FOREIGN KEY (sublineID)
    REFERENCES subline(sublineID)
go

ALTER TABLE task ADD CONSTRAINT RefmiscTerm50 
    FOREIGN KEY (miscTermID)
    REFERENCES miscTerm(miscTermID)
go

ALTER TABLE task ADD CONSTRAINT Refgrade69 
    FOREIGN KEY (gradeID)
    REFERENCES grade(gradeID)
go


/* 
 * TABLE: teamMember 
 */

ALTER TABLE teamMember ADD CONSTRAINT Refteam4 
    FOREIGN KEY (teamID)
    REFERENCES team(teamID)
go

ALTER TABLE teamMember ADD CONSTRAINT RefMember5 
    FOREIGN KEY (MemberID)
    REFERENCES Member(MemberID)
go


