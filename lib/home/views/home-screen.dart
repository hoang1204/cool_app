import 'package:brandshop/cart/controller/cart_controller.dart';
import 'package:brandshop/home/controller/products-controller.dart';
import 'package:brandshop/items/views/item-views.dart';
import 'package:brandshop/routes/routes.dart';

import 'package:brandshop/utils/text-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // Get.find<ProductController>().getDataItem();
    Get.find<ProductController>().getDataItem2();
    super.initState();
  }

  final TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (productController) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: MediaQuery.sizeOf(context).width / 2,
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width - 30,
                    child: TextFormField(
                      onTap: () {
                        Get.toNamed(Routes.search);
                      },
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Search",
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.3122410774),
                          borderSide: const BorderSide(
                            color: Color(0xffc0c0c0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.3122410774),
                          borderSide: const BorderSide(
                            color: Color(0xffc0c0c0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.3122410774),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.3122410774),
                          borderSide: const BorderSide(
                            color: Color(0xffc0c0c0),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                    text: "Catergories",
                    size: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                productController.category.isNotEmpty
                    ? SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: productController.category.length,
                            itemBuilder: (BuildContext context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 80,
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: TextWidget(
                                          text: productController
                                                  .category[index]
                                                  .categoryName ??
                                              "",
                                          size: 20),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    : Text(""),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                    text: "Popular Item",
                    size: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FutureBuilder(
                    future: productController.getDataItem2(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Đã xảy ra lỗi: ${snapshot.error}');
                      } else {
                        return StaggeredGridView.countBuilder(
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                          itemCount: productController.item.length - 80,
                          crossAxisCount: 2,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          staggeredTileBuilder: (int index) =>
                              const StaggeredTile.fit(1),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all()),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 140,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Get.bottomSheet(
                                                ItemView(
                                                  item: productController
                                                      .item[index],
                                                ),
                                                enableDrag: true,
                                                // Chiều cao của Bottom Sheet
                                                isDismissible: true,
                                                barrierColor:
                                                    Colors.transparent,
                                                // Màu nền của Bottom Sheet
                                                backgroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        productController
                                                            .item[index]
                                                            .productImage!),
                                                    fit: BoxFit.contain),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 6,
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          productController
                                                              .item[index]
                                                              .productName!,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    productController
                                                        .item[index]
                                                        .productPrice!
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 13,
                                                      height: 1.4,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.find<CartController>()
                                                          .addProductToCart(
                                                              productController
                                                                  .item[index]);
                                                      Get.snackbar("SUCCESS",
                                                          "Your cart was added product");
                                                      productController
                                                          .update();
                                                    },
                                                    child: Container(
                                                        height: 40,
                                                        width: 60,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                          color: const Color
                                                              .fromARGB(
                                                            255,
                                                            113,
                                                            113,
                                                            114,
                                                          ),
                                                        ),
                                                        child: Icon(
                                                          Icons.shopping_cart,
                                                          color: Colors.white,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
