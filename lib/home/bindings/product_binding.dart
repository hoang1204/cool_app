import 'package:brandshop/auth/controller/authen_controller.dart';
import 'package:brandshop/home/controller/products-controller.dart';
import 'package:brandshop/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

import '../../cart/controller/cart_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.put(CartController());
    Get.put(AuthController());
    Get.put(ProfileController());
  }
}
