import 'package:flutter/material.dart';
import 'package:mausam/screens/homepage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(Mausam());
}

class Mausam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mausam',
      theme: ThemeData(
        fontFamily: 'FredokaOne',
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}
