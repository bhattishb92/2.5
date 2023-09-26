import 'package:get/get.dart';
import 'listcityfrom_item_model.dart';
import 'listrectanglefortyseven_item_model.dart';
import 'listorigin_item_model.dart';

class HomeModel {
  RxList<ListcityfromItemModel>? listcityfromItemList;

  RxList<ListrectanglefortysevenItemModel> listrectanglefortysevenItemList =
      RxList.generate(1, (index) => ListrectanglefortysevenItemModel());

  RxList<ListoriginItemModel> listoriginItemList =
      RxList.generate(1, (index) => ListoriginItemModel());
}
