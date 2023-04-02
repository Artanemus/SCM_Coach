USE SwimClubMeet;

DECLARE @MemberID AS INTEGER;
SET @MemberID = 1;

SELECT MemberID
     , FirstName
     , LastName
     , DOB
     , MembershipNum
     , MembershipStr
FROM Member
WHERE IsSwimmer <> 0
      AND MemberID = @MemberID;