{ *************************************************************************** }
{ Autor:                                                                      }
{ Data:  04/12/2016                                                           }
{ Resenha:
{ *************************************************************************** }
{ Licen�a segue a mesma estabelecida no c�digo original determinada pelo seu  }
{ autor                                                                       }
{                                                                             }
{ *************************************************************************** }
{
 Altera��es:
}
unit uCheckBoxMongo;

interface

{$I mongo.inc}
{$ifndef FMX}
     'codigo n�o pode ser utilizado em projetos VCL}
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
