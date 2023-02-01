unit USales;

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
 Datasnap.DBClient,

 Data.DB,
 uInheritance,
 eNum,

 Model.Connections.FireDac,
 Model.DAO.Sale,
 Model.DAO.Customer,
 Model.DAO.Product,
 Model.DAO.SaleItem,
 Model.Entities.SalesItems,
 Model.Entities.Sales,
 Model.Entities.Customer,
 Model.Entities.Products,
 Model.DAO.Interfaces,
 Model.DAO.CdsItems;
type
  TfrmSales = class(TfrmInheritance)
    gridItems: TDBGrid;
    lkpCustomer: TDBLookupComboBox;
    edtSaleDate: TMaskEdit;
    Label4: TLabel;
    lkpProduct: TDBLookupComboBox;
    edtItem: TEdit;
    edtQuant: TEdit;
    edtTotalItem: TEdit;
    Panel8: TPanel;
    Shape7: TShape;
    btnAddItem: TSpeedButton;
    Panel9: TPanel;
    Shape8: TShape;
    btnRemoveItem: TSpeedButton;
    DSCustomer: TDataSource;
    edtTotalSale: TEdit;
    Label1: TLabel;
    cdsItems: TClientDataSet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DSProducts: TDataSource;
    cdsItemsProductID: TIntegerField;
    cdsItemsDescription: TStringField;
    cdsItemsPrice: TFloatField;
    cdsItemsquant: TFloatField;
    cdsItemsTotalItems: TFloatField;
    cdsItemsTotalSale: TAggregateField;
    DSSaleItems: TDataSource;
    DSCdsItems: TDataSource;
    DBEdit: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure lkpCustomerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtQuantExit(Sender: TObject);
    procedure lkpProductExit(Sender: TObject);
    procedure btnAddItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRemoveItemClick(Sender: TObject);
    procedure gridTitleClick(Column: TColumn);
    procedure DBEditChange(Sender: TObject);
  private
    function inNot(pValue: TClientDataset): String;
    { Private declarations }
  public
    { Public declarations }
    oDAO : iModelDaoEntity<TSale>;
    oDAOCustomer : iModelDaoEntity<TCustomer>;
    oDAOProduct  : iModelDaoEntity<TProducts>;
    oDAOCdsItem     : TCdsItem;
    oDAOSaleItem    : iModelDaoEntity<TSaleItem>;

    function Save(estateRegister:TEstateRegister):Boolean; override;
    function Delete:Boolean; override;

    procedure ClearComponentItem;
    procedure ClearAllItems;
    procedure getSaleItems;
    procedure activeDbedit(pActive:boolean);
    procedure verifyFields;

    function btnItems(estateRegister:TEstateRegister):boolean;
    function getGen():Integer;


  end;

var
  frmSales: TfrmSales;

implementation

{$R *.dfm}

function TfrmSales.btnItems(estateRegister: TEstateRegister): boolean;
begin

  if (estateRegister = erNew) or (estateRegister = erUpdate) then
    begin
     btnAddItem.Enabled    := True;
     btnRemoveItem.Enabled := True;
    end
    else
    begin
     btnAddItem.Enabled    := False;
     btnRemoveItem.Enabled := False;
    end;

    Result := btnAddItem.Enabled;


end;

procedure TfrmSales.btnNewClick(Sender: TObject);
begin
  inherited;
  btnItems(EstateRegister);
  activeDbedit(false);
  ClearAllItems;
  edtID.Text := IntToStr(getGen());


  lkpCustomer.SetFocus;
end;

procedure TfrmSales.btnRemoveItemClick(Sender: TObject);
begin
  inherited;
  if not btnItems(EstateRegister) then
  abort;

  oDAOCdsItem.Remove(cdsItems, cdsItems.FieldByName('productID').Value);
  edtTotalSale.text := FormatFloat('00.00',oDAOCdsItem.Totalize(cdsItems));
  ClearComponentItem;
  lkpProduct.SetFocus;


end;

procedure TfrmSales.btnUpdateClick(Sender: TObject);
begin
  inherited;
  btnItems(EstateRegister);
  edtID.Text       := intToStr(DataSource.Dataset.FieldByName('SaleID').asInteger);
  edtSaleDate.Text := dateToStr(DataSource.Dataset.FieldByName('SaleDate').asDateTime);
  edtTotalSale.Text    := floatToStr(DataSource.Dataset.FieldByName('TotalSale').asFloat);
  lkpCustomer.KeyValue := DataSource.Dataset.FieldByName('customerID').asInteger;
  lkpCustomer.setFocus;
  activeDbedit(false);

end;


procedure TfrmSales.ClearAllItems;
begin

  lkpCustomer.KeyValue   := null;
  lkpProduct.KeyValue    := null;
  edtSaleDate.Text   := dateToStr(date());
  edtQuant.text      := '0';
  edtItem.text       := '0';
  edtTotalItem.text  := '0';
  edtTotalSale.text  := '0';

  oDAOCdsItem.Clean(cdsItems);

end;

procedure TfrmSales.ClearComponentItem;
begin

  lkpProduct.KeyValue   := null;
  edtQuant.text := '0';
  edtItem.text:= '0';
  edtTotalItem.text := '0';

end;

procedure TfrmSales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  cdsItems.Close;
  oDAOCdsItem.DisposeOf;


end;

procedure TfrmSales.FormCreate(Sender: TObject);
begin
  inherited;

  cdsItems.CreateDataSet;
  oDAO         := TModelDAOSale.New.Dataset(DataSource);
  oDAOCustomer := TModelDAOCustomer.New.Dataset(DSCustomer);
  oDAOProduct  := TModelDAOProducts.New.Dataset(DSProducts);
  oDAOSaleItem := TModelDAOSaleItem.New.Dataset(DSSaleItems);
  oDAOCdsItem  := TCdsItem.Create;

  oDAOProduct.Get('');
  oDAOCustomer.Get('');
  oDAO.Get('');
  activeDbedit(true);

end;

function TfrmSales.getGen: Integer;
begin
  oDAO.GetGen;
  Result := DataSource.DataSet.FieldByName('GEN_ID').AsInteger+1;
end;

procedure TfrmSales.getSaleItems;
begin


  try
  DSSaleItems.DataSet.First;

  while not DSSaleItems.DataSet.eof do
    begin
    oDAOProduct.Select('productID',inttoStr(DSSaleItems.DataSet.FieldByName('productID').asInteger));

    oDAOCdsItem.Add(cdsItems, DSSaleItems.DataSet.FieldByName('productID').asInteger,
                              DSProducts.DataSet.FieldByName('Description').AsString,
                              DSSaleItems.DataSet.FieldByName('Price').asFloat,
                              DSSaleItems.DataSet.FieldByName('Quant').asFloat,
                              DSSaleItems.DataSet.FieldByName('TotalItems').AsFloat);

    DSSaleItems.DataSet.Next;
    end;

  finally

  end;

end;

procedure TfrmSales.gridTitleClick(Column: TColumn);
begin
  inherited;

  oDAO.Get('saleID');
  activeDbedit(True);

end;

procedure TfrmSales.lkpCustomerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then Perform(Wm_NextDlgCtl,0,0);
end;

procedure TfrmSales.lkpProductExit(Sender: TObject);
begin
  inherited;
  if (TDBLookupComboBox(Sender).KeyValue<>null) then
  begin
  edtItem.text := FormatFloat('00.00',DSproducts.DataSet.FieldByName('Price').Value);
  edtQuant.text:= '1';
  end;

end;


procedure TfrmSales.activeDbedit(pActive:boolean);
begin

 if pActive then
  begin
   dbEdit.DataSource:= DataSource;
   dbEdit.DataField := DataSource.DataSet.Fields[0].FieldName;
  end else
  begin
   dbEdit.DataField := '';
   dbEdit.DataSource:= nil;
  end;

end;

procedure TfrmSales.btnAddItemClick(Sender: TObject);
begin
  inherited;

  VerifyFields;


end;

procedure TfrmSales.DBEditChange(Sender: TObject);
begin
  inherited;

  oDAOSaleItem.Get(inttoStr(dataSource.DataSet.FieldByName('saleID').asInteger) );
  edtTotalSale.text := FormatFloat('0.00',oDAOCdsItem.Totalize(cdsItems));
  oDAOCdsItem.Clean(cdsItems);
  getSaleItems;

end;

function TfrmSales.Delete: Boolean;
begin

    try
    if messageDlg('delete Sale?', mtConfirmation, [mbYes,mbNo], 0, mbYes) = mrYes then
       begin
       oDAO.This.SaleID         := dataSource.DataSet.FieldByName('saleID').asInteger;
       oDAOSaleItem.This.SaleID := dataSource.DataSet.FieldByName('saleID').asInteger;
       oDAOSaleItem.This.ItemsToDel := '0';

            cdsItems.first;
            while not cdsItems.Eof do
            begin
              oDAOSaleItem.This.ProductID := cdsItems.FieldByName('ProductID').asInteger;
              oDAOSaleItem.This.Price     := cdsItems.FieldByName('Price').asFloat;
              oDAOSaleItem.This.Quant     := cdsItems.FieldByName('Quant').asFloat;
              oDAOSaleItem.This.TotalItems:= cdsItems.FieldByName('TotalItems').asFloat;
              oDAOSaleItem.Insert;

              oDAOCdsItem.ReturnStock(cdsItems.FieldByName('ProductID').asInteger, cdsItems.FieldByName('Quant').asFloat);

            cdsItems.Next;
            end;

       oDAO.Delete;
       oDAOSaleItem.Delete;

       ClearAllItems;
       oDAO.Get('');
       activeDbedit(true);

       end;
    finally


    end;



end;

procedure TfrmSales.edtQuantExit(Sender: TObject);
begin
  inherited;
  edtTotalItem.text := FormatFloat('00.00',( strToFloat(edtItem.text) * strToFloat(edtQuant.text)));

end;


function TfrmSales.Save(estateRegister: TEstateRegister): Boolean;
var
vSaleID,vProductID :Integer;
begin
  activeDbedit(false);

  oDAO.This.CustomerID:= lkpCustomer.KeyValue;
  oDAO.This.SaleDate  := strtoDate(edtSaledate.Text);
  oDAO.This.TotalSale := strToFloat(edtTotalSale.Text);

  if (estateRegister = erNew) then
     begin
      if messageDlg('Insert Record?', mtConfirmation, [mbYes,mbNo], 0, mbYes) = mrYes then
       begin
         try
         edtID.text := intToStr(getGen());
         vSaleID := getGen();
         oDAO.This.SaleID    := vSaleID;
         oDAOSaleItem.This.SaleID := vSaleID;

         oDAO.Insert;

            cdsItems.first;
            while not cdsItems.Eof do
            begin
              oDAOSaleItem.This.ProductID := cdsItems.FieldByName('ProductID').asInteger;
              oDAOSaleItem.This.Price     := cdsItems.FieldByName('Price').asFloat;
              oDAOSaleItem.This.Quant     := cdsItems.FieldByName('Quant').asFloat;
              oDAOSaleItem.This.TotalItems:= cdsItems.FieldByName('TotalItems').asFloat;
              oDAOSaleItem.Insert;

              oDAOCdsItem.UpdateStock(cdsItems.FieldByName('ProductID').asInteger, cdsItems.FieldByName('Quant').asFloat);

            cdsItems.Next;
            end;

         finally
         ClearAllItems;
         oDAO.Get('');
         activeDbedit(true);

         end;

       end;


     end
  else if (estateRegister = erUpdate) then
     begin
      if messageDlg('Update Record?', mtConfirmation, [mbYes,mbNo], 0, mbNo) = mrYes then
      try
      vSaleID := strToInt(edtID.text);
      oDAO.This.SaleID    := vSaleID;
      oDAOSaleItem.This.SaleID := vSaleID;

       oDAO.Update;

       oDAOcdsItem.qryReturnAllItems(vSaleID, inNot(cdsItems));

       oDAOSaleItem.This.ItemsToDel :=  inNot(cdsItems);
       oDAOSaleItem.Delete;

            cdsItems.first;
            while not cdsItems.Eof do
            begin
              vProductID := cdsItems.FieldByName('ProductID').asInteger;
              oDAOSaleItem.This.ProductID := cdsItems.FieldByName('ProductID').asInteger;
              oDAOSaleItem.This.Price     := cdsItems.FieldByName('Price').asFloat;
              oDAOSaleItem.This.Quant     := cdsItems.FieldByName('Quant').asFloat;
              oDAOSaleItem.This.TotalItems:= cdsItems.FieldByName('TotalItems').asFloat;

              if (not oDAOcdsItem.qryExistItem(vSaleID,vProductID)) then
               oDAOSaleItem.Insert;

               oDAOcdsItem.UpdateStock(vProductID, cdsItems.FieldByName('Quant').asFloat);

            cdsItems.Next;
            end;


      finally
      ClearAllItems;
      oDAO.Get('');
      activeDbedit(true);

      end;



     end;


end;


function TfrmSales.inNot(pValue: TClientDataset): String;
var
vInNot:String;
Fcds : TClientDataset;

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

procedure TfrmSales.verifyFields;
begin

  if lkpProduct.keyValue = null then
    begin
    messageDlg('Product is a mandatory field', mtInformation,[mbOK], 0);
    lkpProduct.SetFocus;
    abort;
    end;

  if strToFloat(edtItem.text) <= 0 then
    begin
    messageDlg('value cant be 0', mtInformation,[mbOK], 0);
    edtItem.SetFocus;
    abort;
    end;

  if strToFloat(edtQuant.text) <= 0  then
    begin
    messageDlg('quantity cant be 0', mtInformation,[mbOK], 0);
    edtQuant.SetFocus;
    abort;
    end;

  cdsItems.First;
  while not cdsItems.Eof do
   begin
    if (lkpProduct.keyValue = cdsItems.FieldByName('productID').asInteger) then
    begin
    messageDlg('Item has already been released', mtInformation,[mbOK], 0);
    lkpProduct.SetFocus;
    abort;
    end;

   cdsItems.Next;
   end;

    oDAOCdsItem.Add(cdsItems, lkpProduct.KeyValue, DSproducts.DataSet.FieldByName('Description').Value,
                 strToFloat(edtItem.text), strToFloat(edtQuant.text), strToFloat(edtTotalItem.text));

    edtTotalSale.text := FormatFloat('00.00',oDAOCdsItem.Totalize(cdsItems));
    ClearComponentItem;
    lkpProduct.SetFocus;

end;


end.
