unit uCustomers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls,
  uInheritance,
  eNum,
  Model.Connections.FireDac,
  Model.DAO.Customer,
  Model.Entities.Customer,
  Model.DAO.Interfaces;

type
  TfrmCustomers = class(TfrmInheritance)
    edtLName: TEdit;
    Label1: TLabel;
    edtDBirth: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtPostCode: TEdit;
    edtAddress: TEdit;
    Label6: TLabel;
    edtAddressl2: TEdit;
    Label7: TLabel;
    pnlPicture: TPanel;
    imgPicture: TImage;
    procedure btnNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
    { Private declarations }
    oDAO : iModelDaoEntity<TCustomer>;


  public
    { Public declarations }
    currentIndex : string;
    function Save(estateRegister:TEstateRegister):Boolean; override;
    function Delete:Boolean; override;

  end;

var
  frmCustomers: TfrmCustomers;

implementation

{$R *.dfm}

procedure TfrmCustomers.btnNewClick(Sender: TObject);
begin
  inherited;
  oDAO.Get(currentIndex);
  edtID.Text := IntToStr(DataSource.DataSet.FieldByName('customerID').AsInteger+1);
  edtDescription.SetFocus;

end;

procedure TfrmCustomers.btnUpdateClick(Sender: TObject);
begin
  inherited;

  edtID.Text          := intToStr(DataSource.Dataset.FieldByName('customerID').asInteger);
  edtDescription.Text := DataSource.Dataset.FieldByName('FName').asString;
  edtLName.Text       := DataSource.Dataset.FieldByName('LName').asString;
  edtDBirth.Text      := DateToStr(datasource.Dataset.FieldByName('DBirth').asDatetime);
  edtPostcode.Text    := datasource.Dataset.FieldByName('postcode').asString;
  edtAddress.Text     := DataSource.Dataset.FieldByName('Address').asString;
  edtAddressl2.Text   := DataSource.Dataset.FieldByName('Address').asString;

  edtDescription.setFocus;

end;

function TfrmCustomers.Delete: Boolean;
begin

  if messageDlg('Delete Record?', mtConfirmation, [mbYes,mbNo], 0, mbNo) = mrYes then
  begin

  oDAO.This.customerID := DataSource.Dataset.FieldByName('customerID').asInteger;

  oDAO
  .Delete
  .Get(currentIndex);

  end;

end;

procedure TfrmCustomers.FormCreate(Sender: TObject);
begin
  inherited;

  oDao := TModelDAOCustomer.New.Dataset(DataSource);
  oDAO.Get(currentIndex);

end;

function TfrmCustomers.Save(estateRegister: TEstateRegister): Boolean;
begin

  oDAO.This.CustomerID:= strtoInt(edtID.Text);
  oDAO.This.FName     := edtDescription.Text;
  oDAO.This.LName     := edtLName.Text;
  oDAO.This.DBirth    := strToDate(edtDBirth.Text);
  oDAO.This.Postcode  := edtPostcode.Text;
  oDAO.This.Address   := edtAddress.Text;
  oDAO.This.Addressl2 := edtAddressl2.Text;
  oDAO.This.DRegister := date();


  if (estateRegister = erNew) then
     begin
      if messageDlg('Insert Record?', mtConfirmation, [mbYes,mbNo], 0, mbYes) = mrYes then
      oDAO.Insert;

     end
  else if (estateRegister = erUpdate) then
     begin
      if messageDlg('Update Record?', mtConfirmation, [mbYes,mbNo], 0, mbNo) = mrYes then
      oDAO.Update;

     end;

  oDAO.Get(currentIndex);

end;

end.
