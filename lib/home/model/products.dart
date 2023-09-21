// import 'dart:convert';
// import 'dart:ffi';

// Products ProductFromJson(String str) => Products.fromJson(json.decode(str));

// List<Products> ProducstFromJson(String str) => List<Products>.from(
//       json.decode(str).map(
//             (x) => Products.fromJson(x),
//           ),
//     );

// class Products {
//   String? id;
//   String? title;
//   String? price;
//   String? description;
//   String? category;
//   String? image;
//   Rating? rating;

//   Products(
//       {this.id,
//       this.title,
//       this.price,
//       this.description,
//       this.category,
//       this.image,
//       this.rating});

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'].toString();
//     title = json['title'];
//     price = json['price'].toString();
//     description = json['description'];
//     category = json['category'];
//     image = json['image'];
//     rating = null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['price'] = this.price;
//     data['description'] = this.description;
//     data['category'] = this.category;
//     data['image'] = this.image;
//     if (this.rating != null) {
//       data['rating'] = this.rating!.toJson();
//     }
//     return data;
//   }
// }

// class Rating {
//   double? rate;
//   int? count;

//   Rating({this.rate, this.count});

//   Rating.fromJson(Map<String, dynamic> json) {
//     rate = json['rate'];
//     count = json['count'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['rate'] = this.rate;
//     data['count'] = this.count;
//     return data;
//   }
// }
