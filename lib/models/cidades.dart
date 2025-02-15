class Cidade {
  const Cidade(
    {required this.id,
    required this.nome,
    required this.subCategorias,
    }
  );

  final String id;
  final String nome;
  final List<String> subCategorias;

factory Cidade.fromMap(Map<String, dynamic> map, String id) {
    return Cidade(
      id: id,
      nome: map['nome'] as String,
      subCategorias: List<String>.from(map['subCategorias'] as List<dynamic>),
    );
  }

}
