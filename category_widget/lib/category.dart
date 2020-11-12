import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;

  static const double height = 100.0;
  static const double borderRadius = 50.0;

  Category({@required this.name, @required this.icon, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
        child: Container(
      height: 100.0,
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        splashColor: color,
        highlightColor: color,
        onTap: () {
          debugPrint('tap on category $name');
        },
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                icon,
                size: 60.0,
              ),
            ),
            Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 24.0),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
