import 'dart:ui';
import 'package:flutter/src/widgets/editable_text.dart';

class Usuario {
  String? _idUsuario;
  String? _nome;
  String? _email;
  String? _senha;
  String? _filial;
  // String? _

  Usuario();

  String get getIdUsuario => _idUsuario!;

  set setIdUsuario(String IdUsuario) {
    _idUsuario = IdUsuario;
  }

  String get getSenha => _senha!;

  set setSenha(String Senha) {
    _senha = Senha;
  }

  String get getEmail => _email!;

  set setEmail(String setEmail) {
    _email = setEmail;
  }

  String get getNome => _nome!;

  set setNome(String nome) {
    _nome = nome;
  }

  String get getfilial => _filial!;

  set setfilial (String filial) {
    _nome = filial;
  }
}
