import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';

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
        width: 100,
        child: Row(children: <Widget>[
          //editar
          IconButton(
            color: Colors.orange,
            icon: Icon(Icons.edit),
            onPressed: () {}, 
            ),

          //delete
          IconButton(
            color: Colors.red,
            icon: Icon(Icons.delete),
            onPressed: () {},  
            ),
        ]),
      ),
    );
  }
}