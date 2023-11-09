import 'package:brandshop/auth/widgets/input-password.dart';
import 'package:brandshop/auth/widgets/input-phone.dart';
import 'package:brandshop/home/widgets/custom_snackbar.dart';
import 'package:brandshop/profile/controller/profile_controller.dart';
import 'package:brandshop/utils/app-color.dart';
import 'package:brandshop/utils/text-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var newPassController = TextEditingController();
  var newRePassController = TextEditingController();
  var isObsecured1 = true.obs;
  var isObsecured2 = true.obs;
  var isObsecured3 = true.obs;
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
                    Image.asset(
                      'assets/images/logo.png',
                      width: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          TextWidget(
                            text: 'ĐỔI MẬT KHẨU',
                            size: 26,
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

                            //const TitleInput(textInput: 'Password '),
                            const SizedBox(height: 10),

                            TextWidget(
                              text: " New password",
                              size: 18,
                            ),
                            InputPassword(
                                passwordController: newPassController,
                                isObsecured: isObsecured2),
                            const SizedBox(height: 36),
                            TextWidget(
                              text: " ReNew password",
                              size: 18,
                            ),
                            InputPassword(
                                passwordController: newRePassController,
                                isObsecured: isObsecured3),
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
                                  if (newPassController.text ==
                                      newRePassController.text) {
                                    Get.find<ProfileController>()
                                        .changePassword(
                                            newPassController.text,
                                            Get.find<ProfileController>()
                                                    .authModel!
                                                    .member_id ??
                                                -1);
                                  } else {
                                    customSnackbar("Alert",
                                        "Change pass unsuccesful", Colors.red);
                                  }
                                },
                                child: const Text(
                                  'Update',
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
                                  'Back to profile? ',
                                  style: TextStyle(fontSize: 18),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    'Back',
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
