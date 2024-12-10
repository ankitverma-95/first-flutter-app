import 'package:flutter/material.dart';

import 'IntroBar.dart';
import 'LoginForm.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
      SingleChildScrollView(
        child:  Container(
          height: MediaQuery.of(context).size.height,
          color: const Color(0xffFEF3F2),
          child: Column(
            children: [
              const IntroBar(),
              Expanded(
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      'Create Account or Sign In',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff440F0B),
                          fontSize: 16),
                    ),
                  ),
                  const LoginForm(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Row(
                      children: [
                        Expanded(child: Divider(color: Color(0xffA3A3A3))),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            'or',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffA3A3A3),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(child: Divider(color: Color(0xffA3A3A3))),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                                onPressed: () {
                                  print('clicked');
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text('Continue with Google')
                                  ],
                                )),
                          )
                        ],
                      )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'By continuing you agree that you have read and accepted',
                          softWrap: true,
                          style: TextStyle(fontSize: 11,),
                        ),
                        RichText(
                          text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'our ',
                                  style: TextStyle(fontSize: 11, color:  Colors.black),
                                ),
                                TextSpan(
                                    text: 'Terms of Use',
                                    style: TextStyle(fontSize: 11, color: Colors.blue[500])
                                ),
                                const TextSpan(
                                  text: ' and ',
                                  style: TextStyle(fontSize: 11, color: Colors.black),
                                ),
                                TextSpan(
                                    text: 'Privacy Policy.',
                                    style: TextStyle(fontSize: 11, color: Colors.blue[500])
                                )
                              ]
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
