import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});


  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    // TODO: implement build
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ButtonWithText(icon: Icons.call, color: color, label: 'CALL'),
          ButtonWithText(icon: Icons.route, color: color, label: 'ROUTE'),
          ButtonWithText(icon: Icons.share, color: color, label: 'SHARE'),
        ],
      ),
    );
  }

}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    required this.icon,
    required this.color,
    required this.label,
    super.key
  });

  final IconData icon;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: color
              ),
            ),
          )
        ],
    );
  }

}