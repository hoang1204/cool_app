import 'package:brandshop/auth/controller/authen_controller.dart';
import 'package:brandshop/auth/models/auth_model.dart';
import 'package:brandshop/auth/widgets/input-password.dart';
import 'package:brandshop/auth/widgets/input-phone.dart';
import 'package:brandshop/profile/controller/profile_controller.dart';
import 'package:brandshop/utils/app-color.dart';
import 'package:brandshop/utils/text-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  var formKey = GlobalKey<FormState>();
  var gmailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var nameController = TextEditingController();

  var isObsecured = true.obs;
  @override
  void initState() {
    AuthModel? authModel = Get.find<ProfileController>().authModel;
    gmailController.text = authModel!.email ?? "";
    nameController.text = authModel.member_name ?? "";
    phoneController.text = authModel.phone ?? "";
    addressController.text = authModel.address ?? "";
    super.initState();
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
                            text: 'ĐỔI THÔNG TIN CÁ NHÂN',
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
                            InputPhone(
                                controller: nameController,
                                hint: 'Enter your name'),
                            const SizedBox(height: 18),
                            //const TitleInput(textInput: 'Password '),
                            const SizedBox(height: 10),
                            TextFormField(
                              readOnly: true,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              controller: gmailController,
                              decoration: InputDecoration(
                                hintText: "Enter your email",
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(5.3122410774),
                                  borderSide: const BorderSide(
                                    color: Color(0xffc0c0c0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(5.3122410774),
                                  borderSide: const BorderSide(
                                    color: Color(0xffc0c0c0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(5.3122410774),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(5.3122410774),
                                  borderSide: const BorderSide(
                                    color: Color(0xffc0c0c0),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 6),
                              ),
                            ),
                            const SizedBox(height: 18),
                            //const TitleInput(textInput: 'Password '),
                            const SizedBox(height: 10),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              controller: phoneController,
                              decoration: InputDecoration(
                                hintText: "Enter your phone",
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(5.3122410774),
                                  borderSide: const BorderSide(
                                    color: Color(0xffc0c0c0),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(5.3122410774),
                                  borderSide: const BorderSide(
                                    color: Color(0xffc0c0c0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(5.3122410774),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(5.3122410774),
                                  borderSide: const BorderSide(
                                    color: Color(0xffc0c0c0),
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 6),
                              ),
                            ),
                            const SizedBox(height: 18),
                            //const TitleInput(textInput: 'Password '),
                            const SizedBox(height: 10),
                            InputPhone(
                                controller: addressController,
                                hint: 'Enter your address'),
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
                                  AuthModel authModel = AuthModel();
                                  authModel.address = addressController.text;
                                  authModel.member_name = nameController.text;
                                  authModel.email = gmailController.text;
                                  authModel.phone = phoneController.text;
                                  authModel.member_id =
                                      Get.find<ProfileController>()
                                          .authModel!
                                          .member_id;
                                  Get.find<ProfileController>()
                                      .updateProfileUser(authModel);
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
