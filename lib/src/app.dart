import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class MyApp extends StatelessWidget{
  Widget build (context) {
    return MaterialApp (
      title:'LogIn',
      home : Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.lightBlue,
        body: LoginScreen(),
      ),
    );
  }

}