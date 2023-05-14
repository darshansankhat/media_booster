import 'package:flutter/material.dart';

class Staggred_home_screen extends StatefulWidget {
  const Staggred_home_screen({Key? key}) : super(key: key);

  @override
  State<Staggred_home_screen> createState() => _Staggred_home_screenState();
}

class _Staggred_home_screenState extends State<Staggred_home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("staggered"),
    );
  }
}
