import 'package:flutter/material.dart';
import '../data/database.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/navegacao_abas.dart';
import 'tela_subCategoria.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: const Text('Litoral Piauiense'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: cidadesDisponiveis.length,
          itemBuilder: (context, indice) {
            final cidade = cidadesDisponiveis[indice];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(cidade.nome),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(pageBuilder: (context, animation ,secondaryAnimation )=>
                      TelaSubcategorias(cidadeId: cidade.id),//CARREGAMENTO PARA SEGUNDA TELA
                      transitionsBuilder: (context,animation, secondaryAnimation,child){
                        var begin = const Offset(1.0, 0.0);
                        var end = Offset.zero;
                        var curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      }
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const NavegacaoAbas(),
    );
  }
}
