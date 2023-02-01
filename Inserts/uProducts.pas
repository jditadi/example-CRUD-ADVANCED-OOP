unit uProducts;

interface

uses
 Winapi.Windows,
 Winapi.Messages,
 System.SysUtils,
 System.Variants,
 System.Classes,
 Vcl.Graphics,
 Vcl.StdCtrls,
 Vcl.Grids,
 Vcl.DBGrids,
 Vcl.Buttons,
 Vcl.Imaging.jpeg,
 Vcl.ExtCtrls,
 Vcl.Controls,
 Vcl.Dialogs,
 Vcl.Forms,
 Vcl.Mask,
 Vcl.ComCtrls,
 Vcl.DBCtrls,

 Data.DB,
 uInheritance,
 eNum,

 Model.Connections.FireDac,
 Model.Entities.Products,
 Model.DAO.Product,
 Model.DAO.Interfaces;

type
  TfrmProducts = class(TfrmInheritance)
    Label4: TLabel;
    lkpCategoria: TDBLookupComboBox;
    edtPrice: TEdit;
    edtQuant: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    DSCategory: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure edtPriceKeyPress(Sender: TObject; var Key: Char);
    procedure btnUpdateClick(Sender: TObject);
  private
    { Private declarations }
    oDAO : iModelDaoEntity<TProducts>;

  public
    { Public declarations }
    currentIndex:String;
    function Save(estateRegister:TEstateRegister):Boolean; override;
    function Delete:Boolean; override;

  end;

var
  frmProducts: TfrmProducts;

implementation

{$R *.dfm}

procedure TfrmProducts.btnNewClick(Sender: TObject);
begin
  inherited;
  edtID.Text := IntToStr(DataSource.DataSet.FieldByName('productID').AsInteger+1);
  oDAO.Get(currentIndex);
  edtDescription.setFocus;


end;


procedure TfrmProducts.FormCreate(Sender: TObject);
begin
  inherited;

    oDAO := TModelDAOProducts.New.Dataset(DataSource);
    oDAO.Get(currentIndex);



end;

procedure TfrmProducts.gridDblClick(Sender: TObject);
begin
  inherited;

  edtID.Text            := intToStr(dataSource.DataSet.FieldByName('ProductID').asInteger);
  edtDescription.Text   := dataSource.DataSet.FieldByName('Description').asString;
  lkpCategoria.KeyField := intToStr(dataSource.DataSet.FieldByName('CategoryID').asInteger);
  edtQuant.Text         := floatToStr(dataSource.DataSet.FieldByName('Quant').asFloat);
  edtPrice.Text         := floatToStr(dataSource.DataSet.FieldByName('Price').asFloat);

end;

function TfrmProducts.Save(estateRegister: TEstateRegister): Boolean;
begin

  oDAO.This.ProductID   := strtoInt(edtID.Text);
  oDAO.This.categoryID  := 0;
  oDAO.This.Description := edtDescription.Text;
  oDAO.This.Price       := strToFloat(edtPrice.Text);
  oDAO.This.Quant       := strToFloat(edtQuant.Text);


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

procedure TfrmProducts.btnUpdateClick(Sender: TObject);
begin
  inherited;

  edtID.Text          := intToStr(dataSource.DataSet.FieldByName('ProductID').asInteger);
  edtDescription.Text := dataSource.DataSet.FieldByName('Description').asString;
  edtQuant.Text       := floatToStr(dataSource.DataSet.FieldByName('Quant').asFloat);
  edtPrice.Text       := floatToStr(dataSource.DataSet.FieldByName('Price').asFloat);

  edtDescription.setFocus;

end;

function TfrmProducts.Delete: Boolean;
begin
   if messageDlg('Delete Record?', mtConfirmation, [mbYes,mbNo], 0, mbNo) = mrYes then
    begin

    oDAO.This.ProductID := DataSource.Dataset.FieldByName('productID').asInteger;

    oDAO
    .Delete
    .Get(currentIndex);
   end;
end;

procedure TfrmProducts.edtPriceKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if  not ( Key in ['0'..'9', '.', Chr(8)] ) then
      Key := #0
end;





end.
