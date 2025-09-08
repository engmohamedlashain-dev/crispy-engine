import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String  routeName='home_screen';
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("1"),),
    );
  }
}
