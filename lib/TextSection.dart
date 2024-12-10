import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({required this.description, super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }

}