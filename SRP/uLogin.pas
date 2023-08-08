unit uLogin;

interface

uses
  System.SysUtils,
  System.Classes,
  uAPIService,
  uUser;

type
  TCredentials = class
  private
    FPassword: string;
    FUsername: string;
  public
    property username: string read FUsername write FUsername;
    property password: string read FPassword write FPassword;
  end;

  TLogin = class
  private
    FUser: TUser;
    FAPIService: TAPIService;
  public
    constructor Create();
    destructor Destroy();
    function SignIn(const poCredentials: TCredentials): Boolean;
    function GetUser: TUser;
  end;

implementation

{ TLogin }

constructor TLogin.Create;
begin
  FAPIService := TAPIService.Create();
  FUser := TUser.Create();
end;

destructor TLogin.Destroy;
begin
  FAPIService.Free;
  FUser.Free;
end;

function TLogin.SignIn(const poCredentials: TCredentials): Boolean;
var
  sResponse: String;
const
  URL = 'https://fakestoreapi.com/auth/login';
begin
  Result := False;

  if poCredentials.username.IsEmpty or poCredentials.password.IsEmpty then
    raise Exception.Create('Faltando alguma informação');

  sResponse := FAPIService.Post(URL, poCredentials);
  if sResponse.IsEmpty then
    raise Exception.Create('Credencias incorretas');

  FUser.Codigo := '1';
  FUser.Nome := 'John Distance';
  FUser.Email := poCredentials.username;
  FUser.Tipo := 'A';

  Result := True;
end;

function TLogin.GetUser: TUser;
begin
  if not Assigned(FUser) then
    raise Exception.Create('Não há nenhum usuário logado');

  Result := FUser;
end;

end.
