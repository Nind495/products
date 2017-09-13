unit product_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,datamodule,
  Vcl.StdCtrls, Vcl.DBCtrls,Add_product_form, Vcl.Menus;

type
  TFProduct = class(TForm)
    DBGProduct: TDBGrid;
    Pclient: TPanel;
    Ptable: TPanel;
    PNavigation: TPanel;
    EDNnomer: TEdit;
    Label2: TLabel;
    EDName: TEdit;
    Label3: TLabel;
    EDPrice: TEdit;
    Label4: TLabel;
    BTAdd: TButton;
    BTSave: TButton;
    BTdelete: TButton;
    BTUpadate: TButton;
    DBNavigatorProduct: TDBNavigator;
    OpenDialog1: TOpenDialog;
    BTLoadtoFile: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BTdeleteClick(Sender: TObject);
    procedure BTAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure updateEdit();
    procedure editEnable(val:boolean=true);
    procedure DBNavigatorProductClick(Sender: TObject; Button: TNavigateBtn);
    procedure BTUpadateClick(Sender: TObject);
    procedure BTSaveClick(Sender: TObject);
    procedure BTLoadtoFileClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProduct: TFProduct;

implementation

{$R *.dfm}

procedure TFProduct.BTAddClick(Sender: TObject);
var product:Tproduct;
begin
FPAddProduct.ShowModal();
;;
{product:=Tproduct.Create;
product.nnomer:=strtoint(EDNnomer.Text);
product.name:=EDName.Text;
product.price:=strtofloat(EDPrice.Text);
DataModule1.insertproduct(product);

DataModule1.ViewTableProduct;
}
end;

procedure TFProduct.BTdeleteClick(Sender: TObject);
var id:integer;
    R:word;
begin
//showmessage (DBGProduct.SelectedField.AsString);
//DataModule1.DSProduct.DataSet.FieldByName('idprduct')
    id :=DataModule1.DSProduct.DataSet.FieldByName('idproduct').AsInteger;
    if id=0 then 
        begin
          showmessage('записи не существует');
          exit;
        end;
    R:=MessageDLG('Удалить запись?',mtWarning,[mbYes,mbNo],0);
    if R=mrYes then
      DataModule1.deleteProduct(id);
      updateEdit;

end;

procedure TFProduct.BTLoadtoFileClick(Sender: TObject);
var R:word;
begin
   R:=MessageDLG('Вы уверены что хотите перезаписать таблицу product?  ',mtWarning,[mbYes,mbNo],0);

   OpenDialog1.Filter:='XML Файлы| *.xml';
if (R=mrYes) and (OpenDialog1.Execute) then
  begin
    with DataModule1 do
    begin
      ClientDataSet1.LoadFromFile(OpenDialog1.FileName);
      ClientDataSet1.open;
//      DBGProduct.DataSource:=DSload;
      LoadProductToFile;
    end;

  end;

end;

procedure TFProduct.BTSaveClick(Sender: TObject);
var product:Tproduct;
begin
BTUpadate.Enabled:=true;
BTdelete.Enabled:=true;
BTAdd.Enabled:=true;
BTSave.Enabled:=false;

product:=DataModule1.Getcurentproduct;


  if  product.checkNnomer(EDNnomer.Text) then product.nnomer:=strtoint(EDNnomer.Text)
      else
        begin
          product.Free;
          showmessage('Номер номенклатуры указан неправильно');
          exit;
        end;

  if  product.checkPrise(EdPrice.Text) then product.price:=strtoint(EdPrice.Text)
          else
        begin
          product.Free;
          showmessage('Цена указано указан неправильно');
          exit;
        end;
   product.name:=EdName.Text;

DataModule1.updateProduct(product);
DataModule1.ViewTableProduct;
 DataModule1.TableProduct.Open;
 editEnable(false);

end;

procedure TFProduct.BTUpadateClick(Sender: TObject);
begin
   updateEdit;
  editEnable();
  BTUpadate.Enabled:=false;
  BTdelete.Enabled:=false;
  BTAdd.Enabled:=false;
  BTSave.Enabled:=true;
end;



procedure TFProduct.DBNavigatorProductClick(Sender: TObject;
  Button: TNavigateBtn);
begin
updateEdit;
end;


procedure TFProduct.editEnable(val:boolean=true);
begin
  EDNnomer.Enabled:=val;
  EDName.Enabled:=val;
  EDPrice.Enabled:=val;
end;

procedure TFProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.MainForm.Close;
end;

procedure TFProduct.FormCreate(Sender: TObject);
begin
  ;;
end;

procedure TFProduct.FormShow(Sender: TObject);
begin
  ;;
  DBGProduct.DataSource:= DataModule1.DSProduct;
  DBNavigatorProduct.DataSource:=DataModule1.DSProduct;
  editEnable(false);
  BTAdd.Enabled:=true;
  BTSave.Enabled:=false;
  BTdelete.Enabled:=true;
  BTUpadate.Enabled:=true;
  updateEdit;
end;
procedure TFProduct.N2Click(Sender: TObject);
begin
BTLoadtoFileClick(sender);
end;

procedure TFProduct.N4Click(Sender: TObject);
begin
BTAddClick(sender);
end;

procedure TFProduct.N5Click(Sender: TObject);
begin
BTdeleteClick(sender);
end;

procedure TFProduct.N6Click(Sender: TObject);
begin
BTUpadateClick(sender);
end;

procedure TFProduct.N7Click(Sender: TObject);
begin
BTSaveClick(sender);
end;

procedure TFProduct.updateEdit;
  var product:Tproduct;
begin
  ;;
  product:=Tproduct.Create;
  product:=DataModule1.Getcurentproduct;
  if product=nil then exit;
  EDNnomer.Text:=inttostr(product.nnomer);
  EDName.Text:=product.name;
  EDPrice.Text:= floattostr(product.price);
  product.Free;
end;



end.
