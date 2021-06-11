import 'package:flutter/material.dart';
import 'package:gs_challenge/models/users.dart';

class ShowDialog extends StatelessWidget {
  final Users users;

  ShowDialog(this.users);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: NetworkImage(users.image),
                  ),
                ),
              ),
              Text(
                'Nome:',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
              Text(
                '${users.firstName}' + ' ${users.lastName}',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'E-mail:',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
              Text(
                users.email,
                style: TextStyle(
                  color: Colors.lightGreen[700],
                ),
              ),
              Text(
                'Gênero:',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
              Text(
                users.gender == 'female' ? 'Feminino' : 'Masculino',
                style: TextStyle(
                  color: Colors.lightGreen[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
