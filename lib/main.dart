import 'package:flutter/material.dart';
import 'package:mausam/screens/homepage.dart';

void main() => runApp(Mausam());

class Mausam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mausam',
      theme: ThemeData.dark().copyWith(),
      home: HomePage(),
    );
  }
}
