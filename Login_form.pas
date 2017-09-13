unit Login_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Datamodule,product_form, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TFLogin = class(TForm)
    bt_connect: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EDServerName: TEdit;
    EDBDNAme: TEdit;
    EDLogin: TEdit;
    EDPass: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    CBWin: TCheckBox;
    procedure bt_connectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBWinClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

{ TForm1 }




procedure TFLogin.bt_connectClick(Sender: TObject);
var anConnect:boolean;
begin
anConnect:=DataModule1.BDconnect(EDServerName.Text,EDBDNAme.Text);
if not anConnect then exit;

FLogin.Visible:=false;
DataModule1.ViewTableProduct;
FProduct.ShowModal;

end;

procedure TFLogin.CBWinClick(Sender: TObject);
begin
if CBWin.Checked then
  begin
    EDLogin.Enabled:=false;
    EDPass.Enabled:=false;
    EDLogin.Clear;
    EDPass.Clear;
  end
    else
    begin
     EDLogin.Enabled:=true;
     EDPass.Enabled:=true;
    end;
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
 EDBDNAme.Text:= 'products';
 EDServerName.Text:='Nikolay-PS\SQLEXPRESS';
end;

end.
