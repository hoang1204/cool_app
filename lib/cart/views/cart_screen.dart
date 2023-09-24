import 'package:brandshop/cart/controller/cart_controller.dart';
import 'package:brandshop/cart/widgets/empty_cart_view.dart';
import 'package:brandshop/utils/text-widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartController) => Scaffold(
        floatingActionButton: ElevatedButton(
            onPressed: () {},
            child: TextWidget(
              text: "Checkout",
              size: 20,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            )),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextWidget(
                      text: "My cart",
                      size: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  cartController.productCart.isNotEmpty
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: cartController.productCart.length,
                          itemBuilder: (BuildContext context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: 125,
                                  color: Color.fromARGB(255, 230, 230, 230),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          cartController.productCart[index]
                                                  .product!.productImage ??
                                              "",
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: 100,
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  2,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, left: 10),
                                                child: Text(
                                                  cartController
                                                          .productCart[index]
                                                          .product!
                                                          .productName ??
                                                      "",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 20),
                                              child: SizedBox(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          2,
                                                  child: TextWidget(
                                                      text:
                                                          "${cartController.productCart[index].product!.productPrice ?? 1000} vnd",
                                                      size: 15)),
                                            ),
                                          ),
                                          Flexible(
                                            child: SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  2,
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      cartController
                                                          .decreaseProduct(
                                                              cartController
                                                                      .productCart[
                                                                  index],
                                                              index);
                                                    },
                                                    icon: Icon(Icons.remove),
                                                  ),
                                                  TextWidget(
                                                      text:
                                                          "${cartController.productCart[index].quantity}",
                                                      size: 18),
                                                  IconButton(
                                                    onPressed: () {
                                                      cartController
                                                          .increaseProduct(
                                                              cartController
                                                                      .productCart[
                                                                  index]);
                                                    },
                                                    icon: Icon(Icons.add),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                                middleText:
                                                    "Delete this product",
                                                cancel: ElevatedButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text("Cancel")),
                                                confirm: ElevatedButton(
                                                    onPressed: () {
                                                      cartController
                                                          .delProductCart(
                                                              index);
                                                      Get.back();
                                                    },
                                                    child: Text("Confirm")));
                                          },
                                          icon: Icon(Icons.delete))
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                )
                              ],
                            );
                          })
                      : EmptyCartView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
