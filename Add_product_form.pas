unit Add_product_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,datamodule;

type
  TFPAddProduct = class(TForm)
    Label1: TLabel;
    PClient: TPanel;
    label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdNnmoner: TEdit;
    EdName: TEdit;
    EdPricce: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPAddProduct: TFPAddProduct;

implementation

{$R *.dfm}

procedure TFPAddProduct.Button1Click(Sender: TObject);
var product:Tproduct;
begin
  product:=Tproduct.Create;
    if  product.checkNnomer(EdNnmoner.Text) then product.nnomer:=strtoint(EdNnmoner.Text)
      else
        begin
          product.Free;
          showmessage('Ќомер номенклатуры указан неправильно');
          exit;
        end;

  if  product.checkPrise(EdPricce.Text) then product.price:=strtoint(EdPricce.Text)
          else
        begin
          product.Free;
          showmessage('÷ена указано указан неправильно');
          exit;
        end;
   product.name:=EdName.Text;
  DataModule1.insertProduct(product);
  DataModule1.ViewTableProduct;
  DataModule1.TableProduct.Open;
end;

end.
