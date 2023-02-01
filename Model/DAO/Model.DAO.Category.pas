unit Model.DAO.Category;

// Data Access Object -> DAO

interface

uses

Data.DB,
System.SysUtils,
Model.Connections.FireDac,
Model.Connections.Interfaces,
Model.Entities.Category,
Model.DAO.Interfaces,
eNum;


type
TModelDAOCategory = class(TInterfacedObject, iModelDaoEntity<TCategory>)

  private
  oConnection : iModelComponentsConnections;

  FDataSet : TDatasource;
  oEntity : TCategory;

  public

  constructor Create;
  destructor Destroy; override;

  function GetGen: iModelDaoEntity<TCategory>;
  function Get(currentIndex: String): iModelDaoEntity<TCategory>;
  function Select(currentIndex: String; editField: String): iModelDaoEntity<TCategory>;
  function Insert: iModelDaoEntity<TCategory>;
  function Update: iModelDaoEntity<TCategory>;
  function Delete: iModelDaoEntity<TCategory>;
  function DataSet(aValue :TDatasource):iModelDaoEntity<TCategory>;
  function This: TCategory;
  class function New :iModelDaoEntity<TCategory>;

  end;
implementation

uses
  Vcl.Dialogs;


{ TModelDAOdescription }

constructor TModelDAOCategory.Create;
begin
oConnection := TModelComponentsConnectionsFireDac.New;
oEntity := TCategory.Create;

end;

function TModelDAOCategory.DataSet(aValue: TDatasource): iModelDaoEntity<TCategory>;
begin

Result := Self;
FDataset := aValue;
FDataset.DataSet := oConnection.DatasetQry; //erro estava aqui//

end;

function TModelDAOCategory.Delete: iModelDaoEntity<TCategory>;
begin
Result := Self;

 try

     oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('DELETE FROM categories WHERE categoryID =  :categoryID')
        .SQLParam('categoryID', oEntity.CategoryID)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error when delete record:' + ex.message);
     end;
end;


destructor TModelDAOCategory.Destroy;
begin
  inherited;

  oEntity.disposeOf;
end;

function TModelDAOCategory.Get(currentIndex: String): iModelDaoEntity<TCategory>;
begin
Result := Self;

    try

    oConnection

        .Active(false)
        .SQLClear
        .SQLAdd('SELECT * FROM categories ORDER BY categoryID DESC')
        .SQLOpen;

      if currentIndex<>'' then
      oConnection.qryIndex(currentIndex);

      except on ex:Exception do
       raise Exception.Create('Error when opening list of records:' + ex.message);

     end;


end;

function TModelDAOCategory.GetGen: iModelDaoEntity<TCategory>;
begin

end;

function TModelDAOCategory.Insert: iModelDaoEntity<TCategory>;
begin
Result := Self;

try

    oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('INSERT INTO categories (Description) VALUES (:Description)')
        .SQLParam('Description', oEntity.Category)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error when entering records:' + ex.message);

     end;
end;


class function TModelDAOCategory.New: iModelDaoEntity<TCategory>;
begin
Result := Self.Create;

end;



function TModelDAOCategory.Select(currentIndex: String; editField: String): iModelDaoEntity<TCategory>;
begin

  oConnection.DatasetQry.Locate(currentIndex, editField, [loPartialkey]);

end;

function TModelDAOCategory.This: TCategory;
begin
result := oEntity;

end;

function TModelDAOCategory.Update:iModelDaoEntity<TCategory>;
begin
Result := Self;

 try

     oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('UPDATE categories SET description= :description WHERE categoryID = :categoryID')
        .SQLParam('categoryID', oEntity.CategoryID)
        .SQLParam('description', oEntity.Category)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error updating record:' + ex.message);

     end;

end;

end.