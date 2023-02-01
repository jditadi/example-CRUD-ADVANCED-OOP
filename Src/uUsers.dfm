inherited frmUsers: TfrmUsers
  Caption = 'Users'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label3: TLabel
    Width = 27
    Caption = 'Name'
    ExplicitWidth = 27
  end
  inherited Label2: TLabel
    Width = 11
    Caption = 'ID'
    ExplicitWidth = 11
  end
  inherited grid: TDBGrid
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    OnDblClick = gridDblClick
    OnTitleClick = gridTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'userID'
        Title.Caption = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Width = 626
        Visible = True
      end>
  end
  inherited edtSearch: TEdit
    OnChange = edtSearchChange
  end
end
