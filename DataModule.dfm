object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 190
  Width = 357
  object DBConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=products;Data Source=APOLLO-PS\SQLEXPRE' +
      'SS;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 48
  end
  object TableProduct: TADOTable
    Active = True
    AutoCalcFields = False
    Connection = DBConnection
    CursorType = ctStatic
    TableName = 'product'
    Left = 152
    Top = 48
  end
  object DSProduct: TDataSource
    DataSet = TableProduct
    Left = 240
    Top = 56
  end
  object sql: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 112
    Top = 136
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 128
    Data = {
      620000009619E0BD010000001800000004000000000003000000620009696470
      726F647563740400010000000000064E6E6F6D65720400010000000000046E61
      6D65020049000000010005574944544802000200FF0005707269636508000400
      000000000000}
    object ClientDataSet1Nnomer: TIntegerField
      FieldName = 'Nnomer'
    end
    object ClientDataSet1name: TStringField
      FieldName = 'name'
      Size = 255
    end
    object ClientDataSet1price: TFloatField
      FieldName = 'price'
    end
  end
  object DSload: TDataSource
    DataSet = ClientDataSet1
    Left = 200
    Top = 136
  end
end
