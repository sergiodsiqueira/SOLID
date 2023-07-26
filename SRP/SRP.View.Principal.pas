unit SRP.View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.Styles.Objects,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, REST.Types, Data.Bind.Components,
  Data.Bind.ObjectScope, uErrado;

type
  TfrmPrincipal = class(TForm)
    lblTitulo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    TabControl: TTabControl;
    tbiErrado: TTabItem;
    StyleBook1: TStyleBook;
    tbiCerto: TTabItem;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
//  var loUsuario: TUsuario;
//  loUsuario := TUsuario.Create;
//  if loUsuario.Login('johnd', 'm38rmF$') then
//    ShowMessage('Logado com sucesso')
//  else
//    ShowMessage('Login incorreto')

end;

end.
