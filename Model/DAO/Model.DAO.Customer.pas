unit Model.DAO.Customer;

interface

uses

Data.DB,
System.SysUtils,
Model.Connections.FireDac,
Model.Connections.Interfaces,
Model.Entities.Customer,
Model.DAO.Interfaces,
eNum;

type
TModelDAOCustomer = class(TInterfacedObject, iModelDaoEntity<TCustomer>)

  private
  oConnection : iModelComponentsConnections;

  FDataSet : TDatasource;
  oEntity : TCustomer;

  public

  constructor Create;
  destructor Destroy; override;

  function GetGen: iModelDaoEntity<TCustomer>;
  function Get(currentIndex: String): iModelDaoEntity<TCustomer>;
  function Select(currentIndex: String; editField: String): iModelDaoEntity<TCustomer>;
  function Insert: iModelDaoEntity<TCustomer>;
  function Update: iModelDaoEntity<TCustomer>;
  function Delete: iModelDaoEntity<TCustomer>;
  function DataSet(aValue :TDatasource):iModelDaoEntity<TCustomer>;
  function This: TCustomer;
  class function New :iModelDaoEntity<TCustomer>;

  end;
implementation

uses
  Vcl.Dialogs;


{ TModelDAOdescription }

constructor TModelDAOCustomer.Create;
begin
oConnection := TModelComponentsConnectionsFireDac.New;
oEntity := TCustomer.Create;

end;

function TModelDAOCustomer.DataSet(aValue: TDatasource): iModelDaoEntity<TCustomer>;
begin

Result := Self;
FDataset := aValue;
FDataset.DataSet := oConnection.DatasetQry; //erro estava aqui//

end;

function TModelDAOCustomer.Delete: iModelDaoEntity<TCustomer>;
begin
Result := Self;

 try

     oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('DELETE FROM customers WHERE customerID =  :customerID')
        .SQLParam('customerID', oEntity.CustomerID)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error when delete record:' + ex.message);
     end;
end;


destructor TModelDAOCustomer.Destroy;
begin
  inherited;

  oEntity.disposeOf;
end;

function TModelDAOCustomer.Get(currentIndex: String): iModelDaoEntity<TCustomer>;
begin
Result := Self;

    try

    oConnection

        .Active(false)
        .SQLClear
        .SQLAdd('SELECT * FROM customers ORDER BY customerID DESC')
        .SQLOpen;

      if currentIndex<>'' then
      oConnection.qryIndex(currentIndex);

      except on ex:Exception do
       raise Exception.Create('Error when opening list of records:' + ex.message);

     end;


end;

function TModelDAOCustomer.GetGen: iModelDaoEntity<TCustomer>;
begin

end;

function TModelDAOCustomer.Insert: iModelDaoEntity<TCustomer>;
begin
Result := Self;

try

    oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('INSERT INTO customers (Fname,LName,DBirth,Postcode,Address,Addressl2,DRegister) ' + //,Picture) '  +
                              ' VALUES (:FName,:LName,:DBirth,:Postcode,:Address,:Addressl2,:DRegister)') //,:Picture)')
        .SQLParam('FName', oEntity.FName)
        .SQLParam('LName', oEntity.LName)
        .SQLParam('DBirth', oEntity.DBirth)
        .SQLParam('Postcode', oEntity.Postcode)
        .SQLParam('Address', oEntity.Address)
        .SQLParam('Addressl2', oEntity.Addressl2)
        .SQLParam('DRegister', oEntity.DRegister)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error when entering records:' + ex.message);

     end;
end;


class function TModelDAOCustomer.New: iModelDaoEntity<TCustomer>;
begin
Result := Self.Create;

end;



function TModelDAOCustomer.Select(currentIndex: String; editField: String): iModelDaoEntity<TCustomer>;
begin

  oConnection.DatasetQry.Locate(currentIndex, editField, [loPartialkey]);

end;

function TModelDAOCustomer.This: TCustomer;
begin
result := oEntity;

end;

function TModelDAOCustomer.Update:iModelDaoEntity<TCustomer>;
begin
Result := Self;

 try

     oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('UPDATE customers SET FName= :FName, ' +
                                  'LName= :LName, ' +
                                  'DBirth= :DBirth, ' +
                                  'Postcode= :Postcode, ' +
                                  'Address= :Address, ' +
                                  'Addressl2= :Addressl2, ' +
                                  'DRegister= :Addressl2 ' +
               ' WHERE CustomerID = :customerID')

        .SQLParam('CustomerID', oEntity.CustomerID)
        .SQLParam('FName', oEntity.FName)
        .SQLParam('LName', oEntity.LName)
        .SQLParam('DBirth', oEntity.DBirth)
        .SQLParam('Postcode', oEntity.Postcode)
        .SQLParam('Address', oEntity.Address)
        .SQLParam('Addressl2', oEntity.Addressl2)
        .SQLParam('DRegister', oEntity.DRegister)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error when updating record:' + ex.message);

     end;

end;

end.
