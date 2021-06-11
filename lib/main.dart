import 'package:flutter/material.dart';
import 'package:gs_challenge/components/dropdown_gender.dart';
import 'package:gs_challenge/models/users_manager.dart';
import 'package:gs_challenge/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsersManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => DropdownGender(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.lightBlue[800],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
