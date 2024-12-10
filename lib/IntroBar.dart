import 'package:flutter/material.dart';

class IntroBar extends StatelessWidget {
  const IntroBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 625,
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xfffde5e3),
        borderRadius: BorderRadius.vertical(
            top: Radius.zero, bottom: Radius.elliptical(1631, 350)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center, // horizontal
        mainAxisAlignment: MainAxisAlignment.center, // vertical
        children: [
          Text('MA',
              style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'RussoOne',
                  color: Color(0xFFEA4335))),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text('My App',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'RussoOne',
                    color: Color(0xFF171717))),
          ),
          Text('An effort to learn flutter...',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF404040)))
        ],
      ),
    );
  }
}
