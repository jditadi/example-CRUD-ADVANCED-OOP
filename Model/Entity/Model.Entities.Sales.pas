unit Model.Entities.Sales;


interface

uses
Datasnap.DBClient,
Data.DB,
System.SysUtils, System.Classes;


type
TSale = class

  private
    F_SaleID: Integer;
    F_CustomerID: Integer;
    F_SaleDate: Tdatetime;
    F_TotalSale: Double;

    function getSaleID: Integer;
    function getCustomerID: Integer;
    function getSaleDate: TDatetime;
    function getTotalSale: Double;

  public
    constructor Create();
    destructor  Destroy; override;


    Property SaleID: Integer     read  getSaleID     write F_SaleID;
    Property CustomerID: Integer read  getCustomerID write F_CustomerID;
    Property SaleDate: TDatetime read  getSaleDate   write F_SaleDate;
    Property TotalSale: Double   read  getTotalSale  write F_TotalSale;

end;

implementation
{ TCategoria }

constructor TSale.Create;
begin

end;

destructor TSale.Destroy;
begin

  inherited;
end;


function TSale.getCustomerID: Integer;
begin
if F_CustomerID <=0 then
    raise Exception.Create('informe o cliente');
  Result := F_CustomerID;
end;

function TSale.getSaleDate: TDatetime;
begin
  Result := F_SaleDate;
end;

function TSale.getSaleID: Integer;
begin
if F_SaleID <=0 then
    raise Exception.Create('informe o codigo da categoria');
  Result := F_SaleID;
end;

function TSale.getTotalSale: Double;
begin
  Result := F_TotalSale;
end;

end.
