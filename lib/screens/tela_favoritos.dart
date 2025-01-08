import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:litoral_turistico/data/database.dart';
import '../providers/favorite_provider.dart';
import '../screens/tela_detalhes.dart';

import '../widgets/navegacao_abas.dart';

class TelaFavoritos extends ConsumerWidget {
  const TelaFavoritos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritePontos = ref.watch(favoritePontoProvider); //FAVORITOS
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: ListView.builder(
        itemCount: favoritePontos.length,
        itemBuilder: (context, index) {
          final ponto = favoritePontos[index];
          return Card(
            child: ListTile(
              title: Text(ponto.nome +
                  " - " +
                  cidadesDisponiveis
                      .firstWhere((cidade) => cidade.id == ponto.cidadeId)
                      .nome),
              subtitle: Text(ponto.descricao),
              trailing: IconButton(
                icon: const Icon(
                  Icons.star,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  ref
                      .read(favoritePontoProvider.notifier)
                      .togglePontoFavoriteStatus(ponto, context);
                },
              ),
              leading: Image.asset(
                ponto.urlImagem,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        TelaDetalhes(pontoId: ponto.id),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: const NavegacaoAbas(),
    );
  }
}
