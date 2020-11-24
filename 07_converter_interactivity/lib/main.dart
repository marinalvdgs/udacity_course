import 'package:flutter/material.dart';

import 'category_route.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black),
          display1: TextStyle(color: Colors.grey[600]),
        ),
        primaryColor: Colors.grey[500],
      ),
      home: CategoryRoute(),
    );
  }
}
