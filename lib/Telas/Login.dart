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
double largura = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: Scaffold(
            body: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/TelaLoginImg.png'),
                      fit: BoxFit.fill),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: largura > 960? 500: MediaQuery.of(context).size.width*0.9,
                  decoration:  BoxDecoration(
                    color: const Color(0xfffcfcfc),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [ BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      blurRadius: 1,
                      offset:Offset(0,3),
                      blurStyle: BlurStyle.inner,
                      spreadRadius: 2.0
                   )],
                  ),
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                              prefixIcon: Icon(Icons.person)),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: TextFormField(
                        controller: Senha,
                        decoration: const InputDecoration(
                          hintText: "Digite a sua senha",
                          labelText: "Senha",
                          prefixIcon: Icon(Icons.lock),
                        
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(50, 25, 50, 25),
                        child: ElevatedButton(
                            child: const Text("Entrar"),
                            onPressed: () {
                              Navigator.pushNamed(context, '/Home');
                            }))
                  ],
                )))));
  }
}
