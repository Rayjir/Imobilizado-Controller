import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imobilizado_desktop/Models/Usuario.dart';
import 'package:imobilizado_desktop/Telas/Home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController EmailController = TextEditingController();
TextEditingController SenhaController = TextEditingController();
Usuario usuario = Usuario();

bool passwordVisible = false;

final _FormKey = GlobalKey<FormState>();

_logarUsuario(BuildContext context, Usuario usuario) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth auth = FirebaseAuth.instance;
  auth
      .signInWithEmailAndPassword(
          email: usuario.getEmail, password: usuario.getSenha)
      .then((firebaseUser) {
    print("Conectou");
    Navigator.popAndPushNamed(context, "/Home");
  }).catchError((error) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: const Color(0xffA81735),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('E-mail/senha incorretos',
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 20)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xfffafafa)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(16))),
                  child: Text('Tentar novamente',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffA81735), fontSize: 20)),
                ),
              ],
            ),
          ),
        );
      },
    );
  });
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
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
                    height: altura > 700
                        ? 500
                        : MediaQuery.of(context).size.width * 0.6,
                    width: largura > 960
                        ? 500
                        : MediaQuery.of(context).size.width * 0.9,
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
                    child: Form(
                        key: _FormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 15, 0, 20),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Image.asset('assets/logo.png'),
                                )),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 15, 0, 25),
                              child: Text(
                                "Gestão de imobilizado",
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(25),
                                child: TextFormField(
                                  controller: EmailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Digite seu email';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      hintText: "Digite seu E-mail",
                                      labelText: "Email",
                                      prefixIcon: Icon(Icons.person)),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(25),
                              child: TextFormField(
                                controller: SenhaController,
                                obscureText: !passwordVisible,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Digite sua senha';
                                  }
                                  if (value.length < 8) {
                                    return 'A senha nao pode ser menor que 8 digitos';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Digite a sua senha",
                                  labelText: "Senha",
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                      icon: Icon(passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          passwordVisible = !passwordVisible;
                                        });
                                      }),
                                ),
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 25, 50, 25),
                                child: ElevatedButton(
                                    child: const Text("Entrar"),
                                    onPressed: () {
                                      if (_FormKey.currentState!.validate()) {
                                        setState(() {
                                          usuario.setEmail =
                                              EmailController.text;
                                          usuario.setSenha =
                                              SenhaController.text;
                                          _logarUsuario(context, usuario);
                                        });
                                      }
                                    }))
                          ],
                        ))))));
  }
}
