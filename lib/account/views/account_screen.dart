import 'package:brandshop/account/widgets/expansion-widget.dart';
import 'package:brandshop/auth/models/auth_model.dart';
import 'package:brandshop/profile/controller/profile_controller.dart';
import 'package:brandshop/routes/routes.dart';
import 'package:brandshop/utils/app-color.dart';
import 'package:brandshop/utils/text-widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  AuthModel? authModel = Get.find<ProfileController>().authModel;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 8),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 112, 114, 113),
                            Color.fromARGB(255, 150, 152, 151),
                            Color.fromARGB(255, 155, 157, 156),
                            Color.fromARGB(255, 132, 134, 134),
                            Color.fromARGB(255, 149, 159, 154),
                            Color.fromARGB(255, 119, 119, 119),
                            Color.fromARGB(255, 117, 118, 117),
                            Color.fromARGB(255, 133, 133, 133),
                            Color.fromARGB(255, 102, 102, 102),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height / 2 - 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 8),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //   begin: Alignment.topRight,
                        //   end: Alignment.bottomLeft,
                        //   colors: [
                        //     // Color.fromARGB(255, 114, 116, 114),
                        //     // Color.fromARGB(255, 91, 98, 91),
                        //     // Color.fromARGB(255, 92, 95, 92),
                        //     // Color.fromARGB(255, 103, 105, 103),
                        //     // Color.fromARGB(255, 85, 93, 85),
                        //     // Color.fromARGB(255, 110, 115, 110),
                        //     // Color.fromARGB(255, 104, 105, 104),
                        //   ],
                        // ),
                        // // border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height / 10,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          text: "Thông tin tài khoản",
                          size: 20,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.qr_code,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: CircleAvatar(
                          radius: 50,
                          child: Image.asset(
                            "assets/images/logo.png",
                            width: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextWidget(
                              text: authModel?.member_name ?? "Username",
                              size: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextWidget(
                              text: authModel?.phone ?? "0123456789",
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextWidget(
                              text: authModel?.email ?? "abc@gmail.com",
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width - 80,
                          height: MediaQuery.sizeOf(context).height / 7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 166, 166, 166)),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            TextWidget(
                              text: "Số tiền trong ví",
                              size: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextWidget(
                              text: "2.000.000 vnđ",
                              size: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 2 - 30,
                  ),
                  ExpansionWidget(
                    childrens: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: 5, bottom: 5),
                        child: InkWell(
                          onTap: () async {
                            final prefs = await _prefs;
                            bool? checkLogin = prefs.getBool('isLogined');
                            if (checkLogin ?? false == true) {
                              Get.toNamed(Routes.updateProfile);
                            } else {
                              Get.toNamed(Routes.login);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 149, 149, 149)),
                            height: 60,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.repartition,
                                    color: Colors.white,
                                  ),
                                ),
                                TextWidget(
                                  text: "Sửa thông tin",
                                  size: 17,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: 5, bottom: 5),
                        child: InkWell(
                          onTap: () async {
                            final prefs = await _prefs;
                            bool? checkLogin = prefs.getBool('isLogined');
                            if (checkLogin ?? false == true) {
                              Get.toNamed(Routes.changePassword);
                            } else {
                              Get.toNamed(Routes.login);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 149, 149, 149)),
                            height: 60,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.change_circle,
                                    color: Colors.white,
                                  ),
                                ),
                                TextWidget(
                                  text: "Đổi mật khẩu",
                                  size: 17,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    title: "Cá nhân",
                    icon: Icon(
                      Icons.person,
                      color: AppColor.mainColor,
                    ),
                  ),
                  ExpansionWidget(
                    title: "Đơn hàng",
                    icon: Icon(
                      Icons.shop,
                      color: AppColor.mainColor,
                    ),
                  ),
                  ExpansionWidget(
                    title: "Lịch sử giao dịch",
                    icon: Icon(
                      Icons.history,
                      color: AppColor.mainColor,
                    ),
                  ),
                  ExpansionWidget(
                    title: "Đăng ký làm CTV",
                    icon: Icon(
                      Icons.question_mark,
                      color: AppColor.mainColor,
                    ),
                  ),
                  ExpansionWidget(
                    title: "Thoát",
                    icon: Icon(
                      Icons.exit_to_app,
                      color: AppColor.mainColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
