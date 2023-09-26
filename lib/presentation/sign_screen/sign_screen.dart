import 'package:flutter/cupertino.dart';

import 'controller/sign_controller.dart';
import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/core/utils/validation_functions.dart';
import 'package:mytravelapp/widgets/app_bar/custom_app_bar.dart';
import 'package:mytravelapp/widgets/custom_button.dart';
import 'package:mytravelapp/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignScreen extends GetWidget<SignController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignController controller = Get.put(SignController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
              height: getVerticalSize(70),
              leadingWidth: 64,
            ),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 24, top: 18, right: 24, bottom: 18),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: getHorizontalSize(136),
                                    child: Text("lbl_welcome_back".tr,
                                        maxLines: null,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsSemiBold28)),
                                Container(
                                    height: getSize(60),
                                    width: getSize(60),
                                    child: Stack(children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Image(
                                            image: AssetImage(
                                                ImageConstant.logo_2)),
                                      ),
                                    ]))
                              ]),
                          Padding(
                              padding: getPadding(top: 39),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("lbl_username".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsMedium16),
                                    CustomTextFormField(
                                        focusNode: FocusNode(),
                                        controller: controller.emailController,
                                        margin: getMargin(top: 7),
                                        fontStyle: TextFormFieldFontStyle
                                            .PoppinsRegular16,
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidEmail(value,
                                                  isRequired: true))) {
                                            return "Please enter valid email";
                                          }
                                          return null;
                                        })
                                  ])),
                          Padding(
                              padding: getPadding(top: 14),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("lbl_password".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsMedium16),
                                    Obx(() {
                                      return CustomTextFormField(
                                          focusNode: FocusNode(),
                                          isObscureText:
                                              !controller.passwordVisible.value,
                                          suffix: TextButton(
                                            onPressed: () {
                                              controller.passwordVisible.value =
                                                  !controller
                                                      .passwordVisible.value;
                                            },
                                            child: Text(!controller
                                                    .passwordVisible.value
                                                ? "Show"
                                                : "Hide"),
                                          ),
                                          controller: controller.passController,
                                          margin: getMargin(top: 8),
                                          textInputAction: TextInputAction.done,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          validator: (value) {
                                            if (value == null || value == "") {
                                              return "Please enter a password";
                                            }
                                            return null;
                                          });
                                    })
                                  ])),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.resetPasswordScreen);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'forgot password?',
                                    style: TextStyle(
                                      color: ColorConstant.deepPurple300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: getPadding(top: 8, bottom: 30),
                                  child: Text("",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsRegular14))),
                          // Spacer(),
                          GetBuilder(
                              init: controller,
                              builder: (context) {
                                if (controller.isLoading == true) {
                                  return CupertinoActivityIndicator();
                                }
                                return CustomButton(
                                    height: getVerticalSize(48),
                                    text: "lbl_login".tr,
                                    onTap: onTapLoginOne);
                              }),
                          Padding(
                              padding: getPadding(top: 26),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                        padding:
                                            getPadding(top: 11, bottom: 11),
                                        child: SizedBox(
                                            width: getHorizontalSize(154),
                                            child: Divider(
                                                thickness: getVerticalSize(1),
                                                color: ColorConstant
                                                    .blueGray400))),
                                    Text("lbl_or".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle
                                            .txtPoppinsLight16Bluegray300),
                                    Padding(
                                        padding:
                                            getPadding(top: 11, bottom: 11),
                                        child: SizedBox(
                                            width: getHorizontalSize(153),
                                            child: Divider(
                                                thickness: getVerticalSize(1),
                                                color:
                                                    ColorConstant.blueGray400)))
                                  ])),
                          GestureDetector(
                            onTap: () {
                              onTapTxtDonthaveanaccount();
                            },
                            child: Padding(
                              padding: getPadding(top: 36, bottom: 14),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_don_t_have_an_account2".tr,
                                        style: TextStyle(
                                            color: ColorConstant.blueGray700,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300)),
                                    TextSpan(
                                        text: " ",
                                        style: TextStyle(
                                            color: ColorConstant.deepPurple300,
                                            fontSize: getFontSize(14),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: "lbl_sign_up".tr,
                                        style: TextStyle(
                                            color: ColorConstant.deepPurple300,
                                            fontSize: getFontSize(16),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline))
                                  ]),
                                  textAlign: TextAlign.left),
                            ),
                          ),

                          GestureDetector(
                            onTap: () async {
                              await saveBool(
                                  key: 'profileVisible', value: false);
                              Get.offAndToNamed('/home_screen');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Maybe later',
                                style: TextStyle(
                                    color: ColorConstant.deepPurple300,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ])))));
  }

  onTapLoginOne() async {
    controller.signin();
  }

  onTapTxtDonthaveanaccount() {
    Get.toNamed(AppRoutes.signUpScreen, preventDuplicates: true);
  }

  onTapArrowleft() {
    Get.back();
  }
}
