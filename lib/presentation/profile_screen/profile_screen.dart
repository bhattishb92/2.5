import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mytravelapp/core/utils/countries.dart';
import 'package:mytravelapp/core/utils/progress_dialog_utils.dart';
import 'package:mytravelapp/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/app_bar/appbar_subtitle_2.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../home_screen/controller/home_controller.dart';
import 'controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  final ProfileController controller = Get.put(ProfileController());
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(70),
          leadingWidth: 70,
          centerTitle: true,
          title: AppbarSubtitle2(text: "Profile"),
        ),
        body: FirebaseAuth.instance.currentUser != null
            ? SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                  child: Container(
                    margin: getMargin(left: 24, top: 20, right: 24),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          height: getVerticalSize(87),
                                          width: getHorizontalSize(97),
                                          margin: getMargin(top: 21),
                                          child: Stack(
                                              alignment: Alignment.bottomRight,
                                              children: [
                                                GetBuilder(
                                                    init: controller,
                                                    builder: (context) {
                                                      return CircleAvatar(
                                                        radius: 85,
                                                        backgroundColor: Colors
                                                            .grey.shade100,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          100)),
                                                          child: Image(
                                                            width: 80,
                                                            height: 80,
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                homeController
                                                                        .imgSrc ??
                                                                    ''),
                                                            errorBuilder:
                                                                (context, error,
                                                                    stackTrace) {
                                                              return CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgUser,
                                                                width: 50,
                                                                color: ColorConstant
                                                                    .deepPurple300,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              ]))),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                          padding: getPadding(top: 5),
                                          child: GetBuilder(
                                              init: controller,
                                              builder: (context) {
                                                return Text(
                                                    controller.name ?? "",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtPoppinsSemiBold20);
                                              }))),
                                  Padding(
                                      padding: getPadding(top: 32),
                                      child: Text("lbl_account".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtPoppinsMedium16Gray900)),
                                  GestureDetector(
                                    onTap: () {
                                      updateName(context);
                                    },
                                    child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 0,
                                        margin: getMargin(top: 15),
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: ColorConstant.gray300,
                                                width: getHorizontalSize(1)),
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder4),
                                        child: Container(
                                            height: getVerticalSize(48),
                                            width: getHorizontalSize(327),
                                            padding: getPadding(
                                                left: 8,
                                                top: 9,
                                                right: 8,
                                                bottom: 9),
                                            decoration: AppDecoration
                                                .outlineGray300
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder4),
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 42),
                                                          child: Text(
                                                              "msg_change_account_name"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsLight16))),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgUserBlueGray700,
                                                                height:
                                                                    getSize(24),
                                                                width: getSize(
                                                                    24)),
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgArrowrightBlueGray700,
                                                                height:
                                                                    getSize(16),
                                                                width:
                                                                    getSize(16),
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            263,
                                                                        top: 6,
                                                                        bottom:
                                                                            2))
                                                          ]))
                                                ]))),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      updatePass(context);
                                    },
                                    child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 0,
                                        margin: getMargin(top: 15),
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: ColorConstant.gray300,
                                                width: getHorizontalSize(1)),
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder4),
                                        child: Container(
                                            height: getVerticalSize(48),
                                            width: getHorizontalSize(327),
                                            padding: getPadding(
                                                left: 8,
                                                top: 9,
                                                right: 8,
                                                bottom: 9),
                                            decoration: AppDecoration
                                                .outlineGray300
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder4),
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 42),
                                                          child: Text(
                                                              "msg_change_account_password"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsLight16))),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgCall,
                                                                height:
                                                                    getSize(24),
                                                                width: getSize(
                                                                    24)),
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgArrowrightBlueGray700,
                                                                height:
                                                                    getSize(16),
                                                                width:
                                                                    getSize(16),
                                                                margin:
                                                                    getMargin(
                                                                        left:
                                                                            263,
                                                                        top: 6,
                                                                        bottom:
                                                                            2))
                                                          ]))
                                                ]))),
                                  ),
                                  GestureDetector(
                                    onTap: () => onTapImgCamera(),
                                    child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 0,
                                        margin: getMargin(top: 8),
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: ColorConstant.gray300,
                                                width: getHorizontalSize(1)),
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder4),
                                        child: Container(
                                            height: getVerticalSize(48),
                                            width: getHorizontalSize(327),
                                            padding: getPadding(all: 8),
                                            decoration: AppDecoration
                                                .outlineGray300
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder4),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              left: 42),
                                                          child: Text(
                                                              "msg_change_account_image"
                                                                  .tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsLight16))),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Padding(
                                                          padding: getPadding(
                                                              bottom: 1),
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgCamera,
                                                                    height:
                                                                        getSize(
                                                                            24),
                                                                    width:
                                                                        getSize(
                                                                            24),
                                                                    onTap: () {
                                                                      onTapImgCamera();
                                                                    }),
                                                                CustomImageView(
                                                                    svgPath:
                                                                        ImageConstant
                                                                            .imgArrowrightBlueGray700,
                                                                    height:
                                                                        getSize(
                                                                            16),
                                                                    width:
                                                                        getSize(
                                                                            16),
                                                                    margin: getMargin(
                                                                        left:
                                                                            263,
                                                                        top: 2,
                                                                        bottom:
                                                                            6))
                                                              ])))
                                                ]))),
                                  ),
                                  GetBuilder(
                                      init: controller,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () =>
                                              openChangeCurrencyDialog(),
                                          child: Card(
                                              clipBehavior: Clip.antiAlias,
                                              elevation: 0,
                                              margin: getMargin(top: 8),
                                              shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color:
                                                          ColorConstant.gray300,
                                                      width:
                                                          getHorizontalSize(1)),
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder4),
                                              child: Container(
                                                  height: getVerticalSize(48),
                                                  width: getHorizontalSize(327),
                                                  padding: getPadding(all: 8),
                                                  decoration: AppDecoration
                                                      .outlineGray300
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder4),
                                                  child: Stack(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            42),
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                        "Change Currency"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtPoppinsLight16),
                                                                    Spacer(),
                                                                    if (controller
                                                                            .currentCurrency['code'] !=
                                                                        null)
                                                                      Padding(
                                                                        padding:
                                                                            getPadding(right: 30),
                                                                        child: Text(
                                                                            "(${controller.currentCurrency['code']})"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: TextStyle(
                                                                              color: ColorConstant.deepPurple300,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontFamily: "Poppins",
                                                                            )),
                                                                      ),
                                                                  ],
                                                                ))),
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        bottom:
                                                                            1),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgCurrency,
                                                                          height: getSize(
                                                                              24),
                                                                          width: getSize(
                                                                              24),
                                                                          onTap:
                                                                              () {
                                                                            openChangeCurrencyDialog();
                                                                          }),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgArrowrightBlueGray700,
                                                                          height: getSize(
                                                                              16),
                                                                          width: getSize(
                                                                              16),
                                                                          margin: getMargin(
                                                                              left: 263,
                                                                              top: 2,
                                                                              bottom: 6))
                                                                    ])))
                                                      ]))),
                                        );
                                      }),
                                  GestureDetector(
                                      onTap: () {
                                        logout();
                                      },
                                      child: Padding(
                                          padding:
                                              getPadding(top: 36, bottom: 30),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgRefreshRedA20001,
                                                    height: getSize(24),
                                                    width: getSize(24),
                                                    margin:
                                                        getMargin(bottom: 0)),
                                                Padding(
                                                    padding: getPadding(
                                                      left: 10,
                                                    ),
                                                    child: Text(
                                                        "lbl_log_out".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsLight16RedA20001))
                                              ])))
                                ])),
                      ],
                    ),
                  ),
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login To View Profile'),
                    SizedBox(
                      height: getVerticalSize(20),
                    ),
                    CustomButton(
                        height: getVerticalSize(48),
                        width: getHorizontalSize(327),
                        text: "Log in or sign up".tr,
                        onTap: () {
                          Get.offNamed(AppRoutes.signScreen);
                        })
                  ],
                ),
              ),
      ),
    );
  }

  onTapUpcomingtrips() {
    Get.toNamed(AppRoutes.upcomingTripsOneScreen);
  }

  onTapAppsetting() {
    Get.toNamed(AppRoutes.profileSettingsScreen);
  }

  onTapImgCamera() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    await FileManager().showModelSheetForImage(getImages: (value) async {
      if (value.isNotEmpty) {
        controller.updatePhoto(value.last);
        ProgressDialogUtils.isProgressVisible = false;
        ProgressDialogUtils.showProgressDialog();
      }
    });
  }

  openChangeCurrencyDialog() {
    Get.dialog(AlertDialog(
      title: Text(
        "Change Currency",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins",
        ),
      ),
      content: DropdownButton(
        isExpanded: true,
        hint: Text('Select Currency', style: TextStyle(color: Colors.black54)),
        items: Countries()
            .countriesAndCurrencyCodes
            .map((e) => DropdownMenuItem(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Text(
                              e['name']!,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: "Poppins",
                              ),
                            )),
                        Expanded(
                            child: Text(
                          e['code']!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "Poppins",
                          ),
                        )),
                      ],
                    ),
                  ),
                  value: e,
                ))
            .toList(),
        onChanged: (currency) {
          controller.updateCurrency(currency as Map<String, dynamic>);
          Get.back();
        },
      ),
    ));
  }

  onTapMytask() {
    Get.toNamed(AppRoutes.upcomingTripsOneScreen);
  }

  onTapBtnArrowleft() {
    Get.back();
  }

  void updateName(context) {
    Get.dialog(CupertinoAlertDialog(
      title: Text('Change Account Name'),
      content: Padding(
        padding: getPadding(top: 10),
        child: CupertinoTextField(
          controller: controller.textFieldController,
          placeholder: "Enter your name here",
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('CANCEL'),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: Text('SUBMIT'),
          onPressed: () {
            if (controller.textFieldController.value.text == "") {
              return;
            }
            Get.back();
            controller.updateName();
            ProgressDialogUtils.isProgressVisible = false;
            ProgressDialogUtils.showProgressDialog();
          },
        ),
      ],
    ));
  }

  void updatePass(BuildContext context) {
    controller.passwordController.clear();
    Get.dialog(CupertinoAlertDialog(
      title: Text('Change Password'),
      content: Column(
        children: [
          Padding(
            padding: getPadding(top: 10),
            child: CupertinoTextField(
              controller: controller.oldPasswordController,
              obscureText: true,
              placeholder: "Old password",
            ),
          ),
          Padding(
            padding: getPadding(top: 10),
            child: CupertinoTextField(
              controller: controller.passwordController,
              obscureText: true,
              placeholder: "New password",
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('CANCEL'),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: Text('SUBMIT'),
          onPressed: () {
            if (controller.passwordController.value.text == "") {
              return;
            }
            Get.back();
            controller.updatePass();
            ProgressDialogUtils.isProgressVisible = false;
            ProgressDialogUtils.showProgressDialog();
          },
        ),
      ],
    ));
  }

  void logout() {
    controller.passwordController.clear();
    Get.dialog(CupertinoAlertDialog(
      title: Text('Are you sure you want to Logout?'),
      actions: <Widget>[
        TextButton(
          child: Text('NO'),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: Text('YES'),
          onPressed: () async {
            // sign out from firebase and clear all data
            FirebaseAuth.instance.signOut();
            var ins = await SharedPreferences.getInstance();
            await ins.clear();
            await Get.deleteAll();
            Get.offNamed(AppRoutes.signScreen);
          },
        ),
      ],
    ));
  }
}
