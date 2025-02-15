import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:litoral_turistico/screens/tela_detalhes.dart';
import 'package:litoral_turistico/widgets/navegacao_abas.dart';

class TelaSubcategorias extends StatelessWidget {
  final String cidade;
  final String cidadeId;
  const TelaSubcategorias({super.key, required this.cidade, required this.cidadeId});

  Future<Map<String, List<Map<String, dynamic>>>> _fetchSubcategoriasComPontos() async {
    try {
      final cidadeSnapshot = await FirebaseDatabase.instance.ref('Cidades/$cidadeId').get();
      final pontosSnapshot = await FirebaseDatabase.instance.ref('Pontos').get();

      if (cidadeSnapshot.exists && cidadeSnapshot.value != null && pontosSnapshot.exists && pontosSnapshot.value != null) {
        final cidadeData = cidadeSnapshot.value as Map<dynamic, dynamic>;
        final pontosData = pontosSnapshot.value as Map<dynamic, dynamic>;

        final subcategorias = List<String>.from(cidadeData['subCategorias'] ?? []);
        final Map<String, List<Map<String, dynamic>>> subcategoriasComPontos = {};

        pontosData.forEach((key, ponto) {
          final pontoMap = ponto as Map<dynamic, dynamic>;
          final pontoCidadeId = pontoMap['cidadeId'] as String;
          final subCategoriaId = pontoMap['subCategoriaId'] as String;

          if (pontoCidadeId == cidadeId && subcategorias.contains(subCategoriaId)) {
            final pontoDetalhado = {
              ...pontoMap.cast<String, dynamic>(),
              'id': key
            };

            if (!subcategoriasComPontos.containsKey(subCategoriaId)) {
              subcategoriasComPontos[subCategoriaId] = [];
            }
            subcategoriasComPontos[subCategoriaId]!.add(pontoDetalhado);
          }
        });
        return subcategoriasComPontos;
      } else {
        print("Dados do Firebase não encontrados.");
        return {};
      }
    } catch (e) {
      print('Erro ao buscar subcategorias e pontos: $e');
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pontos Turísticos em $cidade'),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, List<Map<String, dynamic>>>>(
        future: _fetchSubcategoriasComPontos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.blueAccent));
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar pontos.'));
          }

          final subcategoriasComPontos = snapshot.data ?? {};
          if (subcategoriasComPontos.isEmpty) {
            return const Center(child: Text('Nenhum ponto encontrado.'));
          }

          final Map<String, String> subcategoriaNomes = {
            'historicosCulturais': 'Históricos e Culturais',
            'naturaisEcologicos': 'Naturais e Ecológicos',
          };

          final Map<String, IconData> subcategoriaIcones = {
            'historicosCulturais': Icons.history_edu,
            'naturaisEcologicos': Icons.nature,
          };

          return ListView.builder(
            itemCount: subcategoriasComPontos.keys.length,
            itemBuilder: (context, index) {
              final subCategoriaId = subcategoriasComPontos.keys.elementAt(index);
              final pontos = subcategoriasComPontos[subCategoriaId]!;

              final subcategoriaNome = subcategoriaNomes[subCategoriaId] ?? 'Subcategoria Desconhecida';
              final subcategoriaIcon = subcategoriaIcones[subCategoriaId] ?? Icons.category;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(subcategoriaIcon, size: 30, color: Colors.blueAccent),
                        const SizedBox(width: 8),
                        Text(
                          subcategoriaNome,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: pontos.map((ponto) {
                        return Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: ponto['urlImagem'] != null
                                  ? Image.network(
                                      ponto['urlImagem'],
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(Icons.image, size: 80, color: Colors.grey),
                            ),
                            title: Text(
                              ponto['nome'] as String,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                ponto['descricao'] as String,
                                style: const TextStyle(fontSize: 14, color: Colors.black54),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TelaDetalhesPonto(pontoId: ponto['id']),
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),
                  ],
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
