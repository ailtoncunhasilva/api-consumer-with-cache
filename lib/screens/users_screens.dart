import 'package:flutter/material.dart';
import 'package:gs_challenge/models/users.dart';

class UsersScreen extends StatelessWidget {
  final Users users;

  UsersScreen(this.users);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados do cliente'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.maxFinite,
            child: Image.network(users.image, fit: BoxFit.cover),
          ),
          Text('${users.firstName}' + ' ${users.lastName}'),
          Text(users.gender),
          Text(users.email),
        ],
      ),
    );
  }
}
