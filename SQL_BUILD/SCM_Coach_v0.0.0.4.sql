/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      SCM_Coach_v1.0.1.0.DM1
 *
 * Date Created : Monday, March 06, 2023 12:16:44
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
    CONSTRAINT PK_coach PRIMARY KEY NONCLUSTERED (coachID, MemberID, teamID)
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
    ABREV           nvarchar(5)      NULL,
    CONSTRAINT PK_course PRIMARY KEY NONCLUSTERED (courseID)
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
    ABREV             nvarchar(5)      NULL,
    IsStandard        bit              DEFAULT 0 NOT NULL,
    dictionaryType    int              NOT NULL,
    SCMCoachID        int              NULL,
    CONSTRAINT PK_dictionary PRIMARY KEY NONCLUSTERED (dictionaryID)
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
    CONSTRAINT PK_dictionaryType PRIMARY KEY NONCLUSTERED (dictionaryType)
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
    ABREV           nvarchar(5)      NULL,
    IsStandard      bit              DEFAULT 0 NOT NULL,
    Meters          float            NULL,
    CONSTRAINT PK_Distance PRIMARY KEY NONCLUSTERED (DistanceID)
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
    ABREV           nvarchar(5)      NULL,
    taskID          int              NULL,
    CONSTRAINT PK_drill PRIMARY KEY NONCLUSTERED (drillID)
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
    ABREV           nvarchar(5)      NULL,
    CONSTRAINT PK_drillEx PRIMARY KEY NONCLUSTERED (drillExID)
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
    CONSTRAINT PK_drillExLink PRIMARY KEY CLUSTERED (drillExLinkID)
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
    ABREV           nvarchar(5)      NULL,
    CONSTRAINT PK_equipment PRIMARY KEY NONCLUSTERED (equipmentID)
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
    CONSTRAINT PK_evTime PRIMARY KEY NONCLUSTERED (evTimeID)
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
    CONSTRAINT PK_Gender PRIMARY KEY NONCLUSTERED (GenderID)
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
    CONSTRAINT PK_grade PRIMARY KEY NONCLUSTERED (gradeID)
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
    CONSTRAINT PK_heartRange PRIMARY KEY NONCLUSTERED (heartRangeID)
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
    ABREV           nvarchar(5)      NULL,
    Level           int              NULL,
    CONSTRAINT PK_intensity PRIMARY KEY NONCLUSTERED (intensityID)
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
    CONSTRAINT PK_line PRIMARY KEY NONCLUSTERED (lineID)
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
    CONSTRAINT PK_Member PRIMARY KEY NONCLUSTERED (MemberID)
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
    ABREV           nvarchar(5)      NULL,
    CONSTRAINT PK_miscTerm PRIMARY KEY NONCLUSTERED (miscTermID)
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
    CONSTRAINT PK_PB PRIMARY KEY NONCLUSTERED (PBID)
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
    CONSTRAINT PK_pool PRIMARY KEY NONCLUSTERED (poolID)
)
go



IF OBJECT_ID('pool') IS NOT NULL
    PRINT '<<< CREATED TABLE pool >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE pool >>>'
go

/* 
 * TABLE: SCMCoach 
 */

CREATE TABLE SCMCoach(
    SCMCoachID         int              IDENTITY(1,1),
    NickName           nvarchar(128)    NULL,
    Caption            nvarchar(128)    NULL,
    Email              nvarchar(128)    NULL,
    ContactNum         nvarchar(30)     NULL,
    WebSite            nvarchar(256)    NULL,
    CreatedOn          datetime         NULL,
    LogoDir            varchar(max)     NULL,
    LogoImg            image            NULL,
    LogoType           nvarchar(5)      NULL,
    DictionaryState    int              NULL,
    CONSTRAINT PK_SCMCoach PRIMARY KEY CLUSTERED (SCMCoachID)
)
go



IF OBJECT_ID('SCMCoach') IS NOT NULL
    PRINT '<<< CREATED TABLE SCMCoach >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SCMCoach >>>'
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
    SCMCoachID     int              NULL,
    CONSTRAINT PK_session PRIMARY KEY NONCLUSTERED (sessionID)
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
    ABREV           nvarchar(5)      NULL,
    IsStandard      bit              NULL,
    CONSTRAINT PK_stroke PRIMARY KEY NONCLUSTERED (strokeID)
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
    CONSTRAINT PK_subline PRIMARY KEY NONCLUSTERED (sublineID)
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
    CONSTRAINT PK_sublinelink PRIMARY KEY NONCLUSTERED (sublinelinkID)
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
    ABREV            nvarchar(5)      NULL,
    CONSTRAINT PK_sublineType PRIMARY KEY CLUSTERED (sublineTypeID)
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
    CONSTRAINT PK_task PRIMARY KEY NONCLUSTERED (taskID)
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
    CONSTRAINT PK_team PRIMARY KEY NONCLUSTERED (teamID)
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
    CONSTRAINT PK_teamMember PRIMARY KEY NONCLUSTERED (teamMemberID, teamID, MemberID)
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

ALTER TABLE coach ADD CONSTRAINT Member_coach 
    FOREIGN KEY (MemberID)
    REFERENCES Member(MemberID)
go

ALTER TABLE coach ADD CONSTRAINT team_coach 
    FOREIGN KEY (teamID)
    REFERENCES team(teamID)
go


/* 
 * TABLE: ContactNum 
 */

ALTER TABLE ContactNum ADD CONSTRAINT ContactNumType_ContactNum 
    FOREIGN KEY (ContactNumTypeID)
    REFERENCES ContactNumType(ContactNumTypeID) ON DELETE SET NULL
go

ALTER TABLE ContactNum ADD CONSTRAINT Member_ContactNum 
    FOREIGN KEY (MemberID)
    REFERENCES Member(MemberID)
go


/* 
 * TABLE: dictionary 
 */

ALTER TABLE dictionary ADD CONSTRAINT dictionaryType_dictionary 
    FOREIGN KEY (dictionaryType)
    REFERENCES dictionaryType(dictionaryType)
go

ALTER TABLE dictionary ADD CONSTRAINT SCMCoach_dictionary 
    FOREIGN KEY (SCMCoachID)
    REFERENCES SCMCoach(SCMCoachID)
go


/* 
 * TABLE: drill 
 */

ALTER TABLE drill ADD CONSTRAINT task_drill 
    FOREIGN KEY (taskID)
    REFERENCES task(taskID)
go


/* 
 * TABLE: drillExLink 
 */

ALTER TABLE drillExLink ADD CONSTRAINT drillEx_drillExLink 
    FOREIGN KEY (drillExID)
    REFERENCES drillEx(drillExID)
go

ALTER TABLE drillExLink ADD CONSTRAINT task_drillExLink 
    FOREIGN KEY (taskID)
    REFERENCES task(taskID)
go


/* 
 * TABLE: evTime 
 */

ALTER TABLE evTime ADD CONSTRAINT heartRange_evTi6 
    FOREIGN KEY (heartREST)
    REFERENCES heartRange(heartRangeID)
go

ALTER TABLE evTime ADD CONSTRAINT heartRange_evTime 
    FOREIGN KEY (heartRACED)
    REFERENCES heartRange(heartRangeID)
go

ALTER TABLE evTime ADD CONSTRAINT task_evTime 
    FOREIGN KEY (taskID)
    REFERENCES task(taskID)
go


/* 
 * TABLE: line 
 */

ALTER TABLE line ADD CONSTRAINT session_line 
    FOREIGN KEY (sessionID)
    REFERENCES session(sessionID)
go

ALTER TABLE line ADD CONSTRAINT team_line 
    FOREIGN KEY (teamID)
    REFERENCES team(teamID)
go


/* 
 * TABLE: Member 
 */

ALTER TABLE Member ADD CONSTRAINT Gender_Member 
    FOREIGN KEY (GenderID)
    REFERENCES Gender(GenderID)
go

ALTER TABLE Member ADD CONSTRAINT grade_Member 
    FOREIGN KEY (gradeID)
    REFERENCES grade(gradeID)
go


/* 
 * TABLE: PB 
 */

ALTER TABLE PB ADD CONSTRAINT Distance_PB 
    FOREIGN KEY (DistanceID)
    REFERENCES Distance(DistanceID)
go

ALTER TABLE PB ADD CONSTRAINT Member_PB 
    FOREIGN KEY (MemberID)
    REFERENCES Member(MemberID)
go

ALTER TABLE PB ADD CONSTRAINT stroke_PB 
    FOREIGN KEY (strokeID)
    REFERENCES stroke(strokeID)
go


/* 
 * TABLE: pool 
 */

ALTER TABLE pool ADD CONSTRAINT course_pool 
    FOREIGN KEY (courseID)
    REFERENCES course(courseID)
go


/* 
 * TABLE: session 
 */

ALTER TABLE session ADD CONSTRAINT pool_session 
    FOREIGN KEY (poolID)
    REFERENCES pool(poolID)
go

ALTER TABLE session ADD CONSTRAINT SCMCoach_session 
    FOREIGN KEY (SCMCoachID)
    REFERENCES SCMCoach(SCMCoachID)
go


/* 
 * TABLE: subline 
 */

ALTER TABLE subline ADD CONSTRAINT line_subline 
    FOREIGN KEY (lineID)
    REFERENCES line(lineID)
go

ALTER TABLE subline ADD CONSTRAINT sublineType_subline 
    FOREIGN KEY (sublineTypeID)
    REFERENCES sublineType(sublineTypeID)
go


/* 
 * TABLE: sublinelink 
 */

ALTER TABLE sublinelink ADD CONSTRAINT subline_sublineli8 
    FOREIGN KEY (parentID)
    REFERENCES subline(sublineID)
go

ALTER TABLE sublinelink ADD CONSTRAINT subline_sublinelink 
    FOREIGN KEY (childID)
    REFERENCES subline(sublineID)
go


/* 
 * TABLE: task 
 */

ALTER TABLE task ADD CONSTRAINT Distance_task 
    FOREIGN KEY (DistanceID)
    REFERENCES Distance(DistanceID)
go

ALTER TABLE task ADD CONSTRAINT equipment_task 
    FOREIGN KEY (equipmentID)
    REFERENCES equipment(equipmentID)
go

ALTER TABLE task ADD CONSTRAINT grade_task 
    FOREIGN KEY (gradeID)
    REFERENCES grade(gradeID)
go

ALTER TABLE task ADD CONSTRAINT intensity_task 
    FOREIGN KEY (intensityID)
    REFERENCES intensity(intensityID)
go

ALTER TABLE task ADD CONSTRAINT miscTerm_task 
    FOREIGN KEY (miscTermID)
    REFERENCES miscTerm(miscTermID)
go

ALTER TABLE task ADD CONSTRAINT stroke_task 
    FOREIGN KEY (strokeID)
    REFERENCES stroke(strokeID)
go

ALTER TABLE task ADD CONSTRAINT subline_task 
    FOREIGN KEY (sublineID)
    REFERENCES subline(sublineID)
go


/* 
 * TABLE: teamMember 
 */

ALTER TABLE teamMember ADD CONSTRAINT Member_teamMember 
    FOREIGN KEY (MemberID)
    REFERENCES Member(MemberID)
go

ALTER TABLE teamMember ADD CONSTRAINT team_teamMember 
    FOREIGN KEY (teamID)
    REFERENCES team(teamID)
go


