USE [SCM_Coach]
go

-- Standard Alter Table SQL

ALTER TABLE dbo.Distance DROP CONSTRAINT DF__Distance__IsStan__30F848ED
go
ALTER TABLE dbo.Distance ADD CONSTRAINT DF__Distance__IsStan__30F848ED DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.Distance
ALTER COLUMN Meters float NULL
go
