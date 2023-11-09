import 'package:flutter/material.dart';

import 'package:get/get.dart';

customSnackbar(tittle, message, color) {
  Get.snackbar(
    tittle,
    message,
    snackPosition: SnackPosition.BOTTOM,
    forwardAnimationCurve: Curves.easeInOutCubic,
    reverseAnimationCurve: Curves.easeInOutCubic,
    backgroundColor: color,
    colorText: Colors.white,
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    icon: tittle != "ERROR".tr
        ? const Icon(
            Icons.check_circle,
            color: Colors.white,
          )
        : const Icon(
            Icons.error,
            color: Colors.white,
          ),
    duration: const Duration(milliseconds: 3000),
  );
}
