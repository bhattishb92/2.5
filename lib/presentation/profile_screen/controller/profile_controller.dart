import 'dart:io';

// import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/core/utils/countries.dart';
import 'package:mytravelapp/presentation/profile_screen/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/progress_dialog_utils.dart';
import '../../home_screen/controller/home_controller.dart';

class ProfileController extends GetxController {
  Rx<ProfileModel> profileModelObj = ProfileModel().obs;
  TextEditingController textFieldController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  HomeController homeController = Get.find<HomeController>();
  String? name = "";
  RxMap<String, dynamic> currentCurrency = <String, dynamic>{}.obs;

  ProfileController() {
    name = homeController.name;
    textFieldController.text = homeController.name ?? "";
  }

  @override
  Future<void> onInit() async {
    await getCurrency();
    super.onInit();
  }

  getCurrency() async {
    print("getCurrency");
    final prefs = await SharedPreferences.getInstance();

    String? currency = prefs.getString("currency");
    if (currency != null) {
      currentCurrency.value = Countries()
          .countriesAndCurrencyCodes
          .firstWhere((element) => element["code"] == currency);
    } else {
      String countryName = await userCurrentLocation() ?? "United States";

      currentCurrency.value = Countries().countriesAndCurrencyCodes.firstWhere(
          (element) =>
              element["name"]!.toLowerCase() == countryName.toLowerCase());
      prefs.setString("currency", currentCurrency.value["code"]);
    }
    update();
  }

  Future<String?> userCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placeMarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placeMarks[0];

      return place.country;
    } catch (e) {
      print(e);
      return null;
    }
  }

  updateCurrency(Map<String, dynamic> currency) async {
    currentCurrency.value = currency;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("currency", currency["code"]);
    update();
  }

  updateName() {
    // update name in firebase auth
    FirebaseAuth.instance.currentUser!
        .updateDisplayName(textFieldController.value.text)
        .then((value) {
      name = textFieldController.value.text;
      update();
      homeController.updateDetails();
      Get.snackbar("Name updated successfully", "",
          backgroundColor: ColorConstant.deepPurple300.withOpacity(0.2),
          padding: EdgeInsets.only(top: 20, left: 10, right: 10));
    }).whenComplete(() => ProgressDialogUtils.hideProgressDialog());
  }

  updatePass() {
    //reauthenticate using oldPassword TextEditingController and then update password
    var user = FirebaseAuth.instance.currentUser!;
    var credential = EmailAuthProvider.credential(
      email: user.email!,
      password: oldPasswordController.value.text,
    );

    // Reauthenticate the user with the credentials
    user.reauthenticateWithCredential(credential).then((_) {
      // Update the user's password
      user.updatePassword(passwordController.value.text).then((_) {
        Get.snackbar("Password updated successfully", "",
            backgroundColor: ColorConstant.deepPurple300.withOpacity(0.2),
            padding: EdgeInsets.only(top: 20, left: 10, right: 10));
      }).catchError((error) {
        print(error);
        // Handle password update error
      }).whenComplete(() => ProgressDialogUtils.hideProgressDialog());
    }).catchError((error) {
      print(error);
      // Handle reauthentication error
    }).whenComplete(() => ProgressDialogUtils.hideProgressDialog());
  }

  updatePhoto(value) async {
    var file = File(value);
    // upload profile image to firebase storage
    await FirebaseStorage.instance
        .ref()
        .child("images/${FirebaseAuth.instance.currentUser!.uid}")
        .putFile(file)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print("Image Url $value");
        // update profile image url in firebase auth
        FirebaseAuth.instance.currentUser!.updatePhotoURL(value).then((_) {
          homeController.imgSrc = value;
          update();
        }).whenComplete(() => ProgressDialogUtils.hideProgressDialog());
      });
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
