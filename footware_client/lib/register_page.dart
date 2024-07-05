import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:footware_client/controller/login_controller.dart';
import 'package:footware_client/widget/otp_text_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final LoginController _loginController = Get.find<LoginController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create your Account!!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.person),
                labelText: 'Your Name',
                hintText: 'Enter your Name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: mobileNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: Icon(Icons.phone_android),
                labelText: 'Mobile Number',
                hintText: 'Enter your mobile number',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_loginController.otpFieldShown) {
                  setState(() {
                    _loginController.addUser(
                      name: nameController.text.trim(),
                      id: 'user_id', // Provide a user ID
                      number: int.tryParse(mobileNumberController.text.trim()) ?? 0,
                    );
                  });
                } else {
                  setState(() {
                    _loginController.sendOtp();
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
              ),
              child: Text(_loginController.otpFieldShown ? 'Register' : 'Send OTP'),
            ),
            SizedBox(height: 20),
            Visibility(
              visible: _loginController.otpFieldShown,
              child: OtpTextField(
                otpController: _loginController.otpController,
                visible: _loginController.otpFieldShown,
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to login page
                // Example: Get.to(LoginPage());
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
