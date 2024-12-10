import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({required this.image, super.key});

  final String image;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset(
        image,
        width: 600,
        height: 240,
        fit: BoxFit.cover,
    );
  }

}