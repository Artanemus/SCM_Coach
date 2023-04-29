USE SCM_Coach;

DECLARE @HideInActive BIT;
DECLARE @HideArchived BIT;
DECLARE @HideNonSwimmers BIT;
DECLARE @SwimClubID INTEGER;

SET @HideInActive = 1; --:HIDE_INACTIVE;
SET @HideArchived = 0; --:HIDE_ARCHIVED;
SET @HideNonSwimmers = 1; -- :HIDE_NONSWIMMERS;

SELECT [MemberID],
       [RegisterNum],
       [RegisterStr],
       [FirstName],
       [LastName],
       [DOB],
       dbo.SwimmerAge(GETDATE(), [DOB]) AS SwimmerAge,
       [IsActive],
       IsArchived,
       [Email],
       [GenderID],
       [MemberTypeID],
       CONCAT(Member.FirstName, ' ', UPPER(Member.LastName)) AS FName,
       gradeID,
       CreatedOn,
       ArchivedOn
FROM [dbo].[Member]
WHERE (IsActive >= CASE
                       WHEN @HideInActive = 1 THEN
                           1
                       ELSE
                           0
                   END
      )
      AND (IsArchived <= CASE
                             WHEN @HideArchived = 1 THEN
                                 0
                             ELSE
                                 1
                         END
          )
       
-- mitigates NULL booleans
      OR
      (
          IsArchived IS NULL
          AND @HideArchived = 0
      )
      OR
      (
          IsActive IS NULL
          AND @HideInActive = 0
      );



