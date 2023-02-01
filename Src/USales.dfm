inherited frmSales: TfrmSales
  Caption = 'frmSales'
  ClientHeight = 424
  ClientWidth = 778
  OnClose = FormClose
  ExplicitWidth = 794
  ExplicitHeight = 463
  PixelsPerInch = 96
  TextHeight = 13
  inherited Img: TImage
    Width = 778
    Height = 424
    ExplicitLeft = 20
    ExplicitTop = 0
    ExplicitWidth = 778
    ExplicitHeight = 424
  end
  inherited Label3: TLabel
    Top = 55
    Width = 46
    Caption = 'Customer'
    ExplicitTop = 55
    ExplicitWidth = 46
  end
  inherited Label2: TLabel
    Top = 12
    ExplicitTop = 12
  end
  object Label4: TLabel [4]
    Left = 375
    Top = 12
    Width = 46
    Height = 13
    Caption = 'Sale Date'
  end
  object Label1: TLabel [5]
    Left = 431
    Top = 58
    Width = 22
    Height = 13
    Caption = 'Item'
  end
  object Label5: TLabel [6]
    Left = 503
    Top = 58
    Width = 34
    Height = 13
    Caption = 'Quant.'
  end
  object Label6: TLabel [7]
    Left = 595
    Top = 58
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object Label7: TLabel [8]
    Left = 628
    Top = 326
    Width = 47
    Height = 13
    Caption = 'Total Sale'
  end
  inherited grid: TDBGrid
    Left = 22
    Top = 101
    Height = 107
    Hint = 'Sales'
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
    ParentShowHint = False
    ShowHint = True
    OnTitleClick = gridTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'saleID'
        Title.Caption = 'Sale No.'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'customerID'
        Title.Caption = 'Customer'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FNAme'
        Title.Caption = 'Name'
        Width = 468
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'saleDate'
        Title.Caption = 'Sale Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'totalSale'
        Title.Caption = 'Total Sale'
        Visible = True
      end>
  end
  inherited edtDescription: TEdit
    Top = 74
    Width = 59
    ExplicitTop = 74
    ExplicitWidth = 59
  end
  inherited edtID: TEdit
    Top = 31
    ExplicitTop = 31
  end
  inherited Panel1: TPanel
    Top = 349
    ExplicitTop = 349
    inherited Panel3: TPanel
      inherited btnSave: TSpeedButton
        ExplicitLeft = 1
        ExplicitTop = 5
        ExplicitWidth = 90
        ExplicitHeight = 39
      end
    end
    inherited Panel5: TPanel
      inherited btnCancel: TSpeedButton
        ExplicitLeft = 1
        ExplicitTop = 5
        ExplicitWidth = 90
        ExplicitHeight = 39
      end
    end
    inherited Panel6: TPanel
      inherited btnUpdate: TSpeedButton
        ExplicitTop = 5
        ExplicitWidth = 90
        ExplicitHeight = 39
      end
    end
  end
  object gridItems: TDBGrid [14]
    Left = 20
    Top = 214
    Width = 736
    Height = 106
    Hint = 'Items'
    Color = clBtnFace
    DataSource = DSCdsItems
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object lkpCustomer: TDBLookupComboBox [15]
    Left = 85
    Top = 31
    Width = 284
    Height = 21
    BevelEdges = []
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BevelKind = bkFlat
    Ctl3D = True
    KeyField = 'CustomerID'
    ListField = 'FName'
    ListSource = DSCustomer
    ParentCtl3D = False
    TabOrder = 6
    OnKeyDown = lkpCustomerKeyDown
  end
  object edtSaleDate: TMaskEdit [16]
    Left = 375
    Top = 31
    Width = 78
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/0000;1; '
    MaxLength = 10
    TabOrder = 7
    Text = '  /  /    '
    OnKeyDown = lkpCustomerKeyDown
  end
  object lkpProduct: TDBLookupComboBox [17]
    Left = 20
    Top = 74
    Width = 349
    Height = 21
    BevelEdges = []
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BevelKind = bkFlat
    KeyField = 'productID'
    ListField = 'description'
    ListSource = DSProducts
    TabOrder = 8
    OnExit = lkpProductExit
    OnKeyDown = lkpCustomerKeyDown
  end
  object edtItem: TEdit [18]
    Tag = 2
    Left = 375
    Top = 74
    Width = 78
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
    MaxLength = 40
    ParentFont = False
    TabOrder = 9
    Text = '0.00'
    OnKeyDown = lkpCustomerKeyDown
  end
  object edtQuant: TEdit [19]
    Tag = 2
    Left = 459
    Top = 74
    Width = 78
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
    MaxLength = 40
    ParentFont = False
    TabOrder = 10
    Text = '0.00'
    OnExit = edtQuantExit
    OnKeyDown = lkpCustomerKeyDown
  end
  object edtTotalItem: TEdit [20]
    Tag = 2
    Left = 543
    Top = 74
    Width = 78
    Height = 21
    Alignment = taRightJustify
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clSilver
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 40
    ParentFont = False
    TabOrder = 11
    Text = '0.00'
  end
  object Panel8: TPanel [21]
    AlignWithMargins = True
    Left = 625
    Top = 64
    Width = 65
    Height = 37
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 5
    Margins.Bottom = 0
    BevelOuter = bvNone
    Padding.Top = 5
    Padding.Bottom = 5
    TabOrder = 12
    object Shape7: TShape
      Left = 0
      Top = 5
      Width = 65
      Height = 27
      Align = alClient
      Brush.Color = clGray
      Pen.Style = psClear
      Shape = stRoundRect
      ExplicitLeft = 3
      ExplicitTop = 6
      ExplicitWidth = 90
      ExplicitHeight = 39
    end
    object btnAddItem: TSpeedButton
      Left = 0
      Top = 5
      Width = 65
      Height = 27
      Align = alClient
      Caption = 'Add'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnAddItemClick
      ExplicitTop = -5
    end
  end
  object Panel9: TPanel [22]
    AlignWithMargins = True
    Left = 693
    Top = 64
    Width = 65
    Height = 37
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 5
    Margins.Bottom = 0
    BevelOuter = bvNone
    Padding.Top = 5
    Padding.Bottom = 5
    TabOrder = 13
    object Shape8: TShape
      Left = 0
      Top = 5
      Width = 65
      Height = 27
      Align = alClient
      Brush.Color = clGray
      Pen.Style = psClear
      Shape = stRoundRect
      ExplicitLeft = 3
      ExplicitTop = 6
      ExplicitWidth = 90
      ExplicitHeight = 39
    end
    object btnRemoveItem: TSpeedButton
      Left = 0
      Top = 5
      Width = 65
      Height = 27
      Align = alClient
      Caption = 'Remove'
      Enabled = False
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnRemoveItemClick
      ExplicitTop = 4
    end
  end
  object edtTotalSale: TEdit [23]
    Tag = 2
    Left = 678
    Top = 323
    Width = 78
    Height = 21
    Alignment = taRightJustify
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clSilver
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 40
    ParentFont = False
    TabOrder = 14
    Text = '0.00'
  end
  object DBEdit: TDBEdit [24]
    Left = 20
    Top = 323
    Width = 46
    Height = 21
    TabOrder = 15
    Visible = False
    OnChange = DBEditChange
  end
  inherited DataSource: TDataSource
    Left = 736
    Top = 48
  end
  object DSCustomer: TDataSource
    Left = 736
    Top = 104
  end
  object cdsItems: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 736
    Top = 280
    object cdsItemsProductID: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ProductID'
    end
    object cdsItemsDescription: TStringField
      FieldName = 'Description'
      Size = 40
    end
    object cdsItemsPrice: TFloatField
      FieldName = 'Price'
      DisplayFormat = '#0.00'
      currency = True
    end
    object cdsItemsquant: TFloatField
      DisplayLabel = 'Quant.'
      FieldName = 'quant'
    end
    object cdsItemsTotalItems: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TotalItems'
      DisplayFormat = '#0.00'
      currency = True
    end
    object cdsItemsTotalSale: TAggregateField
      FieldName = 'TotalSale'
      DisplayName = ''
      DisplayFormat = '#0.00'
      Expression = 'sum(TotalItems)'
    end
  end
  object DSProducts: TDataSource
    Left = 736
    Top = 232
  end
  object DSSaleItems: TDataSource
    Left = 732
    Top = 349
  end
  object DSCdsItems: TDataSource
    DataSet = cdsItems
    Left = 740
    Top = 165
  end
end
