import 'package:flutter/material.dart';


class UserForm extends StatelessWidget {
  
  final _form = GlobalKey<FormState>();

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

              //verdade se estiver tudo certo, não ja de imediato retorna o erro
              if(isValid){
                //pegando o formulario e salvando. salvando aonde??
                _form.currentState!.save();

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
                  onSaved: (value){
                    print(value); //ele salva o valor inserido no input "nome"
                  },
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