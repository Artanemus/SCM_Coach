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
