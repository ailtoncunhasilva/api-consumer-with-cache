import 'package:flutter/material.dart';
import 'package:gs_challenge/components/showdialog.dart';
import 'package:gs_challenge/models/users.dart';

class UsersTile extends StatelessWidget {
  final Users users;

  UsersTile(this.users);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (_) => ShowDialog(users));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 70,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                    image: NetworkImage(
                      users.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Usuário:',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Text(
                          '${users.firstName}' + ' ${users.lastName}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          users.email,
                          style: TextStyle(
                            color: Colors.lightGreen[700],
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_right, color: Theme.of(context).primaryColor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
