import 'package:flutter/material.dart';
import '../data/database.dart';
import '../screens/tela_detalhes.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/navegacao_abas.dart';


class TelaPontos extends StatelessWidget {
  final String subCategoriaId;

  const TelaPontos({super.key, required this.subCategoriaId});

  @override
  Widget build(BuildContext context) {
    final pontos = pontosDeInteresse
        .where((ponto) => ponto.subCategoriaId == subCategoriaId)
        .toList();

    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: 
        Text(' ${tiposDePontosHistoricos.firstWhere((subcategoria) => subcategoria.id == subCategoriaId).nome} de ${cidadesDisponiveis.firstWhere((cidade) => cidade.id == pontos.first.cidadeId).nome}'),
      ),
      body: ListView.builder(
        itemCount: pontos.length,
        itemBuilder: (context, indice) {
          final ponto = pontos[indice];
          return ListTile(
            title: Text(ponto.nome),
            subtitle: Text(ponto.descricao),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaDetalhes(pontoId: ponto.id),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: const NavegacaoAbas(),
    );
  }
}
