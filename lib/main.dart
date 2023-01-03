import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:imobilizado_desktop/Telas/Home.dart';
import 'firebase_options.dart';
import 'package:imobilizado_desktop/Telas/Login.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options:  DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Login());
}


