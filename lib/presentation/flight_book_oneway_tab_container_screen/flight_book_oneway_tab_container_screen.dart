import '../flight_book_oneway_one_page/flight_book_oneway_one_page.dart';
import 'controller/flight_book_oneway_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:mytravelapp/widgets/app_bar/custom_app_bar.dart';

class FlightBookOnewayTabContainerScreen
    extends GetWidget<FlightBookOnewayTabContainerController> {
  int? tabIndex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
              height: getVerticalSize(70),
              leadingWidth: 64,
              // leading: AppbarIconbutton(
              //     svgPath: ImageConstant.imgArrowleft,
              //     margin: getMargin(left: 24, top: 4, bottom: 4),
              //     onTap: onTapArrowleft10),
              centerTitle: true,
              title: AppbarSubtitle2(text: "msg_flight_ticket_book".tr),
            ),
            body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  child: DefaultTabController(
                    length: 2,
                    child: Builder(builder: (context) {
                      final TabController? tabController =
                          DefaultTabController.of(context);
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: getVerticalSize(45),
                                width: getHorizontalSize(327),
                                margin: getMargin(top: 26),
                                child: TabBar(
                                    // controller: tabController,
                                    labelColor: ColorConstant.gray900,
                                    labelStyle: TextStyle(
                                        fontSize: getFontSize(16),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500),
                                    unselectedLabelColor:
                                        ColorConstant.blueGray700,
                                    unselectedLabelStyle: TextStyle(
                                        fontSize: getFontSize(16),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500),
                                    indicator: BoxDecoration(
                                        color: ColorConstant.deepPurple300,
                                        borderRadius: BorderRadius.circular(
                                            getHorizontalSize(8))),
                                    tabs: [
                                      Tab(
                                          child: Text("lbl_one_way".tr,
                                              overflow: TextOverflow.ellipsis)),
                                      Tab(
                                          child: Text("lbl_round_trip".tr,
                                              overflow: TextOverflow.ellipsis)),
                                      // Tab(
                                      //     child: Text("lbl_multicity".tr,
                                      //         overflow: TextOverflow.ellipsis))
                                    ])),
                            Container(
                                height: getVerticalSize(649),
                                child: TabBarView(
                                    // controller: controller.group73Controller,
                                    children: [
                                      FlightBookOnewayOnePage(
                                        tabController: tabController,
                                      ),
                                      FlightBookOnewayOnePage(
                                        tabController: tabController,
                                      ),
                                    ]))
                          ]);
                    }),
                  )),
            )));
  }

  onTapArrowleft10() {
    Get.back();
  }
}
