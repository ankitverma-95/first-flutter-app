
import 'package:app/MyElevatedButton.dart';
import 'package:app/MyText.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {

  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();

}

class _CounterState extends State<Counter> {

  int _counter = 0;

  void _increment() {
    setState(() {
      // This call to setState tells the Flutter framework
      // that something has changed in this State, which
      // causes it to rerun the build method below so that
      // the display can reflect the updated values. If you
      // change _counter without calling setState(), then
      // the build method won't be called again, and so
      // nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyElevatedButton(onPressed: _increment,),
        const SizedBox(width: 16,),
        MyText(count: _counter,)
      ],
    );
  }

}