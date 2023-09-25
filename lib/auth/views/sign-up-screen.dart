// ignore_for_file: file_names

import 'package:brandshop/auth/controller/authen_controller.dart';
import 'package:brandshop/auth/models/auth_signup.dart';
import 'package:brandshop/auth/widgets/input-password.dart';
import 'package:brandshop/auth/widgets/input-phone.dart';
import 'package:brandshop/routes/routes.dart';
import 'package:brandshop/utils/app-color.dart';
import 'package:brandshop/utils/text-widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  var gmailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var nameController = TextEditingController();

  var isObsecured = true.obs;

  @override
  void dispose() {
    gmailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Image.asset('assets/images/logo.png',
                        width: 200, height: 200),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          TextWidget(
                            text: 'ĐĂNG KÝ TÀI KHOẢN',
                            size: 30,
                            color: AppColor.mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //const TitleInput(textInput: 'Phone Number'),
                            const SizedBox(height: 10),
                            InputPhone(
                                controller: nameController,
                                hint: 'Enter your name'),
                            const SizedBox(height: 18),
                            //const TitleInput(textInput: 'Password '),
                            const SizedBox(height: 10),
                            InputPhone(
                                controller: gmailController,
                                hint: 'Enter your email'),
                            const SizedBox(height: 18),
                            //const TitleInput(textInput: 'Password '),
                            const SizedBox(height: 10),
                            InputPassword(
                              passwordController: passwordController,
                              isObsecured: isObsecured,
                            ),
                            const SizedBox(height: 18),
                            //const TitleInput(textInput: 'Password '),
                            const SizedBox(height: 10),
                            InputPassword(
                              passwordController: rePasswordController,
                              isObsecured: isObsecured,
                            ),
                            const SizedBox(height: 36),
                            SizedBox(
                              width: double.infinity,
                              height: 45,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.mainColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.5),
                                  ),
                                ),
                                onPressed: () async {
                                  {
                                    AuthSignUp authTemp = AuthSignUp(
                                        member_Name: nameController.text,
                                        password: passwordController.text,
                                        email: gmailController.text);
                                    Get.find<AuthController>().signUp(authTemp);
                                    Get.snackbar("Login", "Successful");
                                    Get.offNamed(Routes.login);
                                    // } else {
                                    //   Get.snackbar("Login", "Unsuccessful");
                                    //   gmailController.clear();
                                    //   passwordController.clear();
                                    //   nameController.clear();
                                    //   rePasswordController.clear();
                                  }
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(height: 80),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'You have account? ',
                                  style: TextStyle(fontSize: 18),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.offNamed(Routes.login);
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
