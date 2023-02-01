unit Model.Entities.Category;



interface

uses
Datasnap.DBClient,
Data.DB,
System.SysUtils, System.Classes;


type
TCategory = class

  private
    F_category: string;
    F_categoryID: Integer;
    function getCategory: string;
    function getCategoryID: Integer;

  public
    constructor Create();
    destructor  Destroy; override;

    Property categoryID: Integer read  getCategoryID write F_categoryID;
    Property category:   string  read  getCategory   write F_category;

end;

implementation
{ TCategoria }

constructor TCategory.Create;
begin

end;

destructor TCategory.Destroy;
begin

  inherited;
end;

function TCategory.getCategory: string;
begin
  if trim(F_category) = '' then
    raise Exception.Create('Inform the description of the category');

  Result := F_category;
end;

function TCategory.getCategoryID: Integer;
begin
if F_categoryID <=0 then
    raise Exception.Create('Enter the category code');
  Result := F_categoryID;
end;

end.
