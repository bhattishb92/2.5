import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mytravelapp/data/models/flight_model.dart';
import 'package:mytravelapp/presentation/available_trips_screen/controller/available_trips_controller.dart';
import 'package:mytravelapp/presentation/available_trips_screen/models/results.dart';

import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/presentation/available_trips_screen/models/segments.dart';
import 'package:mytravelapp/presentation/flight_book_oneway_one_page/controller/flight_book_oneway_one_controller.dart';
import 'package:mytravelapp/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher_string.dart';

// ignore: must_be_immutable
class Listcityfrom2ItemWidget extends StatelessWidget {
  FlightModel availResult;

  Listcityfrom2ItemWidget({
    Key? key,
    required this.availResult,
  });

  //Add space like USD 1000
  String formatPrice(String price) {
    String currencyCode = Get.find<AvailableTripsController>().currency;
    final f = NumberFormat.currency(
        locale: "en_US",
        symbol: currencyCode,
        decimalDigits: 0,
        customPattern: "\u00a4 #,##0");
    return f.format(double.parse(price));
  }

  @override
  Widget build(BuildContext context) {
    bool isReturn = false;

    return Card(
      elevation: 0.9,
      margin: getMargin(left: 10, right: 10),
      child: Container(
        padding: getPadding(
          left: 16,
          top: 0,
          right: 16,
          bottom: 0,
        ),
        child: Stack(
          children: [
            CustomImageView(
              svgPath: ImageConstant.imgGroup21,
              height: getVerticalSize(
                42,
              ),
              width: getHorizontalSize(
                130,
              ),
              alignment: Alignment.center,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: getMargin(top: 30),
                child: Text(
                  formatDurationInHhMmSs(
                    Duration(
                      minutes: int.parse(DateTime.parse(availResult.localArrival!)
                          .difference(
                            DateTime.parse(availResult.localDeparture!),
                          )
                          .inMinutes
                          .toString()),
                    ),
                  ),
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtRobotoRegular12,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: getPadding(
                    left: 3,
                    top: 20,
                    right: 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            availResult.cityCodeFrom ?? "",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsSemiBold24,
                          ),
                          Text(
                            availResult.cityFrom ?? "",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsRegular14,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: size.width * 25 / 100,
                            child: Text(
                              availResult.cityCodeTo ?? "",
                              textAlign: TextAlign.right,
                              style: AppStyle.txtPoppinsSemiBold24,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 25 / 100,
                            child: Text(
                              availResult.cityTo ?? "",
                              textAlign: TextAlign.right,
                              style: AppStyle.txtPoppinsRegular14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 3,
                    top: 5,
                    right: 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_departure".tr.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular14Bluegray300,
                      ),
                      Text(
                        "Arrival Date".tr.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular14Bluegray300,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 3,
                    top: 1,
                    right: 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat("dd MMM hh:mm a").format(
                          DateTime.parse(
                            availResult.localDeparture!,
                          ),
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular14,
                      ),
                      Text(
                        DateFormat("dd MMM hh:mm a").format(
                          DateTime.parse(
                            availResult.localArrival!,
                          ),
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: AppStyle.txtPoppinsRegular14,
                      ),
                    ],
                  ),
                ),
                // if (availResult.legs![0].stopCount! > 0)
                Padding(
                  padding: getPadding(
                    left: 3,
                    top: 3,
                    right: 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (availResult.pnrCount! > 1
                                ? "${availResult.pnrCount!} Additonal Stops"
                                : "${availResult.pnrCount!} Additonal Stop")
                            .tr
                            .toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstant.deepPurple800,
                          fontSize: getFontSize(
                            16,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          height: getVerticalSize(
                            1.50,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: ColorConstant.gray300,
                ),
                Padding(
                  padding: getPadding(
                    left: 2,
                    top: 0,
                    right: 1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          formatPrice(availResult.price.toString()),
                          style: AppStyle.txtPoppinsSemiBold24
                              .copyWith(fontSize: 20),
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          height: getVerticalSize(30),
                          width: getHorizontalSize(100),
                          text: "Check",
                          margin: getMargin(
                            top: 3,
                            left: 20,
                            bottom: 3,
                          ),
                          onTap: () {
                            Get.bottomSheet(
                              flightDetails(
                                availResult: availResult,
                                totalFare:
                                    formatPrice(availResult.price.toString()),
                              ),
                              isScrollControlled: true,
                            );
                          },
                          padding: ButtonPadding.PaddingAll4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class flightDetails extends StatelessWidget {
  final FlightModel availResult;
  final String? totalFare;
  final String? discount;
  final bool isLoading;
  String? fareType;

  flightDetails({
    Key? key,
    required this.availResult,
    this.totalFare,
    this.discount,
    this.isLoading = false,
    this.fareType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      String? adult =
          Get.find<FlightBookOnewayOneController>().adultCount.toString();
      fareType = Get.find<FlightBookOnewayOneController>().fClass;

      return SingleChildScrollView(
        child: Container(
          child: Wrap(
            children: [
              Container(
                padding: getMargin(all: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: getPadding(top: 0),
                  child: Stack(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgFrame,
                        height: getVerticalSize(129),
                        alignment: Alignment.topCenter,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 80),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "Details",
                                  style: AppStyle.txtPoppinsBold20,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "",
                                  style: AppStyle.txtPoppinsBold20,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Passengers",
                                  style: AppStyle.txtPoppinsMedium16
                                      .copyWith(color: Colors.black)),
                              DetailsList(
                                  title: "No of Travellers:", trailer: adult),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "DEPARTURE FLIGHT".toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorConstant.deepPurple300,
                                      fontSize: getFontSize(
                                        16,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            availResult.cityFrom!,
                                            style: AppStyle.txtPoppinsMedium16
                                                .copyWith(color: Colors.black),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_sharp,
                                            size: 20,
                                          ),
                                          Text(
                                            availResult.cityTo!,
                                            style: AppStyle.txtPoppinsMedium16
                                                .copyWith(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 18,
                                          ),
                                          Text(
                                            formatDurationInHhMmSs(
                                              Duration(
                                                minutes: int.parse(
                                                    DateTime.parse(availResult
                                                            .localArrival!)
                                                        .difference(
                                                          DateTime.parse(
                                                              availResult
                                                                  .localDeparture!),
                                                        )
                                                        .inMinutes
                                                        .toString()),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Divider(thickness: 2, height: 30),
                                  layOverContainer(availResult.route!),
                                ],
                              ),
                              Divider(thickness: 2, height: 30),
                              // if (availResult.legs!.length > 1)
                              //   Column(
                              //     children: [
                              //       SizedBox(
                              //         height: 10,
                              //       ),
                              //       Text(
                              //         "Return FLIGHT".toUpperCase(),
                              //         textAlign: TextAlign.center,
                              //         style: TextStyle(
                              //           color: ColorConstant.deepPurple300,
                              //           fontSize: getFontSize(
                              //             16,
                              //           ),
                              //           fontFamily: 'Poppins',
                              //           fontWeight: FontWeight.bold,
                              //         ),
                              //       ),
                              //       layOverContainer(
                              //           availResult.legs![1].segments!),
                              //       Divider(thickness: 2, height: 30),
                              //     ],
                              //   ),
                              Text("Summary",
                                  style: AppStyle.txtPoppinsMedium16
                                      .copyWith(color: Colors.black)),
                              DetailsList(
                                title: "Flight Total",
                                trailer: totalFare ?? "0",
                              ),
                              DetailsList(
                                title: "Discount:",
                                trailer: discount ?? "0.00",
                              ),
                              Column(
                                children: [
                                  Divider(thickness: 2, height: 30),
                                  Text("Amount Outstanding"),
                                  Text(totalFare ?? "",
                                      style: AppStyle.txtPoppinsMedium16
                                          .copyWith(color: Colors.black)),
                                ],
                              ),
                              Center(
                                child: CustomButton(
                                  margin: getMargin(top: 20),
                                  width: 400,
                                  text: "CHECKOUT",
                                  height: 50,
                                  variant: isLoading
                                      ? ButtonVariant.FillGray100
                                      : ButtonVariant.FillGreen400,
                                  onTap: isLoading
                                      ? null
                                      : () {
                                          Get.dialog(
                                            CupertinoAlertDialog(
                                              title:
                                                  Text("Confirm Information?"),
                                              content: Text(
                                                  "Please confirm that flight information is correct before you proceed"),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text(
                                                      "CANCEL",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    )),
                                                TextButton(
                                                    onPressed: () async {
                                                      toTicketScreen(availResult
                                                          .deepLink!);
                                                      // Get.back();
                                                    },
                                                    child: Text("CONFIRMED"))
                                              ],
                                            ),
                                          );
                                        },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget layOverContainer(List<RouteModel> segments) {
    return ListView.separated(
        itemCount: segments.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, i) {
          return Divider(thickness: 2, height: 30);
        },
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${segments[index].cityCodeFrom!} to ${segments[index].cityCodeTo!}",
                  style: AppStyle.txtPoppinsMedium16
                      .copyWith(color: Colors.black)),
              DetailsList(
                  title: "Flight No",
                  trailer: segments[index].airline! +
                      segments[index].flightNo!.toString()),
              DetailsList(
                  title: "Departure Date:",
                  trailer: DateFormat("d MMM hh:mm a").format(
                    DateTime.tryParse(segments[index].localDeparture!)!,
                  )),
              // _controller.tabIndex == 0
              //     ? SizedBox()
              //     :
              // if (availResult.legs![0].arrival != null)
              DetailsList(
                  title: "Arrival Date:",
                  trailer: DateFormat("d MMM hh:mm a")
                      .format(DateTime.tryParse(segments[index].localArrival!)!)),
              DetailsList(
                title: "Flight Duration:",
                trailer: formatDurationInHhMmSs(
                  Duration(
                    minutes:
                        int.parse(DateTime.parse(segments[index].localArrival!)
                            .difference(
                              DateTime.parse(segments[index].localDeparture!),
                            )
                            .inMinutes
                            .toString()),
                  ),
                ),
              ),
              DetailsList(
                title: "Fare Type:",
                trailer: fareType ?? "",
              ),
              //add layover time
              if (index + 1 < segments.length)
                Column(
                  children: [
                    Divider(
                      thickness: 2,
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 18,
                        ),
                        Text(
                          formatDurationInHhMmSs(
                                Duration(
                                  minutes: int.parse(DateTime.parse(
                                          segments[index + 1].localDeparture!)
                                      .difference(
                                        DateTime.parse(
                                            segments[index].localArrival!),
                                      )
                                      .inMinutes
                                      .toString()),
                                ),
                              ) +
                              " Layover",
                        ),
                      ],
                    ),
                  ],
                )
            ],
          );
        });
  }

  void toTicketScreen(String urlString) {
    Get.back();
    Get.back();

    launchUrlString(urlString, mode: LaunchMode.externalApplication);
  }
}

class DetailsList extends StatelessWidget {
  const DetailsList({
    Key? key,
    this.title,
    this.trailer,
    this.isLoading = false,
  }) : super(key: key);

  final String? title;
  final String? trailer;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title ?? ""),
          isLoading
              ? CupertinoActivityIndicator(
                  radius: 10,
                )
              : Text(trailer ?? ""),
        ],
      ),
    );
  }
}

String formatDurationInHhMmSs(Duration duration) {
  final hh = (duration.inHours).toString().padLeft(2, '0');
  final mm = (duration.inMinutes % 60).toString().padLeft(2, '0');
  return '$hh\h $mm\m';
}
