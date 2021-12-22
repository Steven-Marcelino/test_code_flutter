// ignore_for_file: prefer_const_constructors, duplicate_ignore, missing_required_param

import 'package:flutter/material.dart';
import 'package:test_code_flutter/ui/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenMenu(),
      routes: <String, WidgetBuilder>{
        '/mainMenu': (BuildContext context) => Pages1(),
        '/page2': (BuildContext context) => Pages2(),
        '/splash': (BuildContext context) => SplashScreenMenu(),
      },
    );
  }
}
