import 'package:brandshop/home/bindings/product_binding.dart';
import 'package:brandshop/home/views/home-screen.dart';
import 'package:get/get.dart';

class Routes {
  static String home = '/home';
}

final getPage = [
  GetPage(
      name: Routes.home, page: () => HomeScreen(), binding: ProductBinding())
];
