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
unit uCheckBoxMongo;

interface

{$I mongo.inc}
{$ifndef FMX}
     'codigo não pode ser utilizado em projetos VCL}
{$endif}
uses
  FMX.StdCtrls, System.Classes;

type
  TCheckBoxMongo = class(TCheckBox)
  private
    FMongoCampo: String;
  published
    property MongoCampo : String read FMongoCampo write FMongoCampo;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Mongo Components', [TCheckBoxMongo]);
end;

end.
