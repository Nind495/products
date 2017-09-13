program products;

uses
  Vcl.Forms,
  Login_form in 'Login_form.pas' {FLogin},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  product_form in 'product_form.pas' {FProduct},
  Add_product_form in 'Add_product_form.pas' {FPAddProduct};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFProduct, FProduct);
  Application.CreateForm(TFPAddProduct, FPAddProduct);
  Application.Run;
end.
