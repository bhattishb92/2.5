// import 'package:backendless_sdk/backendless_sdk.dart';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/presentation/home_screen/models/home_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../data/models/selectionPopupModel/searchResultModel.dart';

class HomeController extends GetxController {
  Rx<HomeModel> homeModelObj = HomeModel().obs;
  String? name = "";
  String? email = "";
  String? imgSrc = "";
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    updateDetails();
  }

  updateDetails() {
    print("Fetching current user");
    // when user is signed in or signed out this will be called
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        name = user.displayName;
        email = user.email;
        imgSrc = user.photoURL;
        print("User details updated");
        update();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class FlightSearchController extends GetxController {
  List searchResult = [];
  TextEditingController searchController = TextEditingController();

  search(String? value) async {
    log("ffff Searching for $value");
    var headers = {
      'apikey': 'fBgjiFP9Tz2OwfZJxpxgflD2oObOv1fc',
      'accept': 'application/json'
    };
    var queryParameters = {
      'term': value,
      'locale': 'en-US',
      'location_types': 'airport',
      'limit': '10',
      'active_only': 'true'
    };
    var uri =
        Uri.https('api.tequila.kiwi.com', '/locations/query', queryParameters);
    var request = http.Request('GET', uri);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Map<dynamic, dynamic> result =
          await jsonDecode(await response.stream.bytesToString());
      // log("ffff Result: $result");
      searchResult = result["locations"];
      // searchResult = List<FightSearch>.from(result["locations"].map((e) {
      //   return FightSearch.fromMap(e);
      // }).toList());
      update();
    } else {
      log("ffff Error: ${response.reasonPhrase}");
      print(response.reasonPhrase);
    }
  }

  @override
  void onReady() {
    super.onReady();
    this.searchResult = [];
    this.searchController.text = "";
  }

  @override
  void onClose() {
    super.onClose();
    this.searchController.dispose();
  }
}
