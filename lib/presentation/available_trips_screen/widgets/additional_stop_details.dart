import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/presentation/available_trips_screen/models/fetch_flight_details_modal.dart';
import 'package:mytravelapp/widgets/app_bar/appbar_iconbutton.dart';
import 'package:mytravelapp/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:mytravelapp/widgets/app_bar/custom_app_bar.dart';

// this screen is not currently in use

class AdditionalStopDetails extends StatelessWidget {
  final AvailResult availResult;
  final String? legId;
  final String? returnLegId;
  const AdditionalStopDetails(
      {Key? key, required this.availResult, this.legId, this.returnLegId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> segmentIds = availResult.legs![legId]!["segmentIds"];
    List<dynamic> returnSegmentIds = [];
    if (returnLegId != null) {
      returnSegmentIds = availResult.legs![returnLegId]!["segmentIds"];
    }
    return Scaffold(
        appBar: CustomAppBar(
          height: getVerticalSize(70),
          leadingWidth: 64,
          leading: AppbarIconbutton(
              svgPath: ImageConstant.imgArrowleftBlueGray700,
              margin: getMargin(left: 24),
              onTap: () {
                Get.back();
              }),
          centerTitle: true,
          title: AppbarSubtitle2(text: "Additional Stop Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: getMargin(left: 24, right: 24),
                child: Text(
                  "Outbound",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              layOverContainer(segmentIds),
              if (returnSegmentIds.isNotEmpty)
                Container(
                  margin: getMargin(top: 24, left: 24, right: 24),
                  child: Text(
                    "Return",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              if (returnSegmentIds.isNotEmpty)
                layOverContainer(returnSegmentIds),
            ],
          ),
        ));
  }

  Container layOverContainer(List<dynamic> segmentIds) {
    return Container(
      margin: getMargin(top: 4, left: 24, right: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: ListView.separated(
            itemCount: segmentIds.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, i) {
              return Divider(
                color: ColorConstant.deepPurple800,
                thickness: 3,
                indent: 16,
                endIndent: 16,
              );
            },
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          availResult.carries![
                              availResult.segments![segmentIds[index]]
                                  ["marketingCarrierId"]]["imageUrl"],
                          scale: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(availResult.carries![
                                  availResult.segments![segmentIds[index]]
                                      ["marketingCarrierId"]]["name"] +
                              " " +
                              availResult.carries![
                                  availResult.segments![segmentIds[index]]
                                      ["marketingCarrierId"]]["iata"] +
                              availResult.segments![segmentIds[index]]
                                  ["marketingFlightNumber"]),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        DateFormat("hh:mm a").format(
                              DateTime(
                                availResult.segments![segmentIds[index]]
                                    ["departureDateTime"]['year'],
                                availResult.segments![segmentIds[index]]
                                    ["departureDateTime"]['month'],
                                availResult.segments![segmentIds[index]]
                                    ["departureDateTime"]['day'],
                                availResult.segments![segmentIds[index]]
                                    ["departureDateTime"]['hour'],
                                availResult.segments![segmentIds[index]]
                                    ["departureDateTime"]['minute'],
                              ),
                            ) +
                            " " +
                            availResult.places![
                                availResult.segments![segmentIds[index]]
                                    ["originPlaceId"]]["iata"] +
                            " " +
                            availResult.places![
                                availResult.segments![segmentIds[index]]
                                    ["originPlaceId"]]["name"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Text(
                      Duration(
                            minutes: availResult.segments![segmentIds[index]]
                                ["durationInMinutes"],
                          ).inHours.toString() +
                          "h " +
                          (availResult.segments![segmentIds[index]]
                                      ["durationInMinutes"] %
                                  60)
                              .toString() +
                          "m",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: DateFormat("hh:mm a").format(
                                DateTime(
                                  availResult.segments![segmentIds[index]]
                                      ["arrivalDateTime"]['year'],
                                  availResult.segments![segmentIds[index]]
                                      ["arrivalDateTime"]['month'],
                                  availResult.segments![segmentIds[index]]
                                      ["arrivalDateTime"]['day'],
                                  availResult.segments![segmentIds[index]]
                                      ["arrivalDateTime"]['hour'],
                                  availResult.segments![segmentIds[index]]
                                      ["arrivalDateTime"]['minute'],
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorConstant.black900,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                              )),
                          WidgetSpan(
                            child: Transform.translate(
                              offset: const Offset(2, -4),
                              child: Text(
                                getDifferenceInDays(
                                  DateTime(
                                    availResult.segments![segmentIds[index]]
                                        ["arrivalDateTime"]['year'],
                                    availResult.segments![segmentIds[index]]
                                        ["arrivalDateTime"]['month'],
                                    availResult.segments![segmentIds[index]]
                                        ["arrivalDateTime"]['day'],
                                    availResult.segments![segmentIds[index]]
                                        ["arrivalDateTime"]['hour'],
                                    availResult.segments![segmentIds[index]]
                                        ["arrivalDateTime"]['minute'],
                                  ),
                                  DateTime(
                                    availResult.segments![segmentIds[index]]
                                        ["departureDateTime"]['year'],
                                    availResult.segments![segmentIds[index]]
                                        ["departureDateTime"]['month'],
                                    availResult.segments![segmentIds[index]]
                                        ["departureDateTime"]['day'],
                                    availResult.segments![segmentIds[index]]
                                        ["departureDateTime"]['hour'],
                                    availResult.segments![segmentIds[index]]
                                        ["departureDateTime"]['minute'],
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  textBaseline: TextBaseline.alphabetic,
                                ),
                              ),
                            ),
                          ),
                          TextSpan(
                            text: " " +
                                availResult.places![
                                    availResult.segments![segmentIds[index]]
                                        ["destinationPlaceId"]]["iata"] +
                                " " +
                                availResult.places![
                                    availResult.segments![segmentIds[index]]
                                        ["destinationPlaceId"]]["name"],
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorConstant.black900,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  String getDifferenceInDays(
      DateTime arrivalDateTime, DateTime departureDateTime) {
    var difference = arrivalDateTime.difference(departureDateTime);
    if (difference.inDays > 0) {
      return "+" + difference.inDays.toString();
    } else {
      return "";
    }
  }
}
