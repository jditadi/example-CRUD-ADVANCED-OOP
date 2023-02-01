unit Model.Entities.Users;

interface

uses
Datasnap.DBClient,
Data.DB,
System.SysUtils, System.Classes;

type
TUsers = class

  private
    F_userID: Integer;
    F_name: String;

    function getUserID: Integer;
    function getName: String;

  public
    constructor Create();
    destructor  Destroy; override;

    Property UserID: Integer read  getUserID write F_userID;
    Property Name:   string  read  getName   write F_name;

end;

implementation
{ TCategoria }

constructor TUsers.Create;
begin

end;

destructor TUsers.Destroy;
begin

  inherited;
end;

function TUsers.getName: string;
begin
  if trim(F_name) = '' then
    raise Exception.Create('Enter the users name');

  Result := F_name;
end;

function TUsers.getUserID: Integer;
begin
if F_userID <=0 then
    raise Exception.Create('Enter the user ID');
  Result := F_userID;
end;

end.
