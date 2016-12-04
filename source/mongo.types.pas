{ *************************************************************************** }
{ Data:  04/12/2016 }
{ Resenha: Extraido da MongoQuery para reduzir acoplamento
  { *************************************************************************** }
{ Licen�a segue a mesma estabelecida no c�digo original determinada pelo seu }
{ autor }
{ }
{ *************************************************************************** }
{

  Altera��es:

  + criado mongo.types para separar os tipos comuns; (por: Amarildo Lacerda)
}

unit mongo.types;

interface

type
  TCampo = (Texto, Numerico, Moeda, DataHora, Booleano);
  TMongoOperacao = (moBrowse,moInsert, moUpdate, moDelete);

implementation

end.
