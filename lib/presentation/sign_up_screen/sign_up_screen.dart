import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/core/utils/validation_functions.dart';
import 'package:mytravelapp/widgets/app_bar/appbar_iconbutton.dart';
import 'package:mytravelapp/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:mytravelapp/widgets/app_bar/custom_app_bar.dart';
import 'package:mytravelapp/widgets/custom_button.dart';
import 'package:mytravelapp/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends GetWidget<SignUpController> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: getVerticalSize(70),
                leadingWidth: 64,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 24, top: 4, bottom: 4),
                    onTap: onTapArrowleft1),
                title: AppbarSubtitle2(
                    text: "lbl_registration".tr, margin: getMargin(left: 16))),
            body: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Container(
                      width: double.maxFinite,
                      padding:
                          getPadding(left: 24, top: 19, right: 24, bottom: 19),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: getHorizontalSize(121),
                                      child: Text("lbl_create_account".tr,
                                          maxLines: null,
                                          textAlign: TextAlign.left,
                                          style:
                                              AppStyle.txtPoppinsSemiBold28)),
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
                                padding: getPadding(top: 31),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("lbl_full_name".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsMedium16),
                                      CustomTextFormField(
                                          focusNode: FocusNode(),
                                          controller: controller.nameController,
                                          hintText: "".tr,
                                          margin: getMargin(top: 7),
                                          validator: (value) {
                                            if (value == "") {
                                              return "Name is required";
                                            }
                                            return null;
                                          })
                                    ])),
                            Padding(
                                padding: getPadding(top: 14),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("lbl_your_email".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsMedium16),
                                      CustomTextFormField(
                                          controller:
                                              controller.emailController,
                                          hintText: "".tr,
                                          margin: getMargin(top: 8),
                                          textInputAction: TextInputAction.next,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("lbl_password".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsMedium16),
                                      Obx(() {
                                        return CustomTextFormField(
                                            focusNode: FocusNode(),
                                            isObscureText: !controller
                                                .passwordVisible.value,
                                            suffix: TextButton(
                                              onPressed: () {
                                                controller
                                                        .passwordVisible.value =
                                                    !controller
                                                        .passwordVisible.value;
                                              },
                                              child: Text(!controller
                                                      .passwordVisible.value
                                                  ? "Show"
                                                  : "Hide"),
                                            ),
                                            controller:
                                                controller.passwordController,
                                            margin: getMargin(top: 8),
                                            textInputAction:
                                                TextInputAction.done,
                                            textInputType:
                                                TextInputType.emailAddress,
                                            validator: (value) {
                                              if (value == null ||
                                                  value == "") {
                                                return "Please enter a password";
                                              }
                                              return null;
                                            });
                                      })
                                    ])),
                            Padding(
                                padding: getPadding(top: 23, right: 64),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(() {
                                        return Checkbox(
                                          value: controller.isAgree.value,
                                          splashRadius: 30,
                                          activeColor:
                                              ColorConstant.deepPurple300,
                                          onChanged: (value) {
                                            controller.isAgree.value =
                                                !controller.isAgree.value;
                                          },
                                        );
                                      }),
                                      Expanded(
                                          child: Container(
                                              // width: getHorizontalSize(230),
                                              margin: getMargin(left: 8),
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text:
                                                            "lbl_i_agree_to_the"
                                                                .tr,
                                                        style: TextStyle(
                                                            color: ColorConstant
                                                                .blueGray700,
                                                            fontSize:
                                                                getFontSize(14),
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                    TextSpan(
                                                        text: " ",
                                                        style: TextStyle(
                                                            color: ColorConstant
                                                                .gray900,
                                                            fontSize:
                                                                getFontSize(14),
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                    TextSpan(
                                                        text:
                                                            "Terms and Privacy Policy",
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap = () {
                                                                Get.bottomSheet(
                                                                    TermsPolicyBottomSheet(),
                                                                    isScrollControlled:
                                                                        true);
                                                              }),
                                                  ]),
                                                  textAlign: TextAlign.left)))
                                    ])),
                            GetBuilder(
                                init: controller,
                                builder: (context) {
                                  if (controller.isLoading == true) {
                                    return Center(
                                        child: CupertinoActivityIndicator());
                                  }
                                  return CustomButton(
                                      height: getVerticalSize(48),
                                      text: "lbl_create_account2".tr,
                                      margin: getMargin(top: 22),
                                      onTap: onTapCreateaccountOne);
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
                                                  color: ColorConstant
                                                      .blueGray400)))
                                    ])),
                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                    onTap: () {
                                      onTapTxtAlreadyhavean();
                                    },
                                    child: Padding(
                                        padding: getPadding(top: 21, bottom: 4),
                                        child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                      "msg_already_have_an2".tr,
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .blueGray700,
                                                      fontSize: getFontSize(16),
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w300)),
                                              TextSpan(
                                                  text: " ",
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .green400,
                                                      fontSize: getFontSize(14),
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              TextSpan(
                                                  text: "lbl_login".tr,
                                                  style: TextStyle(
                                                      color: ColorConstant
                                                          .deepPurple300,
                                                      fontSize: getFontSize(16),
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      decoration: TextDecoration
                                                          .underline))
                                            ]),
                                            textAlign: TextAlign.left))))
                          ]))),
            )));
  }

  onTapCreateaccountOne() async {
    if (_formKey.currentState!.validate()) {
      controller.createAccount();
    }
  }

  onTapTxtAlreadyhavean() {
    Get.toNamed(AppRoutes.signScreen, preventDuplicates: true);
  }

  onTapArrowleft1() {
    Get.back();
  }
}

class TermsPolicyBottomSheet extends StatelessWidget {
  const TermsPolicyBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: size.height * 85 / 100,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                Center(
                  child: Text(
                    "Terms and Privacy Policy",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: getPadding(top: 20),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(height: 2),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
