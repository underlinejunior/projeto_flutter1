import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:litoral_turistico/models/pontos.dart';

final favoritePontoProvider = FutureProvider<List<Ponto>>((ref) async {
  final favoritesRef = FirebaseDatabase.instance.ref('Favoritos');
  final snapshot = await favoritesRef.get();
  
  if (!snapshot.exists) {
    return []; 
  }

  final favoriteData = snapshot.value as Map<dynamic, dynamic>;
  List<Ponto> pontos = [];

  // Mapeamento dos pontos favoritos
  favoriteData.forEach((key, value) {
    if (value is Map) {
      final ponto = Ponto.fromMap(key, value as String);
      pontos.add(ponto);
    } else {
      print('Erro ao mapear ponto favorito: $key');
    }
  });

  return pontos;
});
