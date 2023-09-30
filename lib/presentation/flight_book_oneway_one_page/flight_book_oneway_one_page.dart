import 'package:flutter/material.dart';

import '../../widgets/flightSearch.dart';
import '../available_trips_screen/controller/available_trips_controller.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/widgets/custom_button.dart';

import 'controller/flight_book_oneway_one_controller.dart';

class FlightBookOnewayOnePage extends GetWidget {
  final FlightBookOnewayOneController controller =
      Get.put(FlightBookOnewayOneController());
  AvailableTripsController _controller = Get.put(AvailableTripsController());

  final TabController? tabController;

  FlightBookOnewayOnePage({this.tabController});

  Future<void> _selectDate(BuildContext context, int index) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate:
            index == 1 ? controller.selectedDate2 : controller.selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      print("picked date is $picked");
      print("tab index is ${controller.tabIndex}");
      if (index == 0) {
        controller.selectedDate = picked;
      } else {
        controller.selectedDate2 = picked;
      }
      controller.update();
    }
  }

  Future<void> editTravelersDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: getPadding(all: 0),
          title: Text(
            'Edit Travelers',
            style: AppStyle.txtPoppinsSemiBold24Bluegray700,
          ),
          content: GetBuilder<FlightBookOnewayOneController>(
              builder: (flightController) {
            return Container(
              width: size.width,
              height: size.height * 0.26,
              child: Column(
                children: [
                  Container(
                    padding: getPadding(all: 16),
                    decoration: AppDecoration.fillGray100.copyWith(
                      color: Colors.white,
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Adults",
                              style: AppStyle.txtPoppinsSemiBold16Gray900,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (controller.adultCount > 1) {
                                      controller.adultCount--;
                                      controller.update();
                                    }
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: ColorConstant.deepPurple300,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                          color: ColorConstant.deepPurple300,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "${controller.adultCount}",
                                  style: AppStyle.txtPoppinsSemiBold16Gray900,
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    if (controller.adultCount < 5) {
                                      controller.adultCount++;
                                      controller.update();
                                    }
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: ColorConstant.deepPurple300,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                          color: ColorConstant.deepPurple300,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Children",
                              style: AppStyle.txtPoppinsSemiBold16Gray900,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (controller.childCount > 0) {
                                      controller.childCount--;
                                      controller.update();
                                    }
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: ColorConstant.deepPurple300,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                          color: ColorConstant.deepPurple300,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "${controller.childCount}",
                                  style: AppStyle.txtPoppinsSemiBold16Gray900,
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    if (controller.childCount < 5) {
                                      controller.childCount++;
                                      controller.update();
                                    }
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: ColorConstant.deepPurple300,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                          color: ColorConstant.deepPurple300,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Infants",
                              style: AppStyle.txtPoppinsSemiBold16Gray900,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (controller.infantCount > 0) {
                                      controller.infantCount--;
                                      controller.update();
                                    }
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: ColorConstant.deepPurple300,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                          color: ColorConstant.deepPurple300,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "${controller.infantCount}",
                                  style: AppStyle.txtPoppinsSemiBold16Gray900,
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    if (controller.infantCount < 5) {
                                      controller.infantCount++;
                                      controller.update();
                                    }
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.whiteA700,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: ColorConstant.deepPurple300,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                          color: ColorConstant.deepPurple300,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              controller.update();
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Apply",
                                style: TextStyle(
                                  color: ColorConstant.deepPurple300,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
                width: size.width,
                height: size.height,
                child: SingleChildScrollView(
                    child: GetBuilder(
                        init: controller,
                        builder: (_) {
                          controller.tabIndex = tabController!.index;
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: getMargin(
                                        left: 15,
                                        top: 15,
                                        right: 15,
                                        bottom: 20),
                                    padding: getPadding(all: 16),
                                    decoration: AppDecoration.fillGray100
                                        .copyWith(
                                            color: Colors.white,
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          BookingForm(
                                            title: "FROM",
                                            value: controller.fromLocation ??
                                                "Your Location",
                                            icon: Icon(Icons.flight_takeoff),
                                            onTap: () {
                                              Get.dialog(searchFlightDialog(
                                                onChange: (value) {
                                                  controller.fromIATA =
                                                      value.iataCode;
                                                  controller.fromLocation =
                                                      value.cityName! +
                                                          ", " +
                                                          value.countryName!;
                                                  controller.update();
                                                },
                                              ));
                                            },
                                          ),
                                          BookingForm(
                                            title: "TO",
                                            value: controller.toLocation ??
                                                "Destination",
                                            onTap: () {
                                              Get.dialog(
                                                searchFlightDialog(
                                                  isDestination: false,
                                                  onChange: (value) {
                                                    controller.toITAT =
                                                        value.iataCode;
                                                    controller.toLocation =
                                                        value.cityName! +
                                                            ", " +
                                                            value.countryName!;
                                                    controller.update();
                                                  },
                                                ),
                                              );
                                            },
                                            icon: Icon(
                                                Icons.flight_land_outlined),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: BookingForm(
                                                  title: "DEPARTURE",
                                                  value:
                                                      "${controller.selectedDate.day}/${controller.selectedDate.month}/${controller.selectedDate.year}",
                                                  icon: Icon(
                                                      Icons.calendar_month),
                                                  onTap: () {
                                                    _selectDate(context, 0);
                                                  },
                                                ),
                                              ),
                                              controller.tabIndex == 1
                                                  ? SizedBox(width: 10)
                                                  : SizedBox(),
                                              controller.tabIndex == 1
                                                  ? Expanded(
                                                      child: BookingForm(
                                                        title: "RETURN",
                                                        value:
                                                            "${controller.selectedDate2.day}/${controller.selectedDate2.month}/${controller.selectedDate2.year}",
                                                        icon: Icon(Icons
                                                            .calendar_month),
                                                        onTap: () {
                                                          _selectDate(
                                                              context, 1);
                                                        },
                                                      ),
                                                    )
                                                  : SizedBox(),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: BookingForm(
                                                  title: "Travelers",
                                                  value:
                                                      "${controller.adultCount > 1 ? controller.adultCount.toString() + " Adults" : controller.adultCount.toString() + " Adult"}${controller.childCount > 1 ? ", " + controller.childCount.toString() + " Children" : controller.childCount == 0 ? "" : ", " + controller.childCount.toString() + " Child"}${controller.infantCount > 1 ? ", " + controller.infantCount.toString() + " Infants" : controller.infantCount == 0 ? "" : ", " + controller.infantCount.toString() + " Infant"}",
                                                  icon: Icon(Icons.person),
                                                  onTap: () {
                                                    editTravelersDialog(
                                                        context);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: PopupMenuButton(
                                                    // position: PopupMenuPosition.under,
                                                    child: BookingForm(
                                                      title: "CLASS",
                                                      value:
                                                          controller.fClass ??
                                                              "Economy",
                                                      endicon: Icon(
                                                          Icons.expand_more),
                                                    ),
                                                    onSelected: (value) {
                                                      controller
                                                          .updateClass(value);
                                                    },
                                                    itemBuilder: (context) => [
                                                          PopupMenuItem(
                                                            child:
                                                                Text("Economy"),
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

                                          // PopupMenuButton(
                                          //   // position: PopupMenuPosition.under,
                                          //   // clipBehavior: Clip.hardEdge,
                                          //   child: BookingForm(
                                          //     title: "Adults",
                                          //     value: "${controller.adultCount}",
                                          //     endicon: Icon(Icons.expand_more),
                                          //   ),
                                          //   onSelected: (value) {
                                          //     controller.updatePes(value);
                                          //   },
                                          //   itemBuilder: (context) => [
                                          //     PopupMenuItem(
                                          //       child: Text("1".capitalize!),
                                          //       value: 1,
                                          //     ),
                                          //     PopupMenuItem(
                                          //       child: Text("2".capitalize!),
                                          //       value: 2,
                                          //     ),
                                          //     PopupMenuItem(
                                          //       child: Text("3".capitalize!),
                                          //       value: 3,
                                          //     ),
                                          //     PopupMenuItem(
                                          //       child: Text("4".capitalize!),
                                          //       value: 4,
                                          //     ),
                                          //   ],
                                          // ),
                                          // PopupMenuButton(
                                          //   // position: PopupMenuPosition.under,
                                          //   // clipBehavior: Clip.hardEdge,
                                          //   child: BookingForm(
                                          //     title: "Children",
                                          //     value: "${controller.childCount}",
                                          //     endicon: Icon(Icons.expand_more),
                                          //   ),
                                          //   onSelected: (value) {
                                          //     controller.updatePes(value);
                                          //   },
                                          //   itemBuilder: (context) => [
                                          //     PopupMenuItem(
                                          //       child: Text("0".capitalize!),
                                          //       value: 0,
                                          //     ),
                                          //     PopupMenuItem(
                                          //       child: Text("1".capitalize!),
                                          //       value: 1,
                                          //     ),
                                          //     PopupMenuItem(
                                          //       child: Text("2".capitalize!),
                                          //       value: 2,
                                          //     ),
                                          //     PopupMenuItem(
                                          //       child: Text("3".capitalize!),
                                          //       value: 3,
                                          //     ),
                                          //     PopupMenuItem(
                                          //       child: Text("4".capitalize!),
                                          //       value: 4,
                                          //     ),
                                          //   ],
                                          // ),
                                          // PopupMenuButton(
                                          //   // position: PopupMenuPosition.under,
                                          //   // clipBehavior: Clip.hardEdge,
                                          //   child: BookingForm(
                                          //     title: "Infants",
                                          //     value:
                                          //         "${controller.infantCount}",
                                          //     endicon: Icon(Icons.expand_more),
                                          //   ),
                                          //   onSelected: (value) {
                                          //     controller.updatePes(value);
                                          //   },
                                          //   itemBuilder: (context) => [
                                          //     PopupMenuItem(
                                          //       child: Text("0".capitalize!),
                                          //       value: 0,
                                          //     ),
                                          //     PopupMenuItem(
                                          //       child: Text("1".capitalize!),
                                          //       value: 1,
                                          //     ),
                                          //     PopupMenuItem(
                                          //       child: Text("2".capitalize!),
                                          //       value: 2,
                                          //     ),
                                          //     PopupMenuItem(
                                          //       child: Text("3".capitalize!),
                                          //       value: 3,
                                          //     ),
                                          //     PopupMenuItem(
                                          //       child: Text("4".capitalize!),
                                          //       value: 4,
                                          //     ),
                                          //   ],
                                          // ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                      height:
                                                          getVerticalSize(50),
                                                      text: "lbl_continue".tr,
                                                      onTap: onTapContinue),
                                                )
                                              ]),
                                        ]))
                              ]);
                        })))));
  }

  onTapContinue() {
    _controller.searchResult.clear();
    _controller.isMultiCity = false;
    if (controller.toITAT == null && controller.fromIATA == null) {
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
