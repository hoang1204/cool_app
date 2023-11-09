import 'dart:convert';

import 'package:brandshop/api/api-define.dart';
import 'package:brandshop/auth/models/auth_login.dart';

import 'package:brandshop/auth/models/auth_signup.dart';
import 'package:brandshop/home/widgets/custom_snackbar.dart';
import 'package:brandshop/profile/controller/profile_controller.dart';
import 'package:brandshop/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  AuthLogin? auth;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<AuthLogin?> loginUserPass(String email, String password) async {
    final SharedPreferences prefs = await _prefs;
    try {
      Map body = {'email': email, 'password': password};
      var response = await http.post(
        Uri.parse(Api.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        await prefs.setBool('isLogined', true);
        print(response.body);
        auth = AuthLoginFromJson(response.body);
        print(auth.toString());
        if (auth?.status == true) {
          customSnackbar("SUCCESS", "Login Successful", Colors.green);
          Get.find<ProfileController>().getProfileUser(auth?.user_id ?? -1);
          print(Get.find<ProfileController>().authModel.toString());
          Get.offNamed(Routes.dashboard);
        } else {
          print("OKeeee");
          customSnackbar("UNSUCCESS", "Login Fail", Colors.red);
        }
        return auth;
      } else {
        print("404");
        customSnackbar("UNSUCCESS", "Login Failure", Colors.red);
      }
    } catch (e) {
      e.printError();
    }

    return null;
  }

  Future<bool> signUp(AuthSignUp authSignUp) async {
    try {
      var response = await http.post(
        Uri.parse(Api.signup),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(authSignUp),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print("Sign Up successful");
        return true;
      } else {
        print("${response.statusCode} signUpfail");
        print(response.toString());
        return false;
      }
    } catch (e) {
      e.printError();
      return false;
    }
  }
}
