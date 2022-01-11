import 'package:flutter/material.dart';
import 'package:voting_app_mobile/pages/login.dart';
import 'package:voting_app_mobile/pages/voting_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      //home: LoginStateless(),
      home: Vote(),
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
