import 'package:flutter/material.dart';
import 'package:otp_text_field_v2/otp_text_field_v2.dart';

class OtpTextField extends StatefulWidget {
  final OtpFieldControllerV2 otpController;
  final  bool visible;
  const OtpTextField({Key? key, required this.otpController, required this.visible}) : super(key: key);

  @override
  _OtpTextFieldState createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  final OtpFieldControllerV2 otpController=OtpFieldControllerV2();
  @override
  Widget build(BuildContext context) {
    // Ensure that otpController is not null before using it
    assert(widget.otpController != null);

    return Visibility(
      visible:widget.visible,
      child: OTPTextFieldV2(
        controller: widget.otpController,
        length: 4,
        width: MediaQuery.of(context).size.width, // Ensure context is valid
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldWidth: 45,
        fieldStyle: FieldStyle.box,
        outlineBorderRadius: 15,
        style: TextStyle(fontSize: 17),
        onChanged: (pin) {
          print("Changed: " + pin);
        },
        onCompleted: (pin) {
          print("Completed: " + pin);
        },
      ),
    );
  }
}
