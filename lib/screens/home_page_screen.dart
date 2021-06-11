import 'package:flutter/material.dart';
import 'package:gs_challenge/models/users_manager.dart';
import 'package:gs_challenge/screens/gender_dialog_screen.dart';
import 'package:gs_challenge/tile/users_tile.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GS Challenge'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<UsersManager>(
              builder: (_, usersManager, __) {
                final filteredUsers = usersManager.filteredUsers;
                return ListView.builder(
                  itemCount: filteredUsers.length,
                  itemBuilder: (context, index) {
                    return UsersTile(filteredUsers[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(//button for to open dialog
        onPressed: () async {
          final gender = await showDialog(
              context: context, builder: (_) => GenderDialogScreen());
          if (gender != null) {
            context.read<UsersManager>().gender = gender;
          }
        },
        label: Text('Filtro'),
        backgroundColor: Colors.lightGreen[700],
      ),
    );
  }
}
