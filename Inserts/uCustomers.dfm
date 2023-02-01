inherited frmCustomers: TfrmCustomers
  Caption = 'Customers'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Img: TImage
    ExplicitLeft = -8
    ExplicitTop = 0
  end
  inherited Label3: TLabel
    Left = 21
    Width = 51
    Caption = 'First Name'
    ExplicitLeft = 21
    ExplicitWidth = 51
  end
  inherited Label2: TLabel
    Width = 60
    Caption = 'Customer ID'
    ExplicitWidth = 60
  end
  object Label1: TLabel [4]
    Left = 191
    Top = 51
    Width = 50
    Height = 13
    Caption = 'Last Name'
  end
  object Label4: TLabel [5]
    Left = 451
    Top = 51
    Width = 48
    Height = 13
    Caption = 'Date Birth'
  end
  object Label5: TLabel [6]
    Left = 20
    Top = 99
    Width = 46
    Height = 13
    Caption = 'PostCode'
  end
  object Label6: TLabel [7]
    Left = 92
    Top = 99
    Width = 39
    Height = 13
    Caption = 'Address'
  end
  object Label7: TLabel [8]
    Left = 319
    Top = 99
    Width = 67
    Height = 13
    Caption = 'Address line 2'
  end
  inherited grid: TDBGrid
    Top = 168
    Height = 119
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    Columns = <
      item
        Expanded = False
        FieldName = 'customerID'
        Title.Caption = 'ID'
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FName'
        Title.Caption = 'Name'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LName'
        Title.Caption = 'Last Name'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DBirth'
        Title.Caption = 'Date Birth'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Postcode'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Adress'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Adressl2'
        Title.Caption = 'Adress Line2'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DRegister'
        Title.Caption = 'Date Register'
        Width = 69
        Visible = True
      end>
  end
  inherited edtDescription: TEdit
    Width = 165
    MaxLength = 25
    ExplicitWidth = 165
  end
  object edtLName: TEdit [13]
    Tag = 2
    Left = 191
    Top = 70
    Width = 254
    Height = 21
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
    MaxLength = 25
    ParentFont = False
    TabOrder = 4
  end
  object edtDBirth: TMaskEdit [14]
    Left = 451
    Top = 70
    Width = 78
    Height = 21
    BevelInner = bvLowered
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/0000;1; '
    MaxLength = 10
    TabOrder = 5
    Text = '  /  /    '
  end
  object edtPostCode: TEdit [15]
    Tag = 2
    Left = 20
    Top = 118
    Width = 66
    Height = 21
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
  end
  object edtAddress: TEdit [16]
    Tag = 2
    Left = 92
    Top = 118
    Width = 221
    Height = 21
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
    TabOrder = 7
  end
  object edtAddressl2: TEdit [17]
    Tag = 2
    Left = 319
    Top = 118
    Width = 210
    Height = 21
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
    TabOrder = 8
  end
  inherited Panel1: TPanel
    Top = 291
    TabOrder = 9
    ExplicitTop = 291
    inherited Panel2: TPanel
      inherited Shape1: TShape
        ExplicitHeight = 44
      end
      inherited btnExit: TSpeedButton
        ExplicitHeight = 44
      end
    end
    inherited Panel3: TPanel
      inherited Shape2: TShape
        ExplicitHeight = 44
      end
      inherited btnSave: TSpeedButton
        ExplicitHeight = 44
      end
    end
    inherited Panel4: TPanel
      inherited Shape3: TShape
        ExplicitHeight = 44
      end
      inherited btnDelete: TSpeedButton
        ExplicitHeight = 44
      end
    end
    inherited Panel5: TPanel
      inherited Shape4: TShape
        ExplicitHeight = 44
      end
      inherited btnCancel: TSpeedButton
        ExplicitHeight = 44
      end
    end
    inherited Panel6: TPanel
      inherited Shape5: TShape
        ExplicitHeight = 44
      end
      inherited btnUpdate: TSpeedButton
        ExplicitTop = -1
        ExplicitWidth = 90
        ExplicitHeight = 44
      end
    end
    inherited Panel7: TPanel
      Padding.Left = 5
      inherited Shape6: TShape
        Left = 5
        Width = 85
        ExplicitLeft = 5
        ExplicitWidth = 85
        ExplicitHeight = 44
      end
      inherited btnNew: TSpeedButton
        Left = 5
        Width = 85
        ExplicitLeft = 5
        ExplicitWidth = 85
        ExplicitHeight = 44
      end
    end
  end
  object pnlPicture: TPanel [19]
    Left = 602
    Top = 36
    Width = 119
    Height = 124
    TabOrder = 10
    object imgPicture: TImage
      Left = 1
      Top = 1
      Width = 117
      Height = 122
      Align = alClient
      ExplicitTop = 2
    end
  end
end
