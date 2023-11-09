import 'dart:convert';

AuthLogin AuthLoginFromJson(String str) => AuthLogin.fromJson(json.decode(str));

class AuthLogin {
  String? message;
  bool? status;
  int? user_id;
  String? user_email;

  AuthLogin({this.message, this.status, this.user_id, this.user_email});

  AuthLogin.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    user_id = json['user_id'];
    user_email = json['user_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['user_id'] = this.user_id;
    data['user_email'] = this.user_email;
    return data;
  }
}
