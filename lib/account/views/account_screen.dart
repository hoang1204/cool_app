import 'package:brandshop/account/widgets/expansion-widget.dart';
import 'package:brandshop/utils/app-color.dart';
import 'package:brandshop/utils/text-widget.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
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
                          Color.fromARGB(255, 56, 62, 59),
                          Color.fromARGB(255, 56, 62, 59),
                          Color.fromARGB(255, 81, 93, 87),
                          Color.fromARGB(255, 70, 71, 71),
                          Color.fromARGB(255, 60, 72, 66),
                          Color.fromARGB(255, 87, 95, 92),
                          Color.fromARGB(255, 90, 92, 90),
                          Color.fromARGB(255, 86, 88, 87),
                          Color.fromARGB(255, 56, 62, 59),
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
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromARGB(255, 114, 116, 114),
                          Color.fromARGB(255, 91, 98, 91),
                          Color.fromARGB(255, 92, 95, 92),
                          Color.fromARGB(255, 103, 105, 103),
                          Color.fromARGB(255, 85, 93, 85),
                          Color.fromARGB(255, 110, 115, 110),
                          Color.fromARGB(255, 104, 105, 104),
                        ],
                      ),
                      // border: Border.all(color: Colors.white),
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
                            text: "Diệu My",
                            size: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextWidget(
                            text: "0989565688",
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextWidget(
                            text: "dieumy@gmail.com",
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
                        onTap: () {},
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
                        onTap: () {},
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
                    )
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
    );
  }
}
