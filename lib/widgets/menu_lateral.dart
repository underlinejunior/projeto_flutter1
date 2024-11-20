import 'package:flutter/material.dart';
import '../screens/tela_sobre.dart';
import '../screens/tela_inicial.dart';
import '../screens/tela_subcategorias.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Center(
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TelaInicial()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text('Parnaíba'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TelaSubcategorias(
                          cidadeId: 'cidade1',
                        )),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text('Luis Correia'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TelaSubcategorias(
                          cidadeId: 'cidade2',
                        )),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text('Cajueiro da Praia'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TelaSubcategorias(
                          cidadeId: 'cidade3',
                        )),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaSobre()),
              );
            },
          ),
        ],
      ),
    );
  }
}
