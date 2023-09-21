import 'dart:io';

import 'package:brandshop/api/api-define.dart';
import 'package:brandshop/home/model/categories.dart';
import 'package:brandshop/home/model/product.dart';
import 'package:brandshop/home/model/products.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  // List<Product> item = [];
  List<Product> item = [];
  List<Categories> category = [
    Categories(
      categoryName: "Bag",
    ),
    Categories(
      categoryName: "Tee",
    ),
    Categories(
      categoryName: "Jacket",
    ),
    Categories(
      categoryName: "Item",
    ),
  ];
  @override
  void onInit() {
    getDataItem2();
    super.onInit();
  }

  // Future<List<Product>> getDataItem() async {
  //   try {
  //     var response = await http.get(
  //       Uri.parse(Api.getAllProducts),
  //       // Uri.parse(Api.getItemApi),
  //       // headers: {'Content-Type': 'application/json; charset=utf-8'},
  //     );
  //     if (response.statusCode == 200) {
  //       print("Thanh cong");
  //       item = ProductsFromJson(response.body);
  //       // item = ProducstFromJson(response.body);

  //       return item;
  //     } else {
  //       print(response.statusCode);
  //       return [];
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     return [];
  //   }
  // }

  Future<List<Product>> getDataItem2() async {
    try {
      var response = await http.get(
        Uri.parse(Api.getAllProducts),
        headers: {
          'Accept': 'application/json; charset=utf-8',
        },
      );

      if (response.statusCode == 200) {
        print("Thanh cong");
        item = ProductsFromJson(response.body);
        // item = ProducstFromJson(response.body);

        return item;
      } else {
        print(response.statusCode);
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
