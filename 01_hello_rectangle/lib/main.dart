import 'package:flutter/material.dart';

String title = 'Hello rectangle';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    home: Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: HelloRectangle(),
    ),
  ));
}

class HelloRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 400.0,
      width: 300.0,
      color: Colors.greenAccent,
      child: Center(
        child: Text(
          'Hello!',
          style: TextStyle(fontSize: 40.0),
          textAlign: TextAlign.center,
        ),
      ),
    ));
  }
}
