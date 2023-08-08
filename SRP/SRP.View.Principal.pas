unit SRP.View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.Styles.Objects,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, REST.Types, Data.Bind.Components,
  Data.Bind.ObjectScope, uErrado, FMX.Layouts, FMX.DialogService,
  System.ImageList, FMX.ImgList, FMX.Edit, FMX.Effects, FMX.Objects, FMX.Ani,
  uAPIService, uLogin, uUser, JSON;

type
  TfrmPrincipal = class(TForm)
    lblTitulo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    StyleBook1: TStyleBook;
    ImageList: TImageList;
    TabControl: TTabControl;
    tbiLogin: TTabItem;
    rectLogin: TRectangle;
    ShadowEffect: TShadowEffect;
    btnEntrarErrado: TRectangle;
    lyEdtUsername: TLayout;
    Layout2: TLayout;
    Glyph1: TGlyph;
    edtUsername: TEdit;
    Rectangle7: TRectangle;
    Label3: TLabel;
    tbiErrado: TTabItem;
    Memo1: TMemo;
    tbiCerto: TTabItem;
    Memo2: TMemo;
    Memo3: TMemo;
    lyEdtSenha: TLayout;
    Layout4: TLayout;
    Glyph2: TGlyph;
    edtPassword: TEdit;
    Rectangle5: TRectangle;
    Label4: TLabel;
    lblLogin: TLabel;
    btnListarUsuarios: TLabel;
    Label6: TLabel;
    ColorAnimation1: TColorAnimation;
    btnEntrarCorreto: TRectangle;
    Label7: TLabel;
    ColorAnimation2: TColorAnimation;
    Memo4: TMemo;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnListarUsuariosClick(Sender: TObject);
    procedure btnEntrarErradoClick(Sender: TObject);
    procedure btnEntrarCorretoClick(Sender: TObject);
  private
    { Private declarations }
    function SignInErrado(const psUsername, psPassword: String): Boolean;
    function SignInCorreto(const psUsername, psPassword: String): Boolean;
    procedure ListarUsuarios(var pslsLista: TStringlist);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.btnEntrarCorretoClick(Sender: TObject);
begin
  if SignInCorreto(edtUsername.Text, edtPassword.Text) then
    TabControl.ActiveTab := tbiCerto
  else
    ShowMessage('Usuário ou senha incorretos');
end;

procedure TfrmPrincipal.btnEntrarErradoClick(Sender: TObject);
begin
  if SignInErrado(edtUsername.Text, edtPassword.Text) then
    TabControl.ActiveTab := tbiErrado
  else
    ShowMessage('Usuário ou senha incorretos');
end;

procedure TfrmPrincipal.btnListarUsuariosClick(Sender: TObject);
var
  slsLista: TStringlist;
begin
  slsLista := TStringlist.Create;
  try
    ListarUsuarios(slsLista);
    edtUsername.Text := slsLista[1].Split(['='])[0];
    edtPassword.Text := slsLista[1].Split(['='])[1];
    ShowMessage(slsLista.Text);
  finally
    slsLista.Free;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  TabControl.TabPosition := TTabPosition.None;
  TabControl.ActiveTab := tbiLogin;
end;

procedure TfrmPrincipal.ListarUsuarios(var pslsLista: TStringlist);
var
  loAPIService: TAPIService;
  loJSONArray: TJSONArray;
  loJSONValue: TJSONValue;
const
  URL = 'https://fakestoreapi.com/users?limit=5';
begin
  loAPIService := TAPIService.Create();
  try
    try
      loJSONArray :=
        TJSONArray(TJSONObject.ParseJSONValue(loAPIService.Get(URL)));
      pslsLista.AddPair('Username', 'Password');
      for loJSONValue in loJSONArray do
      begin
        pslsLista.AddPair(loJSONValue.P['username'].ToString.Replace('"', EmptyStr),
                          loJSONValue.P['password'].ToString.Replace('"', EmptyStr));
      end;
    except
      raise Exception.Create('Ocorreu um erro ao trazer os usuários');
    end;
  finally
    loAPIService.Free;
  end;
end;

function TfrmPrincipal.SignInCorreto(const psUsername,
  psPassword: String): Boolean;
var
  loLogin: TLogin;
  loCredential: TCredentials;
begin
  loCredential := TCredentials.Create;
  try
    loCredential.username := psUsername;
    loCredential.password := psPassword;

    loLogin := TLogin.Create;
    try
      try
        Result := loLogin.SignIn(loCredential);
      except
        Result := False;
      end
    finally
      loLogin.Free;
    end;
  finally
    loCredential.Free;
  end;
end;

function TfrmPrincipal.SignInErrado(const psUsername,
  psPassword: String): Boolean;
var
  loUsuario: TUsuario;
begin
  try
    loUsuario := TUsuario.Create;
    try
      Result := loUsuario.Login(psUsername, psPassword);
    except
      Result := False;
      ShowMessage('Erro ao tentar conectar na API');
    end
  finally
    loUsuario.Free;
  end;
end;

end.
