import 'package:brandshop/auth/views/login-screens.dart';
import 'package:brandshop/auth/views/sign-up-screen.dart';
import 'package:brandshop/dashboard/dashboard_screen.dart';
import 'package:brandshop/home/bindings/product_binding.dart';
import 'package:brandshop/home/views/home-screen.dart';
import 'package:brandshop/search/bindings/search_binding.dart';
import 'package:brandshop/search/views/search-screen.dart';
import 'package:get/get.dart';

class Routes {
  static String home = '/home';
  static String login = '/login';
  static String signUp = '/signUp';
  static String dashboard = '/dashboard';
  static String search = '/search';
}

final getPage = [
  GetPage(
      name: Routes.home, page: () => HomeScreen(), binding: ProductBinding()),
  GetPage(name: Routes.login, page: () => LoginScreen()),
  GetPage(name: Routes.signUp, page: () => SignUpScreen()),
  GetPage(name: Routes.dashboard, page: () => DashBoardScreen()),
  GetPage(
      name: Routes.search, page: () => SearchScreen(), binding: SearchBinding())
];
