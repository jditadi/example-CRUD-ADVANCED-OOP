inherited frmProducts: TfrmProducts
  Caption = 'frmProducts'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Img: TImage
    ExplicitHeight = 364
  end
  inherited Label3: TLabel
    Width = 37
    Caption = 'Product'
    ExplicitWidth = 37
  end
  inherited Label2: TLabel
    Width = 65
    Caption = 'Product Code'
    ExplicitWidth = 65
  end
  object Label4: TLabel [4]
    Left = 360
    Top = 51
    Width = 45
    Height = 13
    Caption = 'Category'
  end
  object Label1: TLabel [5]
    Left = 564
    Top = 51
    Width = 26
    Height = 13
    Caption = 'Value'
  end
  object Label5: TLabel [6]
    Left = 679
    Top = 51
    Width = 42
    Height = 13
    Caption = 'Quantity'
  end
  inherited grid: TDBGrid
    Top = 107
    Height = 159
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    OnDblClick = gridDblClick
  end
  inherited edtDescription: TEdit
    Width = 334
    ExplicitWidth = 334
  end
  object lkpCategoria: TDBLookupComboBox [12]
    Left = 360
    Top = 70
    Width = 198
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BevelKind = bkFlat
    KeyField = 'categoryId'
    ListField = 'description'
    ListSource = DSCategory
    TabOrder = 5
  end
  object edtPrice: TEdit [13]
    Tag = 2
    Left = 564
    Top = 70
    Width = 109
    Height = 21
    Alignment = taRightJustify
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 6
    Text = '0.00'
    OnKeyPress = edtPriceKeyPress
  end
  object edtQuant: TEdit [14]
    Tag = 2
    Left = 679
    Top = 70
    Width = 77
    Height = 21
    Alignment = taRightJustify
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 7
    Text = '0.000'
    OnKeyPress = edtPriceKeyPress
  end
  inherited DataSource: TDataSource
    Left = 728
    Top = 8
  end
  object DSCategory: TDataSource
    Left = 728
    Top = 88
  end
end
