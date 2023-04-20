USE [SCM_Coach]
go

-- Standard Alter Table SQL

ALTER TABLE dbo.stroke DROP CONSTRAINT DF__stroke__IsArchiv__71D1E811
go
ALTER TABLE dbo.stroke DROP CONSTRAINT DF__stroke__IsVisibl__72C60C4A
go
ALTER TABLE dbo.stroke ADD CONSTRAINT DF__stroke__IsArchiv__71D1E811 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.stroke ADD CONSTRAINT DF__stroke__IsVisibl__72C60C4A DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.task DROP CONSTRAINT FK__task__TreeNodeID__41EDCAC5
go
ALTER TABLE dbo.TreeRoot DROP CONSTRAINT RefWorkOut130
go
ALTER TABLE dbo.ContactNum DROP CONSTRAINT DF__ContactNu__IsArc__267ABA7A
go
ALTER TABLE dbo.ContactNum ADD CONSTRAINT DF__ContactNu__IsArc__267ABA7A DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.Distance DROP CONSTRAINT DF__Distance__IsArch__31EC6D26
go
ALTER TABLE dbo.Distance DROP CONSTRAINT DF__Distance__IsStan__32E0915F
go
ALTER TABLE dbo.Distance DROP CONSTRAINT DF__Distance__IsVisi__33D4B598
go
ALTER TABLE dbo.Distance ADD CONSTRAINT DF__Distance__IsArch__31EC6D26 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.Distance ADD CONSTRAINT DF__Distance__IsStan__32E0915F DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.Distance ADD CONSTRAINT DF__Distance__IsVisi__33D4B598 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.drill DROP CONSTRAINT DF__drill__IsArchive__36B12243
go
ALTER TABLE dbo.drill DROP CONSTRAINT DF__drill__IsStandar__37A5467C
go
ALTER TABLE dbo.drill DROP CONSTRAINT DF__drill__IsVisible__38996AB5
go
ALTER TABLE dbo.drill ADD CONSTRAINT DF__drill__IsArchive__36B12243 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.drill ADD CONSTRAINT DF__drill__IsStandar__37A5467C DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.drill ADD CONSTRAINT DF__drill__IsVisible__38996AB5 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.drillEx DROP CONSTRAINT DF__drillEx__IsArchi__3B75D760
go
ALTER TABLE dbo.drillEx DROP CONSTRAINT DF__drillEx__IsStand__3C69FB99
go
ALTER TABLE dbo.drillEx DROP CONSTRAINT DF__drillEx__IsVisib__3D5E1FD2
go
ALTER TABLE dbo.drillEx ADD CONSTRAINT DF__drillEx__IsArchi__3B75D760 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.drillEx ADD CONSTRAINT DF__drillEx__IsStand__3C69FB99 DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.drillEx ADD CONSTRAINT DF__drillEx__IsVisib__3D5E1FD2 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.equipment DROP CONSTRAINT DF__equipment__IsArc__4222D4EF
go
ALTER TABLE dbo.equipment DROP CONSTRAINT DF__equipment__IsSta__4316F928
go
ALTER TABLE dbo.equipment DROP CONSTRAINT DF__equipment__IsVis__440B1D61
go
ALTER TABLE dbo.equipment ADD CONSTRAINT DF__equipment__IsArc__4222D4EF DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.equipment ADD CONSTRAINT DF__equipment__IsSta__4316F928 DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.equipment ADD CONSTRAINT DF__equipment__IsVis__440B1D61 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.grade DROP CONSTRAINT DF__grade__IsArchive__4AB81AF0
go
ALTER TABLE dbo.grade DROP CONSTRAINT DF__grade__IsStandar__4BAC3F29
go
ALTER TABLE dbo.grade DROP CONSTRAINT DF__grade__IsVisible__4CA06362
go
ALTER TABLE dbo.grade ADD CONSTRAINT DF__grade__IsArchive__4AB81AF0 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.grade ADD CONSTRAINT DF__grade__IsStandar__4BAC3F29 DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.grade ADD CONSTRAINT DF__grade__IsVisible__4CA06362 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.intensity DROP CONSTRAINT DF__intensity__IsArc__571DF1D5
go
ALTER TABLE dbo.intensity DROP CONSTRAINT DF__intensity__IsSta__5812160E
go
ALTER TABLE dbo.intensity DROP CONSTRAINT DF__intensity__IsVis__59063A47
go
ALTER TABLE dbo.intensity ADD CONSTRAINT DF__intensity__IsArc__571DF1D5 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.intensity ADD CONSTRAINT DF__intensity__IsSta__5812160E DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.intensity ADD CONSTRAINT DF__intensity__IsVis__59063A47 DEFAULT (1) FOR IsVisible
go
ALTER TABLE dbo.miscTerm DROP CONSTRAINT DF__miscTerm__IsArch__5DCAEF64
go
ALTER TABLE dbo.miscTerm DROP CONSTRAINT DF__miscTerm__IsStan__5EBF139D
go
ALTER TABLE dbo.miscTerm DROP CONSTRAINT DF__miscTerm__IsVisi__5FB337D6
go
ALTER TABLE dbo.miscTerm ADD CONSTRAINT DF__miscTerm__IsArch__5DCAEF64 DEFAULT (0) FOR IsArchived
go
ALTER TABLE dbo.miscTerm ADD CONSTRAINT DF__miscTerm__IsStan__5EBF139D DEFAULT (0) FOR IsStandard
go
ALTER TABLE dbo.miscTerm ADD CONSTRAINT DF__miscTerm__IsVisi__5FB337D6 DEFAULT (1) FOR IsVisible
go
EXEC sp_rename 'dbo.RaceHistorySplit.RaceTime', 'SplitTime','COLUMN'
go
ALTER TABLE dbo.task ADD FOREIGN KEY (TreeNodeID)
REFERENCES dbo.TreeNode (TreeNodeID)
go
ALTER TABLE dbo.TreeNode ADD FOREIGN KEY (TreeRootID)
REFERENCES dbo.TreeRoot (TreeRootID)
go
ALTER TABLE dbo.TreeNode ADD FOREIGN KEY (NodeTypeID)
REFERENCES dbo.NodeType (NodeTypeID)
go
ALTER TABLE dbo.TreeNode ADD FOREIGN KEY (Child)
REFERENCES dbo.TreeNode (TreeNodeID)
go
ALTER TABLE dbo.TreeRoot ADD FOREIGN KEY (WorkOutID)
REFERENCES dbo.WorkOut (WorkOutID)
go
ALTER TABLE dbo.RaceHistory ADD FOREIGN KEY (RaceHistoryTypeID)
REFERENCES dbo.RaceHistoryType (RaceHistoryTypeID)
go
ALTER TABLE dbo.RaceHistory ADD FOREIGN KEY (PoolTypeID)
REFERENCES dbo.PoolType (PoolTypeID)
go
ALTER TABLE dbo.RaceHistory ADD FOREIGN KEY (DisqualifiedID)
REFERENCES dbo.Disqualified (DisqualifiedID)
go
