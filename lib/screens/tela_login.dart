import 'package:flutter/material.dart';  
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:litoral_turistico/screens/tela_inicial.dart';  

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  
  @override  
  _LoginPageState createState() => _LoginPageState();  
}  

class _LoginPageState extends State<LoginPage> {  
  final FirebaseAuth _auth = FirebaseAuth.instance;  
  final TextEditingController _emailController = TextEditingController();  
  final TextEditingController _passwordController = TextEditingController();  
  bool _isLoading = false;

  // FocusNodes para os campos de email e senha
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  // Função para login com email e senha
  Future<void> _login() async {  
    setState(() {
      _isLoading = true;
    });
    try {  
      await _auth.signInWithEmailAndPassword(  
        email: _emailController.text,  
        password: _passwordController.text,  
      );  

      // Redirecionar para a tela inicial após o login  
      Navigator.pushReplacement(  
        context,  
        MaterialPageRoute(builder: (context) => TelaPrincipal()),  
      );  
    } catch (e) {  
      print('Erro ao fazer login: $e');  
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(  
        content: Text('Erro ao fazer login: ${e.toString()}'),  
      ));  
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }  

  // Função para login com o Google
  Future<void> _loginWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // O usuário cancelou o login
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      // Redirecionar para a tela inicial após o login com o Google
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TelaPrincipal()),
      );
    } catch (e) {
      print('Erro ao fazer login com o Google: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao fazer login com o Google: ${e.toString()}'),
      ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(
        title: const Text("Login", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),  
      body: Padding(  
        padding: const EdgeInsets.all(16.0),  
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: [  
            // Campo de email com FocusNode
            TextFormField(  
              controller: _emailController,  
              focusNode: _emailFocusNode,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: _emailFocusNode.hasFocus ? Colors.blueAccent : Colors.blueAccent,
                    width: 2,
                  ),
                ),
                prefixIcon: Icon(Icons.email, color: _emailFocusNode.hasFocus ? Colors.blueAccent : Colors.blueAccent),
              ),  
              keyboardType: TextInputType.emailAddress,  
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu email';
                }
                return null;
              },
            ),  
            const SizedBox(height: 16),
            // Campo de senha com FocusNode
            TextFormField( 
              controller: _passwordController,  
              focusNode: _passwordFocusNode,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: _passwordFocusNode.hasFocus ? Colors.blueAccent : Colors.blueAccent,
                    width: 2,
                  ),
                ),
                prefixIcon: Icon(Icons.lock, color: _passwordFocusNode.hasFocus ? Colors.blueAccent : Colors.blueAccent),
              ),  
              obscureText: true,  
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira sua senha';
                }
                return null;
              },
            ),  
            const SizedBox(height: 24),
            _isLoading
                ? CircularProgressIndicator()
                : Column(
                    children: [
                      ElevatedButton(  
                        onPressed: _login,  
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            
                          ),
                        ),  
                        child: const Text('Login com Email', style: TextStyle(color: Colors.black)),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(  
                        onPressed: _loginWithGoogle,  
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          side: BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),  
                        child: const Text('Login com Google', style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
          ],  
        ),  
      ),  
    );  
  }  
}  
