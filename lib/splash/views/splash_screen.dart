import 'dart:async';

import 'package:brandshop/auth/views/login-screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    //for foreground state
    Timer(
      const Duration(seconds: 2),
      () {
        Get.offAll(() => const LoginScreen());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset(
        "assets/images/logo.png",
        height: 200,
        fit: BoxFit.contain,
      )),
    );
  }
}
