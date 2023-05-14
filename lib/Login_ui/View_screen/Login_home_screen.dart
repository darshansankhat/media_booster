import 'package:flutter/material.dart';

class Login_home_screen extends StatefulWidget {
  const Login_home_screen({Key? key}) : super(key: key);

  @override
  State<Login_home_screen> createState() => _Login_home_screenState();
}

class _Login_home_screenState extends State<Login_home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Login"),
    );
  }
}
