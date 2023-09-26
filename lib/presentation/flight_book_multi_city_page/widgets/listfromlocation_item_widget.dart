import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';


class ListfromlocationItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      width: getHorizontalSize(
        295,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "lbl_from".tr.toUpperCase(),
                    style: TextStyle(
                      color: ColorConstant.blueGray300,
                      fontSize: getFontSize(
                        12,
                      ),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "lbl_location".tr.toUpperCase(),
                    style: TextStyle(
                      color: ColorConstant.blueGray300,
                      fontSize: getFontSize(
                        12,
                      ),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "lbl".tr.toUpperCase(),
                    style: TextStyle(
                      color: ColorConstant.blueGray300,
                      fontSize: getFontSize(
                        12,
                      ),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgArrowdown,
                  height: getSize(
                    20,
                  ),
                  width: getSize(
                    20,
                  ),
                  alignment: Alignment.centerRight,
                ),
                Padding(
                  padding: getPadding(
                    top: 4,
                  ),
                  child: Text(
                    "lbl_sans_fransisco".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular16Bluegray700,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 5,
                  ),
                  child: Divider(
                    thickness: getVerticalSize(
                      1,
                    ),
                    color: ColorConstant.gray300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
