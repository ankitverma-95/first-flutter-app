import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: const Row(
        children: [
          Text('data')
        ],
      )
    );
  }

}