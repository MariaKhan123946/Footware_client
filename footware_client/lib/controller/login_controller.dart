import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_text_field_v2.dart';

// Import correct path for OtpFieldControllerV2


class LoginController extends GetxController {
  late final FirebaseFirestore _firestore;
  late final CollectionReference _userCollection;

  final TextEditingController productNameCtrl = TextEditingController();
  final TextEditingController productNumberCtrl = TextEditingController();

  // Assume OtpFieldControllerV2 is a custom class or part of a package
  final OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool otpFieldShown =false;

  @override
  void onInit() {
    super.onInit();
    _firestore = FirebaseFirestore.instance;
    _userCollection = _firestore.collection('Users');
  }

  @override
  void onClose() {
    // Dispose text editing controllers when the controller is closed.
    productNameCtrl.dispose();
    productNumberCtrl.dispose();
    super.onClose();
  }

  Future<void> addUser({
    required String name,
    required String id,
    required int number,
  }) async {
    try {
      // Add user document with specified data
      await _userCollection.add({
        'name': name,
        'id': id,
        'number': number,
      });

      Get.snackbar(
        'Success',
        'User added successfully',
        colorText: Colors.green,
      );

      clearInputFields();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print('Error adding user: $e');
    }
  }

  void clearInputFields() {
    productNameCtrl.clear();
    productNumberCtrl.clear();
  }


  void sendOtp() {
    final random = Random();
    int otp = 1000 + random.nextInt(9000);

    print('Generated OTP: $otp');

    try {
      if (otp != null) {
        otpFieldShown=true;
        // Simulate OTP sending logic here (e.g., via SMS or email)
        Get.snackbar('Success', 'OTP sent successfully', colorText: Colors.green);
      } else {
        throw Exception('Failed to generate OTP');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to send OTP', colorText: Colors.red);
      print('Error sending OTP: $e');
    }finally{
      update();
    }
  }
}
