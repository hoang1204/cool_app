import 'dart:io';

import 'package:brandshop/api/api-define.dart';
import 'package:brandshop/home/model/categories.dart';
import 'package:brandshop/home/model/product.dart';
import 'package:brandshop/home/model/products.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  List<Product> item = [];
  List<Products> item2 = [];
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
    getDataItem();
    super.onInit();
  }

  Future<List<Product>> getDataItem() async {
    try {
      var response = await http.get(
        Uri.parse(Api.getAllProducts),
        //   Uri.parse(ApiFake.getItemApi)
        //headers: {'Content-Type': 'application/json'},
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

  Future<List<Products>> getDataItem2() async {
    try {
      var response = await http.get(Uri.parse(ApiFake.getItemApi)
          //headers: {'Content-Type': 'application/json'},
          );
      if (response.statusCode == 200) {
        print("Thanh cong");
        final encoding = response.headers['content-encoding'];

        // Giải mã dữ liệu dựa trên encoding
        final decodedData = encoding == 'gzip'
            ? utf8.decode(gzip.decode(response.bodyBytes))
            : utf8.decode(response.bodyBytes);
        print(decodedData);
        item2 = ProducstFromJson(response.body);
        print(item2[1].image);
        return item2;
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
