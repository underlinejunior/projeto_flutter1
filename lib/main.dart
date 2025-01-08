import 'package:flutter/material.dart';
import '../screens/tela_inicial.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
  const ProviderScope(child: MyApp()),
  );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Litoral Turistico',
      theme: ThemeData(
        primarySwatch:
            Colors.blue, // Define a cor primária da aplicação
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 126, 181, 253), // Define a cor de fundo do Scaffold
        bottomNavigationBarTheme: const BottomNavigationBarThemeData( // Define a cor de fundo do BottomNavigationBar
          backgroundColor: Color.fromARGB(255, 126, 181, 253),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blueAccent,
        ),
        drawerTheme: const DrawerThemeData(// Define a cor de fundo do Drawer - Menu Lateral
          backgroundColor: Color.fromARGB(255, 126, 181, 253),
        ),
      ),
      home: const TelaInicial(),
    );
  }
}
