import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;
  var isAgree = false.obs;
  var passwordVisible = false.obs;
  var isLoading = false;

  createAccount() async {
    isLoading = true;
    update();
    // create account with email and password
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.value.text.trim(),
            password: passwordController.value.text.trim())
        .then((value) async {
      await value.user!.updateDisplayName(nameController.value.text);
      await value.user!.updatePhotoURL("");
      await value.user!.sendEmailVerification();
      Get.snackbar("Account created successfully", "",
          backgroundColor: ColorConstant.deepPurple300.withOpacity(0.2),
          padding: EdgeInsets.only(top: 20, left: 10, right: 10));
      isLoading = false;
      update();
      Get.toNamed(AppRoutes.signScreen, preventDuplicates: true);
    }).catchError((error) {
      isLoading = false;
      update();
      print(error.toString());
      FirebaseAuthException platformException = error;
      Get.snackbar(
        "Error",
        platformException.message.toString(),
      );
    }).whenComplete(() {
      this.isLoading = false;
      update();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
    nameController.dispose();
    emailController.dispose();
  }
}
