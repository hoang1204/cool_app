import 'package:brandshop/api/api-define.dart';
import 'package:brandshop/home/model/categories.dart';
import 'package:brandshop/home/model/product.dart';
import 'package:brandshop/home/model/products.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  List<Product> item = [];
  List<Products> item2 = [];
  List<Categories> category = [
    Categories(
        categoryName: "Bag",
        categoryImage:
            "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"),
    Categories(
        categoryName: "Tee",
        categoryImage:
            "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"),
    Categories(
        categoryName: "Jacket",
        categoryImage:
            "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg"),
    Categories(
        categoryName: "Item",
        categoryImage:
            "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg"),
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
