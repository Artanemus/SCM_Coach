/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      SCM_Coach_v1.1.0.0.DM1
 *
 * Date Created : Thursday, May 18, 2023 15:20:54
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
    CoachLinkID    int    IDENTITY(1,1),
    HRID           int    NOT NULL,
    SessionID      int    NOT NULL,
    CONSTRAINT PK_CoachLink PRIMARY KEY CLUSTERED (CoachLinkID, HRID, SessionID)
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
    SictionaryID        int              IDENTITY(1,1),
    Caption             nvarchar(128)    NULL,
    ShortCaption        nvarchar(16)     NULL,
    ABREV               nvarchar(5)      NULL,
    IsStandard          bit              DEFAULT 0 NOT NULL,
    DictionaryTypeID    int              NOT NULL,
    SCMCoachID          int              NULL,
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
    DictionaryTypeID    int              IDENTITY(1,1),
    Caption             nvarchar(128)    NULL,
    CONSTRAINT PK_DictionaryType PRIMARY KEY NONCLUSTERED (DictionaryTypeID)
)
go



IF OBJECT_ID('DictionaryType') IS NOT NULL
    PRINT '<<< CREATED TABLE DictionaryType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DictionaryType >>>'
go
SET IDENTITY_INSERT [dbo].[DictionaryType] ON;

INSERT INTO [dbo].[DictionaryType]
(
    [DictionaryTypeID]
  , [Caption]
)
VALUES
(1, N'drill')
, (2, N'drillex')
, (3, N'intensity')
, (4, N'equipment')
, (5, N'distance')
, (6, N'stroke')
, (7, N'miscTerm')
, (8, N'heartRange')
, (9, N'root')
, (10, N'node')
GO

SET IDENTITY_INSERT [dbo].[DictionaryType] OFF;

/* 
 * TABLE: DisqualifyCode 
 */

CREATE TABLE DisqualifyCode(
    DisqualifyCodeID    int              IDENTITY(1,1),
    Caption             nvarchar(128)    NULL,
    ABREV               nvarchar(16)     NULL,
    DisqualifyTypeID    int              NULL,
    CONSTRAINT PK_DisqualifyCode PRIMARY KEY CLUSTERED (DisqualifyCodeID)
)
go



IF OBJECT_ID('DisqualifyCode') IS NOT NULL
    PRINT '<<< CREATED TABLE DisqualifyCode >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DisqualifyCode >>>'
go
SET IDENTITY_INSERT  [dbo].[DisqualifyCode] ON;

-- Insert rows into tableN'DisqualifyCodeCodes'
INSERT INTO DisqualifyCode
( -- columns to insert data into
 [DisqualifyCodeID], [Caption], [ABREV], [DisqualifyTypeID]
)
VALUES
(1,N'False start', N'GA', 1),
(2,N'Delay of meet', N'GB', 1),
(3,N'Unsportsmanlike manner', N'GC', 1),
(4,N'Interference with another swimmer', N'GD', 1),
(5,N'Did not swim stroke specified', N'GE', 1),
(6,N'Did not swim distance specified', N'GF', 1),
(7,N'Did not finish in same lane', N'GG', 1),
(8,N'Standing on bottom during any stroke but freestyle', N'GH', 1),
(9,N'Swimmer swam in wrong lane', N'GI', 1),
(10,N'Swimmer made use of aids', N'GJ', 1),
(11,N'Swimmer did not finish', N'GK', 1),
(12,N'Pulled on lane ropes', N'GL', 1),
(13,N'Use of not FINA approved swim suit', N'GM', 1),
(14,N'Use of more than one swim suit', N'GN', 1),
(15,N'Use of tape on the body', N'GO', 1),

-- Freestyle
(16, N'No touch at turn or finish', N'FrA' ,2),
(17, N'Swam under water more than 15 meters after start or turn', N'FrB' ,2),
(18, N'Walked on pool bottom and/or pushed off bottom', N'FrC' ,2),

-- Backstroke
(19, N'Toes over the gutter', N'BaA' ,3),
(20, N'Head did not break surface by 15 meters after start or turn', N'BaB' ,3),
(21, N'Shoulders past vertical', N'BaC' ,3),
(22, N'No touch at turn and/or finish', N'BaD' ,3),
(23, N'Not on back off wall', N'BaE' ,3),
(24, N'Did not finish on back', N'BaF' ,3),
(25, N'Past vertical at turn: non continuous turning action', N'BaG' ,3),
(26, N'Past vertical at turn: independent kicks', N'BaH' ,3),
(27, N'Past vertical at turn: independent strokes', N'BaI' ,3),
(28, N'Sub-merged at the finish', N'BaJ' ,3),

-- Breaststroke
(29, N'Head did not break surface before hands turned inside at widest part of second stroke', N'BrA' ,4),
(30, N'Head did not break surface of water during each complete stroke cycle', N'BrB' ,4),
(31, N'Arm movements not always simultaneous and in horizontal plane', N'BrC' ,4),
(32, N'Leg Movements not always simultaneous and in horizontal plane', N'BrD' ,4),
(33, N'Hands not pushed forward on, under or over water', N'BrE' ,4),

-- BUTTERFLY 
 
(34, N'Head did not break surface 15 meters after start or turn', N'BfA' ,5),
(35 , N'More than one arm pull under water after start or turn', N'BfB' ,5), 
(36 , N'Not toward breast off the wall', N'BfC' ,5), 
(37 , N'Did not bring arms forward and/or backward simultaneously', N'BfD' ,5),
(38 , N'Did not bring arms forward over water', N'BfE' ,5), 
(39, N'Did not execute movement of both feet in same way', N'BfF' ,5), 
(40, N'Touch was not made with both hands separated and simultaneously at turn and/or finish', N'BfG' ,5), 
(41, N'No touch at turn and/or finish', N'BfH' ,5),
(42, N'Arm movements did not continue throughout race', N'BfI' ,5),
(43, N'More than one breaststroke kick per arm pull', N'BfJ' ,5),

-- Individual Medley
(44, N'Freestyle swum as backstroke, breaststroke or butterfly', N'IMA' ,6),
(45, N'Not swum in right order', N'IMB' ,6),
(46, N'Stroke infraction - use stroke codes', N'IMC' ,6),

-- Relay
(47, N'Early swimmer take-off # (RA#)', N'RA#' ,7),
(48, N'Medley not swum in right order', N'RB' ,7),
(49, N'Changed order of swimmers',N'RC',7),
(50, N'Non listed swimmer swam',N'RD',7),
(51, N'Stroke infraction - use stroke codes and swimmer',N'RE',7),
(52, N'Swimmer other than the swimmer designated to swim entered race area before finished',N'Rf',7)

GO

SET IDENTITY_INSERT [dbo].[DisqualifyCode]  OFF;

/* 
 * TABLE: DisqualifyType 
 */

CREATE TABLE DisqualifyType(
    DisqualifyTypeID    int              IDENTITY(1,1),
    Caption             nvarchar(128)    NULL,
    CONSTRAINT PK_DisqualifyType PRIMARY KEY CLUSTERED (DisqualifyTypeID)
)
go



IF OBJECT_ID('DisqualifyType') IS NOT NULL
    PRINT '<<< CREATED TABLE DisqualifyType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DisqualifyType >>>'
go
SET IDENTITY_INSERT  [dbo].[DisqualifyType] ON;
INSERT INTO DisqualifyType
(
[DisqualifyTypeID], [Caption]
)
VALUES
(1, N'General')
,(2, N'Freestyle')
,(3, N'Backstroke')
,(4, N'Breaststroke')
,(5, N'Butterfly')
,(6, N'Individual Medley')
,(7, N'Relays')

SET IDENTITY_INSERT  [dbo].[DisqualifyType] OFF;

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
SET IDENTITY_INSERT [dbo].[Distance] ON
GO
INSERT [dbo].[Distance]
(
    [DistanceID]
  , [Caption]
  , [ShortCaption]
  , [ABREV]
  , [IsArchived]
  , [IsStandard]
  , [IsVisible]
  , [Meters]
)
VALUES
(1, N'25M', N'25M', N'25', 0, 1, 1, 25),
(2, N'50M', N'50M', N'50', 0, 1, 1, 50),
(3, N'100M', N'100M', N'100', 0, 1, 1, 100),
(4, N'200M', N'200M', N'200', 0, 1, 1, 200),
(5, N'400M', N'400M', N'400', 0, 1, 1, 400),
(6, N'1000M', N'1000M', N'1000', 0, 1, 1, 1000)
GO
SET IDENTITY_INSERT [dbo].[Distance] OFF
GO

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
 * TABLE: Endurance 
 */

CREATE TABLE Endurance(
    EnduranceID     int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    ShortCaption    nvarchar(16)     NULL,
    ABREV           nvarchar(5)      NULL,
    IsStandard      bit              DEFAULT 0 NOT NULL,
    IsArchived      bit              DEFAULT 0 NOT NULL,
    IsVisible       bit              DEFAULT 1 NOT NULL,
    CONSTRAINT PK_Endurance PRIMARY KEY CLUSTERED (EnduranceID)
)
go



IF OBJECT_ID('Endurance') IS NOT NULL
    PRINT '<<< CREATED TABLE Endurance >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Endurance >>>'
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
    NickName         nvarchar(128)    NULL,
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
    ABREV           nvarchar(8)      NULL,
    CONSTRAINT PK_NodeType PRIMARY KEY CLUSTERED (NodeTypeID)
)
go



IF OBJECT_ID('NodeType') IS NOT NULL
    PRINT '<<< CREATED TABLE NodeType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE NodeType >>>'
go
/*
warmup
main set
cool-down
distance
mid-distance
sprint
*/

SET IDENTITY_INSERT [dbo].[NodeType] ON;

INSERT INTO [dbo].[NodeType]
(
    NodeTypeID
  , [Caption]
  , [ShortCaption]
  , [ABREV]
)
VALUES
(1, 'Warm-up', 'WarmUp', 'WU')
, (2, 'Pre Set - Drill', 'PreSet', 'PREM')
, (3, 'Main Set', 'MainSet', 'MAIN')
, (4, 'Post Set', 'PostSet', 'POSTM')
, (5, 'Cool-down', 'CoolDown', 'COOLD')
, (6, 'Distance Set', 'Distance', 'DIST')
, (7, 'Mid-Distance Set', 'MDistance', 'MDIST')
, (8, 'Sprint Set', 'Sprint', 'SPRINT')
GO

SET IDENTITY_INSERT [dbo].[NodeType] OFF;

/* 
 * TABLE: PlayBook 
 */

CREATE TABLE PlayBook(
    PlayBookID      int         NOT NULL,
    Caption         int         NULL,
    CreatedOn       datetime    NULL,
    PlayScriptID    int         NULL,
    CONSTRAINT PK_PlayBook PRIMARY KEY CLUSTERED (PlayBookID)
)
go



IF OBJECT_ID('PlayBook') IS NOT NULL
    PRINT '<<< CREATED TABLE PlayBook >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PlayBook >>>'
go

/* 
 * TABLE: PlayScript 
 */

CREATE TABLE PlayScript(
    PlayScriptID        int              IDENTITY(1,1),
    Caption             nvarchar(128)    NULL,
    CreatedOn           datetime         NULL,
    ModifiedOn          datetime         NULL,
    FileName            nvarchar(max)    NULL,
    SessionID           int              NULL,
    PlayScriptTypeID    int              NULL,
    CONSTRAINT PK_PlayScript PRIMARY KEY CLUSTERED (PlayScriptID)
)
go



IF OBJECT_ID('PlayScript') IS NOT NULL
    PRINT '<<< CREATED TABLE PlayScript >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PlayScript >>>'
go

/* 
 * TABLE: PlayScriptGoal 
 */

CREATE TABLE PlayScriptGoal(
    PlayScriptGoalID    int              IDENTITY(1,1),
    Caption             nvarchar(128)    NULL,
    CreatedOn           datetime         NULL,
    ModifiedOn          datetime         NULL,
    IsArchived          bit              DEFAULT 0 NOT NULL,
    CONSTRAINT PK_PlayScriptGoal PRIMARY KEY CLUSTERED (PlayScriptGoalID)
)
go



IF OBJECT_ID('PlayScriptGoal') IS NOT NULL
    PRINT '<<< CREATED TABLE PlayScriptGoal >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PlayScriptGoal >>>'
go

/* 
 * TABLE: PlayScriptOutCome 
 */

CREATE TABLE PlayScriptOutCome(
    PlayScriptOutComeID    int              IDENTITY(1,1),
    Caption                nvarchar(128)    NULL,
    CreatedOn              datetime         NULL,
    ModifiedOn             datetime         NULL,
    IsArchived             bit              DEFAULT 0 NOT NULL,
    CONSTRAINT PK_PlayScriptOutCome PRIMARY KEY CLUSTERED (PlayScriptOutComeID)
)
go



IF OBJECT_ID('PlayScriptOutCome') IS NOT NULL
    PRINT '<<< CREATED TABLE PlayScriptOutCome >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PlayScriptOutCome >>>'
go

/* 
 * TABLE: PlayScriptType 
 */

CREATE TABLE PlayScriptType(
    PlayScriptTypeID       int              IDENTITY(1,1),
    Caption                nvarchar(128)    NULL,
    PlayScriptGoalID       int              NULL,
    PlayScriptOutComeID    int              NULL,
    CONSTRAINT PK_PlayScriptType PRIMARY KEY CLUSTERED (PlayScriptTypeID)
)
go



IF OBJECT_ID('PlayScriptType') IS NOT NULL
    PRINT '<<< CREATED TABLE PlayScriptType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PlayScriptType >>>'
go
/*
Goals
TECHNIQUE
SPEED
ENDURANCE
STROKE/KICK CORRECTION and STYLE
TECHNICAL - UNDERWATER, TURNS, BREATH CONTROL

OutCome
DURATION
DISTANCE
DENSITY
ENERGY ZONES
*/

/* 
 * TABLE: Pool 
 */

CREATE TABLE Pool(
    PoolID        int              IDENTITY(1,1),
    Caption       nvarchar(128)    NULL,
    NickName      nvarchar(16)     NULL,
    Lanes         char(10)         NULL,
    IsArchived    bit              DEFAULT 0 NULL,
    IsActive      bit              DEFAULT 1 NULL,
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
    IsArchived      bit              DEFAULT 0 NULL,
    IsActive        bit              DEFAULT 1 NULL,
    CONSTRAINT PK_PoolType PRIMARY KEY CLUSTERED (PoolTypeID)
)
go



IF OBJECT_ID('PoolType') IS NOT NULL
    PRINT '<<< CREATED TABLE PoolType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PoolType >>>'
go
/*
Short Course Yards SCY
Short Course Meters SCM
Long Course LCM
*/
SET IDENTITY_INSERT [dbo].[PoolType] ON;

INSERT INTO [dbo].[PoolType]
(
    [PoolTypeID]
  , [Caption]
  , [ShortCaption]
  , [ABREV]
)
VALUES
(1, N'Short Course Yards', 'ShortCourseY', N'SCY')
, (2, N'Short Course Meters', 'ShortCourse', N'SCM')
, (3, N'Long Course', 'LongCourse', N'LCM')
GO

SET IDENTITY_INSERT [dbo].[PoolType] OFF;

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
    DisqualifyCodeID     int               NULL,
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
    BusinessName       nvarchar(128)    NULL,
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
    defSessionDir      nvarchar(max)    NULL,
    defProgramDir      nvarchar(max)    NULL,
    defExportDir       nvarchar(max)    NULL,
    defImportDir       nvarchar(max)    NULL,
    CONSTRAINT PK_SCMCoach PRIMARY KEY CLUSTERED (SCMCoachID)
)
go



IF OBJECT_ID('SCMCoach') IS NOT NULL
    PRINT '<<< CREATED TABLE SCMCoach >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SCMCoach >>>'
go
SET IDENTITY_INSERT [dbo].[SCMCoach] ON
GO
INSERT [dbo].[SCMCoach]
(
    [SCMCoachID]
  , [NickName]
  , [Caption]
  , [Email]
  , [ContactNum]
  , [WebSite]
  , [CreatedOn]
  , [ArchivedOn]
  , [LogoDir]
  , [LogoImg]
  , [LogoType]
  , [DictionaryState]
)
VALUES
(1, N'Riptide', N'Utopia Coaching', N'iapetus@sbcglobal.net', N'(284) 899-6811', N'https://www.google.com/'
, CAST(N'2023-04-30T12:51:11.990' AS DATETIME), NULL, NULL, NULL, NULL, NULL)
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
    SessionID        int              IDENTITY(1,1),
    Caption          nvarchar(128)    NULL,
    FileName         nvarchar(max)    NULL,
    CreatedOn        datetime         NULL,
    ModifiedOn       datetime         NULL,
    lanesBooked      int              NULL,
    timeBooked       time(7)          NULL,
    startDateTime    datetime         NULL,
    endDateTime      datetime         NULL,
    KMswum           float            NULL,
    PoolID           int              NOT NULL,
    SCMCoachID       int              NULL,
    CONSTRAINT PK_Session PRIMARY KEY NONCLUSTERED (SessionID)
)
go



IF OBJECT_ID('Session') IS NOT NULL
    PRINT '<<< CREATED TABLE Session >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Session >>>'
go

/* 
 * TABLE: SessionType 
 */

CREATE TABLE SessionType(
    SessionTypeID    int              IDENTITY(1,1),
    Caption          nvarchar(128)    NULL,
    CONSTRAINT PK_SessionType PRIMARY KEY CLUSTERED (SessionTypeID)
)
go



IF OBJECT_ID('SessionType') IS NOT NULL
    PRINT '<<< CREATED TABLE SessionType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SessionType >>>'
go
/*
Seasonal
Winter
Summer
Spring
Autumn

WITHIN Swimming SEASON
Pre-Season
Start of Season
Mid-Season
Late-Season

Competion-Carnival training
Competiion general
Competition lead-in
Competion warmp-up

General Categories
Endurance
Strength
Speed
Taper
Recovery
*/
USE [SCM_Coach]
GO

SET IDENTITY_INSERT [dbo].[SessionType] ON;

INSERT INTO [dbo].[SessionType]
(
    SessionTypeID
  , [Caption]
)
VALUES
(1, 'Winter')
, (2, 'Summer')
, (3, 'Pre-Season')
, (4, 'Start of Season')
, (5, 'Mid-Season')
, (6, 'End of Season')
, (7, 'Competiion General')
, (8, 'Competiion Lead-in')
, (9, 'Competiion Warm-up')
, (10, 'Endurance')
, (11, 'Strength')
, (12, 'Speed')
, (13, 'Taper')
, (14, 'Recpvery')
GO

SET IDENTITY_INSERT [dbo].[SessionType] OFF;

/* 
 * TABLE: SessionTypeLink 
 */

CREATE TABLE SessionTypeLink(
    SessionTypeLinkID    int    IDENTITY(1,1),
    SessionTypeID        int    NOT NULL,
    SessionID            int    NOT NULL,
    CONSTRAINT PK_SessionTypeLink PRIMARY KEY CLUSTERED (SessionTypeLinkID, SessionTypeID, SessionID)
)
go



IF OBJECT_ID('SessionTypeLink') IS NOT NULL
    PRINT '<<< CREATED TABLE SessionTypeLink >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE SessionTypeLink >>>'
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
    EnduranceID        int               NULL,
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
 * TABLE: TeamLink 
 */

CREATE TABLE TeamLink(
    TeamLinkID    int    IDENTITY(1,1),
    TeamID        int    NOT NULL,
    SessionID     int    NOT NULL,
    CONSTRAINT PK_TeamLink PRIMARY KEY CLUSTERED (TeamLinkID, TeamID, SessionID)
)
go



IF OBJECT_ID('TeamLink') IS NOT NULL
    PRINT '<<< CREATED TABLE TeamLink >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TeamLink >>>'
go

/* 
 * TABLE: TeamType 
 */

CREATE TABLE TeamType(
    TeamTypeID    int             IDENTITY(1,1),
    Caption       nvarchar(16)    NULL,
    CONSTRAINT PK_TeamType PRIMARY KEY CLUSTERED (TeamTypeID)
)
go



IF OBJECT_ID('TeamType') IS NOT NULL
    PRINT '<<< CREATED TABLE TeamType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TeamType >>>'
go
SET IDENTITY_INSERT [dbo].[TeamType] ON
GO
INSERT [dbo].[TeamType]
(
    [TeamTypeID]
  , [Caption]
)
VALUES
(1, N'Default')
GO
INSERT [dbo].[TeamType]
(
    [TeamTypeID]
  , [Caption]
)
VALUES
(2, N'Template')
GO
SET IDENTITY_INSERT [dbo].[TeamType] OFF
GO

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
    TreeRootID      int              IDENTITY(1,1),
    Caption         nvarchar(128)    NULL,
    PlayScriptID    int              NULL,
    CONSTRAINT PK_TreeRoot PRIMARY KEY CLUSTERED (TreeRootID)
)
go



IF OBJECT_ID('TreeRoot') IS NOT NULL
    PRINT '<<< CREATED TABLE TreeRoot >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE TreeRoot >>>'
go

/* 
 * TABLE: CoachLink 
 */

ALTER TABLE CoachLink ADD CONSTRAINT HRCoachLink 
    FOREIGN KEY (HRID)
    REFERENCES HR(HRID)
go

ALTER TABLE CoachLink ADD CONSTRAINT SessionCoachLink 
    FOREIGN KEY (SessionID)
    REFERENCES Session(SessionID)
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
    FOREIGN KEY (DictionaryTypeID)
    REFERENCES DictionaryType(DictionaryTypeID)
go

ALTER TABLE Dictionary ADD CONSTRAINT SCMCoachDictionary 
    FOREIGN KEY (SCMCoachID)
    REFERENCES SCMCoach(SCMCoachID)
go


/* 
 * TABLE: DisqualifyCode 
 */

ALTER TABLE DisqualifyCode ADD CONSTRAINT DisqualifyTypeDisqualifyCode 
    FOREIGN KEY (DisqualifyTypeID)
    REFERENCES DisqualifyType(DisqualifyTypeID)
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

ALTER TABLE evTime ADD CONSTRAINT heartRangeevT28 
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
 * TABLE: PlayBook 
 */

ALTER TABLE PlayBook ADD CONSTRAINT PlayScriptPlayBook 
    FOREIGN KEY (PlayScriptID)
    REFERENCES PlayScript(PlayScriptID)
go


/* 
 * TABLE: PlayScript 
 */

ALTER TABLE PlayScript ADD CONSTRAINT PlayScriptTypePlayScript 
    FOREIGN KEY (PlayScriptTypeID)
    REFERENCES PlayScriptType(PlayScriptTypeID)
go

ALTER TABLE PlayScript ADD CONSTRAINT SessionPlayScript 
    FOREIGN KEY (SessionID)
    REFERENCES Session(SessionID)
go


/* 
 * TABLE: PlayScriptType 
 */

ALTER TABLE PlayScriptType ADD CONSTRAINT PlayScriptGoalPlayScriptType 
    FOREIGN KEY (PlayScriptGoalID)
    REFERENCES PlayScriptGoal(PlayScriptGoalID)
go

ALTER TABLE PlayScriptType ADD CONSTRAINT PlayScriptOutComePlayScriptType 
    FOREIGN KEY (PlayScriptOutComeID)
    REFERENCES PlayScriptOutCome(PlayScriptOutComeID)
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

ALTER TABLE RaceHistory ADD CONSTRAINT DisqualifyCodeRaceHistory 
    FOREIGN KEY (DisqualifyCodeID)
    REFERENCES DisqualifyCode(DisqualifyCodeID)
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
 * TABLE: SessionTypeLink 
 */

ALTER TABLE SessionTypeLink ADD CONSTRAINT SessionSessionTypeLink 
    FOREIGN KEY (SessionID)
    REFERENCES Session(SessionID)
go

ALTER TABLE SessionTypeLink ADD CONSTRAINT SessionTypeSessionTypeLink 
    FOREIGN KEY (SessionTypeID)
    REFERENCES SessionType(SessionTypeID)
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

ALTER TABLE Task ADD CONSTRAINT EnduranceTask 
    FOREIGN KEY (EnduranceID)
    REFERENCES Endurance(EnduranceID)
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
 * TABLE: TeamLink 
 */

ALTER TABLE TeamLink ADD CONSTRAINT SessionTeamLink 
    FOREIGN KEY (SessionID)
    REFERENCES Session(SessionID)
go

ALTER TABLE TeamLink ADD CONSTRAINT TeamTeamLink 
    FOREIGN KEY (TeamID)
    REFERENCES Team(TeamID)
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

ALTER TABLE TreeRoot ADD CONSTRAINT PlayScriptTreeRoot 
    FOREIGN KEY (PlayScriptID)
    REFERENCES PlayScript(PlayScriptID)
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


