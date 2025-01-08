import 'package:flutter/material.dart';
import '../data/database.dart';
import '../widgets/navegacao_abas.dart';
import './tela_detalhes.dart';


class TelaSubcategorias extends StatelessWidget {
  final String cidadeId;

  const TelaSubcategorias({super.key, required this.cidadeId});

  @override
  Widget build(BuildContext context) {
    // Obtem a cidade e suas subcategorias
    final cidade = cidadesDisponiveis.firstWhere((cidade) => cidade.id == cidadeId);
    final subCategorias = cidade.subCategorias.map((subCategoriaId) {
      return tiposDePontos.firstWhere((subCategoria) => subCategoria.id == subCategoriaId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Subcategorias - ${cidade.nome}'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: subCategorias.length,
          itemBuilder: (context, index) {
            final subCategoria = subCategorias[index];

            // Filtra pontos turísticos pela subcategoria e cidade
            final pontos = pontosDeInteresse.where((ponto) {
              return ponto.subCategoriaId == subCategoria.id && ponto.cidadeId == cidadeId;
            }).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    subCategoria.nome,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                pontos.isEmpty
                    ? const Center(
                        child: Text(
                          'Nenhum ponto disponível nesta subcategoria.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 3 / 2,
                        ),
                        itemCount: pontos.length,
                        itemBuilder: (context, i) {
                          final ponto = pontos[i];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(pageBuilder: (context, animation ,secondaryAnimation )=>
                                TelaDetalhes(pontoId: ponto.id),//CARREGAMENTO PARA SEGUNDA TELA
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
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12)),
                                      child: Image.asset(
                                        ponto.urlImagem,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) =>
                                            const Icon(Icons.broken_image, size: 40),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      ponto.nome,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ],
            );
          },
        ),
        
      ),
       bottomNavigationBar: const NavegacaoAbas(),
    );
  }
}
