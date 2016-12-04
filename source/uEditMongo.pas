{ *************************************************************************** }

{ Autor: }
{ Data:  04/12/2016 }
{ Resenha:
  { *************************************************************************** }
{ Licença segue a mesma estabelecida no código original determinada pelo seu }
{ autor }
{ }
{ *************************************************************************** }
{

  Alterações:

}

unit uEditMongo;

interface

{$I mongo.inc}
{$IFNDEF FMX}
  'codigo não pode ser utilizado em projetos VCL}
{$ENDIF}
  uses System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit, mongo.interf, mongo.Types,
  FMX.Controls.Presentation, uMongo_Tipificacoes;

type
  TEditMongo = class(TEdit, IMongoAutoInc, IMongoText, IMongoControl, IMongoCampoChave)
  private
    FMongoCampo: String;
    FMongoTipoCampo: TCampo;
    FAutoInc: Boolean;
    FCampoChave: Boolean;
    function GetMongoCampo: String;
    procedure SetMongoCampo(const Value: String);
    function GetAutoInc: Boolean;
    procedure SetAutoInc(const Value: Boolean);
    function GetMongoTipoCampo: TCampo;
    procedure SetMongoTipoCampo(const Value: TCampo);
    function GetCampoChave: Boolean;
    procedure SetCampoChave(const Value: Boolean);
  protected

  public
    constructor Create(AOwner: TComponent); override;
    function toNumerico: Integer;
    function toMoeda: Currency;
    function toDataHora: TDateTime;
    function toBooleano: Boolean;

  published
    property MongoTipoCampo: TCampo read GetMongoTipoCampo write SetMongoTipoCampo default TCampo.Texto;
    property MongoCampo: String read GetMongoCampo write SetMongoCampo;
    property AutoInc: Boolean read GetAutoInc write SetAutoInc;
    property CampoChave: Boolean read GetCampoChave write SetCampoChave;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Mongo Components', [TEditMongo]);
end;

{ TEditMongo }

constructor TEditMongo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

function TEditMongo.GetAutoInc: Boolean;
begin
  result := FAutoInc;
end;

function TEditMongo.GetCampoChave: Boolean;
begin
  result := FCampoChave;
end;

function TEditMongo.GetMongoCampo: String;
begin
  result := FMongoCampo;
end;

function TEditMongo.GetMongoTipoCampo: TCampo;
begin
  result := FMongoTipoCampo;
end;

procedure TEditMongo.SetAutoInc(const Value: Boolean);
begin
  FAutoInc := Value;
end;

procedure TEditMongo.SetCampoChave(const Value: Boolean);
begin
  FCampoChave := Value;
end;

procedure TEditMongo.SetMongoCampo(const Value: String);
begin
  FMongoCampo := Value;
end;

procedure TEditMongo.SetMongoTipoCampo(const Value: TCampo);
begin
  FMongoTipoCampo := Value;
end;

function TEditMongo.toBooleano: Boolean;
begin
  result := StrToBoolDef(self.Text, false);
end;

function TEditMongo.toDataHora: TDateTime;
begin
  try
    result := TTipificacao.toDataHora(self.Text);
  except
    raise Exception.Create('O Valor do Campo ' + self.FMongoCampo + ' é Inválido');
  end;
end;

function TEditMongo.toMoeda: Currency;
begin
  try
    result := TTipificacao.toMoeda(self.Text);
  except
    raise Exception.Create('O Valor do Campo ' + self.FMongoCampo + ' é Inválido');
  end;
end;

function TEditMongo.toNumerico: Integer;
begin
  try
    result := TTipificacao.toNumerico(self.Text);
  except
    raise Exception.Create('O Valor do Campo ' + self.FMongoCampo + ' é Inválido');
  end;
end;

end.
