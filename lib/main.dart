import 'package:brandshop/home/bindings/product_binding.dart';
import 'package:brandshop/routes/routes.dart';
import 'package:brandshop/splash/views/splash_screen.dart';
import 'package:brandshop/utils/app-color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await _prefs;
  prefs.setBool('isLogined', false);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ProductBinding(),
      getPages: getPage,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Đặt font mặc định cho ứng dụng
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.mainColor),
        useMaterial3: true,
      ),
      home: SplashView(),
    );
  }
}
