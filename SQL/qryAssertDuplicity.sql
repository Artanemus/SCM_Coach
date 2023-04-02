USE SCM_Coach;

DECLARE @MemberID AS INTEGER;
SET @MemberID = 0;

SELECT COUNT([scmMemberID]) AS rtnValue
FROM SCM_Coach.dbo.HR
WHERE [scmMemberID] = @MemberID;