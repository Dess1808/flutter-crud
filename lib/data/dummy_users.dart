//criando MAPS = estrutura de chave valor (json)
import 'package:flutter_crud/models/user.dart';

const DUMMY_USERS = {
  '1': const User(
    id: '1',
    name: 'Maria',
    email: 'maria@alunos.com.br',
    avatarUrl: 'https://cdn.pixabay.com/photo/2016/04/01/10/11/avatar-1299805_960_720.png',
  ),

  '2': const User(
    id: '2',
    name: 'Rafael',
    email: 'rafael@alunos.com.br',
    avatarUrl: 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
  ),

  '3': const User(
    id: '3',
    name: 'Fernanda',
    email: 'maria@alunos.com.br',
    avatarUrl: '',
  ),

  '4': const User(
    id: '4',
    name: 'Maria',
    email: 'maria@alunos.com.br',
    avatarUrl: 'https://cdn.pixabay.com/photo/2016/09/01/08/24/smiley-1635449_960_720.png',
  ),
};