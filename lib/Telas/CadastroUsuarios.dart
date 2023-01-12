import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:imobilizado_desktop/Models/Usuario.dart';

class CadastroUsuario extends StatefulWidget {
  const CadastroUsuario({super.key});

  @override
  State<CadastroUsuario> createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  final FormKey = GlobalKey<FormState>();

  Usuario usuario = Usuario();
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController NomeController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController SenhaController = TextEditingController();
  TextEditingController FilialController = TextEditingController();

  Future getUsuarios() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection("TABPESSOAS").get();
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
      body: Container(
          alignment: Alignment.center,
          color: Colors.amber,
          child: Row(
            children: [
              Expanded(
                  child: FutureBuilder(
                future: getUsuarios(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Text("Loading ..."),
                    );
                  } else {
                    ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((_, index) {
                          return ListTile(
                            title: Text(snapshot.data[index]),
                          );
                        }));
                  }
                },
              )),
              Expanded(
                child: Form(
                    key: FormKey,
                    child: Container(
                        alignment: Alignment.center,
                        height: altura > 700
                            ? 500
                            : MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.1,
                        decoration: BoxDecoration(
                          color: const Color(0xfffcfcfc),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                blurRadius: 1,
                                offset: Offset(0, 3),
                                blurStyle: BlurStyle.inner,
                                spreadRadius: 2.0)
                          ],
                        ),
                        child: ListView(
                          padding: const EdgeInsets.fromLTRB(50, 100, 50, 100),
                          children: [
                            TextFormField(
                              controller: NomeController,
                              decoration: const InputDecoration(
                                  hintText: "Digite o nome do usuario",
                                  labelText: "Nome do funcionario",
                                  prefixIcon: Icon(Icons.person)),
                            ),
                            TextFormField(
                                controller: EmailController,
                                decoration: const InputDecoration(
                                    hintText: "Dinite o email de acesso",
                                    labelText: "Email",
                                    prefixIcon: Icon(Icons.email))),
                            TextFormField(
                                controller: SenhaController,
                                decoration: const InputDecoration(
                                    hintText: "Digite a senha do usuario",
                                    labelText: "Senha",
                                    prefixIcon: Icon(Icons.lock))),
                            TextFormField(
                                controller: FilialController,
                                decoration: const InputDecoration(
                                    hintText: "Digite a filial do usuario",
                                    labelText: "Filial",
                                    prefixIcon: Icon(Icons.local_activity))),
                            ElevatedButton(
                              child: const Text("Criar Usuario"),
                              onPressed: () {
                                cadastrar(usuario);
                              },
                            ),
                          ],
                        ))),
              ),
            ],
          )),
    ));
  }

  cadastrar(Usuario usuario) async {
    try {
      UserCredential userCredencial = await auth.createUserWithEmailAndPassword(
          email: EmailController.text, password: SenhaController.text);
      if (userCredencial != null) {
        userCredencial.user!.updateDisplayName(NomeController.text);

        db.collection('TABPESSOAS').doc().set({
          "Nome": NomeController.text.toString(),
          "Email": EmailController.text.toString(),
          "Filial": FilialController.text.toString(),
          "uid": userCredencial.user!.uid
        });
        formClear();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Usuario Criado'),
          backgroundColor: Colors.green,
        ));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Crie uma senha mais forte'),
          backgroundColor: Colors.redAccent,
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Esse e-mail ja foi cadastrado'),
          backgroundColor: Colors.redAccent,
        ));
      }
    }
  }

  formClear() {
    setState(() {
      NomeController.clear();
      EmailController.clear();
      SenhaController.clear();
      FilialController.clear();
    });
  }
}
