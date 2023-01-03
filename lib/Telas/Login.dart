import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:imobilizado_desktop/Telas/Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController Email = TextEditingController();
TextEditingController Senha = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff931111),
            title: const Text("Imobilizado"),
          ),
          body: Container(
            child: Row(children: [
              Expanded(child: Image.asset('assets/TelaLoginImg.png')),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 25),
                    child: Text("Gestão de imobilizado"),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(25),
                      child: TextFormField(
                        controller: Email,
                        decoration: const InputDecoration(
                          hintText: "Digite seu E-mail",
                          labelText: "Email",
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: TextFormField(
                      controller: Senha,
                      decoration: const InputDecoration(
                        hintText: "Digite a sua senha",
                        labelText: "Senha",
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(50, 25, 50, 25),
                      child: ElevatedButton(
                          child: Text("Entrar"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          }))
                ],
              ))
            ]),
          )),
    );
  }
}
