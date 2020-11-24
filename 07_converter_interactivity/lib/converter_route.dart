import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

const _padding = EdgeInsets.all(16.0);

class ConverterRoute extends StatefulWidget {
  final Color color;

  final List<Unit> units;

  const ConverterRoute({
    @required this.color,
    @required this.units,
  })  : assert(color != null),
        assert(units != null);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  Unit inputUnit;
  Unit outputUnit;
  double inputValue;
  String outputValue = '';
  bool isValidate = true;

  @override
  initState() {
    inputUnit = widget.units[0];
    outputUnit = widget.units[1];
    super.initState();
  }

  List<DropdownMenuItem> _getItems() {
    return widget.units
        .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
        .toList();
  }

  void _updateOutput(double val) {
    outputValue = _format(val * inputUnit.conversion / outputUnit.conversion);
  }

  void _updateValue(String input) {
    setState(() {
      if (input.isEmpty) {
        outputValue = '';
      } else {
        try {
          inputValue = double.parse(input);
          isValidate = true;
          _updateOutput(inputValue);
        } on Exception catch (e) {
          isValidate = false;
        }
      }
    });
  }

  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  @override
  Widget build(BuildContext context) {
    final input = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.headline5,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Input',
              errorText: isValidate ? null : 'Invalid number'),
          onChanged: (String value) {
            _updateValue(value);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DropdownButtonFormField(
            value: inputUnit,
            items: _getItems(),
            style: Theme.of(context).textTheme.headline6,
            onChanged: (dynamic value) {
              setState(() {
                inputUnit = value;
                _updateValue(inputValue.toString());
              });
            },
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ),
      ],
    );

    final arrowIcon = Transform.rotate(
      angle: 90 * pi / 180,
      child: Icon(
        Icons.compare_arrows,
        size: 40.0,
      ),
    );

    final output = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InputDecorator(
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: 'Output'),
          child: Text(
            outputValue,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DropdownButtonFormField(
            value: outputUnit,
            items: _getItems(),
            style: Theme.of(context).textTheme.headline6,
            onChanged: (dynamic value) {
              setState(() {
                outputUnit = value;
                _updateValue(inputValue.toString());
              });
            },
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        )
      ],
    );

    return Column(
      children: [
        Padding(
          padding: _padding,
          child: input,
        ),
        arrowIcon,
        Padding(
          padding: _padding,
          child: output,
        ),
      ],
    );
  }
}
