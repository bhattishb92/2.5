import 'package:flutter/cupertino.dart';
import 'package:mytravelapp/data/models/flight_model.dart';
import 'package:mytravelapp/presentation/available_trips_screen/models/results.dart';
import 'package:mytravelapp/presentation/available_trips_screen/widgets/listcityfrom2_item_widget.dart';
import 'package:mytravelapp/presentation/flight_book_multi_city_page/controller/flight_book_multi_city_controller.dart';
import 'package:mytravelapp/widgets/app_bar/appbar_iconbutton.dart';
import 'package:mytravelapp/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:mytravelapp/widgets/app_bar/custom_app_bar.dart';

import '../flight_book_oneway_one_page/controller/flight_book_oneway_one_controller.dart';
import 'controller/available_trips_controller.dart';
import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';

class AvailableTripsScreen extends GetWidget<AvailableTripsController> {
  final FlightBookOnewayOneController _oneWayController =
      Get.put(FlightBookOnewayOneController());
  final FlightBookMultiCityController _multiCityController =
      Get.put(FlightBookMultiCityController());

  Future<void> getFlights(int length) async {
    controller.searchResult.clear();
    if (controller.isMultiCity) {
      for (int i = 0; i < length; i++) {
        // for multi city search
        await controller.search({
          "fromIATA": _multiCityController.fromIATA[i],
          "toIATA": _multiCityController.toITAT[i],
          "date": _multiCityController.selectedDate[i].day,
          "month": _multiCityController.selectedDate[i].month,
          "year": _multiCityController.selectedDate[i].year,
          "departureDate": _multiCityController.selectedDate[i],
          "adultCount": _multiCityController.adultCount[i],
          "childCount": _multiCityController.childCount[i],
          "infantCount": _multiCityController.infantCount[i],
          "carbinClass": _multiCityController.carbinClass[i],
        });
      }
    } else {
      await controller.search({
        "fromIATA": _oneWayController.fromIATA,
        "toIATA": _oneWayController.toITAT,
        "date": _oneWayController.selectedDate.day,
        "month": _oneWayController.selectedDate.month,
        "year": _oneWayController.selectedDate.year,
        "departureDate": _oneWayController.selectedDate,
        "adultCount": _oneWayController.adultCount,
        "childCount": _oneWayController.childCount,
        "infantCount": _oneWayController.infantCount,
        "index": _oneWayController.tabIndex,
        "date_2": _oneWayController.selectedDate2.day,
        "month_2": _oneWayController.selectedDate2.month,
        "year_2": _oneWayController.selectedDate2.year,
        "returnDate": _oneWayController.selectedDate2,
        "carbinClass": _oneWayController.carbinClass,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        height: getVerticalSize(70),
        leadingWidth: 64,
        leading: AppbarIconbutton(
            svgPath: ImageConstant.imgArrowleftBlueGray700,
            margin: getMargin(left: 24),
            onTap: onTapArrowleft11),
        centerTitle: true,
        title: AppbarSubtitle2(text: "msg_available_flights".tr),
        actions: [
          PopupMenuButton<FilterType>(
            icon: Icon(
              Icons.filter_list,
              color: ColorConstant.deepPurple800,
            ),
            onSelected: (FilterType value) {
              controller.filterType = value;
              controller.update();
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("By Price"),
                  value: FilterType.price,
                ),
                PopupMenuItem(
                  child: Text("By Time"),
                  value: FilterType.duration,
                ),
                PopupMenuItem(
                  child: Text("By Stops"),
                  value: FilterType.additionalStops,
                ),
                PopupMenuItem(
                  child: Text("By Quality"),
                  value: FilterType.quality,
                ),
              ];
            },
          )
        ],
      ),
      backgroundColor: ColorConstant.whiteA700,
      body: FutureBuilder(
          future: getFlights(_multiCityController.totalFlights),
          // future: Future.delayed(Duration(seconds: 1)),
          builder: (context, data) {
            if (data.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: ColorConstant.deepPurple800,
              ));
            }
            if (controller.searchResult.isEmpty) {
              return Container(
                height: size.height * 45 / 100,
                child: Center(child: Text("No result found")),
              );
            }
            return GetBuilder<AvailableTripsController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.searchResult.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    List<FlightModel> results = [];
                    results.addAll(controller.searchResult[i] ?? []);
                    if (controller.filterType == FilterType.price) {
                      results.sort(
                          (a, b) => (a.price ?? 0).compareTo((b.price ?? 0)));
                    }
                    if (controller.filterType == FilterType.duration) {
                      results.sort((a, b) {
                        final aDuration = a.utcArrival != null &&
                                a.utcDeparture != null
                            ? Duration(
                                minutes: DateTime.parse(a.utcArrival!)
                                    .difference(DateTime.parse(a.utcDeparture!))
                                    .inMinutes,
                              )
                            : Duration.zero;
                        final bDuration = b.utcArrival != null &&
                                b.utcDeparture != null
                            ? Duration(
                                minutes: DateTime.parse(b.utcArrival!)
                                    .difference(DateTime.parse(b.utcDeparture!))
                                    .inMinutes,
                              )
                            : Duration.zero;
                        return aDuration.compareTo(bDuration);
                      });
                    }
                    if (controller.filterType == FilterType.additionalStops) {
                      results.sort((a, b) =>
                          (a.pnrCount ?? 0).compareTo((b.pnrCount ?? 0)));
                    }
                    if (controller.filterType == FilterType.quality) {
                      results.sort((a, b) =>
                          (a.quality ?? 0).compareTo((b.quality ?? 0)));
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (controller.isMultiCity)
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: ColorConstant.deepPurple800,
                            ),
                            child: Text(
                              "FLIGHT ${i + 1}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorConstant.whiteA700,
                                fontSize: getFontSize(
                                  16,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: getVerticalSize(
                                  1.50,
                                ),
                              ),
                            ),
                          ),

                        /// this function returns "no result found" widget if the search api didn't return an result
                        if (controller.searchResult[i].isEmpty)
                          Container(
                            height: size.height * 45 / 100,
                            child: Center(child: Text("No result found")),
                          ),

                        Padding(
                          padding: getPadding(),
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: getVerticalSize(16));
                            },
                            itemCount: results.length,
                            itemBuilder: (context, index) {
                              return Listcityfrom2ItemWidget(
                                availResult: results[index],
                              );
                            },
                          ),
                        )
                      ],
                    );
                  });
            });
          }),
    ));
  }

  onTapArrowleft11() {
    Get.back();
  }

  onTapSearch1() {
    Get.back();
  }

  onTapImgClose() {
    Get.back();
  }
}

///this function returns either AM or PM according to the currect hour passed to the function
String? getTime(int hour) {
  if (hour > 11 && hour <= 23) {
    return "PM";
  }
  return "AM";
}

// this function results the giving month name
// e.g 1 = Jan and 12 = Dec
String getMonth(int month) {
  switch (month) {
    case 1:
      return "Jan";
    case 2:
      return "Feb";
    case 3:
      return "Mar";
    case 4:
      return "April";
    case 5:
      return "May";
    case 6:
      return "June";
    case 7:
      return "July";
    case 8:
      return "Aug";
    case 9:
      return "Sept";
    case 10:
      return "Oct";
    case 11:
      return "Nov";
    case 12:
      return "Dec";
  }
  return "";
}
