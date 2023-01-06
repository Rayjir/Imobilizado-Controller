import 'dart:ui';
import 'package:flutter/src/widgets/editable_text.dart';

class Usuario {
  String? _idUsuario;
  String? _nome;
  String? _email;
  String? _urlImagem;
  String? _senha;

  
  // Usuario(String _email, String _senha) {
  //   this._email = _email;
  //   this._senha = _senha;
  // }
  
  Usuario();

  String get idUsuario => _idUsuario!;

  set idUsuario(String value) {
    _idUsuario = value;
  }

  String get getSenha => _senha!;

  set setSenha(String value) {
    _senha = value;
  }

  String get urlImagem => _urlImagem!;

  set urlImagem(String value) {
    _urlImagem = value;
  }

  String get getEmail => _email!;

  set setEmail(String value) {
    _email = value;
  }

  String get nome => _nome!;

  set nome(String value) {
    _nome = value;
  }
}
