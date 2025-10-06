
-- Standard Alter Table SQL

ALTER TABLE dbo.SCMSystem ADD Build int  NULL
go
ALTER TABLE dbo.Distance ADD ABREV nvarchar(8)  NULL
go
ALTER TABLE dbo.Distance ADD EventTypeID int  NULL
go
ALTER TABLE dbo.EventType ADD CaptionShort nvarchar(16)  NULL
go
ALTER TABLE dbo.EventType ADD ABREV nvarchar(5)  NULL
go
ALTER TABLE dbo.DisqualifyType ADD StrokeID int  NULL
go
ALTER TABLE dbo.Distance ADD CONSTRAINT EventTypeDistance
FOREIGN KEY (EventTypeID)
REFERENCES dbo.EventType (EventTypeID)
go
ALTER TABLE dbo.DisqualifyType ADD CONSTRAINT StrokeDisqualifyType
FOREIGN KEY (StrokeID)
REFERENCES dbo.Stroke (StrokeID)
go

-- Drop Referencing Constraint SQL

ALTER TABLE dbo.[Session] DROP CONSTRAINT SwimClubSession
go
ALTER TABLE dbo.ScoreDivision DROP CONSTRAINT SwimClubScoreDivision
go
ALTER TABLE dbo.ScorePoints DROP CONSTRAINT SwimClubScorePoints
go
ALTER TABLE dbo.Member DROP CONSTRAINT SwimClubMember
go
ALTER TABLE dbo.HeatIndividual DROP CONSTRAINT EventHeatIndividual
go
ALTER TABLE dbo.Nominee DROP CONSTRAINT EventNominee
go
ALTER TABLE dbo.Entrant DROP CONSTRAINT HeatIndividualEntrant
go
ALTER TABLE dbo.Entrant DROP CONSTRAINT MemberEntrant
go
ALTER TABLE dbo.TeamEntrant DROP CONSTRAINT MemberTeamEntrant
go
ALTER TABLE dbo.ContactNum DROP CONSTRAINT MemberContactNum
go
ALTER TABLE dbo.Nominee DROP CONSTRAINT MemberNominee
go
ALTER TABLE dbo.Split DROP CONSTRAINT EntrantSplit
go
ALTER TABLE dbo.TeamEntrant DROP CONSTRAINT TeamTeamEntrant
go
ALTER TABLE dbo.Member DROP CONSTRAINT HouseMember
go

-- Drop Constraint, Rename and Create Table SQL

ALTER TABLE dbo.Team DROP CONSTRAINT HeatTeamTeam
go
ALTER TABLE dbo.Member DROP CONSTRAINT MembershipTypeMember
go
EXEC sp_rename 'dbo.SwimClub.PK_SwimClub','PK_SwimClu_01122024074737001','INDEX'
go
EXEC sp_rename 'dbo.SwimClub','SwimClub_01122024074737000',OBJECT
go
CREATE TABLE dbo.SwimClub
(
    SwimClubID                   int            IDENTITY,
    NickName                     nvarchar(128)  NULL,
    Caption                      nvarchar(128)  NULL,
    Email                        nvarchar(128)  NULL,
    ContactNum                   nvarchar(30)   NULL,
    WebSite                      nvarchar(256)  NULL,
    HeatAlgorithm                int            NULL,
    EnableTeamEvents             bit            NULL,
    EnableSwimOThon              bit            NULL,
    EnableExtHeatTypes           bit            NULL,
    EnableMembershipStr          bit            NULL,
    EnableSimpleDisqualification bit             NOT NULL,
    NumOfLanes                   int            NULL,
    LenOfPool                    int            NULL,
    StartOfSwimSeason            datetime       NULL,
    CreatedOn                    datetime       NULL,
    LogoDir                      varchar(max)   NULL,
    LogoImg                      image          NULL,
    LogoType                     nvarchar(5)    NULL,
    PoolTypeID                   int            NULL,
    SwimClubTypeID               int            NULL
)
ON [PRIMARY]
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', 'dbo', 'table', 'SwimClub', 'column', 'EnableMembershipStr'))
BEGIN
  exec sys.sp_dropextendedproperty 'MS_Description', 'schema', 'dbo', 'table', 'SwimClub', 'column', 'EnableMembershipStr'
END
exec sys.sp_addextendedproperty 'MS_Description', 'Allows for AlphaNumerical membership number. Once enabled Member.MembershipNum is ignored.', 'schema', 'dbo', 'table', 'SwimClub', 'column', 'EnableMembershipStr'
go
GRANT SELECT ON dbo.SwimClub TO SCM_Administrator
go
GRANT SELECT ON dbo.SwimClub TO SCM_Guest
go
GRANT SELECT ON dbo.SwimClub TO SCM_Marshall
go
EXEC sp_bindefault 'BIT_0', 'dbo.SwimClub.EnableTeamEvents'
go
EXEC sp_bindefault 'BIT_0', 'dbo.SwimClub.EnableSwimOThon'
go
EXEC sp_bindefault 'BIT_0', 'dbo.SwimClub.EnableExtHeatTypes'
go
EXEC sp_bindefault 'BIT_0', 'dbo.SwimClub.EnableMembershipStr'
go
EXEC sp_bindefault 'BIT_1', 'dbo.SwimClub.EnableSimpleDisqualification'
go
EXEC sp_bindefault 'Def_NumOfLanes', 'dbo.SwimClub.NumOfLanes'
go
EXEC sp_bindefault 'Def_LenOfPool', 'dbo.SwimClub.LenOfPool'
go
EXEC sp_rename 'dbo.ScoreDivision.PK_ScoreDivision','PK_ScoreDi_01122024074738001','INDEX'
go
EXEC sp_rename 'dbo.GenderScoreDivision','GenderScor_01122024074738003'
go
EXEC sp_rename 'dbo.ScoreDivision','ScoreDivis_01122024074738000',OBJECT
go
CREATE TABLE dbo.ScoreDivision
(
    ScoreDivisionID int            IDENTITY,
    Caption         nvarchar(128)  NULL,
    AgeFrom         int            NULL,
    AgeTo           int            NULL,
    SwimClubID      int            NULL,
    GenderID        int            NULL
)
ON [PRIMARY]
go
GRANT DELETE ON dbo.ScoreDivision TO SCM_Administrator
go
GRANT INSERT ON dbo.ScoreDivision TO SCM_Administrator
go
GRANT SELECT ON dbo.ScoreDivision TO SCM_Administrator
go
GRANT UPDATE ON dbo.ScoreDivision TO SCM_Administrator
go
GRANT SELECT ON dbo.ScoreDivision TO SCM_Guest
go
GRANT SELECT ON dbo.ScoreDivision TO SCM_Marshall
go
EXEC sp_rename 'dbo.Event.PK_Event','PK_Event_01122024074739001','INDEX'
go
EXEC sp_rename 'dbo.SessionEvent','SessionEve_01122024074739002'
go
EXEC sp_rename 'dbo.EventStatusEvent','EventStatu_01122024074739003'
go
EXEC sp_rename 'dbo.EventTypeEvent','EventTypeE_01122024074739004'
go
EXEC sp_rename 'dbo.StrokeEvent','StrokeEven_01122024074739005'
go
EXEC sp_rename 'dbo.DistanceEvent','DistanceEv_01122024074739006'
go
EXEC sp_rename 'dbo.Event','Event_01122024074739000',OBJECT
go
CREATE TABLE dbo.Event
(
    EventID       int            IDENTITY,
    EventNum      int            NULL,
    Caption       nvarchar(128)  NULL,
    ScheduleDT    time(7)        NULL,
    RallyOpenDT   datetime       NULL,
    RallyCloseDT  datetime       NULL,
    OpenDT        datetime       NULL,
    CloseDT       datetime       NULL,
    SessionID     int            NULL,
    StrokeID      int            NULL,
    DistanceID    int            NULL,
    EventStatusID int            NULL
)
ON [PRIMARY]
go
GRANT DELETE ON dbo.Event TO SCM_Administrator
go
GRANT INSERT ON dbo.Event TO SCM_Administrator
go
GRANT SELECT ON dbo.Event TO SCM_Administrator
go
GRANT UPDATE ON dbo.Event TO SCM_Administrator
go
GRANT SELECT ON dbo.Event TO SCM_Guest
go
GRANT SELECT ON dbo.Event TO SCM_Marshall
go
EXEC sp_rename 'dbo.HeatIndividual.PK_HeatIndividual','PK_HeatInd_01122024074740001','INDEX'
go
EXEC sp_rename 'dbo.HeatStatusHeatIndividual','HeatStatus_01122024074740002'
go
EXEC sp_rename 'dbo.HeatTypeHeatIndividual','HeatTypeHe_01122024074740004'
go
EXEC sp_rename 'dbo.DisqualifyCodeHeatIndividual','Disqualify_01122024074740005'
go
EXEC sp_rename 'dbo.HeatIndividual','HeatIndivi_01122024074740000',OBJECT
go
CREATE TABLE dbo.HeatIndividual
(
    HeatID       int            IDENTITY,
    HeatNum      int            NULL,
    Caption      nvarchar(128)  NULL,
    ScheduleDT   time(7)        NULL,
    RallyOpenDT  datetime       NULL,
    RallyCloseDT datetime       NULL,
    OpenDT       datetime       NULL,
    CloseDT      datetime       NULL,
    EventID      int            NULL,
    HeatTypeID   int            NULL,
    HeatStatusID int            NULL
)
ON [PRIMARY]
go
GRANT DELETE ON dbo.HeatIndividual TO SCM_Administrator
go
GRANT INSERT ON dbo.HeatIndividual TO SCM_Administrator
go
GRANT SELECT ON dbo.HeatIndividual TO SCM_Administrator
go
GRANT UPDATE ON dbo.HeatIndividual TO SCM_Administrator
go
GRANT SELECT ON dbo.HeatIndividual TO SCM_Guest
go
GRANT DELETE ON dbo.HeatIndividual TO SCM_Marshall
go
GRANT INSERT ON dbo.HeatIndividual TO SCM_Marshall
go
GRANT SELECT ON dbo.HeatIndividual TO SCM_Marshall
go
GRANT UPDATE ON dbo.HeatIndividual TO SCM_Marshall
go
EXEC sp_rename 'dbo.ScorePoints.PK_ScorePoints','PK_ScorePo_01122024074741001','INDEX'
go
EXEC sp_rename 'dbo.ScorePoints','ScorePoint_01122024074741000',OBJECT
go
CREATE TABLE dbo.ScorePoints
(
    ScorePointsID int    IDENTITY,
    Place         int    NULL,
    Points        float  NULL,
    SwimClubID    int    NULL
)
ON [PRIMARY]
go
GRANT DELETE ON dbo.ScorePoints TO SCM_Administrator
go
GRANT INSERT ON dbo.ScorePoints TO SCM_Administrator
go
GRANT SELECT ON dbo.ScorePoints TO SCM_Administrator
go
GRANT UPDATE ON dbo.ScorePoints TO SCM_Administrator
go
GRANT SELECT ON dbo.ScorePoints TO SCM_Guest
go
GRANT SELECT ON dbo.ScorePoints TO SCM_Marshall
go
EXEC sp_rename 'dbo.Member.PK_Member','PK_Member_01122024074742001','INDEX'
go
EXEC sp_rename 'dbo.GenderMember','GenderMemb_01122024074742004'
go
EXEC sp_rename 'dbo.Member','Member_01122024074742000',OBJECT
go
CREATE TABLE dbo.Member
(
    MemberID                 int            IDENTITY,
    MembershipNum            int            NULL,
    MembershipStr            nvarchar(24)   NULL,
    FirstName                nvarchar(128)  NULL,
    MiddleInitial            nvarchar(4)    NULL,
    LastName                 nvarchar(128)  NULL,
    RegisterNum              int            NULL,
    RegisterStr              nvarchar(24)   NULL,
    DOB                      datetime       NULL,
    IsArchived               bit             NOT NULL,
    IsActive                 bit             NOT NULL,
    IsSwimmer                bit            NULL,
    Email                    nvarchar(256)  NULL,
    CreatedOn                datetime       NULL,
    ArchivedOn               datetime       NULL,
    EnableEmailOut           bit            NULL,
    EnableEmailNomineeForm   bit            DEFAULT (0) NULL,
    EnableEmailSessionReport bit            DEFAULT (0) NULL,
    TAGS                     ntext          NULL,
    SwimClubID               int            NULL,
    HouseID                  int            NULL,
    GenderID                 int            NULL
)
ON [PRIMARY]
go
GRANT DELETE ON dbo.Member TO SCM_Administrator
go
GRANT INSERT ON dbo.Member TO SCM_Administrator
go
GRANT SELECT ON dbo.Member TO SCM_Administrator
go
GRANT UPDATE ON dbo.Member TO SCM_Administrator
go
GRANT SELECT ON dbo.Member TO SCM_Guest
go
GRANT SELECT ON dbo.Member TO SCM_Marshall
go
EXEC sp_bindefault 'BIT_0', 'dbo.Member.IsArchived'
go
EXEC sp_bindefault 'BIT_1', 'dbo.Member.IsActive'
go
EXEC sp_bindefault 'BIT_1', 'dbo.Member.IsSwimmer'
go
EXEC sp_bindefault 'BIT_0', 'dbo.Member.EnableEmailOut'
go
EXEC sp_rename 'dbo.Entrant.PK_Entrant','PK_Entrant_01122024074743001','INDEX'
go
EXEC sp_rename 'dbo.Entrant','Entrant_01122024074743000',OBJECT
go
CREATE TABLE dbo.Entrant
(
    EntrantID        int      IDENTITY,
    Lane             int      NULL,
    RaceTime         time(7)  NULL,
    TimeToBeat       time(7)  NULL,
    PersonalBest     time(7)  NULL,
    IsDisqualified   bit      NULL,
    IsScratched      bit      NULL,
    DisqualifyCodeID int      NULL,
    MemberID         int      DEFAULT (NULL) NULL,
    HeatID           int      NULL
)
ON [PRIMARY]
go
GRANT DELETE ON dbo.Entrant TO SCM_Administrator
go
GRANT INSERT ON dbo.Entrant TO SCM_Administrator
go
GRANT SELECT ON dbo.Entrant TO SCM_Administrator
go
GRANT UPDATE ON dbo.Entrant TO SCM_Administrator
go
GRANT SELECT ON dbo.Entrant TO SCM_Guest
go
GRANT DELETE ON dbo.Entrant TO SCM_Marshall
go
GRANT INSERT ON dbo.Entrant TO SCM_Marshall
go
GRANT SELECT ON dbo.Entrant TO SCM_Marshall
go
GRANT UPDATE ON dbo.Entrant TO SCM_Marshall
go
EXEC sp_bindefault 'BIT_0', 'dbo.Entrant.IsDisqualified'
go
EXEC sp_bindefault 'BIT_0', 'dbo.Entrant.IsScratched'
go
DROP TABLE dbo.HeatTeam
go
EXEC sp_rename 'dbo.Team.PK_Team','PK_Team_01122024074744001','INDEX'
go
EXEC sp_rename 'dbo.Team','Team_01122024074744000',OBJECT
go
CREATE TABLE dbo.Team
(
    TeamID           int      IDENTITY,
    Lane             int      NULL,
    RaceTime         time(7)  NULL,
    TimeToBeat       time(7)  NULL,
    IsDisqualified   bit      NULL,
    IsScratched      bit      NULL,
    DisqualifyCodeID int      NULL,
    HeatID           int      NULL,
    TeamNameID       int      NULL
)
ON [PRIMARY]
go
GRANT DELETE ON dbo.Team TO SCM_Administrator
go
GRANT INSERT ON dbo.Team TO SCM_Administrator
go
GRANT SELECT ON dbo.Team TO SCM_Administrator
go
GRANT UPDATE ON dbo.Team TO SCM_Administrator
go
GRANT SELECT ON dbo.Team TO SCM_Guest
go
GRANT SELECT ON dbo.Team TO SCM_Marshall
go
EXEC sp_bindefault 'BIT_0', 'dbo.Team.IsDisqualified'
go
EXEC sp_bindefault 'BIT_0', 'dbo.Team.IsScratched'
go
EXEC sp_rename 'dbo.TeamEntrant.PK_TeamEntrant','PK_TeamEnt_01122024074745001','INDEX'
go
EXEC sp_rename 'dbo.StrokeTeamEntrant','StrokeTeam_01122024074745004'
go
EXEC sp_rename 'dbo.DF_TeamEntrant_MemberID', 'DF_TeamEnt_01122024074745005',OBJECT
go
EXEC sp_rename 'dbo.TeamEntrant','TeamEntran_01122024074745000',OBJECT
go
CREATE TABLE dbo.TeamEntrant
(
    TeamEntrantID    int      IDENTITY,
    Lane             int      NULL,
    RaceTime         time(7)  NULL,
    TimeToBeat       time(7)  NULL,
    PersonalBest     time(7)  NULL,
    IsDisqualified   bit      NULL,
    IsScratched      bit      NULL,
    DisqualifyCodeID int      NULL,
    MemberID         int      NULL,
    StrokeID         int      NULL,
    TeamID           int      NULL
)
ON [PRIMARY]
go
GRANT DELETE ON dbo.TeamEntrant TO SCM_Administrator
go
GRANT INSERT ON dbo.TeamEntrant TO SCM_Administrator
go
GRANT SELECT ON dbo.TeamEntrant TO SCM_Administrator
go
GRANT UPDATE ON dbo.TeamEntrant TO SCM_Administrator
go
GRANT SELECT ON dbo.TeamEntrant TO SCM_Guest
go
GRANT DELETE ON dbo.TeamEntrant TO SCM_Marshall
go
GRANT INSERT ON dbo.TeamEntrant TO SCM_Marshall
go
GRANT SELECT ON dbo.TeamEntrant TO SCM_Marshall
go
GRANT UPDATE ON dbo.TeamEntrant TO SCM_Marshall
go
EXEC sp_bindefault 'BIT_0', 'dbo.TeamEntrant.IsDisqualified'
go
EXEC sp_bindefault 'BIT_0', 'dbo.TeamEntrant.IsScratched'
go
EXEC sp_rename 'dbo.Split.PK_Split','PK_Split_01122024074746001','INDEX'
go
EXEC sp_rename 'dbo.Split','Split_01122024074746000',OBJECT
go
CREATE TABLE dbo.Split
(
    SplitID   int      IDENTITY,
    LapNum    int      NULL,
    SplitTime time(7)  NULL,
    EntrantID int      NULL
)
ON [PRIMARY]
go
GRANT DELETE ON dbo.Split TO SCM_Administrator
go
GRANT INSERT ON dbo.Split TO SCM_Administrator
go
GRANT SELECT ON dbo.Split TO SCM_Administrator
go
GRANT UPDATE ON dbo.Split TO SCM_Administrator
go
GRANT SELECT ON dbo.Split TO SCM_Guest
go
GRANT SELECT ON dbo.Split TO SCM_Marshall
go
EXEC sp_rename 'dbo.House.PK_House','PK_House_01122024074747001','INDEX'
go
EXEC sp_rename 'dbo.House','House_01122024074747000',OBJECT
go
CREATE TABLE dbo.House
(
    HouseID    int            IDENTITY,
    Caption    nvarchar(128)  NULL,
    Motto      nvarchar(128)  NULL,
    Color      int            NULL,
    LogoDir    varchar(max)   NULL,
    LogoImg    image          NULL,
    LogoType   nvarchar(5)    NULL,
    IsArchived bit             NOT NULL,
    CreatedOn  datetime       NULL,
    SwimClubID int            NULL
)
ON [PRIMARY]
go
GRANT DELETE ON dbo.House TO SCM_Administrator
go
GRANT INSERT ON dbo.House TO SCM_Administrator
go
GRANT SELECT ON dbo.House TO SCM_Administrator
go
GRANT UPDATE ON dbo.House TO SCM_Administrator
go
GRANT SELECT ON dbo.House TO SCM_Guest
go
GRANT SELECT ON dbo.House TO SCM_Marshall
go
EXEC sp_rename 'dbo.TeamSplit.PK_TeamSplit','PK_TeamSpl_01122024074748001','INDEX'
go
EXEC sp_rename 'dbo.TeamEntrantTeamSplit','TeamEntran_01122024074748002'
go
EXEC sp_rename 'dbo.TeamSplit','TeamSplit_01122024074748000',OBJECT
go
CREATE TABLE dbo.TeamSplit
(
    TeamSplitID int      IDENTITY,
    LapNum      int      NULL,
    SplitTime   time(7)  NULL,
    TeamID      int      NULL
)
ON [PRIMARY]
go
GRANT DELETE ON dbo.TeamSplit TO SCM_Administrator
go
GRANT INSERT ON dbo.TeamSplit TO SCM_Administrator
go
GRANT SELECT ON dbo.TeamSplit TO SCM_Administrator
go
GRANT UPDATE ON dbo.TeamSplit TO SCM_Administrator
go
GRANT SELECT ON dbo.TeamSplit TO SCM_Guest
go
GRANT SELECT ON dbo.TeamSplit TO SCM_Marshall
go
DROP TABLE dbo.MembershipType
go
EXEC sp_rename 'dbo.Qualify.PK_Qualify','PK_Qualify_01122024074749001','INDEX'
go
EXEC sp_rename 'dbo.DistanceQualify','DistanceQu_01122024074749002'
go
EXEC sp_rename 'dbo.StrokeQualify','StrokeQual_01122024074749003'
go
EXEC sp_rename 'dbo.DistanceQuali8','DistanceQu_01122024074749004'
go
EXEC sp_rename 'dbo.GenderQualify','GenderQual_01122024074749005'
go
EXEC sp_rename 'dbo.Qualify','Qualify_01122024074749000',OBJECT
go
CREATE TABLE dbo.Qualify
(
    QualifyID     int      IDENTITY,
    TrialTime     time(7)  NULL,
    IsShortCourse bit      NULL,
    LengthOfPool  int      NULL,
    TrialDistID   int      NULL,
    QualifyDistID int      NULL,
    StrokeID      int      NULL,
    GenderID      int      NULL
)
ON [PRIMARY]
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', 'dbo', 'table', 'Qualify', default, default))
BEGIN
  exec sys.sp_dropextendedproperty 'MS_Description', 'schema', 'dbo', 'table', 'Qualify'
END
exec sys.sp_addextendedproperty 'MS_Description', 'Qualifying Times:
For a swimmer to compete in an event of said distance and stroke they must have swum the stoke in a (shorter) distance within a given time.', 'schema', 'dbo', 'table', 'Qualify'
go
if exists (select * from ::fn_listextendedproperty('MS_Description', 'schema', 'dbo', 'table', 'Qualify', 'column', 'LengthOfPool'))
BEGIN
  exec sys.sp_dropextendedproperty 'MS_Description', 'schema', 'dbo', 'table', 'Qualify', 'column', 'LengthOfPool'
END
exec sys.sp_addextendedproperty 'MS_Description', 'While IsShortCourse will determine the generic pool standard - ie the course length. Short Course (SC),  Long Course (LC)
LengthOfPool allows for more options in filtering of the qualify table.
An example.
If the tblSwimClub->LengthOfPool value is 33m and Qualify->LengthOfPool is 33m then it can pull these records under the guise of the generic pool standard.
If these values don''t exist then the pool length that matches the generic pool standard is used. towit Short Course (SC) 25m,  Long Course (LC) 50m', 'schema', 'dbo', 'table', 'Qualify', 'column', 'LengthOfPool'
go
GRANT DELETE ON dbo.Qualify TO SCM_Administrator
go
GRANT INSERT ON dbo.Qualify TO SCM_Administrator
go
GRANT SELECT ON dbo.Qualify TO SCM_Administrator
go
GRANT UPDATE ON dbo.Qualify TO SCM_Administrator
go
GRANT SELECT ON dbo.Qualify TO SCM_Guest
go
GRANT SELECT ON dbo.Qualify TO SCM_Marshall
go
EXEC sp_bindefault 'BIT_1', 'dbo.Qualify.IsShortCourse'
go
EXEC sp_rename 'dbo.ContactNum.PK_ContactNum','PK_Contact_01122024074750001','INDEX'
go
EXEC sp_rename 'dbo.ContactNumTypeContactNum','ContactNum_01122024074750002'
go
EXEC sp_rename 'dbo.ContactNum','ContactNum_01122024074750000',OBJECT
go
CREATE TABLE dbo.ContactNum
(
    ContactNumID     int           IDENTITY,
    Number           nvarchar(30)  NULL,
    IsArchived       bit            NOT NULL,
    CreatedOn        datetime      NULL,
    MemberID         int           NULL,
    ContactNumTypeID int           NULL
)
ON [PRIMARY]
go
GRANT DELETE ON dbo.ContactNum TO SCM_Administrator
go
GRANT INSERT ON dbo.ContactNum TO SCM_Administrator
go
GRANT SELECT ON dbo.ContactNum TO SCM_Administrator
go
GRANT UPDATE ON dbo.ContactNum TO SCM_Administrator
go
GRANT SELECT ON dbo.ContactNum TO SCM_Guest
go
GRANT SELECT ON dbo.ContactNum TO SCM_Marshall
go
EXEC sp_bindefault 'BIT_0', 'dbo.ContactNum.IsArchived'
go
CREATE TABLE dbo.MemberRole
(
    MemberRoleID int            IDENTITY,
    Caption      nvarchar(128)  NULL,
    IsArchived   bit             NOT NULL,
    IsActive     bit             NOT NULL,
    CreatedOn    datetime       NULL,
    CONSTRAINT PK_MemberRole
    PRIMARY KEY CLUSTERED (MemberRoleID)
)
go
EXEC sp_bindefault 'BIT_0', 'dbo.MemberRole.IsArchived'
go
EXEC sp_bindefault 'BIT_1', 'dbo.MemberRole.IsActive'
go
SET IDENTITY_INSERT [dbo].[MemberRole] ON
GO

INSERT INTO [dbo].[MemberRole]
(
    MemberRoleID
  , [Caption]
  , [IsActive]
  , [IsArchived]
)
VALUES
(1, 'President', 1, 0)
, (2, 'Vice President', 1, 0)
, (3, 'Secretary', 1, 0)
, (4, 'Registrar', 1, 0)
, (5, 'Treasurer', 1, 0)
, (6, 'Race Secretary', 1, 0)
, (7, 'Committee Member', 1, 0)
, (8, 'Volunteer Coordinator', 1, 0)
, (9, 'Public Officer', 1, 0)
, (10, 'Club Coach', 1, 0)
, (11, 'Life Member', 1, 0)
GO

SET IDENTITY_INSERT [dbo].[MemberRole] OFF
GO
go
CREATE TABLE dbo.MemberRoleLink
(
    MemberRoleID int        NOT NULL,
    MemberID     int        NOT NULL,
    CreatedOn    datetime  NULL,
    IsActive     bit        NOT NULL,
    IsArchived   bit        NOT NULL,
    StartOn      datetime  NULL,
    EndOn        datetime  NULL,
    CONSTRAINT PK_MemberRoleLink
    PRIMARY KEY CLUSTERED (MemberRoleID,MemberID)
)
go
EXEC sp_bindefault 'BIT_1', 'dbo.MemberRoleLink.IsActive'
go
EXEC sp_bindefault 'BIT_0', 'dbo.MemberRoleLink.IsArchived'
go
CREATE TABLE dbo.MetaData
(
    MetaDataID int            IDENTITY,
    TAG        nvarchar(128)  NULL,
    TAGID      int            NULL,
    IsActive   bit             NOT NULL,
    IsArchived bit             NOT NULL,
    CONSTRAINT PK_MetaData
    PRIMARY KEY CLUSTERED (MetaDataID)
)
go
EXEC sp_bindefault 'BIT_1', 'dbo.MetaData.IsActive'
go
EXEC sp_bindefault 'BIT_0', 'dbo.MetaData.IsArchived'
go
SET IDENTITY_INSERT [dbo].[MetaData] ON
GO

INSERT INTO [dbo].[MetaData]
(
    MetaDataID
  , [TAG]	-- METADATA STRING
  , [TAGID] -- NON SPECIFIC RELATIONSHIP - [dbo].[ClubType] - NULL PERMITTED.
  , [IsActive] -- NULL VALUE NOT PERMITTED
  , [IsArchived] -- NULL VALUE NOT PERMITTED
)
VALUES
(1, 'COMPETITIVE', 1, 1, 0)

GO

SET IDENTITY_INSERT [dbo].[MetaData] OFF
GO
go
CREATE TABLE dbo.ParaDetail
(
    ParaDetailID int            IDENTITY,
    Code         nvarchar(16)   NULL,
    Details      nvarchar(max)  NULL,
    ParaMasterID int            NULL,
    CONSTRAINT PK_ParaDetail
    PRIMARY KEY CLUSTERED (ParaDetailID)
)
go
/*
Para-Swimming Sport Classes
The prefix for each class identifies the stroke;
S denotes the class for freestyle, backstroke and butterfly 
SB denotes the class for breaststroke 
SM denotes the class for individual medley
*/


SET IDENTITY_INSERT [dbo].[ParaDetail] ON 
GO

INSERT [dbo].[ParaDetail] (
ParaDetailID
, Code
, Details
, ParaMasterID
)
 
VALUES 
(1, 'S1', 'Swimmers with a Physical Impairment: Swimmers who have significant movement difficulties in arms, legs and trunk. Swimmers use a wheelchair for everyday mobility. Swimmers start in the water for all strokes, use assistance for water exit and entry and complete all strokes on their back.', 1),
(2,'SB1', 'Swimmers with a Physical Impairment: Swimmers who have significant movement difficulties in arms, legs and trunk. Swimmers use a wheelchair for everyday mobility. Swimmers start in the water for all strokes, use assistance for water exit and entry and complete all strokes on their back.', 1),
(3,'SM1', 'Swimmers with a Physical Impairment: Swimmers who have significant movement difficulties in arms, legs and trunk. Swimmers use a wheelchair for everyday mobility. Swimmers start in the water for all strokes, use assistance for water exit and entry and complete all strokes on their back.', 1),
(4,'S2', 'Swimmers with a Physical Impairment: Swimmers have significant movement difficulties in arms, legs and trunk, but with more propulsive ability in arms or legs than S1 swimmers. Swimmers use water starts and assistance with water entry.', 1),
(5,'SB1', 'Swimmers with a Physical Impairment: Swimmers have significant movement difficulties in arms, legs and trunk, but with more propulsive ability in arms or legs than S1 swimmers. Swimmers use water starts and assistance with water entry.', 1),
(6,'SM2', 'Swimmers with a Physical Impairment: Swimmers have significant movement difficulties in arms, legs and trunk, but with more propulsive ability in arms or legs than S1 swimmers. Swimmers use water starts and assistance with water entry.', 1),
(7,'S3', 'Swimmers with a Physical Impairment: Swimmers with some arm movement but with no use of their legs or torso; or swimmers with significant restrictions in all four limbs. Swimmers use water starts and assistance in the water.', 1),
(8,'SB2', 'Swimmers with a Physical Impairment: Swimmers with some arm movement but with no use of their legs or torso; or swimmers with significant restrictions in all four limbs. Swimmers use water starts and assistance in the water.', 1),
(9,'SM3', 'Swimmers with a Physical Impairment: Swimmers with some arm movement but with no use of their legs or torso; or swimmers with significant restrictions in all four limbs. Swimmers use water starts and assistance in the water.', 1),
(10,'S4', 'Swimmers with a Physical Impairment: Swimmers with good use of arms and some hand weakness with no use of their torso or legs; swimmers with significant limb loss to three or four limbs. Swimmers usually start in the water.', 1),
(11,'SB3', 'Swimmers with a Physical Impairment: Swimmers with good use of arms and some hand weakness with no use of their torso or legs; swimmers with significant limb loss to three or four limbs. Swimmers usually start in the water.', 1),
(12,'SM4', 'Swimmers with a Physical Impairment: Swimmers with good use of arms and some hand weakness with no use of their torso or legs; swimmers with significant limb loss to three or four limbs. Swimmers usually start in the water.', 1),
(13,'S5', 'Swimmers with a Physical Impairment: Swimmers with good use of arms, but no torso and leg movement; swimmers with some limb loss in three or four limbs. Some swimmers may start in the water and may have difficulty holding good body position in the water.', 1),
(14,'SB4', 'Swimmers with a Physical Impairment: Swimmers with good use of arms, but no torso and leg movement; swimmers with some limb loss in three or four limbs. Some swimmers may start in the water and may have difficulty holding good body position in the water.', 1),
(15,'SM5', 'Swimmers with a Physical Impairment: Swimmers with good use of arms, but no torso and leg movement; swimmers with some limb loss in three or four limbs. Some swimmers may start in the water and may have difficulty holding good body position in the water.', 1),
(16,'S6', 'Swimmers with a Physical Impairment: Swimmers with short stature; swimmers with good arms, some torso and no leg movement; swimmers with significant impairment down one side of their body (limb loss or co-ordination difficulties).', 1),
(17,'SB5', 'Swimmers with a Physical Impairment: Swimmers with short stature; swimmers with good arms, some torso and no leg movement; swimmers with significant impairment down one side of their body (limb loss or co-ordination difficulties).', 1),
(18,'SM6', 'Swimmers with a Physical Impairment: Swimmers with short stature; swimmers with good arms, some torso and no leg movement; swimmers with significant impairment down one side of their body (limb loss or co-ordination difficulties).', 1),
(19,'S7', 'Swimmers with a Physical Impairment: Swimmers with short stature; good arms and torso control and some leg movement; or swimmers with co-ordination difficulties or limb loss down one side of the body.', 1),
(20,'SB6', 'Swimmers with a Physical Impairment: Swimmers with short stature; good arms and torso control and some leg movement; or swimmers with co-ordination difficulties or limb loss down one side of the body.', 1),
(21,'SM7', 'Swimmers with a Physical Impairment: Swimmers with short stature; good arms and torso control and some leg movement; or swimmers with co-ordination difficulties or limb loss down one side of the body.', 1),
(22,'S8', 'Swimmers with a Physical Impairment: Swimmers with full use of their arms and torso with good hip and some leg movement; or swimmers with limb loss of two limbs; swimmers without the use of one arm. Swimmers use regular starts, strokes and turns and may have some difficulties with timing of their strokes.', 1),
(23,'SB7', 'Swimmers with a Physical Impairment: Swimmers with full use of their arms and torso with good hip and some leg movement; or swimmers with limb loss of two limbs; swimmers without the use of one arm. Swimmers use regular starts, strokes and turns and may have some difficulties with timing of their strokes.', 1),
(24,'SM8', 'Swimmers with a Physical Impairment: Swimmers with full use of their arms and torso with good hip and some leg movement; or swimmers with limb loss of two limbs; swimmers without the use of one arm. Swimmers use regular starts, strokes and turns and may have some difficulties with timing of their strokes.', 1),
(25,'S9', 'Swimmers with a Physical Impairment: Swimmers with weakness, limb loss or co-ordination difficulties in one arm or leg only. Swimmers use regular starts, strokes and turns, but have some difficulties in applying even power to the water.', 1),
(26,'SB8', 'Swimmers with a Physical Impairment: Swimmers with weakness, limb loss or co-ordination difficulties in one arm or leg only. Swimmers use regular starts, strokes and turns, but have some difficulties in applying even power to the water.', 1),
(27,'SM9', 'Swimmers with a Physical Impairment: Swimmers with weakness, limb loss or co-ordination difficulties in one arm or leg only. Swimmers use regular starts, strokes and turns, but have some difficulties in applying even power to the water.', 1),
(28,'S10', 'Swimmers with a Physical Impairment: Swimmers with minimal impairment that affects one joint, usually their foot or hand. Starts, turns and strokes are smooth and fluid.', 1),
(29,'SB9', 'Swimmers with a Physical Impairment: Swimmers with minimal impairment that affects one joint, usually their foot or hand. Starts, turns and strokes are smooth and fluid.', 1),
(30,'SM10', 'Swimmers with a Physical Impairment: Swimmers with minimal impairment that affects one joint, usually their foot or hand. Starts, turns and strokes are smooth and fluid.', 1),
(31,'S11', 'Swimmers with a Vision Impairment: Swimmers who are blind. Swimmers must wear blacked out goggles for competition and use a tapper as they approach the end of the pool. Swimmers often count strokes to know the length of the lane and anticipate turns.', 2),
(32,'SB11', 'Swimmers with a Vision Impairment: Swimmers who are blind. Swimmers must wear blacked out goggles for competition and use a tapper as they approach the end of the pool. Swimmers often count strokes to know the length of the lane and anticipate turns.', 2),
(33,'SM11', 'Swimmers with a Vision Impairment: Swimmers who are blind. Swimmers must wear blacked out goggles for competition and use a tapper as they approach the end of the pool. Swimmers often count strokes to know the length of the lane and anticipate turns.', 2),
(34,'S12', 'Swimmers with a Vision Impairment: Swimmers who have very low vision in both eyes either in how far they can see (visual acuity <2/60; LogMAR 1.5-2.6 inclusive) or how wide they can see (visual field <10 degrees diameter). Swimmers have the option to use a tapper.', 2),
(35,'SB12', 'Swimmers with a Vision Impairment: Swimmers who have very low vision in both eyes either in how far they can see (visual acuity <2/60; LogMAR 1.5-2.6 inclusive) or how wide they can see (visual field <10 degrees diameter). Swimmers have the option to use a tapper.', 2),
(36,'SM12', 'Swimmers with a Vision Impairment: Swimmers who have very low vision in both eyes either in how far they can see (visual acuity <2/60; LogMAR 1.5-2.6 inclusive) or how wide they can see (visual field <10 degrees diameter). Swimmers have the option to use a tapper.', 2),
(37,'S13', 'Swimmer who have low vision in both eyes, but more vision than S12 swimmers. Vision is affected either in how far they can see (visual acuity <6/60; LogMAR 1-1.4 inclusive) or how wide they can see (visual field < 40 degrees diameter). Swimmers may elect to use a tapper.', 2),
(38,'SB13', 'Swimmer who have low vision in both eyes, but more vision than S12 swimmers. Vision is affected either in how far they can see (visual acuity <6/60; LogMAR 1-1.4 inclusive) or how wide they can see (visual field < 40 degrees diameter). Swimmers may elect to use a tapper.', 2),
(39,'SM13', 'Swimmer who have low vision in both eyes, but more vision than S12 swimmers. Vision is affected either in how far they can see (visual acuity <6/60; LogMAR 1-1.4 inclusive) or how wide they can see (visual field < 40 degrees diameter). Swimmers may elect to use a tapper.', 2),
(40,'S14', 'Swimmers with an Intellectual Impairment: Swimmers with an intellectual impairment. Swimmers may find it more difficult to pace consistently and plan event tactics.', 3),
(41,'SB14', 'Swimmers with an Intellectual Impairment: Swimmers with an intellectual impairment. Swimmers may find it more difficult to pace consistently and plan event tactics.', 3),
(42,'SM14', 'Swimmers with an Intellectual Impairment: Swimmers with an intellectual impairment. Swimmers may find it more difficult to pace consistently and plan event tactics.', 3),
(43,'NE', 'Not Eligible: Swimmers do not meet the minimum criteria for the Para-sport classes, but may still be able to compete. Contact Swimming Australia for more information.', 4);

GO

SET IDENTITY_INSERT [dbo].[ParaDetail] OFF
GO
go
CREATE TABLE dbo.ParaMaster
(
    ParaMasterID int            IDENTITY,
    Caption      nvarchar(128)  NULL,
    CONSTRAINT PK_ParaMaster
    PRIMARY KEY CLUSTERED (ParaMasterID)
)
go
SET IDENTITY_INSERT [dbo].[ParaMaster] ON 
GO

INSERT [dbo].[ParaMaster] (
ParaMasterID
, Caption
)
VALUES 
(1,'Physical')
, (2,'Vision Impaired')
, (3,'Intellectual')
, (4,'Not Eligible')
GO

SET IDENTITY_INSERT [dbo].[ParaMaster] OFF
GO
go
CREATE TABLE dbo.PoolType
(
    PoolTypeID   int            IDENTITY,
    Caption      nvarchar(128)  NULL,
    ShortCaption nvarchar(16)   NULL,
    ABREV        nvarchar(12)   NULL,
    IsArchived   bit            NULL,
    IsActive     bit            NULL,
    LenOfPool    float          NULL,
    CONSTRAINT PK_PoolType
    PRIMARY KEY CLUSTERED (PoolTypeID)
)
go
EXEC sp_bindefault 'BIT_0', 'dbo.PoolType.IsArchived'
go
EXEC sp_bindefault 'BIT_1', 'dbo.PoolType.IsActive'
go
CREATE TABLE dbo.SwimClubMetaDataLink
(
    SwimClubID int   NOT NULL,
    MetaDataID int   NOT NULL,
    CONSTRAINT PK_SwimClubMetaDataLink
    PRIMARY KEY CLUSTERED (SwimClubID,MetaDataID)
)
go
--SET IDENTITY_INSERT [dbo].[SwimClubMetaDataLink] ON
--GO

INSERT INTO [dbo].[SwimClubMetaDataLink]
(
    SwimClubID
  , MetaDataID
)
VALUES
(1, 1)

GO

--SET IDENTITY_INSERT [dbo].[SwimClubMetaDataLink] OFF
--GO
go
CREATE TABLE dbo.SwimClubType
(
    SwimClubTypeID int            IDENTITY,
    Caption        nvarchar(128)  NULL,
    ShortCaption   nvarchar(32)   NULL,
    ABREV          nvarchar(12)   NULL,
    IsArchived     bit             NOT NULL,
    IsActive       bit             NOT NULL,
    CONSTRAINT PK_SwimClubType
    PRIMARY KEY CLUSTERED (SwimClubTypeID)
)
go
EXEC sp_bindefault 'BIT_0', 'dbo.SwimClubType.IsArchived'
go
EXEC sp_bindefault 'BIT_1', 'dbo.SwimClubType.IsActive'
go
SET IDENTITY_INSERT [dbo].[SwimClubType] ON
GO

INSERT [dbo].[SwimClubType]
(
    [SwimClubTypeID]
  , [Caption]
  , [ShortCaption]
  , [ABREV]
  , [IsActive] -- NULL NOT ALLOWED
  , [IsArchived] -- NULL NOT ALLOWED
)
VALUES
(1, N'Amateur Swimming Club', 'SCM SwimClub', N'SCMCLUB', 1, 0)
, (2, N'SCM Carnival Club vs Clubs', 'SCM Carnival', N'SCMCARNIVAL', 1, 0)
, (3, N'Club Championship', 'Championship', N'CLUBCHAMP', 1, 0)
, (4, N'Regional Championship', 'Regional Competitive', N'REGCOMP', 1, 0)
, (5, N'State Championship', 'State Competitive', N'STATECOMP', 1, 0)
, (6, N'National Championship', 'National Competitive', N'NATCOMP', 1, 0)
, (7, N'Masters Swimming', 'Masters', N'MASTER', 1, 0)
, (8, N'Paralympic Swimming', 'Paralympic', N'PARA', 1, 0)
, (9, N'Primary School Carnival', 'Primary School', N'PRIMARY', 1, 0)
, (10, N'Secondary School Carnival', 'Secondary School', N'SECONDARY', 1, 0)
, (11, N'Multi-Class Carnival', 'Multi-Class', N'MULTICLASS', 1, 0)
GO

SET IDENTITY_INSERT [dbo].[SwimClubType] OFF
GO
go
CREATE TABLE dbo.SwimmerCategory
(
    SwimmerCategoryID int            IDENTITY,
    Caption           nvarchar(64)   NULL,
    LongCaption       nvarchar(128)  NULL,
    TAG               nvarchar(128)  NULL,
    TAGID             int            NULL,
    ABREV             nvarchar(9)    NULL,
    AgeFrom           int            NULL,
    AgeTo             int            NULL,
    IsArchived        bit             NOT NULL,
    IsActive          bit             NOT NULL,
    SwimClubID        int            NULL,
    CONSTRAINT PK_SwimmerCategory
    PRIMARY KEY CLUSTERED (SwimmerCategoryID)
)
go
EXEC sp_bindefault 'BIT_0', 'dbo.SwimmerCategory.IsArchived'
go
EXEC sp_bindefault 'BIT_1', 'dbo.SwimmerCategory.IsActive'
go
SET IDENTITY_INSERT [dbo].[SwimmerCategory] ON 
GO
INSERT [dbo].[SwimmerCategory] ([SwimmerCategoryID], [Caption], [LongCaption], [TAG], [TAGID], [ABREV], [AgeFrom], [AgeTo], [IsArchived], [IsActive], [SwimClubID]) 
VALUES 
/* 
NOTE: Gender not a consideration in swimming categories. METADATA TAG used to resolve duplicity.
HINT: Use by Auto-Build 'seperate by Swimming Category' option.'
*/
(1, N'Competitive 9 years+', N'Competitive Swimmer 9 years and over.',N'COMPETITIVE',1,N'COMPET9+', 9, 99, 0,1,1)
,(2, N'Casual 9 years+', N'Casual or recreational Swimmer 9 years and over, who does not compete in Metropolitan ChampionShips ',NULL,0,N'CASUAL9+', 9, 99, 0,1,1)
,(3, N'Junior Dolphin 7 & under', N'Junior Dolphin 7 and under.', NULL,0,N'JrDOLP7U', 1, 7, 0,1,1)
,(4, N'Junior Dolphin 8 years', N'Junior Dolphin 8 year old.', NULL,0,N'JrDOLPH8Y', 8, 8, 0,1,1)
GO
SET IDENTITY_INSERT [dbo].[SwimmerCategory] OFF
GO
go
CREATE TABLE dbo.TeamName
(
    TeamNameID   int           IDENTITY,
    Caption      nvarchar(64)  NULL,
    CaptionShort nvarchar(64)  NULL,
    ABREV        nvarchar(5)   NULL,
    CONSTRAINT PK_TeamName
    PRIMARY KEY CLUSTERED (TeamNameID)
)
go
SET IDENTITY_INSERT [dbo].[TeamName] ON 
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (1, N'Team A', N'Alpha', N'A')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (2, N'Team B', N'Beta', N'B')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (3, N'Team C',  N'Charlie', N'C')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (4, N'Team D',  N'Delta', N'D')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (5, N'Team E',  N'Echo', N'E')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (6, N'Team F',  N'Foxtrot', N'F')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (7, N'Team G',  N'Golf', N'G')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (8, N'Team H',  N'Hotel', N'H')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (9, N'Team I',  N'India', N'I')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (10, N'Team J',  N'Juliett', N'J')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (11, N'Team K',  N'Kilo', N'K')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (12, N'Team L',  N'Lima', N'L')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (13, N'Team M',  N'Mike', N'M')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (14, N'Team N',  N'November', N'N')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (15, N'Team O',  N'Oscar', N'O')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort], [ABREV]) VALUES (16, N'Team P',  N'Papa', N'P')
GO
INSERT [dbo].[TeamName] ([TeamNameID], [Caption], [CaptionShort],[ABREV]) VALUES (17, N'Team Q',  N'Quebec',N'Q')
GO
INSERT[dbo].[TeamName]([TeamNameID],[Caption],[CaptionShort],[ABREV]) VALUES (18,N'Team R',N'Romeo',N'R')
GO
INSERT[dbo].[TeamName]([TeamNameID],[Caption],[CaptionShort],[ABREV]) VALUES (19,N'Team S',N'Sierra',N'S')
GO
INSERT[dbo].[TeamName]([TeamNameID],[Caption],[CaptionShort],[ABREV]) VALUES (20,N'Team T',N'Tango',N'T')
GO
INSERT[dbo].[TeamName]([TeamNameID],[Caption],[CaptionShort],[ABREV]) VALUES (21,N'Team U',N'Uniform',N'U')
GO
INSERT[dbo].[TeamName]([TeamNameID],[Caption],[CaptionShort],[ABREV]) VALUES (22,N'Team V',N'Victor',N'V')
GO
INSERT[dbo].[TeamName]([TeamNameID],[Caption],[CaptionShort],[ABREV]) VALUES (23,N'Team W',N'Whiskey',N'W')
GO
INSERT[dbo].[TeamName]([TeamNameID],[Caption],[CaptionShort],[ABREV]) VALUES (24,N'Team X',N'X-ray',N'X')
GO
INSERT[dbo].[TeamName]([TeamNameID],[Caption],[CaptionShort],[ABREV]) VALUES (25,N'Team Y',N'Yankee',N'Y')
GO
INSERT[dbo].[TeamName]([TeamNameID],[Caption],[CaptionShort],[ABREV]) VALUES (26,N'Team Z',N'Zulu',N'Z')
GO
SET IDENTITY_INSERT [dbo].[TeamName] OFF
GO
go

-- Insert Data SQL

SET IDENTITY_INSERT dbo.SwimClub ON
go
INSERT INTO dbo.SwimClub(
                         SwimClubID,
                         NickName,
                         Caption,
                         Email,
                         ContactNum,
                         WebSite,
                         HeatAlgorithm,
                         EnableTeamEvents,
                         EnableSwimOThon,
                         EnableExtHeatTypes,
                         EnableMembershipStr,
--                       EnableSimpleDisqualification,
                         NumOfLanes,
                         LenOfPool,
                         StartOfSwimSeason,
                         CreatedOn,
                         LogoDir,
                         LogoImg,
                         LogoType,
                         PoolTypeID,
                         SwimClubTypeID
                        )
                  SELECT 
                         SwimClubID,
                         NickName,
                         Caption,
                         Email,
                         ContactNum,
                         WebSite,
                         HeatAlgorithm,
                         EnableTeamEvents,
                         EnableSwimOThon,
                         EnableExtHeatTypes,
                         EnableMembershipStr,
--                       EnableSimpleDisqualification,
                         NumOfLanes,
                         LenOfPool,
                         StartOfSwimSeason,
                         CreatedOn,
                         LogoDir,
                         LogoImg,
                         LogoType,
                         NULL,
                         NULL
                    FROM dbo.SwimClub_01122024074737000 
go
SET IDENTITY_INSERT dbo.SwimClub OFF
go
SET IDENTITY_INSERT dbo.ScoreDivision ON
go
INSERT INTO dbo.ScoreDivision(
                              ScoreDivisionID,
                              Caption,
                              AgeFrom,
                              AgeTo,
                              SwimClubID,
                              GenderID
                             )
                       SELECT 
                              ScoreDivisionID,
                              Caption,
                              AgeFrom,
                              AgeTo,
                              SwimClubID,
                              GenderID
                         FROM dbo.ScoreDivis_01122024074738000 
go
SET IDENTITY_INSERT dbo.ScoreDivision OFF
go
SET IDENTITY_INSERT dbo.Event ON
go
INSERT INTO dbo.Event(
                      EventID,
                      EventNum,
                      Caption,
                      ScheduleDT,
                      RallyOpenDT,
                      RallyCloseDT,
                      OpenDT,
                      CloseDT,
                      SessionID,
                      StrokeID,
                      DistanceID,
                      EventStatusID
                     )
               SELECT 
                      EventID,
                      EventNum,
                      Caption,
                      ScheduleDT,
                      NULL,
                      NULL,
                      NULL,
                      NULL,
                      SessionID,
                      StrokeID,
                      DistanceID,
                      EventStatusID
                 FROM dbo.Event_01122024074739000 
go
SET IDENTITY_INSERT dbo.Event OFF
go
SET IDENTITY_INSERT dbo.HeatIndividual ON
go
INSERT INTO dbo.HeatIndividual(
                               HeatID,
                               HeatNum,
                               Caption,
                               ScheduleDT,
                               RallyOpenDT,
                               RallyCloseDT,
                               OpenDT,
                               CloseDT,
                               EventID,
                               HeatTypeID,
                               HeatStatusID
                              )
                        SELECT 
                               HeatID,
                               HeatNum,
                               Caption,
                               NULL,
                               NULL,
                               NULL,
                               NULL,
                               NULL,
                               EventID,
                               HeatTypeID,
                               HeatStatusID
                          FROM dbo.HeatIndivi_01122024074740000 
go
SET IDENTITY_INSERT dbo.HeatIndividual OFF
go
SET IDENTITY_INSERT dbo.ScorePoints ON
go
INSERT INTO dbo.ScorePoints(
                            ScorePointsID,
                            Place,
                            Points,
                            SwimClubID
                           )
                     SELECT 
                            ScorePointsID,
                            Place,
                            Points,
                            SwimClubID
                       FROM dbo.ScorePoint_01122024074741000 
go
SET IDENTITY_INSERT dbo.ScorePoints OFF
go
SET IDENTITY_INSERT dbo.Member ON
go
INSERT INTO dbo.Member(
                       MemberID,
                       MembershipNum,
                       MembershipStr,
                       FirstName,
                       MiddleInitial,
                       LastName,
                       RegisterNum,
                       RegisterStr,
                       DOB,
                       IsArchived,
                       IsActive,
                       IsSwimmer,
                       Email,
                       CreatedOn,
                       ArchivedOn,
                       EnableEmailOut,
                       EnableEmailNomineeForm,
                       EnableEmailSessionReport,
                       TAGS,
                       SwimClubID,
                       HouseID,
                       GenderID
                      )
                SELECT 
                       MemberID,
                       MembershipNum,
                       MembershipStr,
                       FirstName,
                       NULL,
                       LastName,
                       NULL,
                       NULL,
                       DOB,
                       IsArchived,
                       IsActive,
                       IsSwimmer,
                       Email,
                       CreatedOn,
                       ArchivedOn,
                       EnableEmailOut,
                       EnableEmailNomineeForm,
                       EnableEmailSessionReport,
                       NULL,
                       SwimClubID,
                       HouseID,
                       GenderID
                  FROM dbo.Member_01122024074742000 
go
SET IDENTITY_INSERT dbo.Member OFF
go
SET IDENTITY_INSERT dbo.Entrant ON
go
INSERT INTO dbo.Entrant(
                        EntrantID,
                        Lane,
                        RaceTime,
                        TimeToBeat,
                        PersonalBest,
                        IsDisqualified,
                        IsScratched,
                        DisqualifyCodeID,
                        MemberID,
                        HeatID
                       )
                 SELECT 
                        EntrantID,
                        Lane,
                        RaceTime,
                        TimeToBeat,
                        PersonalBest,
                        IsDisqualified,
                        IsScratched,
                        NULL,
                        MemberID,
                        HeatID
                   FROM dbo.Entrant_01122024074743000 
go
SET IDENTITY_INSERT dbo.Entrant OFF
go
SET IDENTITY_INSERT dbo.Team ON
go
INSERT INTO dbo.Team(
                     TeamID,
                     Lane,
                     RaceTime,
                     TimeToBeat,
                     IsDisqualified,
                     IsScratched,
                     DisqualifyCodeID,
                     HeatID,
                     TeamNameID
                    )
              SELECT 
                     TeamID,
                     Lane,
                     TeamTime,
                     NULL,
                     IsDisqualified,
                     IsScratched,
                     NULL,
                     NULL,
                     NULL
                FROM dbo.Team_01122024074744000 
go
SET IDENTITY_INSERT dbo.Team OFF
go
SET IDENTITY_INSERT dbo.TeamEntrant ON
go
INSERT INTO dbo.TeamEntrant(
                            TeamEntrantID,
                            Lane,
                            RaceTime,
                            TimeToBeat,
                            PersonalBest,
                            IsDisqualified,
                            IsScratched,
                            DisqualifyCodeID,
                            MemberID,
                            StrokeID,
                            TeamID
                           )
                     SELECT 
                            TeamEntrantID,
                            NULL,
                            RaceTime,
                            NULL,
                            NULL,
                            NULL,
                            NULL,
                            NULL,
                            MemberID,
                            StrokeID,
                            TeamID
                       FROM dbo.TeamEntran_01122024074745000 
go
SET IDENTITY_INSERT dbo.TeamEntrant OFF
go
SET IDENTITY_INSERT dbo.Split ON
go
INSERT INTO dbo.Split(
                      SplitID,
                      LapNum,
                      SplitTime,
                      EntrantID
                     )
               SELECT 
                      SplitID,
                      NULL,
                      SplitTime,
                      EntrantID
                 FROM dbo.Split_01122024074746000 
go
SET IDENTITY_INSERT dbo.Split OFF
go
SET IDENTITY_INSERT dbo.House ON
go
INSERT INTO dbo.House(
                      HouseID,
                      Caption,
                      Motto,
                      Color,
                      LogoDir,
                      LogoImg,
                      LogoType,
                      IsArchived,
                      CreatedOn,
                      SwimClubID
                     )
               SELECT 
                      HouseID,
                      Caption,
                      Motto,
                      Color,
                      LogoDir,
                      LogoImg,
                      LogoType,
                      0,
                      NULL,
                      NULL
                 FROM dbo.House_01122024074747000 
go
SET IDENTITY_INSERT dbo.House OFF
go
SET IDENTITY_INSERT dbo.TeamSplit ON
go
INSERT INTO dbo.TeamSplit(
                          TeamSplitID,
                          LapNum,
                          SplitTime,
                          TeamID
                         )
                   SELECT 
                          TeamSplitID,
                          NULL,
                          SplitTime,
                          NULL
                     FROM dbo.TeamSplit_01122024074748000 
go
SET IDENTITY_INSERT dbo.TeamSplit OFF
go
SET IDENTITY_INSERT dbo.Qualify ON
go
INSERT INTO dbo.Qualify(
                        QualifyID,
                        TrialTime,
                        IsShortCourse,
                        LengthOfPool,
                        TrialDistID,
                        QualifyDistID,
                        StrokeID,
                        GenderID
                       )
                 SELECT 
                        QualifyID,
                        TrialTime,
                        IsShortCourse,
                        LengthOfPool,
                        TrialDistID,
                        QualifyDistID,
                        StrokeID,
                        GenderID
                   FROM dbo.Qualify_01122024074749000 
go
SET IDENTITY_INSERT dbo.Qualify OFF
go
SET IDENTITY_INSERT dbo.ContactNum ON
go
INSERT INTO dbo.ContactNum(
                           ContactNumID,
                           Number,
                           IsArchived,
                           CreatedOn,
                           MemberID,
                           ContactNumTypeID
                          )
                    SELECT 
                           ContactNumID,
                           Number,
                           IsArchived,
                           NULL,
                           MemberID,
                           ContactNumTypeID
                      FROM dbo.ContactNum_01122024074750000 
go
SET IDENTITY_INSERT dbo.ContactNum OFF
go

-- Add Constraint SQL

ALTER TABLE dbo.SwimClub ADD CONSTRAINT PK_SwimClub
PRIMARY KEY NONCLUSTERED (SwimClubID)
    ON [PRIMARY]
go
ALTER TABLE dbo.ScoreDivision ADD CONSTRAINT PK_ScoreDivision
PRIMARY KEY CLUSTERED (ScoreDivisionID)
    ON [PRIMARY]
go
ALTER TABLE dbo.Event ADD CONSTRAINT PK_Event
PRIMARY KEY NONCLUSTERED (EventID)
    ON [PRIMARY]
go
ALTER TABLE dbo.HeatIndividual ADD CONSTRAINT PK_HeatIndividual
PRIMARY KEY NONCLUSTERED (HeatID)
    ON [PRIMARY]
go
ALTER TABLE dbo.ScorePoints ADD CONSTRAINT PK_ScorePoints
PRIMARY KEY CLUSTERED (ScorePointsID)
    ON [PRIMARY]
go
ALTER TABLE dbo.Member ADD CONSTRAINT PK_Member
PRIMARY KEY NONCLUSTERED (MemberID)
    ON [PRIMARY]
go
ALTER TABLE dbo.Entrant ADD CONSTRAINT PK_Entrant
PRIMARY KEY NONCLUSTERED (EntrantID)
    ON [PRIMARY]
go
ALTER TABLE dbo.Team ADD CONSTRAINT PK_Team
PRIMARY KEY NONCLUSTERED (TeamID)
    ON [PRIMARY]
go
ALTER TABLE dbo.TeamEntrant ADD CONSTRAINT PK_TeamEntrant
PRIMARY KEY NONCLUSTERED (TeamEntrantID)
    ON [PRIMARY]
go
ALTER TABLE dbo.Split ADD CONSTRAINT PK_Split
PRIMARY KEY NONCLUSTERED (SplitID)
    ON [PRIMARY]
go
ALTER TABLE dbo.House ADD CONSTRAINT PK_House
PRIMARY KEY CLUSTERED (HouseID)
    ON [PRIMARY]
go
ALTER TABLE dbo.TeamSplit ADD CONSTRAINT PK_TeamSplit
PRIMARY KEY NONCLUSTERED (TeamSplitID)
    ON [PRIMARY]
go
ALTER TABLE dbo.Qualify ADD CONSTRAINT PK_Qualify
PRIMARY KEY CLUSTERED (QualifyID)
    ON [PRIMARY]
go
ALTER TABLE dbo.ContactNum ADD CONSTRAINT PK_ContactNum
PRIMARY KEY CLUSTERED (ContactNumID)
    ON [PRIMARY]
go

-- Add Referencing Foreign Keys SQL

ALTER TABLE dbo.[Session] ADD CONSTRAINT SwimClubSession
FOREIGN KEY (SwimClubID)
REFERENCES dbo.SwimClub (SwimClubID)
 ON DELETE CASCADE
go
ALTER TABLE dbo.ScoreDivision ADD CONSTRAINT SwimClubScoreDivision
FOREIGN KEY (SwimClubID)
REFERENCES dbo.SwimClub (SwimClubID)
go
ALTER TABLE dbo.ScorePoints ADD CONSTRAINT SwimClubScorePoints
FOREIGN KEY (SwimClubID)
REFERENCES dbo.SwimClub (SwimClubID)
 ON DELETE CASCADE
go
ALTER TABLE dbo.Member ADD CONSTRAINT SwimClubMember
FOREIGN KEY (SwimClubID)
REFERENCES dbo.SwimClub (SwimClubID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.HeatIndividual ADD CONSTRAINT EventHeatIndividual
FOREIGN KEY (EventID)
REFERENCES dbo.Event (EventID)
 ON DELETE CASCADE
go
ALTER TABLE dbo.Nominee ADD CONSTRAINT EventNominee
FOREIGN KEY (EventID)
REFERENCES dbo.Event (EventID)
 ON DELETE CASCADE
go
ALTER TABLE dbo.Entrant ADD CONSTRAINT HeatIndividualEntrant
FOREIGN KEY (HeatID)
REFERENCES dbo.HeatIndividual (HeatID)
 ON DELETE CASCADE
go
ALTER TABLE dbo.Entrant ADD CONSTRAINT MemberEntrant
FOREIGN KEY (MemberID)
REFERENCES dbo.Member (MemberID)
 ON DELETE SET NULL
 NOT FOR REPLICATION
go
ALTER TABLE dbo.TeamEntrant ADD CONSTRAINT MemberTeamEntrant
FOREIGN KEY (MemberID)
REFERENCES dbo.Member (MemberID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.ContactNum ADD CONSTRAINT MemberContactNum
FOREIGN KEY (MemberID)
REFERENCES dbo.Member (MemberID)
 ON DELETE CASCADE
go
ALTER TABLE dbo.Nominee ADD CONSTRAINT MemberNominee
FOREIGN KEY (MemberID)
REFERENCES dbo.Member (MemberID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.Split ADD CONSTRAINT EntrantSplit
FOREIGN KEY (EntrantID)
REFERENCES dbo.Entrant (EntrantID)
 ON DELETE CASCADE
go
ALTER TABLE dbo.TeamEntrant ADD CONSTRAINT TeamTeamEntrant
FOREIGN KEY (TeamID)
REFERENCES dbo.Team (TeamID)
 ON DELETE CASCADE
go
ALTER TABLE dbo.Member ADD CONSTRAINT HouseMember
FOREIGN KEY (HouseID)
REFERENCES dbo.House (HouseID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.MemberRoleLink 
    ADD CONSTRAINT MemberMemberRoleLink
FOREIGN KEY (MemberID)
REFERENCES dbo.Member (MemberID)
go
ALTER TABLE dbo.MemberRoleLink 
    ADD CONSTRAINT MemberRoleMemberRoleLink
FOREIGN KEY (MemberRoleID)
REFERENCES dbo.MemberRole (MemberRoleID)
go
ALTER TABLE dbo.ParaDetail 
    ADD CONSTRAINT ParaMasterParaDetail
FOREIGN KEY (ParaMasterID)
REFERENCES dbo.ParaMaster (ParaMasterID)
go
ALTER TABLE dbo.SwimClubMetaDataLink 
    ADD CONSTRAINT SwimClubSwimClubMetaDataLink
FOREIGN KEY (SwimClubID)
REFERENCES dbo.SwimClub (SwimClubID)
go
ALTER TABLE dbo.SwimClubMetaDataLink 
    ADD CONSTRAINT MetaDataSwimClubMetaDataLink
FOREIGN KEY (MetaDataID)
REFERENCES dbo.MetaData (MetaDataID)
go
ALTER TABLE dbo.SwimmerCategory 
    ADD CONSTRAINT SwimClubSwimmerCategory
FOREIGN KEY (SwimClubID)
REFERENCES dbo.SwimClub (SwimClubID)
go
ALTER TABLE dbo.SwimClub ADD CONSTRAINT SwimClubTypeSwimClub
FOREIGN KEY (SwimClubTypeID)
REFERENCES dbo.SwimClubType (SwimClubTypeID)
go
ALTER TABLE dbo.SwimClub ADD CONSTRAINT PoolTypeSwimClub
FOREIGN KEY (PoolTypeID)
REFERENCES dbo.PoolType (PoolTypeID)
go
ALTER TABLE dbo.ScoreDivision ADD CONSTRAINT GenderScoreDivision
FOREIGN KEY (GenderID)
REFERENCES dbo.Gender (GenderID)
go
ALTER TABLE dbo.Event ADD CONSTRAINT StrokeEvent
FOREIGN KEY (StrokeID)
REFERENCES dbo.Stroke (StrokeID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.Event ADD CONSTRAINT DistanceEvent
FOREIGN KEY (DistanceID)
REFERENCES dbo.Distance (DistanceID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.Event ADD CONSTRAINT EventStatusEvent
FOREIGN KEY (EventStatusID)
REFERENCES dbo.EventStatus (EventStatusID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.Event ADD CONSTRAINT SessionEvent
FOREIGN KEY (SessionID)
REFERENCES dbo.[Session] (SessionID)
 ON DELETE CASCADE
go
ALTER TABLE dbo.HeatIndividual ADD CONSTRAINT HeatTypeHeatIndividual
FOREIGN KEY (HeatTypeID)
REFERENCES dbo.HeatType (HeatTypeID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.HeatIndividual ADD CONSTRAINT HeatStatusHeatIndividual
FOREIGN KEY (HeatStatusID)
REFERENCES dbo.HeatStatus (HeatStatusID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.Member ADD CONSTRAINT GenderMember
FOREIGN KEY (GenderID)
REFERENCES dbo.Gender (GenderID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.Entrant ADD CONSTRAINT DisqualifyCodeEntrant
FOREIGN KEY (DisqualifyCodeID)
REFERENCES dbo.DisqualifyCode (DisqualifyCodeID)
go
ALTER TABLE dbo.Team ADD CONSTRAINT DisqualifyCodeTeam
FOREIGN KEY (DisqualifyCodeID)
REFERENCES dbo.DisqualifyCode (DisqualifyCodeID)
go
ALTER TABLE dbo.Team ADD CONSTRAINT HeatIndividualTeam
FOREIGN KEY (HeatID)
REFERENCES dbo.HeatIndividual (HeatID)
go
ALTER TABLE dbo.Team ADD CONSTRAINT TeamNameTeam
FOREIGN KEY (TeamNameID)
REFERENCES dbo.TeamName (TeamNameID)
go
ALTER TABLE dbo.TeamEntrant ADD CONSTRAINT DisqualifyCodeTeamEntrant
FOREIGN KEY (DisqualifyCodeID)
REFERENCES dbo.DisqualifyCode (DisqualifyCodeID)
go
ALTER TABLE dbo.TeamEntrant ADD CONSTRAINT StrokeTeamEntrant
FOREIGN KEY (StrokeID)
REFERENCES dbo.Stroke (StrokeID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.House ADD CONSTRAINT SwimClubHouse
FOREIGN KEY (SwimClubID)
REFERENCES dbo.SwimClub (SwimClubID)
go
ALTER TABLE dbo.TeamSplit ADD CONSTRAINT TeamTeamSplit
FOREIGN KEY (TeamID)
REFERENCES dbo.Team (TeamID)
go
ALTER TABLE dbo.Qualify ADD CONSTRAINT DistanceQualify
FOREIGN KEY (TrialDistID)
REFERENCES dbo.Distance (DistanceID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.Qualify ADD CONSTRAINT StrokeQualify
FOREIGN KEY (StrokeID)
REFERENCES dbo.Stroke (StrokeID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.Qualify ADD CONSTRAINT DistanceQual10
FOREIGN KEY (QualifyDistID)
REFERENCES dbo.Distance (DistanceID)
go
ALTER TABLE dbo.Qualify ADD CONSTRAINT GenderQualify
FOREIGN KEY (GenderID)
REFERENCES dbo.Gender (GenderID)
 ON DELETE SET NULL
go
ALTER TABLE dbo.ContactNum ADD CONSTRAINT ContactNumTypeContactNum
FOREIGN KEY (ContactNumTypeID)
REFERENCES dbo.ContactNumType (ContactNumTypeID)
 ON DELETE SET NULL
go
