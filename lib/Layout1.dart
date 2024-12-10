import 'package:app/ButtonSection.dart';
import 'package:app/ImageSection.dart';
import 'package:app/TextSection.dart';
import 'package:app/TitleSection.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            title: const Align(
              alignment: Alignment.center,
              child: Text(appTitle),
            )
          ),
          body: const SingleChildScrollView(
            child: Column(
              children: [
                ImageSection(
                    image: 'images/lake.jpg'
                ),
                TitleSection(
                    name: 'Love me like yo do', location: 'New York, USA'),
                ButtonSection(),
                TextSection(
                    description: 'Android 11 and higher supports deploying and '
                        'debugging your app wirelessly from your workstation via'
                        ' Android Debug Bridge (ADB). For example, you can'
                        ' deploy your debuggable app to multiple remote '
                        'devices without physically connecting your device'
                        ' via USB and contending with common USB connection '
                        'issues, such as driver installation')
              ],
            ),
          )),
    );
  }
}
