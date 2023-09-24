import 'package:brandshop/home/controller/products-controller.dart';
import 'package:get/get.dart';

import '../../cart/controller/cart_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.put(CartController());
  }
}
