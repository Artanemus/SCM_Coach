Use SwimClubMeet;

DECLARE @MemberID AS INTEGER;

SET @MemberID = 77;

SELECT SessionStart
,[Session].Caption AS SessionStr
, CONCAT(Distance.Caption, ' ', Stroke.Caption) as EventStr
, Entrant.RaceTime
, [Distance].DistanceID
, [Stroke].StrokeID
, [Entrant].EntrantID
,[Entrant].IsDisqualified
,[Entrant].IsScratched
 FROM [Session]
LEFT JOIN [Event] ON [Session].[SessionID] = [Event].[SessionID]
LEFT JOIN [Stroke] on [Event].StrokeID = Stroke.StrokeID
LEFT JOIN [Distance] on [Event].DistanceID = Distance.DistanceID
LEFT JOIN [HeatIndividual] ON [Event].[EventID] = [HeatIndividual].[EventID]
LEFT JOIN [Entrant] ON HeatIndividual.HeatID = [Entrant].HeatID
WHERE [Entrant].[MemberID] = @MemberID;