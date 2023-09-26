import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';

class BottomNavCtl extends GetxController {
  RxInt? selectedIndex = 0.obs;
}

class CustomBottomBar extends GetWidget {
  CustomBottomBar({this.onChanged});

  BottomNavCtl controller = Get.put(BottomNavCtl());

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    // BottomMenuModel(
    //     icon: ImageConstant.imgReply,
    //     title: "Booking",
    //     type: BottomBarEnum.Booking),
    // BottomMenuModel(
    //   icon: ImageConstant.imgCalendar,
    //   title: "Trips",
    //   type: BottomBarEnum.Trips,
    // ),
    BottomMenuModel(
      icon: ImageConstant.imgUserBlueGray300,
      title: "Profile",
      type: BottomBarEnum.Profile,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
          boxShadow: [
            BoxShadow(
              color: ColorConstant.blueGray3004c,
              spreadRadius: getHorizontalSize(
                2,
              ),
              blurRadius: getHorizontalSize(
                2,
              ),
              offset: Offset(
                0,
                2,
              ),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          elevation: 0,
          currentIndex: controller.selectedIndex!.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: CustomImageView(
                svgPath: bottomMenuList[index].icon,
                height: getSize(
                  20,
                ),
                width: getSize(
                  20,
                ),
                color: ColorConstant.blueGray300,
              ),
              activeIcon: Container(
                margin: getMargin(right: 10, left: 10),
                padding: getPadding(
                  left: 9,
                  top: 8,
                  right: 9,
                  bottom: 8,
                ),
                decoration: AppDecoration.fillGray100.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      svgPath: bottomMenuList[index].icon,
                      height: getSize(
                        20,
                      ),
                      width: getSize(
                        28,
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    Padding(
                      padding: getPadding(
                        left: 8,
                      ),
                      child: Text(
                        bottomMenuList[index].title ?? "",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular14.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              label: '',
            );
          }),
          onTap: (index) {
            controller.selectedIndex!.value = index;
            onChanged!(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum { Home, Profile, Booking, Trips }

class BottomMenuModel {
  BottomMenuModel({required this.icon, this.title, required this.type});

  String icon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
