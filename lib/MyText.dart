
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {

  const MyText({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Count: $count');
  }

}