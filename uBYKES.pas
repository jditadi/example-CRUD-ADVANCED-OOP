unit uBYKES;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmMainBike = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    btnUsers: TSpeedButton;
    btnOptions: TSpeedButton;
    btnConfig: TSpeedButton;
    pnlUsers: TPanel;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    pnlConfig: TPanel;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    ImgBackMain: TImage;
    pnlMenuInsert: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    btnCategory: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    pnlBack: TPanel;
    procedure btnOptionsMouseEnter(Sender: TObject);
    procedure btnUsersMouseEnter(Sender: TObject);
    procedure btnConfigMouseEnter(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
  private
    { Private declarations }
    procedure clearMenu(aMenu :TPanel; Flag: Boolean);
    procedure CreateForm(aForm :TForm; aPanel :TPanel);
  public
    { Public declarations }


  end;

var
  frmMainBike: TfrmMainBike;


implementation

{$R *.dfm}

uses uInheritance, uRegCategory, uUsers, uCustomers, uProducts, USales;

procedure TfrmMainBike.btnConfigMouseEnter(Sender: TObject);
begin
clearMenu(pnlConfig, true);

end;

procedure TfrmMainBike.btnOptionsMouseEnter(Sender: TObject);
begin
clearMenu(pnlMenuInsert, true);


end;

procedure TfrmMainBike.btnUsersMouseEnter(Sender: TObject);
begin
clearMenu(pnlUsers, true);

end;

procedure TfrmMainBike.clearMenu(aMenu: TPanel; Flag: Boolean);
var
aFlag : Boolean;
begin

  aFlag := Flag;
  if (Flag=false) then
    begin
    Flag  := true;
    pnlBack.visible := Flag;
    end;

  pnlMenuInsert.Visible := not Flag;
  pnlConfig.Visible     := not Flag;
  pnlUsers.Visible      := not Flag;

  aMenu.Visible := aFlag;

end;

procedure TfrmMainBike.CreateForm(aForm: TForm; aPanel: TPanel);
var
fForm : TForm;
begin

      fForm := aForm.Create(Self);

//    fForm.Parent := aPanel;
//    fForm.Align  := alClient;
//    fForm.BorderStyle := bsNone;

      fForm.show;

end;




procedure TfrmMainBike.SpeedButton14Click(Sender: TObject);
begin
try

  // clearMenu(pnlMenuInsert, false);
  //CreateForm(frmInheritance, pnlBack);

  frmSales := TfrmSales.Create(Self);
  frmSales.showModal;

  finally
  frmSales.DisposeOf;
  end;

end;

procedure TfrmMainBike.SpeedButton2Click(Sender: TObject);
begin
try
 // clearMenu(pnlMenuInsert, false);
  //CreateForm(frmInheritance, pnlBack);

  frmProducts := TfrmProducts.Create(Self);
  frmProducts.showModal;

  finally
  frmProducts.DisposeOf;
  end;

end;

procedure TfrmMainBike.SpeedButton7Click(Sender: TObject);
begin
try
 // clearMenu(pnlMenuInsert, false);
  //CreateForm(frmInheritance, pnlBack);

   frmRegCategory := TfrmRegCategory.Create(Self);
   frmRegCategory.showModal;

  finally
  frmRegCategory.DisposeOf;
  end;

end;

procedure TfrmMainBike.SpeedButton8Click(Sender: TObject);
begin
try
 // clearMenu(pnlMenuInsert, false);
  //CreateForm(frmInheritance, pnlBack);

  frmCustomers := TfrmCustomers.Create(Self);
  frmCustomers.showModal;

  finally
  frmCustomers.DisposeOf;
  end;

end;

procedure TfrmMainBike.SpeedButton9Click(Sender: TObject);
begin
try
 // clearMenu(pnlMenuInsert, false);
//  CreateForm(frmInheritance, pnlBack);

   frmUsers := TfrmUsers.Create(Self);
   frmUsers.showModal;

  finally
  frmUsers.DisposeOf;
  end;

end;

end.
