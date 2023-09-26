import '../controller/home_controller.dart';
import '../models/listorigin_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/widgets/custom_button.dart';
import 'package:mytravelapp/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ListoriginItemWidget extends StatelessWidget {
  ListoriginItemWidget(this.listoriginItemModelObj);

  ListoriginItemModel listoriginItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Container(
        padding: getPadding(
          left: 16,
          top: 8,
          right: 16,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: fs.Svg(
              ImageConstant.imgCard,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: getVerticalSize(
                72,
              ),
              width: getHorizontalSize(
                287,
              ),
              margin: getMargin(
                top: 12,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 3,
                top: 19,
                right: 3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "lbl_departure".tr.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular14Bluegray3001,
                  ),
                  Text(
                    "lbl_flight_number".tr.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: AppStyle.txtPoppinsRegular14Bluegray3001,
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 3,
                top: 6,
                right: 3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "lbl_feb_25_11_30pm".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular14Bluegray700,
                  ),
                  Text(
                    "lbl_ab689".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: AppStyle.txtPoppinsRegular14Bluegray700,
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                top: 19,
              ),
              child: Divider(
                thickness: getVerticalSize(
                  1,
                ),
                color: ColorConstant.gray300,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 2,
                top: 15,
                right: 1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    height: 36,
                    width: 35,
                    shape: IconButtonShape.CircleBorder18,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgMaskgroup,
                    ),
                  ),
                  CustomButton(
                    height: getVerticalSize(
                      30,
                    ),
                    width: getHorizontalSize(
                      100,
                    ),
                    text: "lbl_book_now".tr,
                    margin: getMargin(
                      top: 3,
                      bottom: 3,
                    ),
                    padding: ButtonPadding.PaddingAll8,
                    fontStyle: ButtonFontStyle.PoppinsRegular14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
