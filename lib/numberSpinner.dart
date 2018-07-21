import 'package:flutter/material.dart';

enum SpinnerAction { ADD, REMOVE }

class NumberSpinner extends StatefulWidget {
  NumberSpinner(
      {Key key,
      this.initValue: 0,
      this.allowNegative: true,
      @required this.onChanged})
      : super(key: key);

  final int initValue;
  final bool allowNegative;
  final ValueChanged<int> onChanged;

  @override
  _NumberSpinnerState createState() => _NumberSpinnerState();
}

class _NumberSpinnerState extends State<NumberSpinner> {
  int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initValue;
  }

  void _updateValue(SpinnerAction action) {
    setState(() {
      if (action == SpinnerAction.ADD) {
        _value++;
        widget.onChanged(_value);
      } else {
        if ((!widget.allowNegative && _value > 0) || widget.allowNegative) {
          _value--;
          widget.onChanged(_value);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new SizedBox(
          width: 45.0,
          child: new RaisedButton(
            child: const Icon(Icons.remove),
            onPressed: () => _updateValue(SpinnerAction.REMOVE),
            color: Colors.redAccent,
            padding: const EdgeInsets.all(0.0),
          ),
        ),
        new SizedBox(
          width: 65.0,
          child: new Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new TextField(
              controller: new TextEditingController(
                text: '$_value'
              ),
              decoration: const InputDecoration(
                contentPadding: const EdgeInsets.all(5.0),
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20.0,color: Colors.black),
              onChanged: (String value) {
                _value = int.parse(value);
                widget.onChanged(_value);
              },
            ),
          ),
        ),
        new SizedBox(
          width: 45.0,
          child: new RaisedButton(
            child: const Icon(Icons.add),
            onPressed: () => _updateValue(SpinnerAction.ADD),
            color: Colors.green,
            padding: const EdgeInsets.all(0.0),
          ),
        ),
      ],
    );
  }
}
