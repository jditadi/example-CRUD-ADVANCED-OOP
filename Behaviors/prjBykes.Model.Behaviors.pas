unit prjBykes.Model.Behaviors;

interface

uses
system.SysUtils,
vcl.Dialogs,
forms;

type
  TModelBehaviors = Class
  private
    procedure BehaviorException (Sender: TObject; E: Exception);
  public

    constructor Create;
    destructor Destroy; override;

  end;

var
 ModelBehaviors : TModelBehaviors;


implementation



{ TModelBehaviors }

procedure TModelBehaviors.BehaviorException(Sender: TObject; E: Exception);
begin
  messageDlg(E.Message, mtWarning, [mbOk], 0);
end;

constructor TModelBehaviors.Create;
begin
  reportMemoryLeaksOnShutDown := true;
  Application.OnException := BehaviorException;
end;

destructor TModelBehaviors.Destroy;
begin

  inherited;
end;

initialization
ModelBehaviors := TModelBehaviors.Create;

finalization;
ModelBehaviors.DisposeOf;


end.
