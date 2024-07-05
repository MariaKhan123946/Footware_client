import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footware_client/controller/login_controller.dart';
import 'package:get/get.dart';
import 'register_page.dart'; // Correct import for HomePage

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:FirebaseOptions(
          apiKey: 'AIzaSyCTtKVkfBmFgRbNAhOhgnpGd2urTzr0mC4',
          appId: '1:186910625998:android:214df27a88195d3166c09f',
          messagingSenderId:
          '186910625998',
          projectId: 'login-26857',

      ));

  Get.put(LoginController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App Name', // Set your app title here
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set your app's primary color
      ),
      home: RegisterPage(),
    );
  }
}
