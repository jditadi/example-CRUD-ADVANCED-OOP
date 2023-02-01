unit Model.DAO.CdsItems;

interface

uses
 Datasnap.DBClient,
 Model.Connections.FireDac,
 Model.Entities.SalesItems,
 Model.DAO.SaleItem,
 Model.DAO.Interfaces,
 Model.Connections.Interfaces;


type
TCdsItem = class

  private
  FCds : TClientDataset;
  oConnection : iModelComponentsConnections;

  public
  constructor Create;
  destructor Destroy; override;

  procedure ReturnStock(pProductID: Integer; pQuant: Double);
  procedure UpdateStock(pProductID: Integer; pQuant: Double);

  procedure Add(pValue: TClientDataset; pProductID: Integer; pDescription: String; pPrice :Double; pQuant: Double; pTotalItems: Double);
  procedure Remove(pValue: TClientDataset; pProductID: Integer);

  function  Totalize(pValue: TClientDataset): Double;
  procedure Clean(pValue: TClientDataset);
  function  inNot(pValue: TClientDataset):String;

  function  qryExistItem(pSaleID:Integer; pProductID:Integer):Boolean;
  Procedure qryReturnAllItems(pSaleID: Integer; pItemsToDel: String);

end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, System.Variants;

{ TCdsItem }

procedure TCdsItem.Add(pValue: TClientDataset; pProductID: Integer; pDescription: String; pPrice :Double; pQuant: Double; pTotalItems :Double);
begin

      FCds := pValue;
      FCds.Append;
      FCds.FieldByName('productID').asInteger  := pProductID;
      FCds.FieldByName('Description').asString := pDescription;
      FCds.FieldByName('Price').asFloat        := pPrice;
      FCds.FieldByName('Quant').asFloat        := pQuant;
      FCds.FieldByName('TotalItems').asFloat   := pTotalItems;
      FCds.Post;

end;

procedure TCdsItem.Clean(pValue: TClientDataset);
begin
      FCds := pValue;
      FCds.Active;
      FCds.First;
      while not FCds.eof do
      begin
       FCds.Delete;
      end;

end;

constructor TCdsItem.Create;
begin
oConnection := TModelComponentsConnectionsFireDac.New;

end;

destructor TCdsItem.Destroy;
begin

  inherited;
end;

function TCdsItem.inNot(pValue: TClientDataset): String;
var
vInNot:String;

begin
    FCds := pValue;
    vInNot := emptyStr;
    FCds.First;
    while not FCds.eof do
    begin
      if vInNot=emptyStr then
        vInNot := FCds.FieldByName('productID').asString
      else
        vInNot := vInNot + ',' + FCds.FieldByName('productID').asString;

      FCds.Next;
    end;

    Result := vInNot;

end;

procedure TCdsItem.Remove(pValue: TClientDataset; pProductID: Integer);
begin

  FCds :=pValue;
  if FCds.Locate('productID', pProductID, []) then
   FCds.Delete;

end;


function TCdsItem.Totalize(pValue: TClientDataset): Double;
var
vTotal:Double;

begin
    try
    Result := 0;
    vTotal := 0;
    FCds := pValue;
    FCds.Active;
    FCds.First;
      While not FCds.Eof do
      begin
        vTotal := vTotal + FCds.FieldByName('TotalItems').Value;
        FCds.next;
      end;


    finally
    Result := vTotal;
    end;
end;


function TCdsItem.qryExistItem(pSaleID, pProductID: Integer): Boolean;
begin

   try
       Result := False;

       oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('SELECT * from items WHERE saleID = :saleID AND productID = :productID')
        .SQLParam('SaleID', pSaleID)
        .SQLParam('productID', pProductID)
        .SQLOpen;

        if oConnection.DatasetQry.RecordCount >0  then
          Result := True;

      except on ex:Exception do
       raise Exception.Create('Error when finding records:' + ex.message);

   end;

end;


Procedure TCdsItem.qryReturnAllItems(pSaleID: Integer; pItemsToDel: String);
var
vProductID :Integer;
vquant     :Double;
vItemsToDel:Boolean;


begin
   try

     vItemsToDel := True;
     while vItemsToDel do
     begin

       oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('SELECT * FROM items WHERE saleID = :SaleID AND productID NOT IN (:ItemsToDel)')
        .SQLParam('ItemsToDel', pItemsToDel)
        .SQLParam('SaleID', pSaleID)
        .SQLOpen;


        if oConnection.DatasetQry.RecordCount >0 then
          begin
          vProductID := oConnection.DatasetQry.FieldByName('productID').asInteger;
          vquant     := oConnection.DatasetQry.FieldByName('Quant').asFloat;

          ReturnStock(vProductID, vquant);

       oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('DELETE FROM items WHERE saleID = :SaleID AND productID = :ProductID')
        .SQLParam('ProductID', vProductID)
        .SQLParam('SaleID', pSaleID)
        .ExecSQL;

          end
          else vItemsToDel := False;

     end;


      except on ex:Exception do
       raise Exception.Create('Error on process:' + ex.message);


   end;


end;

procedure TCdsItem.UpdateStock(pProductID: Integer; pQuant: Double);
begin

 try

     oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('UPDATE Products SET Quant=Quant - :Quant WHERE ProductID = :ProductID')
        .SQLParam('Quant', pQuant)
        .SQLParam('ProductID', pProductID)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error updating record:' + ex.message);

     end;


end;

procedure TCdsItem.ReturnStock(pProductID: Integer;pQuant: Double);
begin

 try

     oConnection
        .Active(false)
        .SQLClear
        .SQLAdd('UPDATE Products SET Quant=Quant + :Quant WHERE ProductID = :ProductID')
        .SQLParam('Quant', pQuant)
        .SQLParam('ProductID', pProductID)
        .ExecSQL;

      except on ex:Exception do
       raise Exception.Create('Error updating record:' + ex.message);

     end;


end;

end.
