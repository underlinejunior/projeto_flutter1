import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:litoral_turistico/screens/tela_login.dart';
import 'package:litoral_turistico/screens/tela_detalhes.dart'; 
import 'package:litoral_turistico/screens/tela_subCategoria.dart';
import 'package:litoral_turistico/widgets/navegacao_abas.dart';
import 'package:litoral_turistico/widgets/menu_lateral.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Litoral Turístico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 126, 181, 253),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 126, 181, 253),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blueAccent,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Color.fromARGB(255, 126, 181, 253),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => TelaPrincipal(), // Tela principal que agora vai usar os widgets
        '/detalhes': (context) => TelaDetalhesPonto(pontoId: 'sampleId'), // Exemplo
        '/subcategorias': (context) => TelaSubcategorias(cidade: 'cidade', cidadeId: 'id'),
      },
    );
  }
}

// TelaPrincipal alterada para usar navegação por abas e menu lateral
class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Litoral Turístico'),
      ),
      drawer: const MenuLateral(), // Usando o widget MenuLateral
      body: const NavegacaoAbas(), // Usando o widget NavegacaoPorAbas
    );
  }
}
