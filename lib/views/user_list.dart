import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../provider/users.dart';

class UserList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //importando o DUMMY_USER
    //operado Xprad??
    final Users users = Provider.of(context);

    //final id = Random().nextDouble().toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              //vai dar um "push" colocar a tela em cima
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM
              );
            }, 
          )
        ],
      ),
      body: ListView.builder(
        //quantos itens eu tenho para mostra na lista
        itemCount: users.count, 

        //cria um componente
        itemBuilder: (contexto, indice) => UserTile(users.byIndex(indice)),

        ),
    );
  }
}