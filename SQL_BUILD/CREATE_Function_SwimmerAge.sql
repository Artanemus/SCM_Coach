USE [SCM_Coach]
GO

/****** Object:  UserDefinedFunction [dbo].[SwimmerAge]    Script Date: 12/03/23 11:16:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ben Ambrpse
-- Create date: 
-- Description:	Swimmer's age at swim club night.
-- =============================================
CREATE   FUNCTION [dbo].[SwimmerAge] (
    -- Add the parameters for the function here
    @SessionStart DATETIME
    , @DOB DATETIME
    )
RETURNS INT
AS
BEGIN
    -- Declare the return variable here
    DECLARE @Result INT

    -- Add the T-SQL statements to compute the return value here
    SET @Result = FLOOR(DATEDIFF(day, @DOB, @SessionStart) / 365.0)

    -- Return the result of the function
    RETURN @Result
END
GO


