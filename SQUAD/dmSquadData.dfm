object SquadData: TSquadData
  Height = 480
  Width = 640
  object qrySelectPool: TFDQuery
    ActiveStoredUsage = [auDesignTime]
    Connection = COACH.coachConnection
    Left = 104
    Top = 48
  end
  object dsSelectPool: TDataSource
    DataSet = qrySelectPool
    Left = 200
    Top = 48
  end
end
