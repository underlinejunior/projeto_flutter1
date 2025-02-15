class Localizacao {
  final double latitude;
  final double longitude;

  const Localizacao({
    required this.latitude,
    required this.longitude,
  });

  // Método para criar a Localizacao a partir de um mapa
  factory Localizacao.fromMap(Map<String, dynamic> map) {
    return Localizacao(
      latitude: map['latitude'] ?? 0.0,
      longitude: map['longitude'] ?? 0.0,
    );
  }

  // Método para converter Localizacao em mapa
  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
