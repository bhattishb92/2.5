import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/core/utils/validation_functions.dart';
import 'package:mytravelapp/presentation/reset_password_screen/controller.dart';
import 'package:mytravelapp/widgets/custom_button.dart';
import 'package:mytravelapp/widgets/custom_text_form_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
        init: ResetPasswordController(),
        initState: (_) {},
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getVerticalSize(50),
                  ),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                        color: ColorConstant.black900,
                        fontSize: getFontSize(
                          20,
                        ),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: getVerticalSize(
                          1.50,
                        ),
                      ),
                    ),
                  )),
                  SizedBox(height: getVerticalSize(20)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Enter your registered email below to receive a password reset link',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorConstant.black90099,
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
                  SizedBox(height: getVerticalSize(15)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Email'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormField(
                        focusNode: FocusNode(),
                        controller: controller.emailController,
                        margin: getMargin(top: 7),
                        fontStyle: TextFormFieldFontStyle.PoppinsRegular16,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          print("value: $value");
                          if (value == null ||
                              (!isValidEmail(value, isRequired: true))) {
                            return "Please enter valid email";
                          }
                          return null;
                        }),
                  ),
                  SizedBox(height: getVerticalSize(50)),
                  GetBuilder(
                      init: controller,
                      builder: (context) {
                        if (controller.isLoading == true) {
                          return Center(child: CupertinoActivityIndicator());
                        }
                        return CustomButton(
                            height: getVerticalSize(48),
                            text: "send".tr,
                            onTap: () {
                              print("controller.emailController.text: " +
                                  controller.emailController.text);
                              controller.passwordReset();
                            });
                      }),
                  SizedBox(height: getVerticalSize(40)),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: ColorConstant.black900,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("or"),
                      ),
                      Expanded(
                        child: Divider(
                          color: ColorConstant.black900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getVerticalSize(40)),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.signScreen,
                          preventDuplicates: true);
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Remember password? ",
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
                              text: "lbl_login".tr,
                              style: TextStyle(
                                  color: ColorConstant.deepPurple300,
                                  fontSize: getFontSize(16),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline))
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
