import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:litoral_turistico/widgets/navegacao_abas.dart';

class TelaDetalhesPonto extends StatefulWidget {
  final String pontoId;
  const TelaDetalhesPonto({super.key, required this.pontoId});

  @override
  _TelaDetalhesPontoState createState() => _TelaDetalhesPontoState();
}

class _TelaDetalhesPontoState extends State<TelaDetalhesPonto> {
  final TextEditingController _comentarioController = TextEditingController();
  late Future<Map<String, dynamic>> _pontoFuture;
  late DatabaseReference _comentariosRef;
  bool _isFavorito = false;
  String? _comentarioEditandoId;
  String? _comentarioEditandoTexto;

  @override
  void initState() {
    super.initState();
    _pontoFuture = _fetchPontoDetalhes();
    _comentariosRef =
        FirebaseDatabase.instance.ref('Comentarios/${widget.pontoId}');
    _checkFavoritoStatus();
  }

  Future<Map<String, dynamic>> _fetchPontoDetalhes() async {
    final pontoSnapshot =
        await FirebaseDatabase.instance.ref('Pontos/${widget.pontoId}').get();
    if (pontoSnapshot.exists && pontoSnapshot.value != null) {
      final pontoData = pontoSnapshot.value as Map<dynamic, dynamic>;
      return pontoData.cast<String, dynamic>();
    } else {
      throw Exception("Ponto não encontrado.");
    }
  }

  Future<void> _adicionarComentario(String comentario) async {
    if (comentario.trim().isEmpty) return;
    final novoComentario = {
      'texto': comentario,
      'data': DateTime.now().toIso8601String(),
    };
    if (_comentarioEditandoId != null) {
      // Editar comentário existente
      await _comentariosRef.child(_comentarioEditandoId!).update(novoComentario);
    } else {
      // Adicionar novo comentário
      await _comentariosRef.push().set(novoComentario);
    }
    _comentarioController.clear();
    setState(() {
      _comentarioEditandoId = null; // Reseta o estado após a edição ou adição
      _comentarioEditandoTexto = null;
    });
  }

  Future<List<Map<String, dynamic>>> _fetchComentarios() async {
    final snapshot = await _comentariosRef.get();
    if (snapshot.exists) {
      final comentariosData = snapshot.value as Map<dynamic, dynamic>;
      return comentariosData.entries.map((e) {
        final data = e.value as Map<dynamic, dynamic>;
        return {'id': e.key, ...data.cast<String, dynamic>()};
      }).toList();
    }
    return [];
  }

  Future<void> _toggleFavorito() async {
    final favoritoRef = FirebaseDatabase.instance.ref('Favoritos/${widget.pontoId}'); // Favoritos globais

    setState(() {
      _isFavorito = !_isFavorito;
    });

    if (_isFavorito) {
      // Marca o ponto como favorito
      await favoritoRef.set(true);
    } else {
      // Remove o ponto dos favoritos
      await favoritoRef.remove();
    }
  }

  Future<void> _checkFavoritoStatus() async {
    final favoritoRef = FirebaseDatabase.instance.ref('Favoritos/${widget.pontoId}'); // Referência global

    final snapshot = await favoritoRef.get();
    setState(() {
      _isFavorito = snapshot.exists; // Verifica se o ponto está nos favoritos
    });
  }

  Future<void> _excluirComentario(String comentarioId) async {
    final comentarioRef = _comentariosRef.child(comentarioId);
    await comentarioRef.remove(); // Remove o comentário
    setState(() {});
  }

  void _editarComentario(String comentarioId, String comentarioTexto) {
    setState(() {
      _comentarioEditandoId = comentarioId;
      _comentarioEditandoTexto = comentarioTexto;
      _comentarioController.text = comentarioTexto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Ponto'),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorito ? Icons.star : Icons.star_border,
              color: _isFavorito ? Colors.yellow : Colors.white,
            ),
            onPressed: _toggleFavorito,
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _pontoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
                child: Text('Erro ao carregar dados do ponto.'));
          }

          final ponto = snapshot.data;
          if (ponto == null) {
            return const Center(child: Text('Ponto não encontrado.'));
          }

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              if (ponto['urlImagem'] != null && ponto['urlImagem'].isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    ponto['urlImagem'],
                    fit: BoxFit.cover,
                    height: 250,
                  ),
                ),
              const SizedBox(height: 16),
              Text(
                ponto['nome'] ?? 'Nome não disponível',
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      blurRadius: 4,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.description, color: Colors.blueAccent, size: 30),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        ponto['descricao'] ?? 'Descrição não disponível',
                        style: const TextStyle(
                            fontSize: 18, color: Colors.black87),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.green, size: 30),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Localização: ${ponto['localizacao'] ?? 'Localização não disponível'}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.orange, size: 30),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Melhor horário para visitar: ${ponto['melhorHorarioParaVisitar'] ?? 'Horário não disponível'}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _comentarioController,
                decoration: InputDecoration(
                  labelText: _comentarioEditandoTexto != null
                      ? 'Editar comentário'
                      : 'Adicione um comentário',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send, color: Colors.blueAccent),
                    onPressed: () =>
                        _adicionarComentario(_comentarioController.text),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Comentários:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              FutureBuilder<List<Map<String, dynamic>>>( 
                future: _fetchComentarios(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final comentarios = snapshot.data ?? [];
                  if (comentarios.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Nenhum comentário ainda.'),
                    );
                  }
                  comentarios.sort((a, b) => DateTime.parse(b['data'])
                      .compareTo(DateTime.parse(a['data'])));

                  return Container(
                    height: 200,
                    padding: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: .2),
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      itemCount: comentarios.length,
                      itemBuilder: (context, index) {
                        final comentario = comentarios[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          child: ListTile(
                            title: Text(comentario['texto']),
                            subtitle: Text('Postado em: ${comentario['data']}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    _editarComentario(
                                        comentario['id'], comentario['texto']);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    _excluirComentario(comentario['id']);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const NavegacaoAbas(),
    );
  }
}
