// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:brandshop/utils/app-color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class searchNotFound extends StatelessWidget {
  const searchNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            SizedBox(
              height: 52,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  hintText: "SEARCH",
                  hintStyle: const TextStyle(color: AppColor.mainColor),
                  filled: true,
                  fillColor: AppColor.iconColor,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: AppColor.iconColor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(width: 0, color: AppColor.iconColor),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/icons8-nothing-found-64.png",
                      height: 180,
                      width: 180,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "RESULT_NOT_FOUND",
                    ),
                    SizedBox(height: 16),
                    SizedBox(height: 8),
                    Text(
                      'RESULT_NOT_FOUND_DESCRIPTION'.tr,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontFamily: 'Rubkik',
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
