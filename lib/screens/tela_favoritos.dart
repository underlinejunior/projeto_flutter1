import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:litoral_turistico/screens/tela_detalhes.dart'; // Certifique-se de que o caminho para TelaDetalhes está correto
import 'package:litoral_turistico/widgets/navegacao_abas.dart';

class TelaFavoritos extends StatefulWidget {
  const TelaFavoritos({super.key});

  @override
  _TelaFavoritosState createState() => _TelaFavoritosState();
}

class _TelaFavoritosState extends State<TelaFavoritos> {
  List<Map<String, dynamic>> _favoritos = [];

  @override
  void initState() {
    super.initState();
    _loadFavoritos();
  }

  // Função para carregar os favoritos com dados detalhados
  Future<void> _loadFavoritos() async {
    try {
      final favoritosSnapshot =
          await FirebaseDatabase.instance.ref('Favoritos').get();

      if (favoritosSnapshot.exists) {
        final favoritosData = favoritosSnapshot.value as Map<dynamic, dynamic>;
        List<Map<String, dynamic>> pontosFavoritos = [];

        for (var pontoId in favoritosData.keys) {
          final pontoSnapshot =
              await FirebaseDatabase.instance.ref('Pontos/$pontoId').get();
          if (pontoSnapshot.exists) {
            final pontoData = pontoSnapshot.value as Map<dynamic, dynamic>;

            // Adiciona o id do ponto
            pontoData['id'] = pontoId;

            // Adiciona o ponto detalhado à lista
            pontosFavoritos.add(pontoData.cast<String, dynamic>());
          }
        }

        setState(() {
          _favoritos = pontosFavoritos;
        });
      } else {
        setState(() {
          _favoritos = [];
        });
      }
    } catch (e) {
      print('Erro ao carregar favoritos: $e');
    }
  }

  // Função para excluir o ponto dos favoritos
  Future<void> _excluirFavorito(String pontoId) async {
    try {
      // Remove o ponto da chave Favoritos
      await FirebaseDatabase.instance.ref('Favoritos/$pontoId').remove();

      // Recarregar a lista de favoritos
      _loadFavoritos(); // Recarrega os favoritos após a exclusão
    } catch (e) {
      print('Erro ao excluir favorito: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: _favoritos.isEmpty
          ? const Center(child: Text('Nenhum favorito encontrado.'))
          : ListView.builder(
              itemCount: _favoritos.length,
              itemBuilder: (context, index) {
                final ponto = _favoritos[index];

                // Garantir que os valores necessários não sejam nulos
                final pontoId = ponto['id'] ?? '';
                final nome = ponto['nome'] ?? 'Nome não disponível';
                final descricao =
                    ponto['descricao'] ?? 'Descrição não disponível';
                final urlImagem = ponto['urlImagem'];

                return Card(
                  child: ListTile(
                    title: Text(nome),
                    subtitle: Text(descricao),
                    leading: urlImagem != null
                        ? Image.network(
                            urlImagem,
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          )
                        : const Icon(Icons.image, size: 100),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _excluirFavorito(pontoId);
                      },
                    ),
                    onTap: () {
                      // Navegação para tela de detalhes
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TelaDetalhesPonto(pontoId: pontoId), // Passa o pontoId corretamente
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
