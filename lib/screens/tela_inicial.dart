import 'package:flutter/material.dart';
import '../data/database.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/navegacao_abas.dart';
import 'tela_subcategorias.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text('Litoral Piauiense'),
      ),
      body: ListView.builder(
        itemCount: cidadesDisponiveis.length,
        itemBuilder: (context, indice) {
          final cidade = cidadesDisponiveis[indice];
          return ListTile(
            title: Text(cidade.nome),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaSubcategorias(cidadeId: cidade.id),
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
