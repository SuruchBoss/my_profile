import 'package:flutter/material.dart';
import 'package:my_profile/MyHomePage.dart';
import 'configView.dart';
import 'package:my_profile/loginView.dart';

void main() {
  runApp(new MaterialApp(
    home: new Login(),
    routes: <String, WidgetBuilder>{
      '/screen1': (BuildContext context) => new Login(),
      '/screen2': (BuildContext context) => new MyHomePage(),
      '/screen3': (BuildContext context) => new ConfigView(),
    },
  ));
}

