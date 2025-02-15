import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:litoral_turistico/screens/tela_subCategoria.dart';
import 'package:litoral_turistico/widgets/menu_lateral.dart';
import 'package:litoral_turistico/widgets/navegacao_abas.dart'; // Importando o widget de menu lateral

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Future<List<String>> _fetchCidades() async {
    try {
      final snapshot = await FirebaseDatabase.instance.ref('Cidades').get();
      if (snapshot.exists && snapshot.value != null) {
        final cidadesData = snapshot.value as Map<dynamic, dynamic>;
        final List<String> cidades = cidadesData.entries.map((entry) {
          final cidadeMap = entry.value as Map<dynamic, dynamic>;
          return cidadeMap['nome'] as String;
        }).toList();
        return cidades;
      } else {
        return [];
      }
    } catch (e) {
      print('Erro ao buscar cidades: $e');
      return [];
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Litoral Piauiense',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 5,
        centerTitle: true,
      ),
      drawer: const MenuLateral(), // Usando o widget MenuLateral
      body: FutureBuilder<List<String>>(
        future: _fetchCidades(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
                strokeWidth: 4,
              ),
            );
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar cidades.'));
          }

          final cidades = snapshot.data ?? [];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: cidades.length,
              itemBuilder: (context, index) {
                final cidade = cidades[index];
                final cidadeId = 'cidade${index + 1}';
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    title: Text(
                      cidade,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Icon(
                      Icons.location_city,
                      color: Colors.blueAccent,
                      size: 30,
                    ),
                    tileColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaSubcategorias(
                              cidade: cidade, cidadeId: cidadeId),
                        ),
                      );
                    },
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
