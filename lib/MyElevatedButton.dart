
import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {

  const MyElevatedButton({ required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: const Text('Click me'),
      );
  }

}