USE SCM_Coach;

DECLARE @SCMCoachID AS INTEGER;
SET @SCMCoachID = 1; -- :SCMCOACHID;

SELECT 
		 [TeamTmpID]
		,[Caption]
		,[NickName]
		,[Color]
		,[SCMCoachID]
FROM [SCM_Coach].[dbo].[TeamTmp] 
WHERE [SCMCoachID] = @SCMCoachID
;
