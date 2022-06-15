import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              //retornar uma tela, no caso a HOME
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  //vai ter texto padrão
                  decoration: InputDecoration(labelText: 'Nome'),
                ),

                 TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),

                 TextFormField(
                  decoration: InputDecoration(labelText: 'AvatarURL'),
                )
              ],
            ),
          ),
        ),
    );
  }
}