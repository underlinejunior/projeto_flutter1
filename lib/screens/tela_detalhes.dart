import 'package:flutter/material.dart';
import '../data/database.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/navegacao_abas.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';//riverpod
import 'package:litoral_turistico/providers/favorite_provider.dart';//provider de favoritos

class TelaDetalhes extends ConsumerWidget  {
  final String pontoId;

  const TelaDetalhes({super.key, required this.pontoId});
  

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ponto = pontosDeInteresse.firstWhere((ponto) => ponto.id == pontoId);

    final favoritePontos = ref.watch(favoritePontoProvider);//FAVORITOS
    final isFavorite = favoritePontos.contains(ponto);//FAVORITOS

    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        actions: [
          IconButton(
          onPressed: (){
            ref.read(favoritePontoProvider.notifier).togglePontoFavoriteStatus(ponto, context);
          },
           icon: Icon(
            isFavorite ? Icons.star : Icons.star_border,
            color: isFavorite ? Colors.yellowAccent : Colors.white,
           ),
           padding: const EdgeInsets.only(right: 20.0),
        )],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          cidadesDisponiveis
                            .firstWhere((cidade) => cidade.id == ponto.cidadeId)
                            .nome,
        ),
      ),
      body: Container(
  width: double.infinity,
  height: MediaQuery.of(context).size.height, // Garante que ocupe toda a altura da tela
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.blueAccent, Colors.white],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  child: SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          const SizedBox(height: 10),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      ponto.urlImagem,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Text(
                        ponto.nome,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                           Icon(Icons.description, color: Colors.blue),
                           SizedBox(width: 10),
                           Text(
                            'Descrição:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        ponto.descricao,
                        style: const TextStyle(fontSize: 16),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.blue),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'lat: ${ponto.localizacao.latitude} / long: ${ponto.localizacao.longitude}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.schedule, color: Colors.blue),
                          const SizedBox(width: 10),
                          const Text(
                            'Melhor Horário:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ponto.melhorHorarioParaVisitar,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavegacaoAbas(),
    );
  }
}
