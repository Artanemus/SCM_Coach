USE [SCM_Coach]
GO
DELETE FROM
      [dbo].[grade]
GO
SET
      IDENTITY_INSERT [dbo].[grade] ON;

-- SUFFIXED EXTENSIONS TO DRILLS
-- (+ user custom - prefix with #)
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

GRADE OR 
PERFORMANCE LEVEL

eg. 
"A"  "Gold"  "Master Team"
"B" "Silver" "Pro Team"
"C" "Bronze" "StartUps"

sorted on Alpha
*/