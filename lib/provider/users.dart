/*
  controle de ações da aplicação
  map de usuario, add, pegar usuario e exluir 

  PADRÃO OBSERVER (padrão de projetos - programação reativa)

  para atualizar a interface grafica
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';

class Users with ChangeNotifier{
  //map 
  //gerenciar o map atraves dessa classe
  final Map<String, User> _items = {...DUMMY_USERS};

  /* 
    METODOS DE CONTROLE
  */

  List<User> get all {
    //retornar uma lista
    //clone da lista??
    //operador sprad
    return [..._items.values];
  }

  //retornar a quantidade de item da lista
  int get count {
    return _items.length;
  }

  //retorna o valor dos indexes
  User byIndex(int i){
    return _items.values.elementAt(i);
  }

  //ADD
  /* 
    metodo put, inserir e atualizar?
  */ 
  void put(User user){

    //não faco nada    
    if(user == null)
      return;

    //INSERE E ALTERA
    if(user.id != null && user.id.trim().isNotEmpty && _items.containsKey(user.id)){
      _items.update(user.id, (_) =>  user);
    }else{
      _items.putIfAbsent(user.id, () => User(
        id: user.id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl,
      ));
    }
      
    

    //notificador
    notifyListeners();
  }  

  //EXCLUIR
  void remove(User user){
    if(user != null && user.id != null){
      _items.remove(user.id);

      notifyListeners();
    }
  }
}