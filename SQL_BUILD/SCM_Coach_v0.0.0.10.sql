/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      SCM_Coach_v1.0.1.0.DM1
 *
 * Date Created : Thursday, March 16, 2023 11:09:18
 * Target DBMS : Microsoft SQL Server 2017
 */

USE master
go
CREATE DATABASE SCM_Coach
go
USE SCM_Coach
go
/* 
 * TABLE: coachLink 
 */

CREATE TABLE coachLink(
    coachLinkID    int              IDENTITY(1,1),
    HRID           int              NOT NULL,
    teamID         int              NOT NULL,
    NickName       nvarchar(128)    NULL,
    CONSTRAINT PK_coachLink PRIMARY KEY CLUSTERED (coachLinkID, HRID, teamID)
)
go



IF OBJECT_ID('coachLink') IS NOT NULL
    PRINT '<<< CREATED TABLE coachLink >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE coachLink >>>'
go

/* 
 * TABLE: ContactNum 
 */

CREATE TABLE ContactNum(
    ContactNumID        int             IDENTITY(1,1),
    Number              nvarchar(30)    NULL,
    ContactNumTypeID    int             NULL,
    HRID                int             NOT NULL,
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
    ShortCaption    nvarchar(16)     NULL,
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
    ShortCaption      nvarchar(16)     NULL,
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
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    IsArchived      bit              DEFAULT 0 NOT NULL,
    IsStandard      bit              DEFAULT 0 NOT NULL,
    IsVisible       bit              DEFAULT 1 NOT NULL,
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
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    IsArchived      bit              DEFAULT 0 NOT NULL,
    IsStandard      bit              DEFAULT 0 NOT NULL,
    IsVisible       bit              DEFAULT 1 NOT NULL,
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
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    IsArchived      bit              DEFAULT 0 NOT NULL,
    IsStandard      bit              DEFAULT 0 NOT NULL,
    IsVisible       bit              DEFAULT 1 NOT NULL,
    CONSTRAINT PK_drillEx PRIMARY KEY NONCLUSTERED (drillExID)
)
go



IF OBJECT_ID('drillEx') IS NOT NULL
    PRINT '<<< CREATED TABLE drillEx >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE drillEx >>>'
go

/* 
 * TABLE: drillLink 
 */

CREATE TABLE drillLink(
    drillLinkID    char(10)         NOT NULL,
    drillID        int              NOT NULL,
    drillExID      int              NOT NULL,
    Caption        nvarchar(128)    NULL,
    CONSTRAINT PK_drillLink PRIMARY KEY CLUSTERED (drillLinkID, drillID, drillExID)
)
go



IF OBJECT_ID('drillLink') IS NOT NULL
    PRINT '<<< CREATED TABLE drillLink >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE drillLink >>>'
go

/* 
 * TABLE: equipment 
 */

CREATE TABLE equipment(
    equipmentID     int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    IsArchived      bit              DEFAULT 0 NOT NULL,
    IsStandard      bit              DEFAULT 0 NOT NULL,
    IsVisible       bit              DEFAULT 1 NOT NULL,
    CONSTRAINT PK_equipment PRIMARY KEY NONCLUSTERED (equipmentID)
)
go



IF OBJECT_ID('equipment') IS NOT NULL
    PRINT '<<< CREATED TABLE equipment >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE equipment >>>'
go

/* 
 * TABLE: EventTime 
 */

CREATE TABLE EventTime(
    EventTimeID        int               IDENTITY(1,1),
    Caption            nvarchar(128)     NULL,
    LongCaption        nvarchar(1024)    NULL,
    RaceTime           time(7)           NULL,
    CreatedOn          datetime          NULL,
    DistanceID         int               NOT NULL,
    strokeID           int               NOT NULL,
    HRID               int               NOT NULL,
    EventTimeTypeID    int               NULL,
    CONSTRAINT PK_PB PRIMARY KEY CLUSTERED (EventTimeID)
)
go



IF OBJECT_ID('EventTime') IS NOT NULL
    PRINT '<<< CREATED TABLE EventTime >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EventTime >>>'
go

/* 
 * TABLE: EventTimeSplit 
 */

CREATE TABLE EventTimeSplit(
    EventTimeSplitID    int         IDENTITY(1,1),
    Lap                 smallint    NULL,
    RaceTime            time(7)     NULL,
    EventTimeID         int         NULL,
    CONSTRAINT PK_PBSplit PRIMARY KEY CLUSTERED (EventTimeSplitID)
)
go



IF OBJECT_ID('EventTimeSplit') IS NOT NULL
    PRINT '<<< CREATED TABLE EventTimeSplit >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EventTimeSplit >>>'
go

/* 
 * TABLE: EventTimeType 
 */

CREATE TABLE EventTimeType(
    EventTimeTypeID    int              IDENTITY(1,1),
    Caption            nvarchar(128)    NULL,
    CONSTRAINT PK62 PRIMARY KEY CLUSTERED (EventTimeTypeID)
)
go



IF OBJECT_ID('EventTimeType') IS NOT NULL
    PRINT '<<< CREATED TABLE EventTimeType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EventTimeType >>>'
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
    gradeID       int              IDENTITY(1,1),
    Alpha         char(1)          NULL,
    Caption       nvarchar(128)    NULL,
    NickName      nvarchar(16)     NULL,
    LogoDir       varchar(max)     NULL,
    LogoImg       image            NULL,
    LogoType      nvarchar(5)      NULL,
    IsArchived    bit              DEFAULT 0 NOT NULL,
    IsStandard    bit              DEFAULT 0 NOT NULL,
    IsVisible     bit              DEFAULT 1 NOT NULL,
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
 * TABLE: HR 
 */

CREATE TABLE HR(
    HRID           int              IDENTITY(1,1),
    FirstName      char(64)         NULL,
    LastName       char(64)         NULL,
    DOB            datetime         NULL,
    RegisterNum    int              NULL,
    RegisterStr    nvarchar(24)     NULL,
    IsActive       bit              DEFAULT 1 NULL,
    IsArchived     bit              DEFAULT 0 NULL,
    CreatedOn      datetime         NULL,
    ArchivedOn     datetime         NULL,
    Email          nvarchar(256)    NULL,
    SCMMemberID    int              NULL,
    GenderID       int              NOT NULL,
    gradeID        int              NULL,
    HRTypeID       int              NOT NULL,
    CONSTRAINT PK_HR PRIMARY KEY CLUSTERED (HRID)
)
go



IF OBJECT_ID('HR') IS NOT NULL
    PRINT '<<< CREATED TABLE HR >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE HR >>>'
go

/* 
 * TABLE: HRType 
 */

CREATE TABLE HRType(
    HRTypeID    int              IDENTITY(1,1),
    Caption     nvarchar(128)    NULL,
    CONSTRAINT PK_HRType PRIMARY KEY CLUSTERED (HRTypeID)
)
go



IF OBJECT_ID('HRType') IS NOT NULL
    PRINT '<<< CREATED TABLE HRType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE HRType >>>'
go

/* 
 * TABLE: intensity 
 */

CREATE TABLE intensity(
    intensityID     int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    IsArchived      bit              DEFAULT 0 NOT NULL,
    IsStandard      bit              DEFAULT 0 NOT NULL,
    IsVisible       bit              DEFAULT 1 NOT NULL,
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
    lineID        int         IDENTITY(1,1),
    reps          char(10)    NULL,
    CreatedOn     datetime    NULL,
    ModifiedOn    datetime    NULL,
    lineTypeID    int         NOT NULL,
    CONSTRAINT PK_line PRIMARY KEY NONCLUSTERED (lineID)
)
go



IF OBJECT_ID('line') IS NOT NULL
    PRINT '<<< CREATED TABLE line >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE line >>>'
go

/* 
 * TABLE: lineType 
 */

CREATE TABLE lineType(
    lineTypeID      int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    CONSTRAINT PK_lineType PRIMARY KEY CLUSTERED (lineTypeID)
)
go



IF OBJECT_ID('lineType') IS NOT NULL
    PRINT '<<< CREATED TABLE lineType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE lineType >>>'
go

/* 
 * TABLE: memberLink 
 */

CREATE TABLE memberLink(
    memberLinkID    int    IDENTITY(1,1),
    teamID          int    NOT NULL,
    HRID            int    NOT NULL,
    CONSTRAINT PK_memberLink PRIMARY KEY CLUSTERED (memberLinkID, teamID, HRID)
)
go



IF OBJECT_ID('memberLink') IS NOT NULL
    PRINT '<<< CREATED TABLE memberLink >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE memberLink >>>'
go

/* 
 * TABLE: miscTerm 
 */

CREATE TABLE miscTerm(
    miscTermID      int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    IsArchived      bit              DEFAULT 0 NOT NULL,
    IsStandard      bit              DEFAULT 0 NOT NULL,
    IsVisible       bit              DEFAULT 1 NOT NULL,
    CONSTRAINT PK_miscTerm PRIMARY KEY NONCLUSTERED (miscTermID)
)
go



IF OBJECT_ID('miscTerm') IS NOT NULL
    PRINT '<<< CREATED TABLE miscTerm >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE miscTerm >>>'
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
 * TABLE: SCMSystem 
 */

CREATE TABLE SCMSystem(
    SCMSystemID    int    IDENTITY(1,1),
    DBVersion      int    NULL,
    Major          int    NULL,
    Minor          int    NULL,
    CONSTRAINT PK_SCMSystem PRIMARY KEY CLUSTERED (SCMSystemID)
)
go



IF OBJECT_ID('SCMSystem') IS NOT NULL
    PRINT '<<< CREATED TABLE SCMSystem >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SCMSystem >>>'
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
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    IsArchived      bit              DEFAULT 0 NOT NULL,
    IsStandard      bit              NULL,
    IsVisible       bit              DEFAULT 1 NOT NULL,
    CONSTRAINT PK_stroke PRIMARY KEY NONCLUSTERED (strokeID)
)
go



IF OBJECT_ID('stroke') IS NOT NULL
    PRINT '<<< CREATED TABLE stroke >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE stroke >>>'
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
    lineID             int               NOT NULL,
    miscTermID         int               NOT NULL,
    gradeID            int               NULL,
    drillID            int               NULL,
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
 * TABLE: WorkOut 
 */

CREATE TABLE WorkOut(
    WorkOutID     int              IDENTITY(1,1),
    Caption       nvarchar(128)    NULL,
    CreatedOn     datetime         NULL,
    ModifiedOn    datetime         NULL,
    teamID        int              NOT NULL,
    sessionID     int              NOT NULL,
    CONSTRAINT PK_WorkOut PRIMARY KEY CLUSTERED (WorkOutID)
)
go



IF OBJECT_ID('WorkOut') IS NOT NULL
    PRINT '<<< CREATED TABLE WorkOut >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE WorkOut >>>'
go

/* 
 * TABLE: WorkOutLink 
 */

CREATE TABLE WorkOutLink(
    WorkOutLinkID    int    IDENTITY(1,1),
    WorkOutID        int    NOT NULL,
    lineID           int    NOT NULL,
    ChildLine        int    NULL,
    ChildSortIndx    int    NULL,
    CONSTRAINT PK_WorkOutLink PRIMARY KEY CLUSTERED (WorkOutLinkID, WorkOutID, lineID)
)
go



IF OBJECT_ID('WorkOutLink') IS NOT NULL
    PRINT '<<< CREATED TABLE WorkOutLink >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE WorkOutLink >>>'
go

/* 
 * TABLE: coachLink 
 */

ALTER TABLE coachLink ADD CONSTRAINT HR_coachLink 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go

ALTER TABLE coachLink ADD CONSTRAINT team_coachLink 
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

ALTER TABLE ContactNum ADD CONSTRAINT HR_ContactNum 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
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
 * TABLE: drillLink 
 */

ALTER TABLE drillLink ADD CONSTRAINT drill_drillLink 
    FOREIGN KEY (drillID)
    REFERENCES drill(drillID)
go

ALTER TABLE drillLink ADD CONSTRAINT drillEx_drillLink 
    FOREIGN KEY (drillExID)
    REFERENCES drillEx(drillExID)
go


/* 
 * TABLE: EventTime 
 */

ALTER TABLE EventTime ADD CONSTRAINT RefEventTimeType113 
    FOREIGN KEY (EventTimeTypeID)
    REFERENCES EventTimeType(EventTimeTypeID)
go

ALTER TABLE EventTime ADD CONSTRAINT Distance_PB 
    FOREIGN KEY (DistanceID)
    REFERENCES Distance(DistanceID)
go

ALTER TABLE EventTime ADD CONSTRAINT HR_PB 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go

ALTER TABLE EventTime ADD CONSTRAINT stroke_PB 
    FOREIGN KEY (strokeID)
    REFERENCES stroke(strokeID)
go


/* 
 * TABLE: EventTimeSplit 
 */

ALTER TABLE EventTimeSplit ADD CONSTRAINT PB_PBSplit 
    FOREIGN KEY (EventTimeID)
    REFERENCES EventTime(EventTimeID)
go


/* 
 * TABLE: evTime 
 */

ALTER TABLE evTime ADD CONSTRAINT heartRange_evT32 
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
 * TABLE: HR 
 */

ALTER TABLE HR ADD CONSTRAINT Gender_HR 
    FOREIGN KEY (GenderID)
    REFERENCES Gender(GenderID)
go

ALTER TABLE HR ADD CONSTRAINT grade_HR 
    FOREIGN KEY (gradeID)
    REFERENCES grade(gradeID)
go

ALTER TABLE HR ADD CONSTRAINT HRType_HR 
    FOREIGN KEY (HRTypeID)
    REFERENCES HRType(HRTypeID)
go


/* 
 * TABLE: line 
 */

ALTER TABLE line ADD CONSTRAINT lineType_line 
    FOREIGN KEY (lineTypeID)
    REFERENCES lineType(lineTypeID)
go


/* 
 * TABLE: memberLink 
 */

ALTER TABLE memberLink ADD CONSTRAINT HR_memberLink 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go

ALTER TABLE memberLink ADD CONSTRAINT team_memberLink 
    FOREIGN KEY (teamID)
    REFERENCES team(teamID)
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
 * TABLE: task 
 */

ALTER TABLE task ADD CONSTRAINT Distance_task 
    FOREIGN KEY (DistanceID)
    REFERENCES Distance(DistanceID)
go

ALTER TABLE task ADD CONSTRAINT drill_task 
    FOREIGN KEY (drillID)
    REFERENCES drill(drillID)
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

ALTER TABLE task ADD CONSTRAINT line_task 
    FOREIGN KEY (lineID)
    REFERENCES line(lineID)
go

ALTER TABLE task ADD CONSTRAINT miscTerm_task 
    FOREIGN KEY (miscTermID)
    REFERENCES miscTerm(miscTermID)
go

ALTER TABLE task ADD CONSTRAINT stroke_task 
    FOREIGN KEY (strokeID)
    REFERENCES stroke(strokeID)
go


/* 
 * TABLE: WorkOut 
 */

ALTER TABLE WorkOut ADD CONSTRAINT session_WorkOut 
    FOREIGN KEY (sessionID)
    REFERENCES session(sessionID)
go

ALTER TABLE WorkOut ADD CONSTRAINT team_WorkOut 
    FOREIGN KEY (teamID)
    REFERENCES team(teamID)
go


/* 
 * TABLE: WorkOutLink 
 */

ALTER TABLE WorkOutLink ADD CONSTRAINT line_WorkOutLi9 
    FOREIGN KEY (ChildLine)
    REFERENCES line(lineID)
go

ALTER TABLE WorkOutLink ADD CONSTRAINT line_WorkOutLink 
    FOREIGN KEY (lineID)
    REFERENCES line(lineID)
go

ALTER TABLE WorkOutLink ADD CONSTRAINT WorkOut_WorkOutLink 
    FOREIGN KEY (WorkOutID)
    REFERENCES WorkOut(WorkOutID)
go


