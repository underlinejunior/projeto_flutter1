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
}
