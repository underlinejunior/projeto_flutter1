class SubCategoria {
  const SubCategoria({
    required this.id,
    required this.nome,
    required this.pontos,
  });

  final String id;
  final String nome;
  final List<String> pontos;

  factory SubCategoria.fromMap(Map<String, dynamic> map, String id) {
    return SubCategoria(
      id: id,
      nome: map['nome'] as String,
      pontos: List<String>.from(map['pontos'] as List<dynamic>),
    );
  }
}
