import '../controller/home_controller.dart';
import '../models/listrectanglefortyseven_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mytravelapp/core/app_export.dart';

// ignore: must_be_immutable
class ListrectanglefortysevenItemWidget extends StatelessWidget {
  ListrectanglefortysevenItemWidget(this.listrectanglefortysevenItemModelObj);

  ListrectanglefortysevenItemModel listrectanglefortysevenItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: getMargin(
            right: 16,
          ),
          padding: getPadding(
            all: 10,
          ),
          decoration: AppDecoration.outlineBluegray3004c.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle47,
                height: getVerticalSize(
                  220,
                ),
                width: getHorizontalSize(
                  230,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    8,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 5,
                  top: 10,
                ),
                child: Text(
                  "lbl_abu_dhabi".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsMedium20,
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 5,
                  top: 11,
                  bottom: 5,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgLocation,
                      height: getSize(
                        20,
                      ),
                      width: getSize(
                        20,
                      ),
                      margin: getMargin(
                        top: 2,
                        bottom: 2,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 5,
                        top: 2,
                        bottom: 1,
                      ),
                      child: Text(
                        "lbl_dubai".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular14Bluegray400,
                      ),
                    ),
                    CustomImageView(
                      svgPath: ImageConstant.imgStar,
                      height: getSize(
                        14,
                      ),
                      width: getSize(
                        14,
                      ),
                      margin: getMargin(
                        left: 112,
                        top: 5,
                        bottom: 5,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 4,
                      ),
                      child: Text(
                        "lbl_4_8".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular16Bluegray400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
