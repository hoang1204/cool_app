import 'package:brandshop/cart/models/cart-model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/model/product.dart';

class CartController extends GetxController {
  List<ProductCart> productCart = [];
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  addProductToCart(Product product) {
    for (int i = 0; i < productCart.length; i++) {
      if (productCart[i].product!.productName == product.productName) {
        productCart[i].quantity = productCart[i].quantity! + 1;
        update();
        return;
      }
    }

    ProductCart newProductToCart = ProductCart(product: product, quantity: 1);
    productCart.add(newProductToCart);

    update();
  }

  increaseProduct(ProductCart productCart1) {
    productCart1.quantity = productCart1.quantity! + 1;
    update();
  }

  decreaseProduct(ProductCart productCart1, int index) {
    if (productCart1.quantity == 1)
      delProductCart(index);
    else
      productCart1.quantity = productCart1.quantity! - 1;
    update();
  }

  delProductCart(int index) {
    productCart.removeAt(index);
    update();
  }
}
