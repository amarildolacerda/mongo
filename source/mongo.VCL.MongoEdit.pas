{ *************************************************************************** }
{ Data:  04/12/2016                                                           }
{ Resenha: Codigo obtido apartir do codigo FMX                                }
{ *************************************************************************** }
{ Licen�a segue a mesma estabelecida no c�digo original determinada pelo seu  }
{ autor                                                                       }
{                                                                             }
{ *************************************************************************** }
{
 Altera��es:
      * retirado dependencia da FMX e incluido VCL  (por: Amarildo Lacerda (AL))
      + adicionado interfaces para reduzir acoplamento (por: AL)

}
unit mongo.VCL.MongoEdit;

interface


{$I mongo.inc}
{$ifdef FMX}
     'codigo n�o pode ser utilizado em projetos VCL}
{$endif}



uses
  System.SysUtils, System.Classes,
  VCL.StdCtrls,
  mongo.interf, mongo.Types,
  uMongo_Tipificacoes;

type
  TMongoEdit = class(TEdit, IMongoAutoInc, IMongoText, IMongoControl, IMongoCampoChave)
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
    function GetText: string;
    procedure SetText(const Value: string);
  protected

  public
    constructor Create(AOwner: TComponent); override;
    function toNumerico: Integer;
    function toMoeda: Currency;
    function toDataHora: TDateTime;
    function toBooleano:Boolean;
  published
    property MongoTipoCampo: TCampo read GetMongoTipoCampo write SetMongoTipoCampo default TCampo.Texto;
    property MongoCampo: String read GetMongoCampo write SetMongoCampo;
    property AutoInc: Boolean read GetAutoInc write SetAutoInc;
    property CampoChave: Boolean read GetCampoChave write SetCampoChave;
    property Text:string read GetText write SetText;
  end;


implementation


{ TMongoEdit }

constructor TMongoEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

function TMongoEdit.GetAutoInc: Boolean;
begin
  result := FAutoInc;
end;

function TMongoEdit.GetCampoChave: Boolean;
begin
  result := FCampoChave;
end;

function TMongoEdit.GetMongoCampo: String;
begin
  result := FMongoCampo;
end;

function TMongoEdit.GetMongoTipoCampo: TCampo;
begin
  result := FMongoTipoCampo;
end;

function TMongoEdit.GetText: string;
begin
  result := inherited text;
end;

procedure TMongoEdit.SetAutoInc(const Value: Boolean);
begin
  FAutoInc := Value;
end;

procedure TMongoEdit.SetCampoChave(const Value: Boolean);
begin
  FCampoChave := Value;
end;

procedure TMongoEdit.SetMongoCampo(const Value: String);
begin
  FMongoCampo := Value;
end;

procedure TMongoEdit.SetMongoTipoCampo(const Value: TCampo);
begin
  FMongoTipoCampo := Value;
end;

procedure TMongoEdit.SetText(const Value: string);
begin
  inherited text := value;
end;

function TMongoEdit.toBooleano: Boolean;
begin
   result := StrToBoolDef(self.Text,false);
end;

function TMongoEdit.toDataHora: TDateTime;
begin
  try
    result := TTipificacao.toDataHora(Self.Text);
  except
    raise Exception.Create('O Valor do Campo ' + Self.FMongoCampo + ' � Inv�lido');
  end;
end;

function TMongoEdit.toMoeda: Currency;
begin
  try
    result := TTipificacao.toMoeda(Self.Text);
  except
    raise Exception.Create('O Valor do Campo ' + Self.FMongoCampo + ' � Inv�lido');
  end;
end;

function TMongoEdit.toNumerico: Integer;
begin
  try
    result := TTipificacao.toNumerico(Self.Text);
  except
    raise Exception.Create('O Valor do Campo ' + Self.FMongoCampo + ' � Inv�lido');
  end;
end;

end.
