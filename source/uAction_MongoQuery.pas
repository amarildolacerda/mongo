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
      + incluidor checagem diretiva FMX (por: AL)
        projetos FMX precisam indicar que v�o carregar a biblioteca FMX
}
unit uAction_MongoQuery;

interface

{$I mongo.inc}
{$ifndef FMX}
     'codigo n�o pode ser utilizado em projetos VCL}
{$endif}

uses
  {$ifdef FMX} FMX.ActnList, FMX.Forms, FMX.Dialogs,{$else} VCL.ActnList, VCL.Forms,VCL.Dialogs,  {$endif} System.Actions, System.SysUtils, uMongoQuery,
   mongo.ui;

type
  TMongoInsert = class(TAction)
  private
    FMongoQuery : TMongoQuery;
    FLayout : TLayout;
  public
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure UpdateTarget(Target: TObject); override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property MongoQuery : TMongoQuery read FMongoQuery write FMongoQuery;
    property Layout : TLayout read FLayout write FLayout;
  end;

type
  TMongoUpdate = class(TAction)
  private
    FMongoQuery : TMongoQuery;
    FLayout : TLayout;
  public
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure UpdateTarget(Target: TObject); override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property MongoQuery : TMongoQuery read FMongoQuery write FMongoQuery;
    property Layout : TLayout read FLayout write FLayout;
  end;

type
  TMongoDelete = class(TAction)
  private
    FMongoQuery : TMongoQuery;
    FLayout : TLayout;
  public
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure UpdateTarget(Target: TObject); override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property MongoQuery : TMongoQuery read FMongoQuery write FMongoQuery;
    property Layout : TLayout read FLayout write FLayout;
  end;

type
  TMongoSelect = class(TAction)
  private
    FMongoQuery : TMongoQuery;
    FLayout : TLayout;
  public
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure UpdateTarget(Target: TObject); override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property MongoQuery : TMongoQuery read FMongoQuery write FMongoQuery;
    property Layout : TLayout read FLayout write FLayout;
  end;

type
  TMongoSelectEdit = class(TAction)
  private
    FMongoQuery : TMongoQuery;
    FLayout : TLayout;
  public
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure UpdateTarget(Target: TObject); override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property MongoQuery : TMongoQuery read FMongoQuery write FMongoQuery;
    property Layout : TLayout read FLayout write FLayout;
  end;

type
  TMongoLimpar = class(TAction)
  private
    FMongoQuery : TMongoQuery;
    FLayout : TLayout;
  public
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure UpdateTarget(Target: TObject); override;
    procedure ExecuteTarget(Target: TObject); override;
  published
    property MongoQuery : TMongoQuery read FMongoQuery write FMongoQuery;
    property Layout : TLayout read FLayout write FLayout;
  end;


  procedure Register;

implementation

{TMongoInsert}

procedure TMongoInsert.ExecuteTarget(Target: TObject);
begin
  try
    MongoQuery.InserirLayout(FLayout);
  Except
    on E : Exception do
      ShowMessage(E.Message);
  end;

end;

function TMongoInsert.HandlesTarget(Target: TObject): Boolean;
begin
  Result := true;
  if not Result then
    Enabled := False;
end;

procedure TMongoInsert.UpdateTarget(Target: TObject);
begin
  Enabled := true;
end;

{TMongoUpdate}

procedure TMongoUpdate.ExecuteTarget(Target: TObject);
begin
  try
    MongoQuery.UpdateLayout(FLayout);
  Except
    on E : Exception do
      ShowMessage(E.Message);
  end;

end;

function TMongoUpdate.HandlesTarget(Target: TObject): Boolean;
begin
  Result := true;
  if not Result then
    Enabled := False;
end;

procedure TMongoUpdate.UpdateTarget(Target: TObject);
begin
  Enabled := true;
end;

{TMongoDelete}

procedure TMongoDelete.ExecuteTarget(Target: TObject);
begin
  try
    MongoQuery.DeleteLayout(FLayout);
  Except
    on E : Exception do
      ShowMessage(E.Message);
  end;

end;

function TMongoDelete.HandlesTarget(Target: TObject): Boolean;
begin
  Result := true;
  if not Result then
    Enabled := False;
end;

procedure TMongoDelete.UpdateTarget(Target: TObject);
begin
  Enabled := true;
end;


{TMongoSelect}

procedure TMongoSelect.ExecuteTarget(Target: TObject);
begin
  try
    MongoQuery.SelectLayout(FLayout);
  Except
    on E : Exception do
      ShowMessage(E.Message);
  end;
end;

function TMongoSelect.HandlesTarget(Target: TObject): Boolean;
begin
  Result := true;
  if not Result then
    Enabled := False;
end;

procedure TMongoSelect.UpdateTarget(Target: TObject);
begin
  Enabled := true;
end;

{TMongoSelectEdit}

procedure TMongoSelectEdit.ExecuteTarget(Target: TObject);
begin
  try
    MongoQuery.SelectEditLayout(FLayout);
  Except
    on E : Exception do
      ShowMessage(E.Message);
  end;
end;

function TMongoSelectEdit.HandlesTarget(Target: TObject): Boolean;
begin
  Result := true;
  if not Result then
    Enabled := False;
end;

procedure TMongoSelectEdit.UpdateTarget(Target: TObject);
begin
  Enabled := true;
end;

{TMongoLimpar}

procedure TMongoLimpar.ExecuteTarget(Target: TObject);
begin
  try
    MongoQuery.LimparLayout(FLayout);
  Except
    on E : Exception do
      ShowMessage(E.Message);
  end;
end;

function TMongoLimpar.HandlesTarget(Target: TObject): Boolean;
begin
  Result := true;
  if not Result then
    Enabled := False;
end;

procedure TMongoLimpar.UpdateTarget(Target: TObject);
begin
  Enabled := true;
end;

procedure Register;
begin
  RegisterActions('Mongo Components', [TMongoInsert,
                                       TMongoUpdate,
                                       TMongoDelete,
                                       TMongoSelect,
                                       TMongoSelectEdit,
                                       TMongoLimpar],
                                       nil);
end;

end.


