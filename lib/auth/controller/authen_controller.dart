import 'dart:convert';

import 'package:brandshop/api/api-define.dart';
import 'package:brandshop/auth/models/auth_signup.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  // Future<AuthModel>loginUserPass(String user, String password) async{
  //   try{
  //     var response = await http.get(Uri.parse(Api.login));
  //   }catch(e){
  //     e.printError();
  //   }
  // }

  Future<bool> signUp(AuthSignUp authSignUp) async {
    try {
      var response = await http.post(
        Uri.parse(Api.signup),
        // headers: {},
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
