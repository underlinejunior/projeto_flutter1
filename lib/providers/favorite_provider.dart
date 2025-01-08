import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litoral_turistico/models/pontos.dart';

class FavoritePontosNotifier extends StateNotifier<List<Ponto>> {
  FavoritePontosNotifier() : super([]);

  void togglePontoFavoriteStatus(Ponto ponto, BuildContext context) {
    final pontoIsFavorite = state.contains(ponto);

    if (pontoIsFavorite) {
      // Remove o ponto dos favoritos
      state = state.where((m) => m.id != ponto.id).toList();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Removido dos favoritos!'),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {
              // Exibe outra snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Ação desfeita!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ),
      );
    } else {
      // Adiciona o ponto aos favoritos
      state = [...state, ponto];
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Adicionado aos favoritos!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}

final favoritePontoProvider =
    StateNotifierProvider<FavoritePontosNotifier, List<Ponto>>((ref) {
  return FavoritePontosNotifier();
});
