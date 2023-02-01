unit Model.Connections.Interfaces;

interface

uses
Data.DB,
Winapi.Windows,
System.Classes;

type

 iModelComponentsConnections = interface
 ['{8EC254AE-FD20-4834-8914-033F72E91205}']
   function Active (aValue :boolean):iModelComponentsConnections;

   function DatasetQry: TDataset;

   procedure qryIndex(currentIndex:string);
   function ExecSQL  :iModelComponentsConnections;
   function SQLAdd (aValue :String) :iModelComponentsConnections;
   function SQLClear :iModelComponentsConnections;
   function SQLOpen  :iModelComponentsConnections;
   function SQLParam (aParam :String; aValue :Variant ) :iModelComponentsConnections; overload;
   function SQLParam (aParam :String; aValue :TPersistent ) :iModelComponentsConnections; overload;


end;


implementation

end.
