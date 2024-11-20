import 'package:flutter/material.dart';
import '../data/database.dart';
import 'tela_pontos.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/navegacao_abas.dart';

class TelaSubcategorias extends StatelessWidget {
  final String cidadeId;

  const TelaSubcategorias({super.key, required this.cidadeId});

  @override
  Widget build(BuildContext context) {
    final subcategorias = tiposDePontosHistoricos
        .where((subcategoria) => subcategoria.cidadeId == cidadeId)
        .toList();

    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title:  Text('Subcategorias de ${cidadesDisponiveis.firstWhere((cidade) => cidade.id == cidadeId).nome}'),
        
      ),
      body: ListView.builder(
        itemCount: subcategorias.length,
        itemBuilder: (context, indice) {
          final subcategoria = subcategorias[indice];
          return ListTile(
            title: Text(subcategoria.nome),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaPontos(subCategoriaId: subcategoria.id),
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
