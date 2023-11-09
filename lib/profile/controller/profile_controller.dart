import 'dart:convert';

import 'package:brandshop/api/api-define.dart';
import 'package:brandshop/auth/models/auth_model.dart';
import 'package:brandshop/home/widgets/custom_snackbar.dart';
import 'package:brandshop/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  AuthModel? authModel;
  Future<AuthModel?> getProfileUser(int id) async {
    try {
      var response = await http.get(
        Uri.parse(Api.getProfileUser + "${id}"),
        headers: {
          'Accept': 'application/json; charset=utf-8',
        },
      );
      if (response.statusCode == 200) {
        authModel = AuthModelFromJson(response.body);
        update();
        print(authModel!.member_name);
        return authModel;
      }
    } catch (e) {}
    return null;
  }

  Future<void> updateProfileUser(AuthModel authModel) async {
    try {
      Map body = {
        'member_name': authModel.member_name,
        'email': authModel.email,
        'phone': authModel.phone,
        'address': authModel.address,
        'status': null,
      };

      var response = await http.put(
        Uri.parse(Api.updateProfileUser + "${authModel.member_id}"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        customSnackbar("SUCCESS", "Update successful", Colors.green);
        Get.offNamed(Routes.dashboard);
      } else
        print(response.statusCode);
    } catch (e) {}
  }

  Future<void> changePassword(String password, int id) async {
    try {
      Map body = {
        'password': password,
      };

      var response = await http.post(
        Uri.parse(Api.changePassword + "${id}"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        customSnackbar("SUCCESS", "Change password successful", Colors.green);
        Get.offNamed(Routes.dashboard);
      } else
        print(response.statusCode);
    } catch (e) {}
  }
}
