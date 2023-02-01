inherited frmRegCategory: TfrmRegCategory
  BorderStyle = bsSingle
  Caption = 'Category'
  ClientHeight = 377
  ClientWidth = 789
  ExplicitHeight = 406
  PixelsPerInch = 96
  TextHeight = 13
  inherited Img: TImage
    Width = 789
    Height = 377
    ExplicitWidth = 789
    ExplicitHeight = 377
  end
  inherited grid: TDBGrid
    Top = 97
    OnDblClick = gridDblClick
    OnTitleClick = gridTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'categoryID'
        Title.Caption = 'Category'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'description'
        Title.Caption = 'Description'
        Visible = True
      end>
  end
  inherited edtDescription: TEdit
    CharCase = ecNormal
  end
  inherited edtSearch: TEdit
    CharCase = ecNormal
    OnChange = edtSearchChange
  end
  inherited Panel1: TPanel
    inherited Panel4: TPanel
      inherited btnDelete: TSpeedButton
        ExplicitLeft = 1
        ExplicitTop = 5
        ExplicitWidth = 90
        ExplicitHeight = 39
      end
    end
    inherited Panel5: TPanel
      inherited btnCancel: TSpeedButton
        ExplicitLeft = 156
      end
    end
    inherited Panel6: TPanel
      inherited btnUpdate: TSpeedButton
        ExplicitTop = 5
        ExplicitWidth = 90
        ExplicitHeight = 49
      end
    end
    inherited Panel7: TPanel
      inherited btnNew: TSpeedButton
        ExplicitTop = 5
        ExplicitWidth = 90
        ExplicitHeight = 49
      end
    end
  end
end
