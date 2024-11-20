import 'package:flutter/material.dart';
import '../screens/tela_inicial.dart';
import '../screens/tela_sobre.dart';

class NavegacaoAbas extends StatelessWidget {
  const NavegacaoAbas({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
      
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Sobre',
        ),
      ],
      currentIndex: 0, // Índice da aba atual
      onTap: (index) {
        // Lógica para navegar entre as abas
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const TelaInicial()),
          );
          
        } else if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const TelaSobre()),
            
          );
        }
      },
      backgroundColor: Colors.blueAccent,
      selectedItemColor: Colors.white,
      selectedLabelStyle: const TextStyle(color: Colors.white),
      unselectedItemColor: Colors.white,
    );
  }
}