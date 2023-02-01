unit Model.Entities.Products;

interface

uses
Datasnap.DBClient,
Data.DB,
System.SysUtils, System.Classes;

type
TProducts = class

  private
    F_productID: Integer;
    F_description: String;
    F_categoryID: Integer;
    F_Price: Double;
    F_quant: Double;
    function getCategoryID: Integer;
    function getDescription: string;
    function getProductID: Integer;
    function getQuant: Double;
    function getPrice: Double;

  public
    constructor Create();
    destructor  Destroy; override;

    Property ProductID:   Integer read  getProductID   write F_productID;
    Property Description: string  read  getDescription write F_description;
    Property CategoryID:  Integer read  getCategoryID  write F_categoryID;
    Property Price:       Double  read  getPrice       write F_Price;
    Property Quant:       Double  read  getQuant       write F_quant;

end;

implementation
{ TCategoria }

constructor TProducts.Create;
begin

end;

destructor TProducts.Destroy;
begin

  inherited;
end;

function TProducts.getCategoryID: Integer;
begin
  Result := F_categoryID;
end;

function TProducts.getDescription: string;
begin
  if trim(F_description) = '' then
    raise Exception.Create('inform the description of the product');

  Result := F_description;
end;


function TProducts.getProductID: Integer;
begin
if F_productID <=0 then
    raise Exception.Create('inform the product ID:');
  Result := F_productID;
end;

function TProducts.getQuant: Double;
begin
  Result := F_quant;
end;


function TProducts.getPrice: Double;
begin
  Result := F_price;
end;

end.
