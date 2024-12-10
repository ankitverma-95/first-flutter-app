import 'package:app/registration.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpFormWidget extends StatefulWidget {
  const OtpFormWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OtPFormState();
  }

}

class _OtPFormState extends State<OtpFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final FocusNode focusNode;
  final pinController = TextEditingController();

  // List<TextEditingController> otpController = List.generate(6,
  //         (index) => TextEditingController()
  // );

  void _onPressed() {
    if(_formKey.currentState!.validate()) {
      print(pinController.text);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegistrationWidget()),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
        color: Colors.white
      ),
    );

    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 8),
                child: Pinput(
                  length: 6,
                  controller: pinController,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  validator: (value) {
                    return null;
                    // return value == '2222' ? null : 'Pin is incorrect';
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  // cursor: Column(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       margin: const EdgeInsets.only(bottom: 9),
                  //       width: 22,
                  //       height: 1,
                  //       color: focusedBorderColor,
                  //     ),
                  //   ],
                  // ),
                  // focusedPinTheme: defaultPinTheme.copyWith(
                  //   decoration: defaultPinTheme.decoration!.copyWith(
                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(color: focusedBorderColor),
                  //   ),
                  // ),
                  // submittedPinTheme: defaultPinTheme.copyWith(
                  //   decoration: defaultPinTheme.decoration!.copyWith(
                  //     color: fillColor,
                  //     borderRadius: BorderRadius.circular(19),
                  //     border: Border.all(color: focusedBorderColor),
                  //   ),
                  // ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                )
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 16,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Didn't receive the OTP?",
                  style: TextStyle(
                    color: Color(0xff404040),
                    fontSize: 13,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  'Resent OTP',
                  style: TextStyle(
                    color: Color(0xff737373),
                    fontSize: 13,
                    fontWeight: FontWeight.w400
                  ),
                )

              ],
            ),),
            const SizedBox(
              height: 40,
              child: Text('')
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // minimumSize: const Size(0, 50),
                    backgroundColor: const Color(0xffe44335),
                    foregroundColor: const Color(0xfffdcfcb),
                  ),
                    onPressed: _onPressed,
                    child: const Text('Login'))
                )
              ],
            ),)
          ],
        ));
  }

}


// SizedBox(
// height: 80,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: List.generate(6, (index) =>
// SizedBox(
// width: 36,
// child: TextFormField(
// keyboardType: TextInputType.number,
// decoration: const InputDecoration(
// border: OutlineInputBorder(),
// hintText: '*'
// ),
// controller: otpController[index],
// onChanged: (value) {
// if(value.length == 1 && index <= 5) {
// FocusScope.of(context).nextFocus();
// }  else if(value.isEmpty){
// FocusScope.of(context).previousFocus();
// }
// },
// ),
// )),
// ),
// )