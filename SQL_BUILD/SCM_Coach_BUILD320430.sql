/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      SCM_Coach_v1.0.1.0.DM1
 *
 * Date Created : Sunday, April 30, 2023 12:49:55
 * Target DBMS : Microsoft SQL Server 2017
 */

USE master
go
CREATE DATABASE SCM_Coach
go
USE SCM_Coach
go
/* 
 * TABLE: CoachLink 
 */

CREATE TABLE CoachLink(
    CoachLinkID    int              IDENTITY(1,1),
    HRID           int              NOT NULL,
    TeamID         int              NOT NULL,
    NickName       nvarchar(128)    NULL,
    CONSTRAINT PK_CoachLink PRIMARY KEY CLUSTERED (CoachLinkID, HRID, TeamID)
)
go



IF OBJECT_ID('CoachLink') IS NOT NULL
    PRINT '<<< CREATED TABLE CoachLink >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE CoachLink >>>'
go

/* 
 * TABLE: ContactNum 
 */

CREATE TABLE ContactNum(
    ContactNumID        int             IDENTITY(1,1),
    Number              nvarchar(30)    NULL,
    IsArchived          bit             DEFAULT 0 NOT NULL,
    CreatedOn           datetime        NULL,
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
USE SCM_Coach
GO

DELETE FROM [dbo].[ContactNumType]	
GO

SET IDENTITY_INSERT [dbo].[ContactNumType] ON;

INSERT INTO [dbo].[ContactNumType]
(
    [ContactNumTypeID]
  , [Caption]
)
VALUES
(1, N'Mobile')
, (2, N'Home')
, (3, N'Business')
GO

SET IDENTITY_INSERT [dbo].[ContactNumType] OFF;

/* 
 * TABLE: Dictionary 
 */

CREATE TABLE Dictionary(
    SictionaryID      int              IDENTITY(1,1),
    Caption           nvarchar(128)    NULL,
    ShortCaption      nvarchar(16)     NULL,
    ABREV             nvarchar(5)      NULL,
    IsStandard        bit              DEFAULT 0 NOT NULL,
    DictionaryType    int              NOT NULL,
    SCMCoachID        int              NULL,
    CONSTRAINT PK_Dictionary PRIMARY KEY NONCLUSTERED (SictionaryID)
)
go



IF OBJECT_ID('Dictionary') IS NOT NULL
    PRINT '<<< CREATED TABLE Dictionary >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dictionary >>>'
go

/* 
 * TABLE: DictionaryType 
 */

CREATE TABLE DictionaryType(
    DictionaryType    int              IDENTITY(1,1),
    Caption           nvarchar(128)    NULL,
    CONSTRAINT PK_DictionaryType PRIMARY KEY NONCLUSTERED (DictionaryType)
)
go



IF OBJECT_ID('DictionaryType') IS NOT NULL
    PRINT '<<< CREATED TABLE DictionaryType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DictionaryType >>>'
go

/* 
 * TABLE: Disqualified 
 */

CREATE TABLE Disqualified(
    DisqualifiedID    int              NOT NULL,
    Caption           nvarchar(128)    NULL,
    ABREV             nvarchar(16)     NULL,
    CONSTRAINT PK_Disqualified PRIMARY KEY CLUSTERED (DisqualifiedID)
)
go



IF OBJECT_ID('Disqualified') IS NOT NULL
    PRINT '<<< CREATED TABLE Disqualified >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Disqualified >>>'
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
USE [SCM_Coach]
GO

DELETE FROM [dbo].[Distance]	
GO

SET IDENTITY_INSERT [dbo].[Distance] ON;

INSERT INTO [dbo].[Distance]
			(DistanceID
           ,[Caption]
           ,[ShortCaption]
           ,[ABREV]
           ,[IsStandard]
           ,[Meters])
     VALUES
           (1,'25M','25M','25',1,25.0)
           ,(2,'50M','50M','50',1,50.0)
           ,(3,'100M','100M','100',1,100.0)
           ,(4,'200M','200M','200',1,200.0)
           ,(5,'400M','400M','400',1,400.0)
           ,(6,'1000M','1000M','1000',1,1000.0)
GO

SET IDENTITY_INSERT [dbo].[Distance] OFF;

/* 
 * TABLE: Drill 
 */

CREATE TABLE Drill(
    DrillID         int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    IsArchived      bit              DEFAULT 0 NOT NULL,
    IsStandard      bit              DEFAULT 0 NOT NULL,
    IsVisible       bit              DEFAULT 1 NOT NULL,
    CONSTRAINT PK_Drill PRIMARY KEY NONCLUSTERED (DrillID)
)
go



IF OBJECT_ID('Drill') IS NOT NULL
    PRINT '<<< CREATED TABLE Drill >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Drill >>>'
go
USE [SCM_Coach]
GO
DELETE FROM [dbo].[drill]
GO
SET IDENTITY_INSERT [dbo].[drill] ON;

INSERT INTO [dbo].[drill]
(
    drillID
  , [Caption]
  , [ShortCaption]
  , [ABREV]
)
VALUES
(1, 'KICK', 'Kick', 'KICK')
, (2, 'PULL', 'Pull', 'PULL')
, (3, 'SWIM', 'Swim', 'SWIM')
GO

SET IDENTITY_INSERT [dbo].[drill] OFF;

/* 
 * TABLE: DrillEx 
 */

CREATE TABLE DrillEx(
    DrillExID       int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    IsArchived      bit              DEFAULT 0 NOT NULL,
    IsStandard      bit              DEFAULT 0 NOT NULL,
    IsVisible       bit              DEFAULT 1 NOT NULL,
    CONSTRAINT PK_DrillEx PRIMARY KEY NONCLUSTERED (DrillExID)
)
go



IF OBJECT_ID('DrillEx') IS NOT NULL
    PRINT '<<< CREATED TABLE DrillEx >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DrillEx >>>'
go
USE [SCM_Coach]
GO

DELETE FROM [dbo].[drillEx]
GO

SET IDENTITY_INSERT [dbo].[drillEx] ON;

INSERT INTO [dbo].[drillEx]
(
    drillExID
  , [Caption]
  , [ShortCaption]
  , [ABREV]
)
VALUES
(1, 'REVERSE', 'Rev', 'REV')
, (2, 'SPLIT', 'Split', 'SPLIT')

GO

SET IDENTITY_INSERT [dbo].[drillEx] OFF;

/* 
 * TABLE: DrillLink 
 */

CREATE TABLE DrillLink(
    DrillLinkID    char(10)         NOT NULL,
    DrillID        int              NOT NULL,
    DrillExID      int              NOT NULL,
    Caption        nvarchar(128)    NULL,
    CONSTRAINT PK_DrillLink PRIMARY KEY CLUSTERED (DrillLinkID, DrillID, DrillExID)
)
go



IF OBJECT_ID('DrillLink') IS NOT NULL
    PRINT '<<< CREATED TABLE DrillLink >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DrillLink >>>'
go


/* 
 * TABLE: Equipment 
 */

CREATE TABLE Equipment(
    EquipmentID     int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    IsArchived      bit              DEFAULT 0 NOT NULL,
    IsStandard      bit              DEFAULT 0 NOT NULL,
    IsVisible       bit              DEFAULT 1 NOT NULL,
    CONSTRAINT PK_Equipment PRIMARY KEY NONCLUSTERED (EquipmentID)
)
go



IF OBJECT_ID('Equipment') IS NOT NULL
    PRINT '<<< CREATED TABLE Equipment >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Equipment >>>'
go
USE [SCM_Coach]
GO

DELETE FROM [dbo].[Equipment]	
GO

SET IDENTITY_INSERT [dbo].[Equipment] ON;

INSERT INTO [dbo].[equipment]
			(equipmentID
           ,[Caption]
           ,[ShortCaption]
           ,[ABREV])
     VALUES
           (1,'KICKBOARD','KickB','KB')
           ,(2,'FLOAT','Float','FLT')
           ,(3,'BUOY','Buoy','BUOY')
           ,(4,'SNORKLE','SnorkL','SNKL')
           ,(5,'PADDLES','PaddL','PADL')
           ,(6,'FINS','Fins','FINS')
GO

SET IDENTITY_INSERT [dbo].[Equipment] OFF;

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
    TaskID        int         NOT NULL,
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
USE [SCM_Coach]
GO

DELETE FROM [dbo].[Gender]
GO
SET IDENTITY_INSERT [dbo].[Gender] ON;

INSERT [dbo].[Gender]
(
    [GenderID]
  , [Caption]
)
VALUES
(1, N'Male')
GO
INSERT [dbo].[Gender]
(
    [GenderID]
  , [Caption]
)
VALUES
(2, N'Female')
GO

SET IDENTITY_INSERT [dbo].[Gender] OFF
GO

/* 
 * TABLE: Grade 
 */

CREATE TABLE Grade(
    GradeID       int              IDENTITY(1,1),
    Alpha         char(1)          NULL,
    Caption       nvarchar(128)    NULL,
    NickName      nvarchar(16)     NULL,
    LogoDir       varchar(max)     NULL,
    LogoImg       image            NULL,
    LogoType      nvarchar(5)      NULL,
    IsArchived    bit              DEFAULT 0 NOT NULL,
    IsStandard    bit              DEFAULT 0 NOT NULL,
    IsVisible     bit              DEFAULT 1 NOT NULL,
    CONSTRAINT PK_Grade PRIMARY KEY NONCLUSTERED (GradeID)
)
go



IF OBJECT_ID('Grade') IS NOT NULL
    PRINT '<<< CREATED TABLE Grade >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Grade >>>'
go
USE [SCM_Coach]
GO
DELETE FROM
      [dbo].[grade]
GO
SET
      IDENTITY_INSERT [dbo].[grade] ON;

INSERT INTO
      [dbo].[grade]
      (
      [gradeID],
	  [Alpha],
      [Caption],
      [NickName]
      )
VALUES
      (1, 'A', 'Gold', 'Masters'),
      (2, 'B', 'Silver', 'Pros'),
      (3, 'C', 'Bronze', 'StartUp')
GO
SET
      IDENTITY_INSERT [dbo].[grade] OFF;

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
    HRID             int              IDENTITY(1,1),
    FirstName        char(64)         NULL,
    MiddleInitial    char(4)          NULL,
    LastName         char(64)         NULL,
    DOB              datetime         NULL,
    RegisterNum      int              NULL,
    RegisterStr      nvarchar(24)     NULL,
    IsActive         bit              DEFAULT 1 NULL,
    IsArchived       bit              DEFAULT 0 NULL,
    CreatedOn        datetime         NULL,
    ArchivedOn       datetime         NULL,
    Email            nvarchar(256)    NULL,
    SCMMemberID      int              NULL,
    GenderID         int              NOT NULL,
    GradeID          int              NULL,
    HRTypeID         int              NOT NULL,
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
USE [SCM_Coach]
GO

DELETE FROM [dbo].[HRType]
GO

SET IDENTITY_INSERT [dbo].[HRType] ON;

INSERT INTO [dbo].[HRType]
(
    HRTypeID
  , [Caption]
)
VALUES
(1, 'Coach')
, (2, 'Contact')
, (3, 'Swimmer')
GO

SET IDENTITY_INSERT [dbo].[HRType] OFF;

/* 
 * TABLE: Intensity 
 */

CREATE TABLE Intensity(
    IntensityID     int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    IsArchived      bit              DEFAULT 0 NOT NULL,
    IsStandard      bit              DEFAULT 0 NOT NULL,
    IsVisible       bit              DEFAULT 1 NOT NULL,
    Level           int              NULL,
    CONSTRAINT PK_Intensity PRIMARY KEY NONCLUSTERED (IntensityID)
)
go



IF OBJECT_ID('Intensity') IS NOT NULL
    PRINT '<<< CREATED TABLE Intensity >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Intensity >>>'
go
USE [SCM_Coach]
GO
DELETE FROM [dbo].[intensity]
GO
SET IDENTITY_INSERT [dbo].[intensity] ON;

INSERT INTO   [dbo].[intensity]
      (
      intensityID,
      [Caption],
      [ShortCaption],
      [ABREV],
      [Level]
      )
VALUES
      (1, 'Easy Pace', 'EASY', 'EASY', 40),
      (2, 'Half Pace', 'HALFPACE', 'HALFP', 50),
      (3, 'Build Up Pace', 'BUILDUP', 'BUILD', 50),
      (4, 'Moderate Pace', 'MODERATE', 'MOD', 65),
      (5, 'Fast', 'BUILDUP', 'BUILD', 75),
      (6, 'Sprint', 'BUILDUP', 'BUILD', 90),
      (7, 'As Fast As Possible', 'AFAP', 'AFAP', 100)
GO

SET IDENTITY_INSERT [dbo].[intensity] OFF;

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
USE [SCM_Coach]
GO
DELETE FROM [dbo].[miscTerm]
GO
SET IDENTITY_INSERT [dbo].[miscTerm] ON;

-- SUFFIXED EXTENSIONS TO miscTermS
-- (+ user custom - prefix with #)
INSERT INTO   [dbo].[miscTerm]
      (
      miscTermID,
      [Caption],
      [ShortCaption],
      [ABREV]
      )
VALUES
      (1, 'Block Start', 'BLOCKSTART', 'BLKS'),
      (2, 'Wall Start', 'WALLSTART', 'WALLS'),
      (3, 'Under Water', 'UNDERW', 'UNDW'),
      (4, 'Flip Turns', 'FLIPT', 'FLPT'),
      (5, 'Stream Lines', 'STREAML', 'STML'),
      (6, 'Pull Downs', 'PULLDOWNS', 'PULD'),
      (7, 'Dives', 'DIVES', 'DIVE'),
      (8, 'Reduce Stroke Count', 'REDSTROKE', 'RSC'),
      (9, 'Count Your Breath', 'COUNTBREATH', 'CRB')

GO

SET IDENTITY_INSERT [dbo].[miscTerm] OFF;

/* 
 * TABLE: NodeType 
 */

CREATE TABLE NodeType(
    NodeTypeID      int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    CONSTRAINT PK_NodeType PRIMARY KEY CLUSTERED (NodeTypeID)
)
go



IF OBJECT_ID('NodeType') IS NOT NULL
    PRINT '<<< CREATED TABLE NodeType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE NodeType >>>'
go

/* 
 * TABLE: Pool 
 */

CREATE TABLE Pool(
    PoolID        int              IDENTITY(1,1),
    Caption       nvarchar(128)    NULL,
    Lanes         char(10)         NULL,
    PoolTypeID    int              NOT NULL,
    CONSTRAINT PK_Pool PRIMARY KEY NONCLUSTERED (PoolID)
)
go



IF OBJECT_ID('Pool') IS NOT NULL
    PRINT '<<< CREATED TABLE Pool >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Pool >>>'
go

/* 
 * TABLE: PoolType 
 */

CREATE TABLE PoolType(
    PoolTypeID      int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    CONSTRAINT PK_PoolType PRIMARY KEY CLUSTERED (PoolTypeID)
)
go



IF OBJECT_ID('PoolType') IS NOT NULL
    PRINT '<<< CREATED TABLE PoolType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PoolType >>>'
go

/* 
 * TABLE: RaceHistory 
 */

CREATE TABLE RaceHistory(
    RaceHistoryID        int               IDENTITY(1,1),
    Caption              nvarchar(128)     NULL,
    LongCaption          nvarchar(1024)    NULL,
    RaceTime             time(7)           NULL,
    Lane                 int               NULL,
    IsDisqualified       bit               DEFAULT 0 NULL,
    IsScratched          bit               DEFAULT 0 NULL,
    NumOfLanes           int               DEFAULT 8 NULL,
    LenOfPool            int               DEFAULT 25 NULL,
    CreatedOn            datetime          NULL,
    EntrantID            int               NULL,
    PoolName             nvarchar(128)     NULL,
    DistanceID           int               NOT NULL,
    StrokeID             int               NOT NULL,
    HRID                 int               NOT NULL,
    RaceHistoryTypeID    int               NULL,
    DisqualifiedID       int               NULL,
    PoolTypeID           int               NULL,
    CONSTRAINT PK_RaceHistory PRIMARY KEY CLUSTERED (RaceHistoryID)
)
go



IF OBJECT_ID('RaceHistory') IS NOT NULL
    PRINT '<<< CREATED TABLE RaceHistory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RaceHistory >>>'
go

/* 
 * TABLE: RaceHistorySplit 
 */

CREATE TABLE RaceHistorySplit(
    RaceHistorySplitID    int         IDENTITY(1,1),
    Lap                   smallint    NULL,
    SplitTime             time(7)     NULL,
    RaceHistoryID         int         NULL,
    CONSTRAINT PK_RaceHistorySplit PRIMARY KEY CLUSTERED (RaceHistorySplitID)
)
go



IF OBJECT_ID('RaceHistorySplit') IS NOT NULL
    PRINT '<<< CREATED TABLE RaceHistorySplit >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RaceHistorySplit >>>'
go

/* 
 * TABLE: RaceHistoryType 
 */

CREATE TABLE RaceHistoryType(
    RaceHistoryTypeID    int              IDENTITY(1,1),
    Caption              nvarchar(128)    NULL,
    CONSTRAINT PK_RaceHistoryType PRIMARY KEY CLUSTERED (RaceHistoryTypeID)
)
go



IF OBJECT_ID('RaceHistoryType') IS NOT NULL
    PRINT '<<< CREATED TABLE RaceHistoryType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RaceHistoryType >>>'
go
USE [SCM_Coach]
GO

DELETE FROM [dbo].[RaceHistoryType]
GO

SET IDENTITY_INSERT [dbo].[RaceHistoryType] ON;

INSERT INTO [dbo].[RaceHistoryType]
(
    [RaceHistoryTypeID]
  , [Caption]
)
VALUES
(1, 'Club Night')
, (2, 'Regional Meet')
, (3, 'Reginal Championship')
, (4, 'Club vs Club')
, (5, 'Nationals')
GO

SET IDENTITY_INSERT [dbo].[RaceHistoryType] OFF;

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
    ArchivedOn         datetime         NULL,
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
USE [SCM_Coach]
GO

DELETE FROM [dbo].[SCMCoach]
GO

SET IDENTITY_INSERT [dbo].[SCMCoach] ON;

INSERT [dbo].[SCMCoach]
(
    [SCMCoachID]
		, [NickName]
		,[Caption]
		,[Email]
		,[ContactNum]
		,[WebSite]
		,[CreatedOn]
)
VALUES
(1, N'Riptide', N'Utopia Coaching', N'iapetus@sbcglobal.net', N'(284) 899-6811', N'https://www.google.com/', GETDATE())
GO


SET IDENTITY_INSERT [dbo].[SCMCoach] OFF
GO

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
 * TABLE: Session 
 */

CREATE TABLE Session(
    SessionID      int              IDENTITY(1,1),
    Caption        nvarchar(128)    NULL,
    CreatedOn      datetime         NULL,
    ModifiedOn     datetime         NULL,
    lanesBooked    int              NULL,
    timeBooked     time(7)          NULL,
    totTime        time(7)          NULL,
    totKM          char(10)         NULL,
    PoolID         int              NOT NULL,
    SCMCoachID     int              NULL,
    CONSTRAINT PK_Session PRIMARY KEY NONCLUSTERED (SessionID)
)
go



IF OBJECT_ID('Session') IS NOT NULL
    PRINT '<<< CREATED TABLE Session >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Session >>>'
go

/* 
 * TABLE: Stroke 
 */

CREATE TABLE Stroke(
    StrokeID        int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    IsArchived      bit              DEFAULT 0 NOT NULL,
    IsStandard      bit              NULL,
    IsVisible       bit              DEFAULT 1 NOT NULL,
    CONSTRAINT PK_Stroke PRIMARY KEY NONCLUSTERED (StrokeID)
)
go



IF OBJECT_ID('Stroke') IS NOT NULL
    PRINT '<<< CREATED TABLE Stroke >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Stroke >>>'
go
USE [SCM_Coach]
GO

DELETE FROM [dbo].[Stroke]	
GO

SET IDENTITY_INSERT [dbo].[Stroke] ON;

INSERT INTO [dbo].[Stroke]
			(StrokeID
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

SET IDENTITY_INSERT [dbo].[Stroke] OFF;

/* 
 * TABLE: SwimmerLink 
 */

CREATE TABLE SwimmerLink(
    SwimmerLinkID    int    IDENTITY(1,1),
    TeamID           int    NOT NULL,
    HRID             int    NOT NULL,
    CONSTRAINT PK_SwimmerLink PRIMARY KEY CLUSTERED (SwimmerLinkID, TeamID, HRID)
)
go



IF OBJECT_ID('SwimmerLink') IS NOT NULL
    PRINT '<<< CREATED TABLE SwimmerLink >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SwimmerLink >>>'
go

/* 
 * TABLE: Task 
 */

CREATE TABLE Task(
    TaskID             int               IDENTITY(1,1),
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
    IntensityID        int               NOT NULL,
    EquipmentID        int               NOT NULL,
    DistanceID         int               NOT NULL,
    StrokeID           int               NOT NULL,
    miscTermID         int               NOT NULL,
    GradeID            int               NULL,
    DrillID            int               NULL,
    TreeNodeID         int               NULL,
    CONSTRAINT PK_Task PRIMARY KEY NONCLUSTERED (TaskID)
)
go



IF OBJECT_ID('Task') IS NOT NULL
    PRINT '<<< CREATED TABLE Task >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Task >>>'
go

/* 
 * TABLE: Team 
 */

CREATE TABLE Team(
    TeamID        int              IDENTITY(1,1),
    Caption       nvarchar(128)    NULL,
    NickName      nvarchar(128)    NULL,
    Color         int              NULL,
    CreatedOn     datetime         NULL,
    ModifiedOn    datetime         NULL,
    TeamIconID    int              NULL,
    TeamTypeID    int              NULL,
    CONSTRAINT PK_Team PRIMARY KEY NONCLUSTERED (TeamID)
)
go



IF OBJECT_ID('Team') IS NOT NULL
    PRINT '<<< CREATED TABLE Team >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Team >>>'
go

/* 
 * TABLE: TeamIcon 
 */

CREATE TABLE TeamIcon(
    TeamIconID    int             IDENTITY(1,1),
    IconDir       varchar(max)    NOT NULL,
    IconImg       image           NULL,
    IconType      nvarchar(5)     NULL,
    CONSTRAINT PK_TeamIcon PRIMARY KEY CLUSTERED (TeamIconID)
)
go



IF OBJECT_ID('TeamIcon') IS NOT NULL
    PRINT '<<< CREATED TABLE TeamIcon >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TeamIcon >>>'
go

/* 
 * TABLE: TeamType 
 */

CREATE TABLE TeamType(
    TeamTypeID      int             IDENTITY(1,1),
    CaptionShort    nvarchar(16)    NULL,
    CONSTRAINT PK_TeamType PRIMARY KEY CLUSTERED (TeamTypeID)
)
go



IF OBJECT_ID('TeamType') IS NOT NULL
    PRINT '<<< CREATED TABLE TeamType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TeamType >>>'
go
USE [SCM_Coach]
GO

DELETE FROM [dbo].[TeamType]
GO

SET IDENTITY_INSERT [dbo].[TeamType] ON;

INSERT INTO [dbo].[TeamType]
(
    TeamTypeID
  , [Caption]
)
VALUES
(1, 'Default')
, (2, 'Template')
GO

SET IDENTITY_INSERT [dbo].[TeamType] OFF;

/* 
 * TABLE: TreeNode 
 */

CREATE TABLE TreeNode(
    TreeNodeID    int              IDENTITY(1,1),
    Caption       nvarchar(128)    NULL,
    RepsStr       char(10)         NULL,
    RepNum        int              NULL,
    SortIndx      int              NULL,
    CreatedOn     datetime         NULL,
    ModifiedOn    datetime         NULL,
    Child         int              NULL,
    TreeRootID    int              NULL,
    NodeTypeID    int              NULL,
    CONSTRAINT PK_TreeNode PRIMARY KEY CLUSTERED (TreeNodeID)
)
go



IF OBJECT_ID('TreeNode') IS NOT NULL
    PRINT '<<< CREATED TABLE TreeNode >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TreeNode >>>'
go

/* 
 * TABLE: TreeRoot 
 */

CREATE TABLE TreeRoot(
    TreeRootID    int              IDENTITY(1,1),
    Caption       nvarchar(128)    NULL,
    WorkOutID     int              NULL,
    CONSTRAINT PK_TreeRoot PRIMARY KEY CLUSTERED (TreeRootID)
)
go



IF OBJECT_ID('TreeRoot') IS NOT NULL
    PRINT '<<< CREATED TABLE TreeRoot >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TreeRoot >>>'
go

/* 
 * TABLE: WorkOut 
 */

CREATE TABLE WorkOut(
    WorkOutID     int              IDENTITY(1,1),
    Caption       nvarchar(128)    NULL,
    CreatedOn     datetime         NULL,
    ModifiedOn    datetime         NULL,
    TeamID        int              NOT NULL,
    SessionID     int              NOT NULL,
    CONSTRAINT PK_WorkOut PRIMARY KEY CLUSTERED (WorkOutID)
)
go



IF OBJECT_ID('WorkOut') IS NOT NULL
    PRINT '<<< CREATED TABLE WorkOut >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE WorkOut >>>'
go

/* 
 * TABLE: CoachLink 
 */

ALTER TABLE CoachLink ADD CONSTRAINT HRCoachLink 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go

ALTER TABLE CoachLink ADD CONSTRAINT TeamCoachLink 
    FOREIGN KEY (TeamID)
    REFERENCES Team(TeamID)
go


/* 
 * TABLE: ContactNum 
 */

ALTER TABLE ContactNum ADD CONSTRAINT ContactNumTypeContactNum 
    FOREIGN KEY (ContactNumTypeID)
    REFERENCES ContactNumType(ContactNumTypeID) ON DELETE SET NULL
go

ALTER TABLE ContactNum ADD CONSTRAINT HRContactNum 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go


/* 
 * TABLE: Dictionary 
 */

ALTER TABLE Dictionary ADD CONSTRAINT DictionaryTypeDictionary 
    FOREIGN KEY (DictionaryType)
    REFERENCES DictionaryType(DictionaryType)
go

ALTER TABLE Dictionary ADD CONSTRAINT SCMCoachDictionary 
    FOREIGN KEY (SCMCoachID)
    REFERENCES SCMCoach(SCMCoachID)
go


/* 
 * TABLE: DrillLink 
 */

ALTER TABLE DrillLink ADD CONSTRAINT DrillDrillLink 
    FOREIGN KEY (DrillID)
    REFERENCES Drill(DrillID)
go

ALTER TABLE DrillLink ADD CONSTRAINT DrillExDrillLink 
    FOREIGN KEY (DrillExID)
    REFERENCES DrillEx(DrillExID)
go


/* 
 * TABLE: evTime 
 */

ALTER TABLE evTime ADD CONSTRAINT heartRangeevTi6 
    FOREIGN KEY (heartREST)
    REFERENCES heartRange(heartRangeID)
go

ALTER TABLE evTime ADD CONSTRAINT heartRangeevTime 
    FOREIGN KEY (heartRACED)
    REFERENCES heartRange(heartRangeID)
go

ALTER TABLE evTime ADD CONSTRAINT TaskevTime 
    FOREIGN KEY (TaskID)
    REFERENCES Task(TaskID)
go


/* 
 * TABLE: HR 
 */

ALTER TABLE HR ADD CONSTRAINT GenderHR 
    FOREIGN KEY (GenderID)
    REFERENCES Gender(GenderID)
go

ALTER TABLE HR ADD CONSTRAINT GradeHR 
    FOREIGN KEY (GradeID)
    REFERENCES Grade(GradeID)
go

ALTER TABLE HR ADD CONSTRAINT HRTypeHR 
    FOREIGN KEY (HRTypeID)
    REFERENCES HRType(HRTypeID)
go


/* 
 * TABLE: Pool 
 */

ALTER TABLE Pool ADD CONSTRAINT PoolTypePool 
    FOREIGN KEY (PoolTypeID)
    REFERENCES PoolType(PoolTypeID)
go


/* 
 * TABLE: RaceHistory 
 */

ALTER TABLE RaceHistory ADD CONSTRAINT DisqualifiedRaceHistory 
    FOREIGN KEY (DisqualifiedID)
    REFERENCES Disqualified(DisqualifiedID)
go

ALTER TABLE RaceHistory ADD CONSTRAINT DistanceRaceHistory 
    FOREIGN KEY (DistanceID)
    REFERENCES Distance(DistanceID)
go

ALTER TABLE RaceHistory ADD CONSTRAINT HRRaceHistory 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go

ALTER TABLE RaceHistory ADD CONSTRAINT PoolTypeRaceHistory 
    FOREIGN KEY (PoolTypeID)
    REFERENCES PoolType(PoolTypeID)
go

ALTER TABLE RaceHistory ADD CONSTRAINT RaceHistoryTypeRaceHistory 
    FOREIGN KEY (RaceHistoryTypeID)
    REFERENCES RaceHistoryType(RaceHistoryTypeID)
go

ALTER TABLE RaceHistory ADD CONSTRAINT StrokeRaceHistory 
    FOREIGN KEY (StrokeID)
    REFERENCES Stroke(StrokeID)
go


/* 
 * TABLE: RaceHistorySplit 
 */

ALTER TABLE RaceHistorySplit ADD CONSTRAINT RaceHistoryRaceHistorySplit 
    FOREIGN KEY (RaceHistoryID)
    REFERENCES RaceHistory(RaceHistoryID)
go


/* 
 * TABLE: Session 
 */

ALTER TABLE Session ADD CONSTRAINT PoolSession 
    FOREIGN KEY (PoolID)
    REFERENCES Pool(PoolID)
go

ALTER TABLE Session ADD CONSTRAINT SCMCoachSession 
    FOREIGN KEY (SCMCoachID)
    REFERENCES SCMCoach(SCMCoachID)
go


/* 
 * TABLE: SwimmerLink 
 */

ALTER TABLE SwimmerLink ADD CONSTRAINT HRSwimmerLink 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go

ALTER TABLE SwimmerLink ADD CONSTRAINT TeamSwimmerLink 
    FOREIGN KEY (TeamID)
    REFERENCES Team(TeamID)
go


/* 
 * TABLE: Task 
 */

ALTER TABLE Task ADD CONSTRAINT DistanceTask 
    FOREIGN KEY (DistanceID)
    REFERENCES Distance(DistanceID)
go

ALTER TABLE Task ADD CONSTRAINT DrillTask 
    FOREIGN KEY (DrillID)
    REFERENCES Drill(DrillID)
go

ALTER TABLE Task ADD CONSTRAINT EquipmentTask 
    FOREIGN KEY (EquipmentID)
    REFERENCES Equipment(EquipmentID)
go

ALTER TABLE Task ADD CONSTRAINT GradeTask 
    FOREIGN KEY (GradeID)
    REFERENCES Grade(GradeID)
go

ALTER TABLE Task ADD CONSTRAINT IntensityTask 
    FOREIGN KEY (IntensityID)
    REFERENCES Intensity(IntensityID)
go

ALTER TABLE Task ADD CONSTRAINT miscTermTask 
    FOREIGN KEY (miscTermID)
    REFERENCES miscTerm(miscTermID)
go

ALTER TABLE Task ADD CONSTRAINT StrokeTask 
    FOREIGN KEY (StrokeID)
    REFERENCES Stroke(StrokeID)
go

ALTER TABLE Task ADD CONSTRAINT TreeNodeTask 
    FOREIGN KEY (TreeNodeID)
    REFERENCES TreeNode(TreeNodeID)
go


/* 
 * TABLE: Team 
 */

ALTER TABLE Team ADD CONSTRAINT TeamIconTeam 
    FOREIGN KEY (TeamIconID)
    REFERENCES TeamIcon(TeamIconID)
go

ALTER TABLE Team ADD CONSTRAINT TeamTypeTeam 
    FOREIGN KEY (TeamTypeID)
    REFERENCES TeamType(TeamTypeID)
go


/* 
 * TABLE: TreeNode 
 */

ALTER TABLE TreeNode ADD CONSTRAINT NodeTypeTreeNode 
    FOREIGN KEY (NodeTypeID)
    REFERENCES NodeType(NodeTypeID)
go

ALTER TABLE TreeNode ADD CONSTRAINT TreeNodeTreeNode 
    FOREIGN KEY (Child)
    REFERENCES TreeNode(TreeNodeID)
go

ALTER TABLE TreeNode ADD CONSTRAINT TreeRootTreeNode 
    FOREIGN KEY (TreeRootID)
    REFERENCES TreeRoot(TreeRootID)
go


/* 
 * TABLE: TreeRoot 
 */

ALTER TABLE TreeRoot ADD CONSTRAINT WorkOutTreeRoot 
    FOREIGN KEY (WorkOutID)
    REFERENCES WorkOut(WorkOutID)
go


/* 
 * TABLE: WorkOut 
 */

ALTER TABLE WorkOut ADD CONSTRAINT SessionWorkOut 
    FOREIGN KEY (SessionID)
    REFERENCES Session(SessionID)
go

ALTER TABLE WorkOut ADD CONSTRAINT TeamWorkOut 
    FOREIGN KEY (TeamID)
    REFERENCES Team(TeamID)
go


/* 
 * FUNCTION: PersonalBest 
 */

USE SCM_Coach
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrose
-- Create date: 27/4/2023
-- Updated 16/5/2020
-- Description:	Find the 'Personal Best' 
--				race time for a given swimmer
-- =============================================
CREATE FUNCTION [PersonalBest]
(
    -- Add the parameters for the function here
    @HRID INT
  , @DistanceID INT
  , @StrokeID INT
  , @SeedDate DATETIME = NULL
)
RETURNS TIME
AS
BEGIN
    -- Declare the return variable here
    DECLARE @Result TIME

    -- use a default sessiontime
    IF @SeedDate IS NULL
        SET @SeedDate = GETDATE();

    -- Add the T-SQL statements to compute the return value here
    SELECT @Result = MIN(RaceHistory.RaceTime)
    -- CAST(CAST(MIN(Entrant.RaceTime) AS DATETIME) AS FLOAT) AS PersonalBest
    FROM RaceHistory
    WHERE (RaceHistory.StrokeID = @StrokeID)
          AND (RaceHistory.DistanceID = @DistanceID)
          AND (RaceHistory.RaceTime IS NOT NULL)
          AND (RaceHistory.IsDisqualified <> 1) -- added 16/5/2020
          AND (RaceHistory.IsScratched <> 1) -- added 16/5/2020
          AND (RaceHistory.CreatedOn < @SeedDate)
    GROUP BY RaceHistory.HRID
    HAVING (RaceHistory.HRID = @HRID)

    -- Return the result of the function
    RETURN @Result
END
GO



go
IF OBJECT_ID('PersonalBest') IS NOT NULL
    PRINT '<<< CREATED FUNCTION PersonalBest >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION PersonalBest >>>'
go


/* 
 * FUNCTION: SwimmerAge 
 */

USE [SCM_Coach]
GO

/****** Object:  UserDefinedFunction [dbo].[SwimmerAge]    Script Date: 12/03/23 11:16:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ben Ambrpse
-- Create date: 
-- Description:	Swimmer's age at specific seed date.
-- =============================================
CREATE FUNCTION [SwimmerAge]
(
    -- Add the parameters for the function here
    @SeedStart DATETIME
  , @DOB DATETIME
)
RETURNS INT
AS
BEGIN
    -- Declare the return variable here
    DECLARE @Result INT

    -- Add the T-SQL statements to compute the return value here
    SET @Result = FLOOR(DATEDIFF(day, @DOB, @SeedStart) / 365.0)

    -- Return the result of the function
    RETURN @Result
END
GO


go
IF OBJECT_ID('SwimmerAge') IS NOT NULL
    PRINT '<<< CREATED FUNCTION SwimmerAge >>>'
ELSE
    PRINT '<<< FAILED CREATING FUNCTION SwimmerAge >>>'
go


