import 'dart:convert';

Product ProductFromJson(String str) => Product.fromJson(json.decode(str));

List<Product> ProductsFromJson(String str) => List<Product>.from(
      json.decode(str).map(
            (x) => Product.fromJson(x),
          ),
    );

class Product {
  String? id;
  String? productName;
  String? productType;
  String? productBrand;
  String? productDescription;
  String? productImage;
  int? productPrice;

  Product(
      {this.id,
      this.productName,
      this.productType,
      this.productBrand,
      this.productDescription,
      this.productImage,
      this.productPrice});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    productName = json['productName'];
    productType = json['productType'];
    productBrand = json['productBrand'];
    productDescription = json['productDescription'];
    productImage = json['productImage'];
    productPrice = json['productPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['productType'] = this.productType;
    data['productBrand'] = this.productBrand;
    data['productDescription'] = this.productDescription;
    data['productImage'] = this.productImage;
    data['productPrice'] = this.productPrice;
    return data;
  }
}
// import 'dart:convert';

// ProductModel ProductModelFromJson(String str) =>
//     ProductModel.fromJson(json.decode(str));

// String ProductModelToJson(ProductModel data) => json.encode(data.toJson());

// class ProductModel {
//   ProductModel({
//     this.data,
//   });

//   List<ProductData>? data;

//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         data: json["data"] == null
//             ? []
//             : List<ProductData>.from(
//                 json["data"]!.map((x) => ProductData.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class ProductData {
//   ProductData(
//       {this.id,
//       this.productName,
//       this.productType,
//       this.productBrand,
//       this.productDescription,
//       this.productImage,
//       this.productPrice});

//   String? id;
//   String? productName;
//   String? productType;
//   String? productBrand;
//   String? productDescription;
//   String? productImage;
//   int? productPrice;

//   factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
//         id: json["id"],
//         productName: json["productName"],
//         productType: json["productType"],
//         productBrand: json["productBrand"],
//         productDescription: json["productDescription"],
//         productImage: json["productImage"],
//         productPrice: json["productPrice"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "productName": productName,
//         "productType": productType,
//         "productBrand": productBrand,
//         "productDescription": productDescription,
//         "productImage": productImage,
//         "productPrice": productPrice,
//       };
// }
