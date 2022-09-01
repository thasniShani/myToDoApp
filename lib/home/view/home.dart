import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'Welcome',
        style: TextStyle(fontSize: 65, fontWeight: FontWeight.bold),
      )),
    );
  }
}
