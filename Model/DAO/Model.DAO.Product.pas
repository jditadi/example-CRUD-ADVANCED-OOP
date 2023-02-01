unit Model.DAO.Product;

// Data Access Object -> DAO

interface

uses

Data.DB,
System.SysUtils,
Model.Connections.FireDac,
Model.Connections.Interfaces,
Model.Entities.Products,
Model.DAO.Interfaces,
eNum;


type
TModelDAOProducts = class(TInterfacedObject, iModelDaoEntity<TProducts>)

  private
  oConnection : iModelComponentsConnections;

  FDataSet : TDatasource;
  oEntity : TProducts;

  public

  constructor Create;
  destructor Destroy; override;

  function GetGen: iModelDaoEntity<TProducts>;
  function Get(currentIndex: String): iModelDaoEntity<TProducts>;
  function Select(currentIndex: String; editField: String): iModelDaoEntity<TProducts>;
  function Insert: iModelDaoEntity<TProducts>;
  function Update: iModelDaoEntity<TProducts>;
  function Delete: iModelDaoEntity<TProducts>;
  function DataSet(aValue :TDatasource):iModelDaoEntity<TProducts>;
  function This: TProducts;
  class function New :iModelDaoEntity<TProducts>;

  end;
implementation

uses
  Vcl.Dialogs;


{ TModelDAOdescription }

constructor TModelDAOProducts.Create;
begin
oConnection := TModelComponentsConnectionsFireDac.New;
oEntity := TProducts.Create;

end;

function TModelDAOProducts.DataSet(aValue: TDatasource): iModelDaoEntity<TProducts>;
begin

Result := Self;
FDataset := aValue;
FDataset.DataSet := oConnection.DatasetQry;

end;

function TModelDAOProducts.Delete: iModelDaoEntity<TProducts>;
begin
Result := Self;

 try

     oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('DELETE FROM products WHERE ProductID =  :ProductID')
        .SQLParam('ProductID', oEntity.ProductID)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error when delete record:' + ex.message);
     end;
end;


destructor TModelDAOProducts.Destroy;
begin
  inherited;

  oEntity.disposeOf;
end;

function TModelDAOProducts.Get(currentIndex: String): iModelDaoEntity<TProducts>;
begin
Result := Self;

    try

    oConnection

        .Active(false)
        .SQLClear
        .SQLAdd('SELECT * FROM Products ORDER BY ProductID DESC')
        .SQLOpen;

      if currentIndex<>'' then
      oConnection.qryIndex(currentIndex);

      except on ex:Exception do
       raise Exception.Create('Error when opening list of records:' + ex.message);

     end;


end;


function TModelDAOProducts.GetGen: iModelDaoEntity<TProducts>;
begin

end;

function TModelDAOProducts.Insert: iModelDaoEntity<TProducts>;
begin
Result := Self;

try

    oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('INSERT INTO Products (Description,CategoryID,Price,Quant) ' +
                'VALUES (:Description,:CategoryID,:Price,:Quant)')
        .SQLParam('Description', oEntity.Description)
        .SQLParam('CategoryID', oEntity.CategoryID)
        .SQLParam('Price', oEntity.Price)
        .SQLParam('Quant', oEntity.Quant)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error when entering records:' + ex.message);

     end;
end;


class function TModelDAOProducts.New: iModelDaoEntity<TProducts>;
begin
Result := Self.Create;

end;



function TModelDAOProducts.Select(currentIndex: String; editField: String): iModelDaoEntity<TProducts>;
begin

  oConnection.DatasetQry.Locate(currentIndex, editField, [loPartialkey]);

end;

function TModelDAOProducts.This: TProducts;
begin
result := oEntity;

end;

function TModelDAOProducts.Update:iModelDaoEntity<TProducts>;
begin
Result := Self;

 try

     oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('UPDATE Products SET description= :description, ' +
                                     'CategoryID= :CategoryID, ' +
                                     'Quant= :Quant, ' +
                                     'Price= :Price ' +
                          'WHERE ProductID = :ProductID')
        .SQLParam('ProductID', oEntity.ProductID)
        .SQLParam('description', oEntity.description)
        .SQLParam('Quant', oEntity.Quant)
        .SQLParam('Price', oEntity.Price)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error when updating record:' + ex.message);

     end;

end;



end.
