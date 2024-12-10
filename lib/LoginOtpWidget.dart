import 'package:app/IntroBar.dart';
import 'package:app/OtpFormWidget.dart';
import 'package:flutter/material.dart';

class LoginOtpWidget extends StatelessWidget {
  const LoginOtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            color: const Color(0xffFEF3F2),
            child: const Column(
              children: [
                IntroBar(),
                Expanded(child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        'Enter OTP',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff440F0B),
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      child: Text(
                        'Otp sent successfully to +91xxxxxxx19',
                        style: TextStyle(
                            color: Color(0xffD93729),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    OtpFormWidget()
                  ],
                ))

              ],
            )
        ),
      ),
    );
  }

}