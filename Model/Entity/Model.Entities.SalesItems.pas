unit Model.Entities.SalesItems;


interface

uses
Datasnap.DBClient,
Data.DB,
System.SysUtils, System.Classes;


type
TSaleItem = class

  private
    F_SaleID: Integer;
    F_ProductID: Integer;
    F_Price: Double;
    F_Quant: Double;
    F_TotalItems: Double;
    F_ItemsToDel: String;

    function getPrice: Double;
    function getProductID: Integer;
    function getQuant: Double;
    function getSaleID: Integer;
    function getTotalItems: Double;
    function getItemsToDel: String;

  public
    constructor Create();
    destructor  Destroy; override;


    Property SaleID: Integer    read  getSaleID     write F_SaleID;
    Property ProductID: Integer read  getProductID  write F_ProductID;
    Property Price: Double      read  getPrice      write F_Price;
    Property Quant: Double      read  getQuant      write F_Quant;
    Property TotalItems: Double read  getTotalItems write F_TotalItems;
    Property ItemsToDel: String read  getItemsToDel write F_ItemsToDel;

end;

implementation
{ TCategoria }

constructor TSaleItem.Create;
begin

end;

destructor TSaleItem.Destroy;
begin

  inherited;
end;


function TSaleItem.getItemsToDel: String;
begin
  Result := F_ItemsToDel;
end;

function TSaleItem.getPrice: Double;
begin
  Result := F_Price;
end;

function TSaleItem.getProductID: Integer;
begin
  Result := F_ProductID;
end;

function TSaleItem.getQuant: Double;
begin
  Result := F_Quant;
end;

function TSaleItem.getSaleID: Integer;
begin
if F_SaleID <=0 then
    raise Exception.Create('Inform the sale code:');
  Result := F_SaleID;
end;


function TSaleItem.getTotalItems: Double;
begin
  Result := F_TotalItems;
end;

end.
