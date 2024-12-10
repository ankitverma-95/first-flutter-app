import 'package:app/LoginOtpWidget.dart';
import 'package:app/Network.dart';
import 'package:app/PostWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'LoginWidget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyLoginApp());
}

class MyLoginApp extends StatelessWidget {
  const MyLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
        title: 'My Login App',
        home:  NetworkPage(),
    );
    // PostWidget()
  }
  // LoginWidget()
}


