//contruindo os modelos
import 'package:flutter/material.dart';

class User{
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  /*
    CONSTRUTOR, "metodo"
    como todos os atributos são finals, o contrutor sera const
  */
  const User({
    required this.id, //e agora??
    //obrigatorio a inserção desses atributos ??
    required this.name,
    required this.email,
    required this.avatarUrl,
  });
}