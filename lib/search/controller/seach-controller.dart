import 'package:brandshop/home/controller/products-controller.dart';
import 'package:brandshop/home/model/product.dart';
import 'package:get/get.dart';

class SearchController1 extends GetxController {
  ProductController productController = Get.put(ProductController());
  List<Product> searchDatalist = [];
  List<Product> foundItem = [];
  List<Product> results = [];

  bool itemLoader = false;
  onInit() {
    super.onInit();
    getData();
  }

  getData() {
    itemLoader = true;
    update();
    Get.find<ProductController>().getDataItem2();
    update();
    searchDatalist = productController.item;
    results = searchDatalist;
    itemLoader = false;
    update();
  }

  filterItem(String itemName) {
    itemLoader = true;
    update();
    getData();
    if (itemName.isEmpty) {
      results = searchDatalist;
      update();
    } else {
      results = searchDatalist
          .where((element) => element.productName
              .toString()
              .toLowerCase()
              .contains(itemName.toLowerCase()))
          .toList();
    }
    foundItem = results;
    itemLoader = false;
    update();
  }
}
