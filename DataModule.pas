unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB,Dialogs,System.Variants,
  Datasnap.DBClient;

type
  Tproduct = class
  //поля таблицы product
    idproduct:integer;
    nnomer:integer;
    name:string[255];
    price:Double;
    //методы
    function checkNnomer(nnomer:string):boolean; //валидация инвентарно номера
    function checkPrise (Prise:string):boolean; //валидация стоимости
   function Setproduct(nnomer,name,price:string) :Tproduct; // записыват в структуры Tproduct Инвю номер, наименование, стоимоть товара (не записывает idproduct)


  end;
  TDataModule1 = class(TDataModule)
    DBConnection: TADOConnection;
    TableProduct: TADOTable;
    DSProduct: TDataSource;
    sql: TADOQuery;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Nnomer: TIntegerField;
    ClientDataSet1name: TStringField;
    ClientDataSet1price: TFloatField;
    DSload: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    function BDconnect(ServerName:string;DBanme:string;login:string ='';pass:string = ''):boolean; // Соединение с базой
    procedure  ViewTableProduct(); //обновление таблицы product
    function deleteProduct(ID:integer):integer; //удаление записи из таблицы product по атрибуту idproduct
    procedure insertProduct(product:Tproduct); //добавление записи в таблицу product
    function Getcurentproduct:Tproduct; //получение текущей записи на которой установлен курсор
    procedure updateProduct(product:Tproduct); // обновление текущей записи 
    procedure LoadProductToFile(); //загрузка данных из   xml файла в таблицу product (пример структуры файлв test.xml)
  end;

var
  DataModule1: TDataModule1;

implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
{ Tproduct }

    function Tproduct.Setproduct(nnomer,name,price:string) :Tproduct;
      var product:Tproduct;
    begin
      product:=Tproduct.Create;
    if  product.checkNnomer(nnomer) then product.nnomer:=strtoint(nnomer)
      else
        begin
          product.Free;
          showmessage('Номер номенклатуры указан неправильно');
          exit;
        end;

  if  product.checkPrise(price) then product.price:=strtoint(price)
          else
        begin
          product.Free;
          showmessage('Цена указано указан неправильно');
          exit;
        end;
   product.name:=name;
   result:= product;
    end;
    function Tproduct.checkNnomer(nnomer:string):boolean;
    var n:integer;
    begin
      if   TryStrToInt(nnomer,n) then
         result:=true
         else result:=false;
    end;
    function Tproduct.checkPrise (Prise:string):boolean;
      var n:double;
    begin

     if   TryStrToFloat(Prise, n) then result:=true else result:=false;
    end;

{ TDataModule1 }
procedure     TDataModule1.LoadProductToFile();
var product:Tproduct;    
    nproduct,name,price:string;
begin
product:=Tproduct.Create; 
try
DBConnection.BeginTrans;
  sql.Parameters.Clear;
  sql.SQL.Text:='delete from product';  
  sql.ExecSQL;
  //Удалил все записи из таблицы 
while not ClientDataSet1.Eof  do
begin
 
  product.nnomer:=ClientDataSet1.FieldByName('nnomer').AsInteger;
  product.name:=ClientDataSet1.FieldByName('name').AsString;    
  product.price:=ClientDataSet1.FieldByName('price').AsFloat;      
  insertproduct(product); 
  ClientDataSet1.Next;
end; 
DBConnection.CommitTrans; 
ViewTableProduct;
except on
  E:exception do     
  begin
    product.Free;                  
    DBConnection.RollbackTrans;
    Showmessage('Операция отменена');
    
  end;
end;


end;
procedure TDataModule1.updateProduct(product:Tproduct);
  var id:integer;
      price:double;
      name:string;
      nnomer:integer;
begin
  try
  DBConnection.BeginTrans;
    sql.SQL.Clear;
   sql.Parameters.Clear;
    sql.Parameters.CreateParameter('id', ftinteger, pdInput, 20,product.idproduct);
   sql.Parameters.CreateParameter('nnomer', ftinteger, pdInput, 20,product.nnomer);
   sql.Parameters.CreateParameter('name', ftString, pdInput, 20,product.name);
   sql.Parameters.CreateParameter('prise', ftinteger, pdInput, 20,product.price);
   sql.SQL.Text:='update product set Nnomer =:nnomer, name =:name , prise =:prise where idproduct=:id';
   sql.ExecSQL;
   DBConnection.CommitTrans;
  except
   on E:exception do
   begin
     DBConnection.RollbackTrans;
     Showmessage('Операция отменена');
   end;


  end;



end;
function TDataModule1.Getcurentproduct:Tproduct;
var product:Tproduct;
    field:tfield;
   begin
   product:=Tproduct.Create;
     field:=TableProduct.FieldByName('idproduct');
     if (field=nil) then exit ;
     if VarIsNull(field.Value) then exit;
     
     field:=TableProduct.FieldByName('Nnomer');
     if (field=nil) and (not product.checkNnomer(field.Value) ) then exit;


     field:=TableProduct.FieldByName('prise');
     if field=nil  then exit;

     field:=TableProduct.FieldByName('name');
     if field=nil then exit;



      product.idproduct:=TableProduct.FieldByName('idproduct').Value;
      product.nnomer:=TableProduct.FieldByName('Nnomer').Value;
      product.name:=TableProduct.FieldByName('name').Value;
      product.price:=TableProduct.FieldByName('prise').value;
      result:= product;

{


   // установка поля idproduct из таблицы product
   field:=TableProduct.FieldByName('idproduct');
      if (field<>nil) then
        begin
          product:=Tproduct.Create;
          product.idproduct:=field.Value;
        end
        else
        begin
          product.Free;
          exit;
        end;
//установка поля номенклатура из таблицы product
        field:=TableProduct.FieldByName('Nnomer');
      if (field<>nil) and (product.checkNnomer(field.Value) ) then
        begin
          product.nnomer:=field.Value;
        end
      else
        begin
          Product.Free;
          exit;
        end;
//установка поля цена  из таблицы product
        field:=TableProduct.FieldByName('prise');
       if (field<>nil and product.checkPrise(field.Value)) then
        begin
          product.price:=field.Value;
        end
        else

//установка поля наименования из таблицы product


 }



   end;
function TDataModule1.BDconnect(ServerName:string;DBanme:string;login:string = '';pass:string =''):boolean;
var Sconnect:string;
begin
with (DataModule1) do
begin
try
   DBConnection.Connected:=false;
   DBConnection.CommandTimeout:=15;
   DBConnection.ConnectionTimeout:=10;
   Sconnect:= 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;'+
      'Initial Catalog='+DBanme+';Data Source='+ServerName;
   if login<>'' then   Sconnect:=Sconnect+'User ID ='+login+'Password = '+pass;
   DBConnection.ConnectionString :=Sconnect;
   DBConnection.Connected:=true;
   DSProduct.DataSet:=TableProduct;
   result:=true;
 except
    on E : Exception do
       begin
        result:=false;
        ShowMessage('Источник: '+E.ClassName+''#13#10''+'Ошибка: '+E.Message);
       end;
  end;
end;
end;

function TDataModule1.deleteProduct(ID: integer): integer;
var b :TAffectRecords;
    param:TCollectionItem;
begin
try
  DBConnection.BeginTrans;
   sql.Parameters.Clear;
  sql.Parameters.CreateParameter('id', ftinteger, pdInput, 20,ID);
  sql.SQL.text:='delete from product where idproduct =:id';
  sql.ExecSQL;
  sql.Close;
  DataModule1.ViewTableProduct;
  DBConnection.CommitTrans;

except
  on E:Exception do
  begin
      DBConnection.RollbackTrans;
     ShowMessage('Источник: '+E.ClassName+''#13#10''+'Ошибка: '+E.Message);
  end;
end;
end;

procedure TDataModule1.ViewTableProduct;
begin
;;
   TableProduct.Connection:=DBConnection;
   TableProduct.TableName:='product';
   TableProduct.Active:=false;
   TableProduct.open;
end;
procedure TDataModule1.insertproduct(product:Tproduct);
 begin
   ;; 
   try
   sql.SQL.Clear;
   sql.Parameters.Clear;
   sql.Parameters.CreateParameter('nnomer', ftinteger, pdInput, 20,product.nnomer);
   sql.Parameters.CreateParameter('name', ftString, pdInput, 20,product.name);
   sql.Parameters.CreateParameter('prise', ftinteger, pdInput, 20,product.price);
   sql.SQL.Text:='insert into product (Nnomer,name,prise) values(:nnomer,:name,:prise)';
   sql.ExecSQL;
   Except on E:exception do
     begin
        
      Showmessage('Операция отменена.'+''#13#10''+'Источник: '+E.ClassName+''#13#10''+'Ошибка: '+E.Message);
     end;

   end;
 end;

end.
