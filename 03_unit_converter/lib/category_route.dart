import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';

class CategoryRoute extends StatelessWidget {
  final Color _bgColor = Colors.green[100];
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: Text(
          'Unit Converter',
          style: TextStyle(fontSize: 30.0, color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: _bgColor,
      ),
      body: ListView.builder(
          itemCount: _categoryNames.length,
          itemBuilder: (BuildContext context, int i) =>
              Category(name: _categoryNames[i], color: _baseColors[i])),
    );
  }
}
