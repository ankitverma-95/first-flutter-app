import 'package:app/FavoriteWidget.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({required this.name, required this.location, super.key});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                          name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(location, style: TextStyle(color: Colors.grey[500]),)
                  ],
                )),
            const FavoriteWidget(),
          ],
        ),
      );
  }

}