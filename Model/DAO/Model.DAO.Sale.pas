unit Model.DAO.Sale;

// Data Access Object -> DAO

interface

uses

Data.DB,
System.SysUtils,
Model.Connections.FireDac,
Model.Connections.Interfaces,
Model.Entities.Sales,
Model.DAO.Interfaces,
eNum;


type
TModelDAOSale = class(TInterfacedObject, iModelDaoEntity<TSale>)

  private
  oConnection : iModelComponentsConnections;

  FDataSet : TDatasource;
  oEntity : TSale;

  public

  constructor Create;
  destructor Destroy; override;

  function GetGen: iModelDaoEntity<TSale>;

  function Get(currentIndex: String): iModelDaoEntity<TSale>;
  function Select(currentIndex: String; editField: String): iModelDaoEntity<TSale>;
  function Insert: iModelDaoEntity<TSale>;
  function Update: iModelDaoEntity<TSale>;
  function Delete: iModelDaoEntity<TSale>;
  function DataSet(aValue :TDatasource):iModelDaoEntity<TSale>;
  function This: TSale;
  class function New :iModelDaoEntity<TSale>;

  end;
implementation

uses
  Vcl.Dialogs;


{ TModelDAOdescription }

constructor TModelDAOSale.Create;
begin
oConnection := TModelComponentsConnectionsFireDac.New;
oEntity := TSale.Create;

end;

function TModelDAOSale.DataSet(aValue: TDatasource): iModelDaoEntity<TSale>;
begin

Result := Self;
FDataset := aValue;
FDataset.DataSet := oConnection.DatasetQry;

end;

function TModelDAOSale.Delete: iModelDaoEntity<TSale>;
begin
Result := Self;

 try

     oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('DELETE FROM sales WHERE SaleID = :SaleID')
        .SQLParam('SaleID', oEntity.SaleID)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error when delete sale:' + ex.message);
     end;
end;


destructor TModelDAOSale.Destroy;
begin
  inherited;

  oEntity.disposeOf;
end;

function TModelDAOSale.Get(currentIndex: String): iModelDaoEntity<TSale>;
begin
Result := Self;

    try

    oConnection

        .Active(false)
        .SQLClear
        .SQLAdd('SELECT * FROM sales ORDER BY SaleID DESC')
        .SQLOpen;


      except on ex:Exception do
       raise Exception.Create('Error when opening list of records:' + ex.message);

     end;


end;

function TModelDAOSale.GetGen: iModelDaoEntity<TSale>;
begin

    try

    oConnection

      .Active(false)
      .SQLClear
      .SQLAdd('SELECT GEN_ID( gen_sales_id, 0) FROM RDB$DATABASE;')
      .SQLOpen;

          except on ex:Exception do
       raise Exception.Create('Error when searching for sales control number:' + ex.message);


     end;

end;

function TModelDAOSale.Insert: iModelDaoEntity<TSale>;
begin
Result := Self;

try

    oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('INSERT INTO sales (CustomerID,SaleDate,TotalSale) ' +
                ' VALUES (:CustomerID,:SaleDate,:TotalSale)')

        .SQLParam('CustomerID', oEntity.CustomerID)
        .SQLParam('SaleDate', oEntity.SaleDate)
        .SQLParam('TotalSale', oEntity.TotalSale)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error entering records:' + ex.message);

     end;
end;


class function TModelDAOSale.New: iModelDaoEntity<TSale>;
begin
Result := Self.Create;

end;



function TModelDAOSale.Select(currentIndex: String; editField: String): iModelDaoEntity<TSale>;
begin

  oConnection.DatasetQry.Locate(currentIndex, editField, [loPartialkey]);

end;

function TModelDAOSale.This: TSale;
begin
result := oEntity;

end;

function TModelDAOSale.Update:iModelDaoEntity<TSale>;
begin
Result := Self;

 try

     oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('UPDATE sales SET CustomerID= :CustomerID, ' +
                                      'SaleDate= :SaleDate, ' +
                                      'TotalSale= :TotalSale ' +

               ' WHERE SaleID = :SaleID')

        .SQLParam('SaleID', oEntity.SaleID)
        .SQLParam('CustomerID', oEntity.CustomerID)
        .SQLParam('SaleDate', oEntity.SaleDate)
        .SQLParam('TotalSale', oEntity.TotalSale)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error when updating record:' + ex.message);

     end;

end;



end.