import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color bgColor = Color(0xFFADC8CA);
const Color accentColor = Color(0xFFC21618);
const Color textColor = Color(0xFF0E274D);

class OrderPage extends StatelessWidget {
  Widget _buildBody() {
    return Column(
      children: [
        _buildDateContainer(
            icon: Icons.calendar_today_outlined,
            text: RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: textColor,
                        fontSize: 36,
                        fontStyle: FontStyle.italic),
                    text: '${DateFormat('E').format(DateTime.now())}, ',
                    children: [
                  TextSpan(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      text:
                          '${DateFormat('LLL').format(DateTime.now())} ${DateTime.now().day}'),
                  TextSpan(text: 'th')
                ]))),
        _buildDivider(),
        _buildDateContainer(
            icon: Icons.access_time_outlined,
            text: RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: textColor,
                        fontSize: 36,
                        fontStyle: FontStyle.italic),
                    text:
                        '${DateFormat('j').format(DateTime.now())} - ${DateFormat('j').format(DateTime.now().add(Duration(hours: 2)))}'))),
        _buildDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: TextFormField(
            maxLines: 6,
            decoration: InputDecoration(
                labelText: 'Special instructions...',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)))),
          ),
        ),
        _buildDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                debugPrint('order');
              },
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    border: Border.all(color: Colors.white, width: 5)),
                child: Center(
                  child: Text(
                    'Order',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 20,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20.0,
            child: Container(
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
            ),
          ),
          SizedBox(
            width: 4.0,
          ),
          SizedBox(
            width: 20.0,
            child: Container(
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.all(Radius.circular(50.0)))),
          )
        ],
      ),
    );
  }

  Widget _buildDateContainer({IconData icon, RichText text}) {
    return Container(
      height: 70.0,
      margin: EdgeInsets.symmetric(horizontal: 36.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
            child: Icon(
              icon,
              color: bgColor,
              size: 40,
            ),
          ),
          text,
          Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 8.0),
              child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: accentColor,
                    size: 40,
                  ),
                  onPressed: () {
                    debugPrint('tap');
                  }))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: Center(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 56),
                child: Text(
                  'New order',
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 48,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildBody(),
              Padding(
                padding: const EdgeInsets.only(bottom: 56),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
