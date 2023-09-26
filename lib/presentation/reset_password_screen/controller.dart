import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';

class ResetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  var isLoading = false;

  passwordReset() async {
    isLoading = true;
    update();
    // send password reset link to email
    FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.value.text.trim())
        .then((value) {
      isLoading = false;
      update();
      Get.back();

      Get.snackbar("Password reset link sent to your email", "",
          backgroundColor: ColorConstant.deepPurple300.withOpacity(0.2),
          padding: EdgeInsets.only(top: 20, left: 10, right: 10));
    }).catchError((e) {
      print(e);
      isLoading = false;
      update();
      Get.snackbar("Error", e.toString(),
          backgroundColor: ColorConstant.deepPurple300.withOpacity(0.2),
          padding: EdgeInsets.only(top: 20, left: 10, right: 10));
    });
  }
}
