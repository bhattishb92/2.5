import 'package:flutter/material.dart';
import 'package:mytravelapp/widgets/flightSearch.dart';

import '../available_trips_screen/controller/available_trips_controller.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/widgets/custom_button.dart';

import 'controller/flight_book_multi_city_controller.dart';

class FlightBookMultiCityPage extends GetWidget {
  final FlightBookMultiCityController controller =
      Get.put(FlightBookMultiCityController());
  AvailableTripsController _controller = Get.put(AvailableTripsController());

  final TabController? tabController;

  FlightBookMultiCityPage({this.tabController});

  Future<void> _selectDate(BuildContext context, int index) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller.selectedDate[index],
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      controller.selectedDate[index] = picked;

      controller.update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            GetBuilder(
              init: controller,
              builder: (_) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: getMargin(
                              left: 15, top: 15, right: 15, bottom: 20),
                          padding: getPadding(all: 16),
                          decoration: AppDecoration.fillGray100.copyWith(
                              color: Colors.white,
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: getVerticalSize(430),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.totalFlights,
                                      // physics:
                                      //     const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "FLIGHT ${index + 1}",
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: ColorConstant
                                                          .deepPurple800,
                                                      fontSize: getFontSize(
                                                        16,
                                                      ),
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: getVerticalSize(
                                                        1.50,
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  InkWell(
                                                    onTap: () {
                                                      if (controller
                                                              .totalFlights ==
                                                          1) {
                                                        return;
                                                      }
                                                      controller.totalFlights--;
                                                      controller.update();
                                                    },
                                                    child: Icon(
                                                      Icons.close,
                                                      color: ColorConstant
                                                          .deepPurple800,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: BookingForm(
                                                    title: "FROM",
                                                    value:
                                                        controller.fromLocation[
                                                                index] ??
                                                            "Your Location",
                                                    icon: Icon(
                                                        Icons.flight_takeoff),
                                                    onTap: () {
                                                      Get.dialog(
                                                          searchFlightDialog(
                                                        onChange: (value) {
                                                          controller.fromIATA[
                                                                  index] =
                                                              value.iataCode;
                                                          controller
                                                                  .fromLocation[
                                                              index] = value
                                                                  .cityName! +
                                                              ", " +
                                                              value
                                                                  .countryName!;
                                                          controller.update();
                                                        },
                                                      ));
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: BookingForm(
                                                    title: "TO",
                                                    value:
                                                        controller.toLocation[
                                                                index] ??
                                                            "Destination",
                                                    onTap: () {
                                                      Get.dialog(
                                                        searchFlightDialog(
                                                          isDestination: false,
                                                          onChange: (value) {
                                                            controller.toITAT[
                                                                    index] =
                                                                value.iataCode;
                                                            controller
                                                                    .toLocation[
                                                                index] = value
                                                                    .cityName! +
                                                                ", " +
                                                                value
                                                                    .countryName!;
                                                            controller.update();
                                                          },
                                                        ),
                                                      );
                                                    },
                                                    icon: Icon(Icons
                                                        .flight_land_outlined),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            BookingForm(
                                              title: "DEPARTURE",
                                              value:
                                                  "${controller.selectedDate[index].day}/${controller.selectedDate[index].month}/${controller.selectedDate[index].year}",
                                              icon: Icon(Icons.calendar_month),
                                              onTap: () {
                                                _selectDate(
                                                  context,
                                                  index,
                                                );
                                              },
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: PopupMenuButton(
                                                      // position: PopupMenuPosition.under,
                                                      // clipBehavior: Clip.hardEdge,
                                                      child: BookingForm(
                                                        title: "PASSENGER",
                                                        value:
                                                            "${controller.pessengerCount[index]} ${controller.pessengerType[index]}",
                                                        endicon: Icon(
                                                            Icons.expand_more),
                                                      ),
                                                      onSelected: (value) {
                                                        controller.updatePes(
                                                            value, index);
                                                      },
                                                      itemBuilder: (context) =>
                                                          [
                                                            PopupMenuItem(
                                                              child: Text("1"
                                                                  .capitalize!),
                                                              value: 0,
                                                            ),
                                                            PopupMenuItem(
                                                              child: Text("2"
                                                                  .capitalize!),
                                                              value: 1,
                                                            ),
                                                            PopupMenuItem(
                                                              child: Text("3"
                                                                  .capitalize!),
                                                              value: 2,
                                                            ),
                                                            PopupMenuItem(
                                                              child: Text("4"
                                                                  .capitalize!),
                                                              value: 3,
                                                            ),
                                                          ]),
                                                ),
                                                SizedBox(width: 10),
                                                Expanded(
                                                  child: PopupMenuButton(
                                                      // position: PopupMenuPosition.under,
                                                      child: BookingForm(
                                                        title: "CLASS",
                                                        value:
                                                            controller.fClass[
                                                                    index] ??
                                                                "Economy",
                                                        endicon: Icon(
                                                            Icons.expand_more),
                                                      ),
                                                      onSelected: (value) {
                                                        controller.updateClass(
                                                            value, index);
                                                      },
                                                      itemBuilder: (context) =>
                                                          [
                                                            PopupMenuItem(
                                                              child: Text(
                                                                  "Economy"),
                                                              value: 0,
                                                            ),
                                                            PopupMenuItem(
                                                              child: Text(
                                                                  "Premium Economy"),
                                                              value: 1,
                                                            ),
                                                            PopupMenuItem(
                                                              child: Text(
                                                                  "Business"),
                                                              value: 2,
                                                            ),
                                                            PopupMenuItem(
                                                              child: Text(
                                                                  "First Class"),
                                                              value: 3,
                                                            ),
                                                          ]),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (controller.totalFlights == 6) {
                                      return;
                                    }
                                    controller.addFlight();
                                  },
                                  child: Center(
                                    child: Text(
                                      "ADD FLIGHT",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorConstant.deepPurple800,
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
                                ),
                                SizedBox(height: 10),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // CustomImageView(
                                      //   width: 60,
                                      //   height: 60,
                                      //   placeHolder: "Logo",
                                      //   fit: BoxFit.fill,
                                      //   imagePath:
                                      //       ImageConstant.logo_2,
                                      // ),
                                      Expanded(
                                        child: CustomButton(
                                            width: double.infinity,
                                            height: getVerticalSize(50),
                                            text: "lbl_continue".tr,
                                            onTap: onTapContinue),
                                      )
                                    ])
                              ]))
                    ]);
              },
            ),
          ],
        ),
      ),
    );
  }

  onTapContinue() {
    _controller.searchResult.clear();
    _controller.isMultiCity = true;
    if (controller.toITAT.where((element) => element != null).isEmpty &&
        controller.fromIATA.where((element) => element != null).isEmpty) {
    } else {
      Get.toNamed(AppRoutes.availableTripsScreen);
    }
  }
}

class BookingForm extends StatelessWidget {
  const BookingForm({
    Key? key,
    this.title,
    this.value,
    this.onTap,
    this.icon,
    this.content,
    this.endicon,
  }) : super(key: key);

  final String? title;
  final dynamic value;
  final Function()? onTap;
  final Widget? icon;
  final Widget? endicon;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(bottom: 30),
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: TextField(
              onTap: onTap,
              readOnly: true,
              decoration: InputDecoration(
                enabled: false,
                labelStyle: AppStyle.txtPoppinsSemiBold16Gray900.copyWith(
                  color: Colors.grey.shade700,
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade500,
                  ),
                ),
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: title ?? "",
                hintText: value,
                hoverColor: ColorConstant.deepPurple300,
                helperMaxLines: 1,
                hintStyle: TextStyle(
                  // overflow: TextOverflow.visible,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
                prefixIcon: icon ?? null,
                suffixIcon: endicon ?? null,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
