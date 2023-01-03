import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
              )),
          title: Container(height: 30, child: Image.asset('assets/logo.png')),
          centerTitle: true,
          backgroundColor: const Color(0xff931111),
        ),
        body: Row(
          children: [
            const Expanded(child: Center(child: CircularProgressIndicator())),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      height: 25,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Relatório")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      height: 25,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Cadastro de usuarios")),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      height: 25,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Usuarios cadastrados")),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
