program prjBYKES;

uses
  Vcl.Forms,
  uBYKES in 'uBYKES.pas' {frmMainBike},
  uInheritance in 'Inheritance\uInheritance.pas' {frmInheritance},
  eNum in 'Inheritance\eNum.pas',
  uRegCategory in 'Inserts\uRegCategory.pas' {frmRegCategory},
  Model.Connections.FireDac in 'Model\Connections\Model.Connections.FireDac.pas',
  Model.DAO.Category in 'Model\DAO\Model.DAO.Category.pas',
  Model.Entities.Category in 'Model\Entity\Model.Entities.Category.pas',
  Model.Connections.Interfaces in 'Model\Connections\Model.Connections.Interfaces.pas',
  prjBykes.Model.Behaviors in 'Behaviors\prjBykes.Model.Behaviors.pas',
  Model.Entities.Users in 'Model\Entity\Model.Entities.Users.pas',
  Model.DAO.Interfaces in 'Model\DAO\Model.DAO.Interfaces.pas',
  Model.DAO.Users in 'Model\DAO\Model.DAO.Users.pas',
  uUsers in 'Src\uUsers.pas' {frmUsers},
  uCustomers in 'Inserts\uCustomers.pas' {frmCustomers},
  Model.DAO.Customer in 'Model\DAO\Model.DAO.Customer.pas',
  Model.Entities.Customer in 'Model\Entity\Model.Entities.Customer.pas',
  uProducts in 'Inserts\uProducts.pas' {frmProducts},
  Model.Entities.Products in 'Model\Entity\Model.Entities.Products.pas',
  Model.DAO.Product in 'Model\DAO\Model.DAO.Product.pas',
  USales in 'Src\USales.pas' {frmSales},
  Model.Entities.Sales in 'Model\Entity\Model.Entities.Sales.pas',
  Model.DAO.Sale in 'Model\DAO\Model.DAO.Sale.pas',
  Model.DAO.CdsItems in 'Model\DAO\Model.DAO.CdsItems.pas',
  Model.Entities.SalesItems in 'Model\Entity\Model.Entities.SalesItems.pas',
  Model.DAO.SaleItem in 'Model\DAO\Model.DAO.SaleItem.pas';

{$R *.res}

 begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMainBike, frmMainBike);
  Application.Run;
end.
