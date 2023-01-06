import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CadastroUsuario extends StatefulWidget {
  const CadastroUsuario({super.key});

  @override
  State<CadastroUsuario> createState() => _CadastroUsuarioState();
}

final FormKey = GlobalKey<FormState>();

TextEditingController NomeController = TextEditingController();
TextEditingController EmailController = TextEditingController();
TextEditingController SenhaController = TextEditingController();

class _CadastroUsuarioState extends State<CadastroUsuario> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Form(
        key: FormKey,
        child: Container(
          alignment: Alignment.center,
            color: Colors.amber,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.8 ,
              width: MediaQuery.of(context).size.width * 0.3,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child: TextFormField(
                      controller: NomeController,
                      decoration: const InputDecoration(
                        hintText: "Digite o nome do usuario",
                        labelText:"Nome do funcionario",
                        prefixIcon: Icon(Icons.person)
                      ),
                    )),
                    Padding(padding:EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child: TextFormField(
                      controller: EmailController,
                      decoration: const InputDecoration(
                        hintText: "Dinite o email de acesso",
                        labelText:"Email",
                        prefixIcon: Icon(Icons.email)
                      )
                    )),
                    Padding(padding:EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child:TextFormField(controller: SenhaController,
                    decoration: const InputDecoration(
                      hintText:"Digite a senha do usuario",
                      labelText: "Senha",
                      prefixIcon: Icon(Icons.lock)
                    )))
              ]),
            )),
      ),
    ));
  }
}
