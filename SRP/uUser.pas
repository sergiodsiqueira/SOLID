unit uUser;

interface

uses
  System.SysUtils,
  System.Classes;

type
  TUser = class(TObject)
    FID: string;
    FName: string;
    FType: string;
    FEmail: string;
  public
    property Codigo: string read FID write FID;
    property Nome: string read FName write FName;
    property Tipo: string read FType write FType;
    property Email: string read FEmail write FEmail;
  end;

implementation

end.
