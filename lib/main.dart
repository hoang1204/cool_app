import 'package:brandshop/dashboard/dashboard_screen.dart';
import 'package:brandshop/home/bindings/product_binding.dart';
import 'package:brandshop/routes/routes.dart';
import 'package:brandshop/splash/views/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashView(),
    );
  }
}
