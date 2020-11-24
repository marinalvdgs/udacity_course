import 'package:converter_navigation/unit.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


class ConverterRoute extends StatelessWidget {
  final List<Unit> units;
  final Color color;
  final String name;

  const ConverterRoute({
    @required this.units,
    @required this.color,
    @required this.name
  }) : assert(units != null);

  @override
  Widget build(BuildContext context) {
    final unitWidgets = units.map((Unit unit) {
      return Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        color: color,
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(backgroundColor: color,title: Text(name),),
      body: ListView(
        children: unitWidgets,
      ),
    );
  }
}
