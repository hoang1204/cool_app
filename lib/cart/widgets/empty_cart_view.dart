import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EmptyCartView extends GetView {
  const EmptyCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Empty_Cart.jpeg"),
              Text("YOUR CART IS EMPTY"),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'LOOKS LIKE YOU HAVENT ADDED ANYTHING',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
