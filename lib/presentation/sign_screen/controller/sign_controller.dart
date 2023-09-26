// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/presentation/sign_screen/models/sign_model.dart';
import 'package:flutter/material.dart';

class SignController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var passwordVisible = false.obs;
  var isLoading = false;

  Rx<SignModel> signModelObj = SignModel().obs;

  signin() {
    isLoading = true;
    update();
    // sign in with email and password
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.value.text.trim(),
            password: passController.value.text)
        .then((value) {
      isLoading = false;
      update();
      Get.snackbar("Login successful", "",
          padding: EdgeInsets.only(top: 20, left: 10, right: 10));
      Get.toNamed(AppRoutes.homeScreen, preventDuplicates: true);
    }).catchError((e) {
      FirebaseAuthException firebaseAuthException = e;
      isLoading = false;
      update();
      Get.snackbar("Error", firebaseAuthException.message.toString(),
          backgroundColor: ColorConstant.deepPurple300.withOpacity(0.2),
          padding: EdgeInsets.only(top: 20, left: 10, right: 10));
    });
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passController.dispose();
  }
}
