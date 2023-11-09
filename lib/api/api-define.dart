// class ApiFake {
//   static const String url = "https://fakestoreapi.com";
//   static const String getItemApi = "$url/products";
// }

class Api {
  static const String url = "http://54.254.150.184:8080";
  static const String getAllProducts = "$url/api/Product/getAllProducts";
  static const String login = "$url/api/public/login";
  static const String signup = "$url/api/public/register";
  static const String getProfileUser = "$url/api/public/";

  static const String updateProfileUser = "$url/api/public/update/";
  static const String changePassword = "$url/api/public/changePassword/";
}
