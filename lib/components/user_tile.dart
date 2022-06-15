import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:provider/provider.dart';

import '../provider/users.dart';
import '../routes/app_routes.dart';

class UserTile extends StatelessWidget{
  
  final User user;

  //contrutor
  const UserTile(this.user);  

  @override
  Widget build(BuildContext context){
    //verificando se o foi inserido uma img de avatar
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
      ? CircleAvatar(child: Icon(Icons.person))
      : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 90,
        child: Row(children: <Widget>[
          //editar
          IconButton(
            color: Colors.orange,
            icon: Icon(Icons.edit),
            onPressed: () {
              //teste
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
                arguments: user //passando o usuario preenchido como parametro atraves do Navigator
              );
            }, 
          ),

          //delete
          IconButton(
            color: Colors.red,
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Excluir Usuário'),
                  content: Text('Tem certeza???'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Não'),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),

                    TextButton(
                      child: Text('Sim'),
                      onPressed: () => Navigator.of(context).pop(true),
                    )
                  ],
                ),
              ).then((confirmed){
                if(confirmed)
                  Provider.of<Users>(context, listen: false).remove(user);
              });
              
            },  
            ),
        ]),
      ),
    );
  }
}