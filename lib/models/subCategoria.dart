class SubCategoria {
  const SubCategoria({
    required this.id,
    required this.nome,
    required this.cidadeId,
    required this.pontos,
  });

  final String id;
  final String nome;
  final String cidadeId;
  final List<String> pontos;
}
