import 'package:flutter/material.dart';
import '../data/database.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/navegacao_abas.dart';

class TelaDetalhes extends StatelessWidget {
  final String pontoId;

  const TelaDetalhes({super.key, required this.pontoId});

  @override
  Widget build(BuildContext context) {
    final ponto = pontosDeInteresse.firstWhere((ponto) => ponto.id == pontoId);
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        title: Text('${ponto.nome} - ${cidadesDisponiveis.firstWhere((cidade) => cidade.id == ponto.cidadeId).nome}'),
      ),
      body: SingleChildScrollView(
        // Envolve o conteúdo em um scroll
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Image.network(
              ponto.urlImagem,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  size: 50,
                  color: Colors.red,
                );
              },
            ),
            Text('Descrição:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(ponto.descricao),

            SizedBox(height: 20),
            Text('Localização:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('lat:${ponto.localizacao.latitude} / long: ${ponto.localizacao.longitude}'),
            SizedBox(height: 20),
            Text(
              'Caracteristicas:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(ponto.caracteristicas.join(', ')),
            SizedBox(height: 20),
            Text(
              'Melhor Horario Para Visitar:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(ponto.melhorHorarioParaVisitar),
            
          ],
        ),
      ),
      bottomNavigationBar: const NavegacaoAbas(),
    );
  }
}
