import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:imobilizado_desktop/Models/usuario.dart';
import 'package:firebase_database/firebase_database.dart';

class CadastroUsuario extends StatefulWidget {
  const CadastroUsuario({super.key});

  @override
  State<CadastroUsuario> createState() => _CadastroUsuarioState();
}

final FormKey = GlobalKey<FormState>();

Usuario usuario = Usuario();

DatabaseReference ref = FirebaseDatabase.instance.ref("Tab_Usuarios");

TextEditingController NomeController = TextEditingController();
TextEditingController EmailController = TextEditingController();
TextEditingController SenhaController = TextEditingController();
TextEditingController FilialController = TextEditingController();

Future<void> criarUsuario(BuildContext context, Usuario usuario) async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  FirebaseAuth auth = FirebaseAuth.instance;
  auth
      .createUserWithEmailAndPassword(
          email: usuario.getEmail, password: usuario.getSenha)
      .then((firebeseuser) {
    print("Criado com sucesso");
    usuario.setIdUsuario = firebeseuser.user!.uid;
    // salvarUsuario(usuario);
  }).catchError((error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Falha ao criar o usuario"),
          actions: [
            ElevatedButton(
                onPressed: (() => Navigator.pop(context)),
                child: const Text("Voltar"))
          ],
        );
      },
    );
  });
}

// void salvarUsuario(Usuario usuario) {
//   ref.set({
//     "nome": usuario.getNome,
//     "uid": usuario.getIdUsuario,
//     "email": usuario.getEmail,
//     "filial": usuario.getfilial
//   });
// }

class _CadastroUsuarioState extends State<CadastroUsuario> {
  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    return MaterialApp(
        home: Scaffold(
      body: Form(
        key: FormKey,
        child: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            child: Container(
                alignment: Alignment.center,
                height: altura > 700
                    ? 500
                    : MediaQuery.of(context).size.width * 0.5,
                width: largura > 960
                    ? 500
                    : MediaQuery.of(context).size.width * 0.5,
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
                  
                  padding:  const EdgeInsets.fromLTRB(50, 100, 50, 100),

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
                      child: Text("Criar Usuario"),
                      onPressed: () {
                        setState(() {
                          usuario.setNome = NomeController.text;
                          usuario.setEmail = EmailController.text;
                          usuario.setSenha = SenhaController.text;
                          usuario.setfilial = FilialController.text;
                        });
                        criarUsuario(context, usuario);
                      },
                    ),
                  ],
                ))),
      ),
    ));
  }
}
