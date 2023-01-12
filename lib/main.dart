import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:imobilizado_desktop/Telas/CadastroUsuarios.dart';
import 'package:imobilizado_desktop/Telas/Home.dart';
import 'package:imobilizado_desktop/Telas/ListaUsuarios.dart';
import 'package:imobilizado_desktop/Telas/Relatorio.dart';
import 'firebase_options.dart';
import 'package:imobilizado_desktop/Telas/Login.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyWebApp());
}

class MyWebApp extends StatelessWidget {
  const MyWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/Home': (context) => Home(),
        '/Cadastro': (context) => CadastroUsuario(),
        '/ListaUsuario': (context) => ListaUsuarios(),
        '/Relatorio': (context) => Relatorio()
      },
    );
  }
}
