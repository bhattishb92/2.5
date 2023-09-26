import 'package:mytravelapp/presentation/flight_book_multi_city_page/flight_book_multi_city_page.dart';
import 'package:mytravelapp/presentation/flight_book_oneway_tab_container_screen/flight_book_oneway_tab_container_screen.dart';
import 'package:mytravelapp/presentation/profile_screen/profile_screen.dart';

import '../flight_book_oneway_one_page/flight_book_oneway_one_page.dart';

import 'controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/widgets/app_bar/custom_app_bar.dart';
import 'package:mytravelapp/widgets/custom_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.homeScreen,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) => getCurrentPage(routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Navigator.pushNamed(
                navigatorKey.currentContext!, getCurrentRoute(type));
          },
        ),
      ),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Profile:
        return AppRoutes.profileScreen;
      case BottomBarEnum.Booking:
        return AppRoutes.flight_book;
      case BottomBarEnum.Trips:
        return AppRoutes.upcomingTripsScreen;
      default:
        return AppRoutes.homeScreen;
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.profileScreen:
        return ProfileScreen();
      case AppRoutes.flight_book:
        return FlightBookOnewayTabContainerScreen();
      default:
        return HomeScreenWidget();
    }
  }
}

class HomeScreenWidget extends StatelessWidget {
  final HomeController controller_ = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      appBar: CustomAppBar(
        height: getVerticalSize(70),
        centerTitle: true,
        title: Text("Book Flight",
            style: TextStyle(
                color: ColorConstant.gray900,
                fontSize: getFontSize(16),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600)),
      ),
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTabController(
                  length: 3,
                  child: Builder(builder: (context) {
                    final TabController? tabController =
                        DefaultTabController.of(context);
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: getVerticalSize(35),
                              width: getHorizontalSize(300),
                              margin: getMargin(top: 40),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(10),
                                ),
                              ),
                              child: TabBar(
                                  // controller: tabController,
                                  labelColor: ColorConstant.whiteA700,
                                  labelStyle: TextStyle(
                                      fontSize: getFontSize(14),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500),
                                  unselectedLabelColor:
                                      ColorConstant.blueGray700,
                                  unselectedLabelStyle: TextStyle(
                                      fontSize: getFontSize(14),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500),
                                  indicator: BoxDecoration(
                                    color: ColorConstant.deepPurple300,
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(10),
                                    ),
                                  ),
                                  tabs: [
                                    Tab(
                                        child: Text("lbl_one_way".tr,
                                            overflow: TextOverflow.ellipsis)),
                                    Tab(
                                        child: Text("lbl_round_trip".tr,
                                            overflow: TextOverflow.ellipsis)),
                                    Tab(
                                        child: Text("Multi-City".tr,
                                            overflow: TextOverflow.ellipsis)),
                                    // Tab(
                                    //     child: Text("lbl_multicity".tr,
                                    //         overflow: TextOverflow.ellipsis))
                                  ])),
                          Container(
                              height: getVerticalSize(649),
                              child: TabBarView(children: [
                                FlightBookOnewayOnePage(
                                  tabController: tabController,
                                ),
                                FlightBookOnewayOnePage(
                                  tabController: tabController,
                                ),
                                FlightBookMultiCityPage(
                                  tabController: tabController,
                                ),
                              ]))
                        ]);
                  }),
                )
              ]),
        );
      }),
    ));
  }

  onTapTxtViewAll() {
    // Get.toNamed();
  }

  onTapTxtViewAllTwo() {
    Get.toNamed(AppRoutes.availableTripsScreen);
  }
}
