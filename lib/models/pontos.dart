import 'localizacao.dart';
class Ponto {
 const Ponto({
   required this.id,
   required this.nome,
   required this.descricao,
   required this.cidadeId,
   required this.subCategoriaId,
   required this.urlImagem,
   required this.localizacao,
   required this.caracteristicas,
   required this.melhorHorarioParaVisitar,
 });

 final String id;
 final String nome;
 final String descricao;
 final String cidadeId;
 final String subCategoriaId;
 final String urlImagem;
 final Localizacao localizacao;
 final List<String> caracteristicas;
 final String melhorHorarioParaVisitar;
 }
