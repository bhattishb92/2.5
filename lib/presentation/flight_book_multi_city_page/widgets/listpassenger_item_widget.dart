import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';


class ListpassengerItemWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(
        57,
      ),
      width: getHorizontalSize(
        295,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: getPadding(
                top: 2,
              ),
              child: Text(
                "lbl_passenger".tr.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsRegular12Bluegray300,
              ),
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
                    top: 7,
                  ),
                  child: Text(
                    "lbl_1_adult".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular16Bluegray700,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 4,
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
