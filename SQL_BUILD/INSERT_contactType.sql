USE SCM_Coach
GO


DELETE FROM [dbo].[ContactNumType]	
GO

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
