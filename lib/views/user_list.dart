import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/data/dummy_users.dart';

class UserList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //importando o DUMMY_USER
    //operado Xprad??
    final users = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.ac_unit_sharp),
            )
        ],
      ),
      body: ListView.builder(
        //quantos itens eu tenho para mostra na lista
        itemCount: users.length, 
        //cria um componente
        itemBuilder: (contexo, indice) => UserTile(users.values.elementAt(indice)),
        ),
    );
  }
}