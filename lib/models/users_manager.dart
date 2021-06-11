import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gs_challenge/models/users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:path_provider/path_provider.dart';

class UsersManager extends ChangeNotifier {

  UsersManager() {
    getUsers();
  }

  List<Users> usersList = [];

  var url =
      'https://randomuser.me/api/?format=json&page=&results=15&inc=&gender,name,email,picture&nat=br';

  String _gender = 'Todos';

  String get gender => _gender;

  set gender(String value) {
    _gender = value;

    notifyListeners();
  }

  List<Users> get filteredUsers {
    final List<Users> filteredUsers = [];

    if (gender == 'Todos') {
      filteredUsers.addAll(usersList);
    } else if (gender.isNotEmpty && gender == 'female') {
      filteredUsers.addAll(usersList.where((e) => e.gender.contains(gender)));
    } else if (gender.isNotEmpty && gender == 'male') {
      filteredUsers.addAll(usersList.where((m) => m.gender == 'male'));
    }

    return filteredUsers;
  }

  Future<void> getUsers() async {
    final request = await http.get(url);

    String fileName = 'path.json';
    var dir = await getTemporaryDirectory();

    File file = File(dir.path + '/' + fileName);

    if (file.existsSync() && request.statusCode != 200) {
      //print('Loading from cache'); test for know where is building list(cache ou API)

      final data = file.readAsStringSync();
      Iterable resp = json.decode(data)['results'];

      return usersList = resp.map((e) => Users.fromJson(e)).toList();
    } else {
      //print('Loading from API'); test for know where is building list(cache ou API)

      if (request.statusCode == 200) {
        var body = request.body;

        file.writeAsStringSync(body, flush: true, mode: FileMode.write);
        Iterable response = json.decode(body)['results'];

        usersList = response.map((d) => Users.fromJson(d)).toList();
      } else {
        return json.decode(request.body);
      }
    }
  }

  //notifyListeners();
}
