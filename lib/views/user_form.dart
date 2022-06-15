import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../provider/users.dart';


class UserForm extends StatelessWidget {
  
  final _form = GlobalKey<FormState>();

  //map de dados de usuario
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              //chamando as validações, retorna um bool
              //se retornar algum texto, isValid sera um erro
              final isValid = _form.currentState!.validate();

              //posso fazer a validação aqui??
              if(_formData['id'] == null){
                //tera que recebar um valor aleatorio
                _formData['id'] = '1000';
              }

              //verdade se estiver tudo certo, não ja de imediato retorna o erro
              if(isValid){
                //pegando o formulario e salvando. salvando aonde??
                _form.currentState!.save();
  
                // //pegando informações do form e salvando o dados 
                Provider.of<Users>(context, listen: false).put(
                  User(
                    // ele e causador de tudo???
                    //porque não funciona?????????!!!!!
                    id: _formData['id'] as String, //preciso ajeitar isso
                    name: _formData['name'] as String,
                    email: _formData['email'] as String,
                    avatarUrl: _formData['avatarUrl'] as String,
                 ),
                );

                //retornar uma tela, no caso a HOME
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  //vai ter texto padrão
                  decoration: InputDecoration(labelText: 'Nome'),

                  //validação, chama de volta?
                  validator: (value){
                    if(value == null || value.trim().isEmpty)
                      return 'Nome inválido';

                    if(value.trim().length < 3)
                      return 'Nome muito curto';

                    //esta tudo certo
                    return null;
                  },
                  
                  //metodo salve sendo chamado
                  onSaved: (value) => _formData['name'] = value as String,
                ),

                 TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onSaved: (value) => _formData['email'] = value as String,
                ),

                 TextFormField(
                  decoration: InputDecoration(labelText: 'AvatarURL'),
                  onSaved: (value) => _formData['avatarUrl'] = value as String
                )
              ],
            ),
          ),
        ),
    );
  }
}