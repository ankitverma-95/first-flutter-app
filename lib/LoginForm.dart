import 'package:app/LoginOtpWidget.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  void _onPressed() {
    if (_formKey.currentState!.validate()) {
      print(myController.text);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginOtpWidget()),
      );
    }
  }

  @override
  Widget build(Object context) {
    // TODO: implement build
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      'Enter your Phone number',
                      style: TextStyle(
                        color: Color(0xffd4d4d4),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number';
                  }
                  if (value.length > 10) {
                    return 'Number should be 10 digits';
                  }
                  if (value.length < 10) {
                    return 'Number should be 10 digits';
                  }
                  return null;
                },
                controller: myController,
              ),
            ),
            Row(children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffEA4335),
                          foregroundColor: const Color(0xffFDCFCB),
                        ),
                        onPressed: _onPressed,
                        child: const Text('Send OTP'))),
              )
            ])
          ],
        ));
  }
}
