unit uErrado;

interface

uses
  System.SysUtils,
  System.Classes,
  idHTTP,
  REST.JSON;

type
  TUsuario = class(TObject)
    FCodigo: string;
    FNome: string;
    FTipo: string;
    FEmail: string;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Tipo: string read FTipo write FTipo;
    property Email: string read FEmail write FEmail;

	  function Login(const psEmail, psSenha: string): boolean;
  end;

  TCredenciais = class
    username: string;
    password: string;
  end;

implementation

{ TUsuario }

function TUsuario.Login(const psEmail, psSenha: string): boolean;
var
  loidHTTP: TIdHTTP;
  lsJSONReq: TStringStream;
  lsJSONRes: string;
  loCredenciais: TCredenciais;
const
  URL = 'https://fakestoreapi.com/auth/login';
begin
  loCredenciais := TCredenciais.Create;
  try
    loCredenciais.username := psEmail;
    loCredenciais.password := psSenha;

    loidHTTP := TIdHTTP.Create;
    try
      lsJSONReq := TStringStream.Create(TJson.ObjectToJsonString(loCredenciais), TEncoding.UTF8);
      lsJSONReq.Position := 0;

      loidHTTP.HTTPOptions := loidHTTP.HTTPOptions + [hoNoProtocolErrorException];
      loidHTTP.Request.ContentType := 'application/json';
      loidHTTP.Request.Charset := 'UTF-8';
      loidHTTP.Request.UserAgent :=
        'User-Agent:Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36';

      lsJSONRes := loidHTTP.Post(URL, lsJSONReq);
      if loidHTTP.ResponseCode = 200 then
        Result := True
      else
        Result := False;
    finally
      loidHTTP.Free;
    end;
  finally
    loCredenciais.Free;
  end;
end;

end.
