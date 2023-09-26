import '../controller/home_controller.dart';
import '../models/listcityfrom_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:mytravelapp/core/app_export.dart';
import 'package:mytravelapp/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ListcityfromItemWidget extends StatelessWidget {
  ListcityfromItemWidget(this.listcityfromItemModelObj);

  ListcityfromItemModel listcityfromItemModelObj;

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
              Padding(
                padding: getPadding(
                  left: 3,
                  top: 12,
                  right: 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: getHorizontalSize(
                        51,
                      ),
                      margin: getMargin(
                        top: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_eng".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtPoppinsSemiBold24,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "lbl_london".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: getVerticalSize(
                        73,
                      ),
                      width: getHorizontalSize(
                        219,
                      ),
                      margin: getMargin(
                        left: 16,
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "lbl_san_fransisco".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsRegular14,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: getPadding(
                                top: 16,
                                right: 1,
                              ),
                              child: Text(
                                "lbl_sfo".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsSemiBold24,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: getHorizontalSize(
                                24,
                              ),
                              margin: getMargin(
                                left: 63,
                                bottom: 13,
                              ),
                              child: Text(
                                "lbl_2h_35m".tr,
                                maxLines: null,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtRobotoRegular12,
                              ),
                            ),
                          ),
                          CustomImageView(
                            svgPath: ImageConstant.imgGroup21,
                            height: getVerticalSize(
                              42,
                            ),
                            width: getHorizontalSize(
                              149,
                            ),
                            alignment: Alignment.topLeft,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 3,
                  top: 15,
                  right: 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "lbl_departure".tr.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsRegular14Bluegray300,
                    ),
                    Padding(
                      padding: getPadding(
                        left: 110,
                      ),
                      child: Text(
                        "lbl_flight_number".tr.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular14Bluegray300,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 3,
                  top: 1,
                  right: 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 1,
                      ),
                      child: Text(
                        "lbl_feb_25_11_30pm".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular14,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 140,
                        bottom: 1,
                      ),
                      child: Text(
                        "lbl_ab689".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 15,
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
                  right: 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconButton(
                        height: 36,
                        width: 35,
                        shape: IconButtonShape.CircleBorder18,
                        child: FlutterLogo(
                          textColor: Colors.white,
                        )),
                    Padding(
                      padding: getPadding(
                        left: 206,
                        top: 4,
                        bottom: 4,
                      ),
                      child: Text(
                        "\$200",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsSemiBold18Bluegray700,
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
