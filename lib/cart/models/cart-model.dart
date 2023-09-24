import '../../home/model/product.dart';

class Cart {
  List<ProductCart>? productCart;
  int? amount;
}

class ProductCart {
  Product? product;
  int? quantity;
  ProductCart({
    this.product,
    this.quantity,
  });
}
