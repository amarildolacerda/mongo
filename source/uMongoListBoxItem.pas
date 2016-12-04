{ *************************************************************************** }
{ Autor:                                                                      }
{ Data:  04/12/2016                                                           }
{ Resenha:
{ *************************************************************************** }
{ Licença segue a mesma estabelecida no código original determinada pelo seu  }
{ autor                                                                       }
{                                                                             }
{ *************************************************************************** }
{
 Alterações:
 }
unit uMongoListBoxItem;

interface

{$I mongo.inc}
{$ifndef FMX}
     'codigo não pode ser utilizado em projetos VCL}
{$endif}


uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  mongo.interf,
  FMX.Controls.Presentation, FMX.ListBox, uMongo_Tipificacoes, VCL.Controls, VCL.Forms;

type
  TMongoListBoxItem = class(TListBoxItem{, IMongoJSON})
  private
    FJSON: String;
    FListBox: TListBox;
    function GetJSON: String;
    procedure SetJSON(const Value: String);
  protected

  public
    constructor Create(AOwner: TComponent); override;

  published
    property JSON: String read GetJSON write SetJSON;
    property ListBox: TListBox read FListBox write FListBox;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Mongo Components', [TMongoListBoxItem]);
end;

{ TMongoListBoxItem }

constructor TMongoListBoxItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

function TMongoListBoxItem.GetJSON: String;
begin
  result := FJSON;
end;

procedure TMongoListBoxItem.SetJSON(const Value: String);
begin
  FJSON := Value;
end;

end.
