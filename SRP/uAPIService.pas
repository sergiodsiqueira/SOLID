unit uAPIService;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Math,
  idHTTP,
  REST.JSON;

type
  TAPIService = class
    function Post(const psURL: String; poBodyReq: TObject): String;
    function Get(const psURL: String): String;
  end;

implementation

{ TAPIService }

function TAPIService.Post(const psURL: String; poBodyReq: TObject): String;
var
  loidHTTP: TIdHTTP;
  lsJSONReq: TStringStream;
  lsJSONRes: string;
begin
  Result := EmptyStr;

  loidHTTP := TIdHTTP.Create;
  try
    lsJSONReq := TStringStream.Create(TJson.ObjectToJsonString(poBodyReq),
      TEncoding.UTF8);
    lsJSONReq.Position := 0;

    loidHTTP.HTTPOptions := loidHTTP.HTTPOptions + [hoNoProtocolErrorException];
    loidHTTP.Request.ContentType := 'application/json';
    loidHTTP.Request.Charset := 'UTF-8';
    loidHTTP.Request.UserAgent :=
      'User-Agent:Mozilla/5.0 (Windows NT 10.0; Win64; x64)' +
      'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36';

    lsJSONRes := loidHTTP.Post(psURL, lsJSONReq);
    if InRange(loidHTTP.ResponseCode, 200, 299) then
      Result := lsJSONRes;
  finally
    loidHTTP.Free;
  end;
end;

function TAPIService.Get(const psURL: String): String;
var
  loidHTTP: TIdHTTP;
  lsJSONRes: string;
begin
  loidHTTP := TIdHTTP.Create;
  try
    loidHTTP.HTTPOptions := loidHTTP.HTTPOptions + [hoNoProtocolErrorException];
    loidHTTP.Request.ContentType := 'application/json';
    loidHTTP.Request.Charset := 'UTF-8';
    loidHTTP.Request.UserAgent :=
      'User-Agent:Mozilla/5.0 (Windows NT 10.0; Win64; x64)' +
      'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36';

    lsJSONRes := loidHTTP.Get(psURL);
    if InRange(loidHTTP.ResponseCode, 200, 299) then
      Result := lsJSONRes
    else
      Result := EmptyStr;
  finally
    loidHTTP.Free;
  end;
end;

end.
