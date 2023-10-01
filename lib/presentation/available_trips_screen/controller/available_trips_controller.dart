import 'dart:convert';
import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'package:mytravelapp/data/models/flight_model.dart';
import 'package:mytravelapp/presentation/available_trips_screen/models/itineraries.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum FilterType { price, duration, additionalStops, quality }

class AvailableTripsController extends GetxController {
  List<List<FlightModel>> searchResult = [];
  String? errorMsg = "";
  bool isMultiCity = false;
  int flightCount = 1;
  String currency = "USD";

  FilterType filterType = FilterType.price;

  // this is the search flight function that fetches result from the RapidApi for skyScanner endpoint
  Future<void> search(Map<dynamic, dynamic> query) async {
    errorMsg = "";
    await getCurrency();
    final url = Uri.parse('https://api.tequila.kiwi.com/v2/search');
    final headers = {
      'accept': 'application/json',
      'apikey': 'fBgjiFP9Tz2OwfZJxpxgflD2oObOv1fc',
    };

    final params = {
      'fly_from': query['fromIATA'],
      'fly_to': query['toIATA'],
      'date_from': DateFormat('yyyy-MM-dd').format(query['departureDate']),
      'date_to': DateFormat('yyyy-MM-dd').format(query['departureDate']),
      'adults': query['adultCount'].toString(),
      'children': query['childCount'].toString(),
      'infants': query['infantCount'].toString(),
      'curr': currency,
      'selected_cabins': query['carbinClass'],
    };
    if (query['index'] == 1) {
      params.addAll({
        'return_from': DateFormat('yyyy-MM-dd').format(query['returnDate']),
        'return_to': DateFormat('yyyy-MM-dd').format(query['returnDate']),
      });
    }

    log("params $params");

    final response =
        await http.get(url.replace(queryParameters: params), headers: headers);
    print(response.statusCode);

    if (response.statusCode == 200) {
      // result are be decoded from json to Map
      update();
      log(jsonDecode(response.body)['data']
          .map((e) => jsonEncode(e))
          .toList()
          .first
          .toString());
      try {
        List<FlightModel> flightList = [];
        jsonDecode(response.body)['data'].forEach((v) {
          flightList.add(new FlightModel.fromJson(v));
        });
        // flightList.sort((a, b) => a.quality!.compareTo(b.quality!));
        searchResult.add(
            flightList.where((element) => element.deepLink != null).toList());
      } catch (e) {
        print("error in search $e");
      }
    } else {
      // error message is being returned if HTTP code wasn't 200
      errorMsg = response.reasonPhrase;

      update();
      print(response.reasonPhrase);
    }
    return null;
  }
  // Future<void> search(Map<dynamic, dynamic> query) async {
  //   errorMsg = "";
  //   await getCurrency();
  //   final url =
  //       Uri.parse('https://skyscanner44.p.rapidapi.com/search-extended');
  //   final headers = {
  //     'X-RapidAPI-Key': 'a6d93fbcf6msh3b17bf1c7ff9293p1649c6jsn52a8cbf11157',
  //     'X-RapidAPI-Host': 'skyscanner44.p.rapidapi.com',
  //   };

  //   final params = {
  //     'adults': query['adultCount'].toString(),
  //     'origin': query['fromIATA'],
  //     'destination': query['toIATA'],
  //     'departureDate': DateFormat('yyyy-MM-dd').format(query['departureDate']),
  //     'currency': currency,
  //     'cabinClass': query['carbinClass'],
  //   };
  //   if (query['index'] == 1) {
  //     params.addAll({
  //       'returnDate': DateFormat('yyyy-MM-dd').format(query['returnDate']),
  //     });
  //   }

  //   final response =
  //       await http.get(url.replace(queryParameters: params), headers: headers);

  //   if (response.statusCode == 200) {
  //     // result are be decoded from json to Map
  //     update();
  //     try {
  //       searchResult.add(
  //           Itineraries.fromJson(json.decode(response.body)['itineraries']));
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else {
  //     // error message is being returned if HTTP code wasn't 200
  //     errorMsg = response.reasonPhrase;

  //     update();
  //     print(response.reasonPhrase);
  //   }
  //   return null;
  // }

  Future<void> getCurrency() async {
    final prefs = await SharedPreferences.getInstance();
    currency = prefs.getString("currency") ?? "USD";
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
