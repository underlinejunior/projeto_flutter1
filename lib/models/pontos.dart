class Ponto {
  final String id;
  final String nome;
  final String descricao;
  final String urlImagem;
  bool isFavorito; // Campo para armazenar o status de favorito

  Ponto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.urlImagem,
    this.isFavorito = false,  // Inicializa com false
  });

  // Método para criar um Ponto a partir de um mapa
  factory Ponto.fromMap(Map<String, dynamic> map, String id) {
    return Ponto(
      id: id,
      nome: map['nome'],
      descricao: map['descricao'],
      urlImagem: map['urlImagem'],
      isFavorito: map['isFavorito'] ?? false, // Adiciona o campo isFavorito
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'descricao': descricao,
      'urlImagem': urlImagem,
      'isFavorito': isFavorito, // Inclui o campo isFavorito ao salvar no Firebase
    };
  }
}
