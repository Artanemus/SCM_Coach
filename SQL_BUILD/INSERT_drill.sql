USE [SCM_Coach]
GO
DELETE FROM
      [dbo].[drill]
GO
SET
      IDENTITY_INSERT [dbo].[drill] ON;

-- SUFFIXED EXTENSIONS TO DRILLS
-- (+ user custom - prefix with #)
INSERT INTO
      [dbo].[drill]
      (
      drillID,
      [Caption],
      [ShortCaption],
      [ABREV]
      )
VALUES
      (1, 'KICK', 'Kick', 'KICK'),
      (2, 'PULL', 'Pull', 'PULL'),
      (3, 'SWIM', 'Swim', 'SWIM')
GO

SET
      IDENTITY_INSERT [dbo].[drill] OFF;