import 'package:flutter/material.dart';
import 'package:my_layout/order_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Layout',
      home: OrderPage(),
    );
  }
}
