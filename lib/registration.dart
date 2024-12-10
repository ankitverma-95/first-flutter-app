import 'package:app/ImagePreviewWidget.dart';
import 'package:app/RegistrationFormWidget.dart';
import 'package:app/component1.dart';
import 'package:flutter/material.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Complete your Profile'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Color(0xff440F0B),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImagePreviewWidget(),
              ],
            ),
            RegistrationFormWidget()
          ],
        ),
      ),
    );
  }
}
